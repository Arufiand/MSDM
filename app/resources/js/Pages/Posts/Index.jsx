// Import React
import React from "react";

// Import Layout
import Layout from "../../Layouts/Default";

// Import Link from the correct Inertia package
import { Link } from "@inertiajs/react";

export default function PostIndex({ posts, session }) {
    return (
        <Layout>
            <div style={{ marginTop: "100px" }}>
                <Link
                    href="/posts/create"
                    className="btn btn-success btn-md mb-3"
                >
                    TAMBAH POST
                </Link>

                {session?.success && (
                    <div className="alert alert-success border-0 shadow-sm rounded-3">
                        {session.success}
                    </div>
                )}

                <div className="card border-0 rounded shadow-sm">
                    <div className="card-body">
                        <table className="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">TITLE</th>
                                    <th scope="col">CONTENT</th>
                                    <th scope="col">ACTIONS</th>
                                </tr>
                            </thead>
                            <tbody>
                                {posts?.map((post, index) => (
                                    <tr key={index}>
                                        <td>{post.title}</td>
                                        <td>{post.content}</td>
                                        <td className="text-center" />
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </Layout>
    );
}
