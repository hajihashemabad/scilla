(*
 * Copyright (c) 2018 - present Zilliqa, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 *)


open Printf
open Sexplib.Std
open Syntax
open EvalUtil

let () =
  let filename = Sys.argv.(1) in
  match FrontEndParser.parse_file ScillaParser.exps filename with
  | Some (e :: _) ->
      let env = Env.empty in
      let res = Eval.exp_eval e env in
      (match res with
      | Ok r -> printf "%s\n" (pp_result res)
      | Error _ -> printf "Failed execution:\n%s\n" (pp_result res))
  | Some [] | None ->
      printf "%s\n" "Failed to parse input file."
  


