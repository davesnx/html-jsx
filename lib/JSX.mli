(** Declaratively create HTML elements with JSX using OCaml/Reason.

  {[
    let html: string = JSX.render (
      <div>
        <h1> {JSX.string("Hello, World!")} </h1>
      </div>
    )
  ]}
*)

type attribute =
  string * [ `Bool of bool | `Int of int | `Float of float | `String of string ]

type element
(** The type that represents a JSX.element *)

val render : element -> string
(** Render a JSX.element to a string.

    {[
      let html: string = JSX.render (
        <div>
          <h1> (JSX.string "Hello, World!") </h1>
        </div>
      )
    ]}
*)

val float : float -> element
(** Helper to render a float *)

val fragment : element list -> element
[@@deprecated "Use JSX.list instead"]
(** Fragment *)

val int : int -> element
(** Helper to render an integer *)

val list : element list -> element
(** Helper to render a list of elements *)

val node : string -> attribute list -> element list -> element
(** The function to create a HTML DOM Node [https://developer.mozilla.org/en-US/docs/Web/API/Node]. Given the tag, list of attributes and list of children.

  {[
    JSX.node(
      "a",
      [JSX.Attribute.String(("href", "https://ocaml.org"))],
      [JSX.string("OCaml")],
    );
  ]}
*)

val null : element
(** Helper to represent nullability in JSX, useful to pattern match *)

val string : string -> element
(** Helper to represent an element as a string *)

val text : string -> element
[@@deprecated "Use JSX.string instead"]
(** Helper to render a text *)

val unsafe : string -> element
(** Helper to bypass HTML encoding and treat output as unsafe. This can lead to
    HTML scaping problems, XSS injections and other security concerns, use with caution. *)

(** Provides ways to inspect a JSX.element. *)
module Debug : sig
  type html_element := element

  type element =
    | Null
    | String of string
    | Unsafe of string (* text without encoding *)
    | Node of {
        tag : string;
        attributes : attribute list;
        children : element list;
      }
    | List of element list

  val view : html_element -> element
  (** A function to inspect a JSX.element.

     {[
      let debug: JSX.Debug.__element =
        JSX.Debug.view(
          <div>
            <h1> {JSX.string("Hello, World!")} </h1>
          </div>
        );

      switch (debug) {
        | JSX.Debug.Node {tag; attributes; children} -> Printf.printf("Node: %s", tag)
        | _ -> ()
      }
     ]}
  *)
end

module Html : module type of Html
