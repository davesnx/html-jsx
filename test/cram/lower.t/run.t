  $ ../ppx.sh --output re input.re
  let lower = JSX.node("div", [], []);
  let lower_empty_attr =
    JSX.node(
      "div",
      List.filter_map(Fun.id, [Some(("class", `String("": string)))]),
      [],
    );
  let lower_inline_styles =
    JSX.node(
      "div",
      List.filter_map(
        Fun.id,
        [
          Some((
            "style",
            `String(Style.make(~backgroundColor="gainsboro", ()): string),
          )),
        ],
      ),
      [],
    );
  let lower_opt_attr =
    JSX.node(
      "div",
      List.filter_map(
        Fun.id,
        [
          Stdlib.Option.map(
            v => ("tabindex", `Int(v)),
            tabindex: option(int),
          ),
        ],
      ),
      [],
    );
  let lowerWithChildAndProps = foo =>
    JSX.node(
      "a",
      List.filter_map(
        Fun.id,
        [
          Some(("tabindex", `Int(1: int))),
          Some(("href", `String("https://example.com": string))),
        ],
      ),
      [foo],
    );
  let lower_child_static = JSX.node("div", [], [JSX.node("span", [], [])]);
  let lower_child_ident = JSX.node("div", [], [lolaspa]);
  let lower_child_single = JSX.node("div", [], [JSX.node("div", [], [])]);
  let lower_children_multiple = (foo, bar) => lower(~children=[foo, bar], ());
  let lower_child_with_upper_as_children = JSX.node("div", [], [App.make()]);
  let lower_children_nested =
    JSX.node(
      "div",
      List.filter_map(
        Fun.id,
        [Some(("class", `String("flex-container": string)))],
      ),
      [
        JSX.node(
          "div",
          List.filter_map(
            Fun.id,
            [Some(("class", `String("sidebar": string)))],
          ),
          [
            JSX.node(
              "h2",
              List.filter_map(
                Fun.id,
                [Some(("class", `String("title": string)))],
              ),
              ["jsoo-react" |> s],
            ),
            JSX.node(
              "nav",
              List.filter_map(
                Fun.id,
                [Some(("class", `String("menu": string)))],
              ),
              [
                JSX.node(
                  "ul",
                  [],
                  [
                    examples
                    |> List.map(e =>
                         JSX.node(
                           "li",
                           [],
                           [
                             JSX.node(
                               "a",
                               List.filter_map(
                                 Fun.id,
                                 [
                                   Some(("href", `String(e.path: string))),
                                   Some((
                                     "onclick",
                                     `String("console.log": string),
                                   )),
                                 ],
                               ),
                               [e.title |> s],
                             ),
                           ],
                         )
                       )
                    |> React.list,
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  let lower_ref_with_children =
    JSX.node(
      "button",
      List.filter_map(
        Fun.id,
        [Some(("class", `String("FancyButton": string)))],
      ),
      [children],
    );
  let lower_with_many_props =
    JSX.node(
      "div",
      List.filter_map(Fun.id, [Some(("translate", `String("yes": string)))]),
      [
        JSX.node(
          "picture",
          List.filter_map(
            Fun.id,
            [Some(("id", `String("idpicture": string)))],
          ),
          [
            JSX.node(
              "img",
              List.filter_map(
                Fun.id,
                [
                  Some(("src", `String("picture/img.png": string))),
                  Some(("alt", `String("test picture/img.png": string))),
                  Some(("id", `String("idimg": string))),
                ],
              ),
              [],
            ),
            JSX.node(
              "source",
              List.filter_map(
                Fun.id,
                [
                  Some(("type", `String("image/webp": string))),
                  Some(("src", `String("picture/img1.webp": string))),
                ],
              ),
              [],
            ),
            JSX.node(
              "source",
              List.filter_map(
                Fun.id,
                [
                  Some(("type", `String("image/jpeg": string))),
                  Some(("src", `String("picture/img2.jpg": string))),
                ],
              ),
              [],
            ),
          ],
        ),
      ],
    );
  let some_random_html_element =
    JSX.node(
      "text",
      List.filter_map(
        Fun.id,
        [
          Some(("dx", `String("1 2": string))),
          Some(("dy", `String("3 4": string))),
        ],
      ),
      [],
    );
