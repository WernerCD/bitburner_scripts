��  WbX9BtjongvbXTr6ro2yvqvc2hNub6W9EAvAE2cxDi2ekNpv7toe7H2WSQb8y9TNn6m32WkaDhqiuLa75msLGfe6Grb                     nicoty9       lib_ls.js: minor refactor. rm.js: add. README.md: update.        2020-10-10T23:31:05.259054523Z              @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V   @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩ   @       d��y��-e^�2j�l��_�5���t�y�h&�4�Lr�5�OG��iJ$���^��m�?y�P   @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%���   @       7�L�|��-�m�۫0`�����oc>#(q\^��������)�t�"z���s�Ҋ<�z�ğ�/w�                    @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���          @       ���`|���s�7��6V��
���w��p��О\�x�5B��E�#\�߱QR�-�lm`m����          @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                     @       ���`|���s�7��6V��
���w��p��О\�x�5B��E�#\�߱QR�-�lm`m����                 @       �V	ؽ��Ђ��&��ߤpP�Y��ap|5��6�O*��L���3 ���qN�Ոu-}X                      �      Save all the `.js` files in this repository to the root directory of a rooted server (one with at least enough RAM to run "hacker.js", e.g. "foodnstuff") using the same filenames (but not including the directory names) that they currently have in this repository. If in the start of a new game or just after resetting, run `run botnet.js 0.001` to increase the RAM available for the scripts and increase the available hackable servers, then `run kill.js` (to kill any currently running scripts).
   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                     @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���                 @       �V	ؽ��Ђ��&��ߤpP�Y��ap|5��6�O*��L���3 ���qN�Ոu-}X>                              
       ---
       
       ### "rm.js" (3.05 GB)
`         * Removes all removable files (which excludes currently running scripts, including this one).
Q         * Optionally, removes only files whose names match a given regular expression.
\         * Optionally, removes only files on servers whose names match a given regular expression.
�         * Optionally, removes only files whose names match a given regular expression on servers whose names match a given regular expression.
       
       #### USAGE
$         `run rm.js [FLAGS ...] [OPTIONS]`
       
       #### FLAGS
         `-h, --help`
       
(         * Displays a help message then exits.
       
       #### OPTIONS
         `-e, --server <REGEX>`
       
6         * REGEX = Regular expression used for server names.
       
         `-f, --file <REGEX>`
       
3         * REGEX = Regular expression used for filenames.
       
       #### EXAMPLES
         `run rm.js`
       
!         * Removes all removable files.
       
          `run rm.js -f txt --file lit`
   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                     @       �V	ؽ��Ђ��&��ߤpP�Y��ap|5��6�O*��L���3 ���qN�Ոu-}X>                 @       �V	ؽ��Ђ��&��ߤpP�Y��ap|5��6�O*��L���3 ���qN�Ոu-}X?        "       
       Y         * Removes all files with filenames that match the regular expressions "txt" and "lit".
       
.         `run rm.js -e home --server harakiri-sushi`
       
j         * Removes all files from servers whose names match the regular expressions "home" and "harakiri-sushi".
       
@         `run rm.js -f txt --file lit -e home --server harakiri-sushi`
       
�         * Removes all files with filenames that match the regular expressions "txt" and "lit" from servers whose names match the regular expressions "home" and "harakiri-sushi".
       
   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                    @       7�L�|��-�m�۫0`�����oc>#(q\^��������)�t�"z���s�Ҋ<�z�ğ�/w�	          @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���0          @       7�L�|��-�m�۫0`�����oc>#(q\^��������)�t�"z���s�Ҋ<�z�ğ�/w�   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                     @       eMO2\��PS4e���s(�)b=��8H<�@}�ބ�ŀ�?��O�f������e<d�1��(���0                 @       �u _�R'�=:3P��J�HT0�nJ���k�5�O��+lij��c}v̅�������'��n�        ,              ,        * [See if this discussion about the hacking strategy used answers your questions](https://web.archive.org/web/20201010181949/https://old.reddit.com/r/Bitburner/comments/g2ry1t/can_someone_explain_traditional_hacking_loop/). If it doesn't, feel free to contact me through one of the channels above.
   @       K�}�z��޻N��0?��\�@G9�	�y�Ta7S���)����>u[����V�.~�����F�=��                    @       d��y��-e^�2j�l��_�5���t�y�h&�4�Lr�5�OG��iJ$���^��m�?y�PI          @       t�{�v��v�Y�j
�����;n$;����~S�E"��H�c�a^�[�`�&���qߏ�J�|          @       d��y��-e^�2j�l��_�5���t�y�h&�4�Lr�5�OG��iJ$���^��m�?y�P   @       ��*�⦽Z<���o�92(�O�9�X�Pa�DQ�yLsz~":OJX?�Q�Ҏ���<�Z�$�	                     @       t�{�v��v�Y�j
�����;n$;����~S�E"��H�c�a^�[�`�&���qߏ�J�|                 @       ��*�⦽Z<���o�92(�O�9�X�Pa�DQ�yLsz~":OJX?�Q�Ҏ���<�Z�$�	E        -                               break;
   @       ��*�⦽Z<���o�92(�O�9�X�Pa�DQ�yLsz~":OJX?�Q�Ҏ���<�Z�$�	                     @       MR�ֱ.��d�O�X�W��2�+�7����eЋ��X��E����Q� G�sƤ\O�v�;�               .                     �rm.js           @       MR�ֱ.��d�O�X�W��2�+�7����eЋ��X��E����Q� G�sƤ\O�v�;�                   /                0       �       %       /* rm.js - 3.05GB - removes files */
       
	       import {
         string_sanitise,
         object_parse_arguments
       } from "lib_no_ns.js";
       
       // functions
+       const object_get_constants = function () {
         return {
           object_argument_names: {
             file_regex: {
               short: "f",
               long: "file",
	             },
             server_regex: {
               short: "e",
               long: "server",
	             },
             help: {
               short: "h",
               long: "help",
	             },
           }
         };
       };
       
(       const void_print_help = function (ns) {
N         const object_argument_names = object_get_constants().object_argument_names;
         ns.tprint(
           string_sanitise(`
       DESCRIPTION
^         Removes all removable files (which excludes currently running scripts, including this one).
O         Optionally, removes only files whose names match a given regular expression.
Z         Optionally, removes only files on servers whose names match a given regular expression.
�         Optionally, removes only files whose names match a given regular expression on servers whose names match a given regular expression.
       
       USAGE
6         run ${ns.getScriptName()} [FLAGS ...] [OPTIONS ...]
       
       FLAGS
M         -${object_argument_names.help.short}, --${object_argument_names.help.long}
&           Displays this message then exits.
       
       OPTIONS
e         -${object_argument_names.server_regex.short}, --${object_argument_names.server_regex.long} <REGEX>
6           REGEX = Regular expression used for server names.
       
a         -${object_argument_names.file_regex.short}, --${object_argument_names.file_regex.long} <REGEX>
4           REGEX = Regular expression used for filenames.`
           )
         );
       };
       
-       const array_get_servers_matching_regexes = (
         ns,
         array_string_server_regexes
       ) => {
,         const array_servers = [ns.getHostname()];
0         if (array_string_server_regexes.length > 0) {
%           const array_server_regexes = [];
A           array_string_server_regexes.forEach(string_server_regex => {
B             array_server_regexes.push(new RegExp(string_server_regex));
           });
-           array_servers.forEach(string_server => {
9             const array_scan_results = ns.scan(string_server);
9             array_scan_results.forEach(string_scan_result => {
>               array_server_regexes.forEach(object_server_regex => {
                 if (
<                   object_server_regex.test(string_scan_result) &&
=                   array_servers.indexOf(string_scan_result) === -1
                 )
4                   array_servers.push(string_scan_result);
               });

             });
           });
         } else {
-           array_servers.forEach(string_server => {
9             const array_scan_results = ns.scan(string_server);
9             array_scan_results.forEach(string_scan_result => {
>               if (array_servers.indexOf(string_scan_result) === -1)
2                 array_servers.push(string_scan_result);

             });
           });
         }
         return array_servers;
       };
       
5       const array_get_files_on_server_matching_regexes = (
         ns,
         string_server,
         array_string_file_regexes
       ) => {
.         if (array_string_file_regexes.length > 0) {

           const
             array_file_regexes = [],
             array_files = [];
=           array_string_file_regexes.forEach(string_file_regex => {
>             array_file_regexes.push(new RegExp(string_file_regex));
           });
2           ns.ls(string_server).forEach(string_file => {
8             array_file_regexes.forEach(object_file_regex => {
1               if (object_file_regex.test(string_file))
)                 array_files.push(string_file);

             });
           });
           return array_files;
         } else {
!           return ns.ls(string_server);
         }
       };
       
       const void_remove = (
         ns,
         array_string_server_regexes,
         array_string_file_regexes
       ) => {
<         const array_servers = array_get_servers_matching_regexes(
           ns,
            array_string_server_regexes
         );
+         array_servers.forEach(string_server => {
D           const array_files = array_get_files_on_server_matching_regexes(

             ns,
             string_server,
              array_string_file_regexes
           );
)           array_files.forEach(string_file => {
             if (!ns.rm(
               string_file,
               string_server
             )) {
               ns.tprint(
\                 `WARNING: Unable to remove file "${string_file}" from server "${string_server}".`
               );
             }
           });
         });
       };
       
       // main
*       export const main = async function (ns) {
         // variables
         let boolean_print_help = !1;
         const
           array_server_regexes = [],
           array_file_regexes = [],
8           object_arguments = object_parse_arguments(ns.args),
J           object_argument_names = object_get_constants().object_argument_names;
         // argument parsing
2         for (const string_argument in object_arguments)
<           if (object_arguments.hasOwnProperty(string_argument)) {
@             const argument_value = object_arguments[string_argument];
!             switch (string_argument) {
7               case object_argument_names.server_regex.short:
               // fall-through
6               case object_argument_names.server_regex.long:
,                 "object" == typeof argument_value
;                   ? array_server_regexes.push(...argument_value)
9                   : array_server_regexes.push(argument_value);
                 break;
5               case object_argument_names.file_regex.short:
               // fall-through
4               case object_argument_names.file_regex.long:
,                 "object" == typeof argument_value
9                   ? array_file_regexes.push(...argument_value)
7                   : array_file_regexes.push(argument_value);
                 break;
/               case object_argument_names.help.short:
               // fall-through
.               case object_argument_names.help.long:
/                 boolean_print_help = argument_value;
                 break;
               case "_":
                 continue;
               default:
[                 const string_message_error = `Unknown argument passed: \"${string_argument}\".`;
7                 ns.tprint(`ERROR: ${string_message_error}`);
1                 throw new Error(string_message_error);
             }
           }
       

         // main
         if (boolean_print_help)
            return void_print_help(ns);
=         void_remove(ns, array_server_regexes, array_file_regexes);
       };
 /                    @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%����         @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V2          @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%���   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                     @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V2                 @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩW        �              -       export const array_get_files_with_string = (
   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                    @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩX          @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩW          @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩ   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                     @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩW                 @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%-        �                       string_server,
   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                    @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩZ          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%-          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩZ          @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩY          @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩ   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4/          @       Z.�y�����pI�󃝜G/JF��iM��m��K?���#=ԥ��4Ƹ�Y��=f�O]�9lǩZ          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�40          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4/          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�41          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�40          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                     @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%-                 @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%0        �                     ) => {
2         const string_type_substring = typeof substring;
   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                    @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%1          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%0          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�42          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%1          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%2          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�42          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%2          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%1          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%3          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%2          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�43          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%3          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%5          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�43          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%5          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%4          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%6          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%5          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%8          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%7          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�44          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%8          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%:          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�44          @       �X̾���TbP/��4E���NO�zp�N^�*D-�g�D�kN�ջ̒]6[��I3 ��`�4   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%:          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%9          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%;          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%:          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%<          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%;          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                    @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%>          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%=          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%?          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%>          @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                     @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%=                 @       N�� eq��P�\i�ɬRH��~��@c�q����A,���DS� �a��u$6>=�F��b����%@        �              .             return ns.ls(string_server, substring);
           case "object":
2             return substring.flatMap((string_file) => {
L               return array_get_files_with_string(ns, string_server, string_file);

             });
   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                    @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%����         @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V;          @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%���   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V=          @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V<          @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V=          @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%����         @       ˢ�ů`O�8�K���R�!��@���:��1Ȧ}��\�>j�����*����u�z�nF�s%���   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0                     @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V;                �                     };
   @       vyc|�{.�_����oF�U��A�F��]}���#$�e�eQUJk� ���_��`�z?P���T<V0       �u 
 '�_�E=!%4/ �y�r-��I�l���	I�l���  �) �-� ֒��J�1�ƭ�^zɉ�%*.�2�.�Q �u��^��iT�������KMj��*��+t