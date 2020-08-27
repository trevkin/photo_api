<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;
use App\Photo;
use App\User;

class PhotoTest extends TestCase
{
    public function testsPhotosAreCreatedCorrectly()
    {
        $user = factory(User::class)->create();
        $token = $user->generateToken();
        $headers = ['Authorization' => "Bearer $token"];
        $payload = [
            'title' => 'Lorem',
            'description' => 'Ipsum',
        ];

        $this->json('POST', '/api/photos', $payload, $headers)
            ->assertStatus(201)
            ->assertJson(['id' => 1, 'title' => 'Lorem', 'description' => 'Ipsum']);
    }

    public function testsPhotosAreUpdatedCorrectly()
    {
        $user = factory(User::class)->create();
        $token = $user->generateToken();
        $headers = ['Authorization' => "Bearer $token"];
        $photo = factory(Photo::class)->create([
            'title' => 'First Photo',
            'description' => 'First Description',
        ]);

        $payload = [
            'title' => 'Lorem',
            'description' => 'Ipsum',
        ];

        $response = $this->json('PUT', '/api/photos/' . $photo->id, $payload, $headers)
            ->assertStatus(200)
            ->assertJson([ 
                'id' => 1, 
                'title' => 'Lorem', 
                'description' => 'Ipsum' 
            ]);
    }
/*
    public function testsArtilcesAreDeletedCorrectly()
    {
        $user = factory(User::class)->create();
        $token = $user->generateToken();
        $headers = ['Authorization' => "Bearer $token"];
        $photo = factory(Photo::class)->create([
            'title' => 'First Photo',
            'description' => 'First Description',
        ]);

        $this->json('DELETE', '/api/photos/' . $photo->id, [], $headers)
            ->assertStatus(204);
    }
*/
    public function testPhotosAreListedCorrectly()
    {
        factory(Photo::class)->create([
            'title' => 'First Photo',
            'description' => 'First Description'
        ]);

        factory(Photo::class)->create([
            'title' => 'Second Photo',
            'description' => 'Second Description'
        ]);

        $user = factory(User::class)->create();
        $token = $user->generateToken();
        $headers = ['Authorization' => "Bearer $token"];

        $response = $this->json('GET', '/api/photos', [], $headers)
            ->assertStatus(200)
            ->assertJson([
                [ 'title' => 'First Photo', 'description' => 'First Description' ],
                [ 'title' => 'Second Photo', 'description' => 'Second Description' ]
            ])
            ->assertJsonStructure([
                '*' => ['id', 'description', 'title', 'created_at', 'updated_at'],
            ]);
    }

}
