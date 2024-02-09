# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "ansi-regex-5.0.1" = {
      name = "ansi-regex";
      packageName = "ansi-regex";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz";
        sha512 = "quJQXlTSUGL2LH9SUXo8VwsY4soanhgo6LNSm84E1LBcE8s3O0wpdiRzyR9z/ZZJMlMWv37qOOb9pdJlMUEKFQ==";
      };
    };
    "ansi-styles-4.3.0" = {
      name = "ansi-styles";
      packageName = "ansi-styles";
      version = "4.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ansi-styles/-/ansi-styles-4.3.0.tgz";
        sha512 = "zbB9rCJAT1rbjiVDb2hqKFHNYLxgtk8NURxZ3IZwD3F6NtxbXZQCnnSi1Lkx+IDohdPlFp222wVALIheZJQSEg==";
      };
    };
    "buffer-from-1.1.2" = {
      name = "buffer-from";
      packageName = "buffer-from";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz";
        sha512 = "E+XQCRwSbaaiChtv6k6Dwgc+bx+Bs6vuKJHHl5kox/BaKbhiXzqQOwK4cO22yElGp2OCmjwVhT3HmxgyPGnJfQ==";
      };
    };
    "bufferutil-4.0.8" = {
      name = "bufferutil";
      packageName = "bufferutil";
      version = "4.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/bufferutil/-/bufferutil-4.0.8.tgz";
        sha512 = "4T53u4PdgsXqKaIctwF8ifXlRTTmEPJ8iEPWFdGZvcf7sbwYo6FKFEX9eNNAnzFZ7EzJAQ3CJeOtCRA4rDp7Pw==";
      };
    };
    "cliui-8.0.1" = {
      name = "cliui";
      packageName = "cliui";
      version = "8.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/cliui/-/cliui-8.0.1.tgz";
        sha512 = "BSeNnyus75C4//NQ9gQt1/csTXyo/8Sb+afLAkzAptFuMsod9HFokGNudZpi/oQV73hnVK+sR+5PVRMd+Dr7YQ==";
      };
    };
    "color-convert-2.0.1" = {
      name = "color-convert";
      packageName = "color-convert";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-convert/-/color-convert-2.0.1.tgz";
        sha512 = "RRECPsj7iu/xb5oKYcsFHSppFNnsj/52OVTRKb4zP5onXwVF3zVmmToNcOfGC+CRDpfK/U584fMg38ZHCaElKQ==";
      };
    };
    "color-name-1.1.4" = {
      name = "color-name";
      packageName = "color-name";
      version = "1.1.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/color-name/-/color-name-1.1.4.tgz";
        sha512 = "dOy+3AuW3a2wNbZHIuMZpTcgjGuLU/uBL/ubcZF9OXbDo8ff4O8yVp5Bf0efS8uEoYo5q4Fx7dY9OgQGXgAsQA==";
      };
    };
    "colors-1.4.0" = {
      name = "colors";
      packageName = "colors";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/colors/-/colors-1.4.0.tgz";
        sha512 = "a+UqTh4kgZg/SlGvfbzDHpgRu7AAQOmmqRHJnxhRZICKFUT91brVhNNt58CMWU9PsBbv3PDCZUHbVxuDiH2mtA==";
      };
    };
    "dateformat-4.5.1" = {
      name = "dateformat";
      packageName = "dateformat";
      version = "4.5.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dateformat/-/dateformat-4.5.1.tgz";
        sha512 = "OD0TZ+B7yP7ZgpJf5K2DIbj3FZvFvxgFUuaqA/V5zTjAtAAXZ1E8bktHxmAGs4x5b7PflqA9LeQ84Og7wYtF7Q==";
      };
    };
    "emoji-regex-8.0.0" = {
      name = "emoji-regex";
      packageName = "emoji-regex";
      version = "8.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz";
        sha512 = "MSjYzcWNOA0ewAHpz0MxpYFvwg6yjy1NG3xteoqz644VCo/RPgnr1/GGt+ic3iJTzQ8Eu3TdM14SawnVUmGE6A==";
      };
    };
    "escalade-3.1.2" = {
      name = "escalade";
      packageName = "escalade";
      version = "3.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/escalade/-/escalade-3.1.2.tgz";
        sha512 = "ErCHMCae19vR8vQGe50xIsVomy19rg6gFu3+r3jkEO46suLMWBksvVyoGgQV+jOfl84ZSOSlmv6Gxa89PmTGmA==";
      };
    };
    "eventemitter3-5.0.1" = {
      name = "eventemitter3";
      packageName = "eventemitter3";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/eventemitter3/-/eventemitter3-5.0.1.tgz";
        sha512 = "GWkBvjiSZK87ELrYOSESUYeVIc9mvLLf/nXalMOS5dYrgZq9o5OVkbZAVM06CVxYsCwH9BDZFPlQTlPA1j4ahA==";
      };
    };
    "get-caller-file-2.0.5" = {
      name = "get-caller-file";
      packageName = "get-caller-file";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/get-caller-file/-/get-caller-file-2.0.5.tgz";
        sha512 = "DyFP3BM/3YHTQOCUL/w0OZHR0lpKeGrxotcHWcqNEdnltqFwXVfhEBQ94eIo34AfQpo0rGki4cyIiftY06h2Fg==";
      };
    };
    "goban-0.7.5" = {
      name = "goban";
      packageName = "goban";
      version = "0.7.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/goban/-/goban-0.7.5.tgz";
        sha512 = "aAY0uRgfWsGao45SJruJdBLZSXRHGpzQYcYUEGF08/kmC0VfuUJu0tvxpXyoKWQiy559AiVlUN8L3A9WfUKcZg==";
      };
    };
    "is-fullwidth-code-point-3.0.0" = {
      name = "is-fullwidth-code-point";
      packageName = "is-fullwidth-code-point";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz";
        sha512 = "zymm5+u+sCsSWyD9qNaejV3DFvhCKclKdizYaJUuHA83RLjb7nSuGnddCHGv0hk+KY7BMAlsWeK4Ueg6EV6XQg==";
      };
    };
    "json5-2.2.3" = {
      name = "json5";
      packageName = "json5";
      version = "2.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/json5/-/json5-2.2.3.tgz";
        sha512 = "XmOWe7eyHYH14cLdVPoyg+GOH3rYX++KpzrylJwSW98t3Nk+U8XOl8FWKOgwtzdb8lXGf6zYwDUzeHMWfxasyg==";
      };
    };
    "jsonschema-1.4.1" = {
      name = "jsonschema";
      packageName = "jsonschema";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonschema/-/jsonschema-1.4.1.tgz";
        sha512 = "S6cATIPVv1z0IlxdN+zUk5EPjkGCdnhN4wVSBlvoUO1tOLJootbo9CquNJmbIh4yikWHiUedhRYrNPn1arpEmQ==";
      };
    };
    "mkdirp-1.0.4" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz";
        sha512 = "vVqVZQyf3WLx2Shd0qJ9xuvqgAyKPLAiqITEtqW0oIUjzo3PePDd6fW9iFz30ef7Ysp/oiWqbhszeGWW2T6Gzw==";
      };
    };
    "node-gyp-build-4.8.0" = {
      name = "node-gyp-build";
      packageName = "node-gyp-build";
      version = "4.8.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-gyp-build/-/node-gyp-build-4.8.0.tgz";
        sha512 = "u6fs2AEUljNho3EYTJNBfImO5QTo/J/1Etd+NVdCj7qWKUSN/bSLkZwhDv7I+w/MSC6qJ4cknepkAYykDdK8og==";
      };
    };
    "require-directory-2.1.1" = {
      name = "require-directory";
      packageName = "require-directory";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/require-directory/-/require-directory-2.1.1.tgz";
        sha512 = "fGxEI7+wsG9xrvdjsrlmL22OMTTiHRwAMroiEeMgq8gzoLC/PQr7RsRDSTLUg/bZAZtF+TVIkHc6/4RIKrui+Q==";
      };
    };
    "source-map-0.6.1" = {
      name = "source-map";
      packageName = "source-map";
      version = "0.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz";
        sha512 = "UjgapumWlbMhkBgzT7Ykc5YXUT46F0iKu8SGXq0bcwP5dz/h0Plj6enJqjz1Zbq2l5WaqYnrVbwWOWMyF3F47g==";
      };
    };
    "source-map-support-0.5.21" = {
      name = "source-map-support";
      packageName = "source-map-support";
      version = "0.5.21";
      src = fetchurl {
        url = "https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz";
        sha512 = "uBHU3L3czsIyYXKX88fdrGovxdSCoTGDRZ6SYXtSRxLZUzHg5P/66Ht6uoUlHu9EZod+inXhKo3qQgwXUT/y1w==";
      };
    };
    "split2-4.2.0" = {
      name = "split2";
      packageName = "split2";
      version = "4.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/split2/-/split2-4.2.0.tgz";
        sha512 = "UcjcJOWknrNkF6PLX83qcHM6KHgVKNkV62Y8a5uYDVv9ydGQVwAHMKqHdJje1VTWpljG0WYpCDhrCdAOYH4TWg==";
      };
    };
    "string-width-4.2.3" = {
      name = "string-width";
      packageName = "string-width";
      version = "4.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz";
        sha512 = "wKyQRQpjJ0sIp62ErSZdGsjMJWsap5oRNihHhu6G7JVO/9jIB6UyevL+tXuOqrng8j/cxKTWyWUwvSTriiZz/g==";
      };
    };
    "strip-ansi-6.0.1" = {
      name = "strip-ansi";
      packageName = "strip-ansi";
      version = "6.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz";
        sha512 = "Y38VPSHcqkFrCpFnQ9vuSXmquuv5oXOKpGeT6aGrr3o3Gc9AlVa6JBfUSOCnbxGGZF+/0ooI7KrPuUSztUdU5A==";
      };
    };
    "tinytim-0.1.1" = {
      name = "tinytim";
      packageName = "tinytim";
      version = "0.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/tinytim/-/tinytim-0.1.1.tgz";
        sha512 = "NIpsp9lBIxPNzB++HnMmUd4byzJSVbbO4F+As1Gb1IG/YQT5QvmBDjpx8SpDS8fhGC+t+Qw8ldQgbcAIaU+2cA==";
      };
    };
    "tracer-1.3.0" = {
      name = "tracer";
      packageName = "tracer";
      version = "1.3.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tracer/-/tracer-1.3.0.tgz";
        sha512 = "8G2okIuUNThM1W8HU9YUCsQgxROw9VpewE2f8Tsw3B90b0acvBiATqnUIvv07qG/aBTs7ALDr7tLVUVD86kPPA==";
      };
    };
    "utf-8-validate-6.0.3" = {
      name = "utf-8-validate";
      packageName = "utf-8-validate";
      version = "6.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/utf-8-validate/-/utf-8-validate-6.0.3.tgz";
        sha512 = "uIuGf9TWQ/y+0Lp+KGZCMuJWc3N9BHA+l/UmHd/oUHwJJDeysyTRxNQVkbzsIWfGFbRe3OcgML/i0mvVRPOyDA==";
      };
    };
    "wrap-ansi-7.0.0" = {
      name = "wrap-ansi";
      packageName = "wrap-ansi";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/wrap-ansi/-/wrap-ansi-7.0.0.tgz";
        sha512 = "YVGIj2kamLSTxw6NsZjoBxfSwsn0ycdesmc4p+Q21c5zPuZ1pl+NfxVdxPtdHvmNVOQ6XSYG4AUtyt/Fi7D16Q==";
      };
    };
    "ws-8.16.0" = {
      name = "ws";
      packageName = "ws";
      version = "8.16.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/ws/-/ws-8.16.0.tgz";
        sha512 = "HS0c//TP7Ina87TfiPUz1rQzMhHrl/SG2guqRcTOIUYD2q8uhUdNHZYJUaQ8aTGPzCh+c6oawMKW35nFl1dxyQ==";
      };
    };
    "y18n-5.0.8" = {
      name = "y18n";
      packageName = "y18n";
      version = "5.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/y18n/-/y18n-5.0.8.tgz";
        sha512 = "0pfFzegeDWJHJIAmTLRP2DwHjdF5s7jo9tuztdQxAhINCdvS+3nGINqPd00AphqJR/0LhANUS6/+7SCb98YOfA==";
      };
    };
    "yargs-17.7.2" = {
      name = "yargs";
      packageName = "yargs";
      version = "17.7.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs/-/yargs-17.7.2.tgz";
        sha512 = "7dSzzRQ++CKnNI/krKnYRV7JKKPUXMEh61soaHKg9mrWEhzFWhFnxPxGl+69cD1Ou63C13NUPCnmIcrvqCuM6w==";
      };
    };
    "yargs-parser-21.1.1" = {
      name = "yargs-parser";
      packageName = "yargs-parser";
      version = "21.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/yargs-parser/-/yargs-parser-21.1.1.tgz";
        sha512 = "tVpsJW7DdjecAiFpbIB1e3qxIQsE6NoPc5/eTdrbbIC4h0LVsWhnoa3g+m2HclBIujHzsxZ4VJVA+GUuc2/LBw==";
      };
    };
  };
in
{
  gtp2ogs = nodeEnv.buildNodePackage {
    name = "gtp2ogs";
    packageName = "gtp2ogs";
    version = "8.0.3";
    src = fetchurl {
      url = "https://registry.npmjs.org/gtp2ogs/-/gtp2ogs-8.0.3.tgz";
      sha512 = "MFroCJQSI1uVy40wm4nJm+7S6YpRsJI6uS04zxpua8CcctblUyoCe7lMXSCDwRFGxR3+djrAzTa7EfQ2sDIJVg==";
    };
    dependencies = [
      sources."ansi-regex-5.0.1"
      sources."ansi-styles-4.3.0"
      sources."buffer-from-1.1.2"
      sources."bufferutil-4.0.8"
      sources."cliui-8.0.1"
      sources."color-convert-2.0.1"
      sources."color-name-1.1.4"
      sources."colors-1.4.0"
      sources."dateformat-4.5.1"
      sources."emoji-regex-8.0.0"
      sources."escalade-3.1.2"
      sources."eventemitter3-5.0.1"
      sources."get-caller-file-2.0.5"
      sources."goban-0.7.5"
      sources."is-fullwidth-code-point-3.0.0"
      sources."json5-2.2.3"
      sources."jsonschema-1.4.1"
      sources."mkdirp-1.0.4"
      sources."node-gyp-build-4.8.0"
      sources."require-directory-2.1.1"
      sources."source-map-0.6.1"
      sources."source-map-support-0.5.21"
      sources."split2-4.2.0"
      sources."string-width-4.2.3"
      sources."strip-ansi-6.0.1"
      sources."tinytim-0.1.1"
      sources."tracer-1.3.0"
      sources."utf-8-validate-6.0.3"
      sources."wrap-ansi-7.0.0"
      sources."ws-8.16.0"
      sources."y18n-5.0.8"
      sources."yargs-17.7.2"
      sources."yargs-parser-21.1.1"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "Wrapper to allow Gnu Go Text Protocol speaking Go engines to connect to Online-Go.com and play games";
      homepage = "https://github.com/online-go/gtp2ogs";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
