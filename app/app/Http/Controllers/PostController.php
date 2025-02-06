<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Inertia\Response;
use Inertia\ResponseFactory;

class PostController extends Controller
{
    /**
     * index
     *
     * @return ResponseFactory|Response
     */
    public function index(): ResponseFactory|Response
    {
        //get all posts
        $posts = Post::latest()->get();

        //return view
        return inertia('Posts/Index', [
            'posts' => $posts
        ]);
    }
}
