Content-Type: multipart/mixed; boundary="===============0856089223643282515=="
MIME-Version: 1.0
From: Brendan Higgins <brendanhiggins@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v21 16/18] mm/damon: Add kunit tests
Date: Fri, 09 Oct 2020 11:33:00 -0700
Message-ID: <CAFd5g44jktQU=j_rjJaJ4Ca-qwNaRnQbXXVnT_M0WnFff655MQ@mail.gmail.com>
In-Reply-To: <20201006083205.3476-1-sjpark@amazon.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0856089223643282515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

+KUnit Development +David Gow

On Tue, Oct 6, 2020 at 1:32 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> On Tue, 6 Oct 2020 03:42:01 +0800 kernel test robot <lkp@intel.com> wro=
te:
>
> > Hi SeongJae,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on hnaz-linux-mm/master]
> > [also build test ERROR on kselftest/next tip/perf/core linus/master v5.=
9-rc=3D
> > 8 next-20201002]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/SeongJae-Park/Introduc=
e-Da=3D
> > ta-Access-MONitor-DAMON/20201005-190315
> > base:   https://github.com/hnaz/linux-mm master
> > config: m68k-allmodconfig (attached as .config)
> > compiler: m68k-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=3D3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/=3D
> > make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/bcd8ade170e80e5d63dac=
b96b=3D
> > eb007bfd4e2845e
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review SeongJae-Park/Introduce-Data-A=
cces=3D
> > s-MONitor-DAMON/20201005-190315
> >         git checkout bcd8ade170e80e5d63dacb96beb007bfd4e2845e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D3D$HOME/0day COMPILER=3D3Dgcc-9.3.0 mak=
e.cross =3D
> > ARCH=3D3Dm68k
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    m68k-linux-ld: mm/damon/core.o: in function `damon_test_merge_two':
> >    core.c:(.text+0x63e): undefined reference to `kunit_binary_assert_fo=
rmat=3D
> > '
> > >> m68k-linux-ld: core.c:(.text+0x6ae): undefined reference to `kunit_b=
inar=3D
> > y_assert_format'
> >    m68k-linux-ld: core.c:(.text+0x722): undefined reference to `kunit_b=
inar=3D
> > y_assert_format'
> > >> m68k-linux-ld: core.c:(.text+0x790): undefined reference to `kunit_b=
inar=3D
> > y_ptr_assert_format'
> >    m68k-linux-ld: core.c:(.text+0x83c): undefined reference to `kunit_b=
inar=3D
> > y_assert_format'
> >    m68k-linux-ld: mm/damon/core.o: in function `damon_test_merge_region=
s_of=3D
> > ':
> >    core.c:(.text+0xa66): undefined reference to `kunit_binary_assert_fo=
rmat=3D
> [...]

This kind of looks like an issue with KUnit, since the symbol it is
complaining about is a KUnit one. But we tested KUnit on
m68k...hmmm...

Wait, I think I know what the issue is:

SeongJae, are your KUnit tests #include-d into mm/damon/core.c? Is
that include properly #ifdef-ed?

> Hi,
>
>
> Thanks for the report.  I fixed this with below 1/2 patch.  I also noticed
> DAMON kunit tests are ignoring KUNIT_ALL_TESTS, and fixed it with below 2=
/2
> patch.  Those will be merged in the next version of the patchset.
>
>
> Thanks,
> SeongJae Park
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D >8 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> From b0059c5f620adf8f3244cc1b893ffb1088f70831 Mon Sep 17 00:00:00 2001
> From: SeongJae Park <sjpark@amazon.de>
> Date: Tue, 6 Oct 2020 08:04:23 +0000
> Subject: [PATCH 1/2] mm/damon: Make non-loadable kunit tests depend on KU=
NIT=3Dy
>
> The kunit tests for DAMON don't support module build, and therefore it
> could trigger compile errors with 'make allmodconfig' builds.  This
> commit avoids such errors by making those to depend on KUNIT=3Dy.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
>  mm/damon/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
> index efb158cdc0fc..7dcdbd9ff321 100644
> --- a/mm/damon/Kconfig
> +++ b/mm/damon/Kconfig
> @@ -14,7 +14,7 @@ config DAMON
>
>  config DAMON_KUNIT_TEST
>         bool "Test for damon"
> -       depends on DAMON && KUNIT
> +       depends on DAMON && KUNIT=3Dy
>         help
>           This builds the DAMON Kunit test suite.
>
> @@ -35,7 +35,7 @@ config DAMON_PRIMITIVES
>
>  config DAMON_PRIMITIVES_KUNIT_TEST
>         bool "Test for DAMON primitives"
> -       depends on DAMON_PRIMITIVES && KUNIT
> +       depends on DAMON_PRIMITIVES && KUNIT=3Dy
>         help
>           This builds the DAMON PRIMITIVES Kunit test suite.
>
> @@ -55,7 +55,7 @@ config DAMON_DBGFS
>
>  config DAMON_DBGFS_KUNIT_TEST
>         bool "Test for damon debugfs interface"
> -       depends on DAMON_DBGFS && KUNIT
> +       depends on DAMON_DBGFS && KUNIT=3Dy
>         help
>           This builds the DAMON debugfs interface Kunit test suite.
>
> --
> 2.17.1
>
>
> From c6ee9b0e837dead2e40504c6ab344a689e2d1e96 Mon Sep 17 00:00:00 2001
> From: SeongJae Park <sjpark@amazon.de>
> Date: Tue, 6 Oct 2020 08:09:10 +0000
> Subject: [PATCH 2/2] mm/damon: Respect KUNIT_ALL_TESTS
>
> DAMON kunit tests are not respecting 'KUNIT_ALL_TESTS' config.  This
> commit fixes this problem by letting those default on it and don't let
> users turn off individual tests if 'KUNIT_ALL_TESTS' turned on.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
>  mm/damon/Kconfig | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/mm/damon/Kconfig b/mm/damon/Kconfig
> index 7dcdbd9ff321..9cabf3124c8a 100644
> --- a/mm/damon/Kconfig
> +++ b/mm/damon/Kconfig
> @@ -13,8 +13,9 @@ config DAMON
>           more information.
>
>  config DAMON_KUNIT_TEST
> -       bool "Test for damon"
> +       bool "Test for damon" if !KUNIT_ALL_TESTS
>         depends on DAMON && KUNIT=3Dy
> +       default KUNIT_ALL_TESTS
>         help
>           This builds the DAMON Kunit test suite.
>
> @@ -34,8 +35,9 @@ config DAMON_PRIMITIVES
>           cover your use case, you can implement and use your own primiti=
ves.
>
>  config DAMON_PRIMITIVES_KUNIT_TEST
> -       bool "Test for DAMON primitives"
> +       bool "Test for DAMON primitives" if !KUNIT_ALL_TESTS
>         depends on DAMON_PRIMITIVES && KUNIT=3Dy
> +       default KUNIT_ALL_TESTS
>         help
>           This builds the DAMON PRIMITIVES Kunit test suite.
>
> @@ -54,8 +56,9 @@ config DAMON_DBGFS
>           If unsure, say N.
>
>  config DAMON_DBGFS_KUNIT_TEST
> -       bool "Test for damon debugfs interface"
> +       bool "Test for damon debugfs interface" if !KUNIT_ALL_TESTS
>         depends on DAMON_DBGFS && KUNIT=3Dy
> +       default KUNIT_ALL_TESTS
>         help
>           This builds the DAMON debugfs interface Kunit test suite.
>
> --
> 2.17.1
--===============0856089223643282515==--

