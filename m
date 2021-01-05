Content-Type: multipart/mixed; boundary="===============4136502944217388519=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 6/7] spi: cadence-quadspi: Wait at least 500 ms for direct reads
Date: Tue, 05 Jan 2021 11:41:25 -0800
Message-ID: <CAKwvOdnNeAXUsNQnSmVmODT9C4_J9cX7prRaYTs+R588=JW7LA@mail.gmail.com>
In-Reply-To: <20201229091806.eyrakehdxo6762sg@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4136502944217388519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 29, 2020 at 1:18 AM 'Pratyush Yadav' via Clang Built Linux
<clang-built-linux@googlegroups.com> wrote:
>
> On 29/12/20 11:29AM, kernel test robot wrote:
> > Hi Pratyush,
> >
> > Thank you for the patch! Perhaps something to improve:
> >
> > [auto build test WARNING on spi/for-next]
> > [also build test WARNING on v5.11-rc1 next-20201223]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/Pratyush-Yadav/spi-cad=
ence-quadspi-Add-Octal-DTR-support/20201223-025328
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git=
 for-next
> > config: arm-randconfig-r006-20201221 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ce=
e1e7d14f4628d6174b33640d502bff3b54ae45)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm cross compiling tool for clang build
> >         # apt-get install binutils-arm-linux-gnueabi
> >         # https://github.com/0day-ci/linux/commit/04a7bcbc449363e5d6f49=
8376c69116567b49d7d
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review Pratyush-Yadav/spi-cadence-qua=
dspi-Add-Octal-DTR-support/20201223-025328
> >         git checkout 04a7bcbc449363e5d6f498376c69116567b49d7d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Darm
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/spi/spi-cadence-quadspi.c:966:24: warning: comparison of dis=
tinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (5=
00UL) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
> >                                             msecs_to_jiffies(max(len, 5=
00UL)))) {
> >                                                              ^~~~~~~~~~=
~~~~~
> >    include/linux/minmax.h:58:19: note: expanded from macro 'max'
> >    #define max(x, y)       __careful_cmp(x, y, >)
> >                            ^~~~~~~~~~~~~~~~~~~~~~
> >    include/linux/minmax.h:42:24: note: expanded from macro '__careful_c=
mp'
> >            __builtin_choose_expr(__safe_cmp(x, y), \
> >                                  ^~~~~~~~~~~~~~~~
> >    include/linux/minmax.h:32:4: note: expanded from macro '__safe_cmp'
> >                    (__typecheck(x, y) && __no_side_effects(x, y))
> >                     ^~~~~~~~~~~~~~~~~
> >    include/linux/minmax.h:18:28: note: expanded from macro '__typecheck'
> >            (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
> >                       ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
> >    1 warning generated.
>
> On arm64 size_t is defined as unsigned long and on arm is it defined as
> unsigned int. So using 500U would generate the same warning on 64-bit
> platforms. Maybe the fix is to do something like: max(len, (size_t)500).
> Any better ideas?

SGTM

-- =

Thanks,
~Nick Desaulniers
--===============4136502944217388519==--

