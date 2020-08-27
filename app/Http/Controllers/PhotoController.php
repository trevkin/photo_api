<?php

namespace App\Http\Controllers;
use Storage;
use Illuminate\Http\Request;
use App\Photo;

class PhotoController extends Controller
	{   
    public function index()
    	{
        return Photo::orderBy('taken_at')->get();
    	}

    public function show(Photo $photo)
    	{
        return $photo;
    	}

    public function store(Request $request)
    	{
        $photo = Photo::create($request->all());
		$url = $request->url;
		$contents = file_get_contents($url);
		$name = $photo->id .".". substr($url, strrpos($url, '.') + 1);
		Storage::put("public/".$name, $contents);
        return response()->json(array('id' => $photo->id), 201);
    	}

    public function update(Request $request, Photo $photo)
    	{
        $photo->update($request->all());
		if ($request->url != "")
			{
			$url = $request->url;
			$contents = file_get_contents($url);
			$name = $photo->id .".". substr($url, strrpos($url, '.') + 1);
			Storage::delete("public/".$name);
			Storage::put("public/".$name, $contents);
			}
        return response()->json($photo, 200);
		}

    public function delete(Photo $photo)
    	{
		$name = $photo->id .".". $photo->image_ext;
		Storage::delete("public/".$name);
        $photo->delete();

        return response()->json(null, 204);
    	}

	}
