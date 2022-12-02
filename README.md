# billstclair/elm-mastodon-instances

This is a package for reading, writing, and editing Fediverse
`instances.json` files.

An `instances.json` file contains a list of Fediverse instances, with
a name, url, description, and list of tags for each:

    [{ name: "Impeccable",
       domain: "impeccable.social",
       description: "Personal instance of Bill St. Clair. Registrations closed"
       tags: ["personal,pleroma,closed"]
     },
     { name: "Gleasonator",
       domain: "gleasonator.com",
       description: "Alex Gleason's Rebased server. Registrations open."
       tags: "rebased,open"
     }
    ]
    
See `README.md` in the `example` directory for how to run an example application.
