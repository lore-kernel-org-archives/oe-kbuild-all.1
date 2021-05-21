Content-Type: multipart/mixed; boundary="===============7680155293155103966=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [staging:staging-next 201/268] drivers/staging/rtl8723bs/core/rtw_security.c:89:6: warning: stack frame size of 1120 bytes in function 'rtw_wep_encrypt'
Date: Fri, 21 May 2021 12:19:39 -0700
Message-ID: <YKgHy7ZNNxv/KMl8@archlinux-ax161>
In-Reply-To: <20210521142656.GA1409@agape.jhs>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7680155293155103966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

On Fri, May 21, 2021 at 04:26:57PM +0200, Fabio Aiuto wrote:
> Hi robot,
> =

> On Thu, May 20, 2021 at 05:03:14PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.=
git staging-next
> > head:   b9f38e913a926b455e5048a95f53a993b515509f
> > commit: 1b11e893eda0907fc9b28696271e2d9c4337e42d [201/268] staging: rtl=
8723bs: replace private arc4 encryption with in-kernel one
> > config: powerpc64-randconfig-r011-20210520 (attached as .config)
> > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project bf=
9ef3efaa99c02e7bfc4c57207301b8de39a278)
> > reproduce (this is a W=3D1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install powerpc64 cross compiling tool for clang build
> >         # apt-get install binutils-powerpc64-linux-gnu
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/stagin=
g.git/commit/?id=3D1b11e893eda0907fc9b28696271e2d9c4337e42d
> >         git remote add staging https://git.kernel.org/pub/scm/linux/ker=
nel/git/gregkh/staging.git
> >         git fetch --no-tags staging staging-next
> >         git checkout 1b11e893eda0907fc9b28696271e2d9c4337e42d
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =
ARCH=3Dpowerpc64 =

> =

> can't compile this, I get the following error:
> =

> make CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy HOSTCC=3D/home/fabio/0day/clan=
g/bin/clang CC=3D/home/fabio/0day/clang/bin/clang LD=3D/home/fabio/0day/cla=
ng/bin/ld.lld HOSTLD=3D/home/fabio/0day/clang/bin/ld.lld AR=3D/home/fabio/0=
day/clang/bin/llvm-ar NM=3D/home/fabio/0day/clang/bin/llvm-nm STRIP=3D/home=
/fabio/0day/clang/bin/llvm-strip OBJDUMP=3D/home/fabio/0day/clang/bin/llvm-=
objdump OBJSIZE=3D/home/fabio/0day/clang/bin/llvm-size READELF=3D/home/fabi=
o/0day/clang/bin/llvm-readelf HOSTCXX=3D/home/fabio/0day/clang/bin/clang++ =
HOSTAR=3D/home/fabio/0day/clang/bin/llvm-ar CROSS_COMPILE=3Dpowerpc-linux-g=
nu- --jobs=3D8 LLVM_IAS=3D1 ARCH=3Dpowerpc drivers/staging/rtl8723bs/
>   CC      scripts/mod/empty.o
> clang: error: unsupported argument '-me500' to option 'Wa,'
> make[1]: *** [scripts/Makefile.build:272: scripts/mod/empty.o] Error 1
> make[1]: *** Attesa per i processi non terminati....
> make: *** [Makefile:1226: prepare0] Error 2
> =

> moreover I had to add LLVM_IAS=3D1, and ARCH=3Dpowerpc64 is not a valid a=
rchitecture (used powerpc instead).
> =

> Could you help me?
> =


This is not a clang specific issue, I would not bother with trying to
use the bot's reproducer steps.

I can reproduce it with GCC 11.1.0 using the following commands:

$ make -skj"$(nproc)" ARCH=3Di386 defconfig

$ scripts/config -e MMC -e STAGING -m RTL8723BS

$ make -skj"$(nproc)" ARCH=3Di386 olddefconfig drivers/staging/rtl8723bs/
drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_wep=
_encrypt=E2=80=99:
drivers/staging/rtl8723bs/core/rtw_security.c:91:1: warning: the frame size=
 of 1084 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
   91 | }
      | ^
drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_wep=
_decrypt=E2=80=99:
drivers/staging/rtl8723bs/core/rtw_security.c:128:1: warning: the frame siz=
e of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  128 | }
      | ^
drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_tki=
p_encrypt=E2=80=99:
drivers/staging/rtl8723bs/core/rtw_security.c:531:1: warning: the frame siz=
e of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  531 | }
      | ^
drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_tki=
p_decrypt=E2=80=99:
drivers/staging/rtl8723bs/core/rtw_security.c:633:1: warning: the frame siz=
e of 1084 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
  633 | }
      | ^

Your commit introduced this because the size of the arc4_ctx structure
is 1032 bytes so allocating it on the stack will cause it to go over the
32-bit limit of 1024 bytes. The previous arc4context was only 264 bytes.
For that large of structure, I would recommend allocating it on the heap
with kzalloc() and freeing with kfree_sensitive().

Cheers,
Nathan
--===============7680155293155103966==--

