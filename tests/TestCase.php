<?php
namespace Tests;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use Illuminate\Support\Facades\Artisan;
use Database\Seeds\UsersTableSeeder;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication, DatabaseMigrations;
    public function setUp()
    {
        parent::setUp();
        Artisan::call('db:seed', [ '--class' => 'UsersTableSeeder' ]);
    }
}
