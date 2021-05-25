Content-Type: multipart/mixed; boundary="===============5180100936160585803=="
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] kcov: add __no_sanitize_coverage to fix noinstr for all architectures
Date: Wed, 26 May 2021 00:29:58 +0200
Message-ID: <CANpmjNMT=HQQpK9U4bnoGb-=+KJC246dSZ3u2VB0TXw4itsB-w@mail.gmail.com>
In-Reply-To: <202105260629.X6n5yc4D-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5180100936160585803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 26 May 2021 at 00:23, kernel test robot <lkp@intel.com> wrote:
[...]
> [auto build test WARNING on linux/master]
> [also build test WARNING on kees/for-next/pstore linus/master v5.13-rc3 n=
ext-20210525]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Marco-Elver/kcov-add-__n=
o_sanitize_coverage-to-fix-noinstr-for-all-architectures/20210526-020046
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t dd860052c99b1e088352bdd4fb7aef46f8d2ef47
> config: s390-randconfig-r002-20210525 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 9915=
5e913e9bad5f7f8a247f8bb3a3ff3da74af1)

^^^ you're using a Clang pre-release, breakages are expected until
Clang 13 is final.

I think there was a thread about this at some point. I guess LKP has
decided that testing Clang pre-releases is fair game? I guess it's
useful, but this warning here needs to be ignored. It'll go away when
you rebuild your pre-release Clang 13 from the latest LLVM main
branch.

[...]
> >> arch/s390/kernel/nmi.c:182:6: warning: unknown sanitizer 'coverage' ig=
nored [-Wunknown-sanitizers]
>    void noinstr s390_handle_mcck(void)
>         ^
>    include/linux/compiler_types.h:213:35: note: expanded from macro 'noin=
str'
>            __no_kcsan __no_sanitize_address __no_sanitize_coverage
>                                             ^
>    include/linux/compiler-clang.h:49:59: note: expanded from macro '__no_=
sanitize_coverage'
>    #define __no_sanitize_coverage __attribute__((no_sanitize("coverage")))
>                                                              ^

Clang 13 will support the attribute, but this is a pre-release Clang
13 -- so please ignore the report. FWIW, I tested my patch of course
with a version of Clang 13 that supports the attribute. :-)

Thanks,
-- Marco
--===============5180100936160585803==--

