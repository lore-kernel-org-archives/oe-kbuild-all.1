Content-Type: multipart/mixed; boundary="===============7400042553902987538=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: ld.lld: error: undefined symbol: amba_driver_register
Date: Thu, 29 Oct 2020 12:28:54 -0700
Message-ID: <CAKwvOdk82WZnCh9G8CidN9tJ6qiMaHYdN-e+Ad5kRa6C87Vfxg@mail.gmail.com>
In-Reply-To: <202010291249.MFjbb8tv-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7400042553902987538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2020 at 9:57 PM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   23859ae44402f4d935b9ee548135dd1e65e2cbf4
> commit: ea0c0ad6b6eb36726088991d97a55b99cae456d0 memory: Enable compile t=
esting for most of the drivers
> date:   2 months ago
> config: arm-randconfig-r024-20201028 (attached as .config)

^ Note, this was a randconfig, so the preprocessor guards on CONFIGs
might be wrong.

> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 50df=
a19cc799ae7cddd39a95dbfce675a12672ad)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm cross compiling tool for clang build
>         # apt-get install binutils-arm-linux-gnueabi
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dea0c0ad6b6eb36726088991d97a55b99cae456d0
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout ea0c0ad6b6eb36726088991d97a55b99cae456d0
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Darm
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: amba_driver_register
>    >>> referenced by pl353-smc.c
>    >>> memory/pl353-smc.o:(pl353_smc_driver_init) in archive drivers/buil=
t-in.a
> --
> >> ld.lld: error: undefined symbol: amba_driver_unregister
>    >>> referenced by pl353-smc.c
>    >>> memory/pl353-smc.o:(pl353_smc_driver_exit) in archive drivers/buil=
t-in.a
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202010291249.MFjbb8tv-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============7400042553902987538==--

