----------------------------------------------------------------------
--
-- Instances.elm
-- Edit instances.json.
-- Copyright (c) 2022 Bill St. Clair <billstclair@gmail.com>
-- Some rights reserved.
-- Distributed under the MIT License
-- See LICENSE
--
----------------------------------------------------------------------


module Mastodon.Instances exposing
    ( Instance, Instances
    , encodeInstance, instanceDecoder
    , encodeInstances, instancesDecoder
    )

{-| Code to read, write, and edit lists of Fediverse instances, encoded as JSON.


# Types

@docs Instance, Instances


# Encode/Decode to/from JSON

@docs encodeInstance, instanceDecoder
@docs encodeInstances, instancesDecoder

-}

import Json.Decode as JD exposing (Decoder)
import Json.Decode.Pipeline as DP exposing (custom, hardcoded, optional, required)
import Json.Encode as JE exposing (Value)


{-| A single Fedivers instance.
-}
type alias Instance =
    { name : String
    , url : String
    , description : String
    , tags : List String
    }


{-| A list of Fediverse instances.
-}
type alias Instances =
    List Instance


{-| Encode an `Instance`.
-}
encodeInstance : Instance -> Value
encodeInstance { name, url, description, tags } =
    JE.object
        [ ( "name", JE.string name )
        , ( "url", JE.string url )
        , ( "description", JE.string description )
        , ( "tags", String.join "," tags |> JE.string )
        ]


{-| Decoder for an `Instance`.
-}
instanceDecoder : Decoder Instance
instanceDecoder =
    JD.succeed Instance
        |> required "name" JD.string
        |> required "url" JD.string
        |> optional "description" JD.string ""
        |> optional "tags"
            (JD.string
                |> JD.andThen
                    (\s ->
                        String.split "," s
                            |> List.map String.trim
                            |> JD.succeed
                    )
            )
            []


{-| Encode an `Instances`.
-}
encodeInstances : Instances -> Value
encodeInstances instances =
    JE.list encodeInstance instances


{-| Decoder for `Instances`
-}
instancesDecoder : Decoder Instances
instancesDecoder =
    JD.list instanceDecoder
