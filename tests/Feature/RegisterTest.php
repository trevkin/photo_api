<?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;

class RegisterTest extends TestCase
	{
    public function testsRegistersSuccessfully()
    	{
        $payload = [
            'name' => 'John',
            'email' => 'john@toptal.com',
            'password' => 'password',
            'password_confirmation' => 'password',
        ];

        $this->json('post', '/api/register', $payload)
            ->assertStatus(201)
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'name',
                    'email',
                    'created_at',
                    'updated_at',
                    'api_token',
                ],
            ]);;
    	}

    public function testsRequiresPasswordEmailAndName()
   		{
        $this->json('post', '/api/register')
            ->assertStatus(422)
            ->assertJsonFragment([
                'name' => ['The name field is required.'],
                'email' => ['The email field is required.'],
                'password' => ['The password field is required.'],
            ]);
    	}

    public function testsRequirePasswordConfirmation()
    	{
        $payload = [
            'name' => 'John',
            'email' => 'john@toptal.com',
            'password' => 'password',
        ];

        $this->json('post', '/api/register', $payload)
            ->assertStatus(422)
            ->assertJsonFragment([
                'password' => ['The password confirmation does not match.'],
            ]);
    	}
	}