Content-Type: multipart/mixed; boundary="===============7363397810499084006=="
MIME-Version: 1.0
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [staging:staging-next 201/268] drivers/staging/rtl8723bs/core/rtw_security.c:89:6: warning: stack frame size of 1120 bytes in function 'rtw_wep_encrypt'
Date: Sat, 22 May 2021 09:48:31 +0200
Message-ID: <20210522074830.GA1523@agape.jhs>
In-Reply-To: <YKgHy7ZNNxv/KMl8@archlinux-ax161>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7363397810499084006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello Nathan,

On Fri, May 21, 2021 at 12:19:39PM -0700, Nathan Chancellor wrote:
> Hi Fabio,
> =

> On Fri, May 21, 2021 at 04:26:57PM +0200, Fabio Aiuto wrote:
> > Hi robot,
> > =

> > On Thu, May 20, 2021 at 05:03:14PM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/stagin=
g.git staging-next
> > > head:   b9f38e913a926b455e5048a95f53a993b515509f
> > > commit: 1b11e893eda0907fc9b28696271e2d9c4337e42d [201/268] staging: r=
tl8723bs: replace private arc4 encryption with in-kernel one
> > > config: powerpc64-randconfig-r011-20210520 (attached as .config)
> > > compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project =
bf9ef3efaa99c02e7bfc4c57207301b8de39a278)
> > > reproduce (this is a W=3D1 build):
> > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master=
/sbin/make.cross -O ~/bin/make.cross
> > >         chmod +x ~/bin/make.cross
> > >         # install powerpc64 cross compiling tool for clang build
> > >         # apt-get install binutils-powerpc64-linux-gnu
> > >         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/stag=
ing.git/commit/?id=3D1b11e893eda0907fc9b28696271e2d9c4337e42d
> > >         git remote add staging https://git.kernel.org/pub/scm/linux/k=
ernel/git/gregkh/staging.git
> > >         git fetch --no-tags staging staging-next
> > >         git checkout 1b11e893eda0907fc9b28696271e2d9c4337e42d
> > >         # save the attached .config to linux build tree
> > >         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cros=
s ARCH=3Dpowerpc64 =

> > =

> > can't compile this, I get the following error:
> > =

> > make CONFIG_OF_ALL_DTBS=3Dy CONFIG_DTC=3Dy HOSTCC=3D/home/fabio/0day/cl=
ang/bin/clang CC=3D/home/fabio/0day/clang/bin/clang LD=3D/home/fabio/0day/c=
lang/bin/ld.lld HOSTLD=3D/home/fabio/0day/clang/bin/ld.lld AR=3D/home/fabio=
/0day/clang/bin/llvm-ar NM=3D/home/fabio/0day/clang/bin/llvm-nm STRIP=3D/ho=
me/fabio/0day/clang/bin/llvm-strip OBJDUMP=3D/home/fabio/0day/clang/bin/llv=
m-objdump OBJSIZE=3D/home/fabio/0day/clang/bin/llvm-size READELF=3D/home/fa=
bio/0day/clang/bin/llvm-readelf HOSTCXX=3D/home/fabio/0day/clang/bin/clang+=
+ HOSTAR=3D/home/fabio/0day/clang/bin/llvm-ar CROSS_COMPILE=3Dpowerpc-linux=
-gnu- --jobs=3D8 LLVM_IAS=3D1 ARCH=3Dpowerpc drivers/staging/rtl8723bs/
> >   CC      scripts/mod/empty.o
> > clang: error: unsupported argument '-me500' to option 'Wa,'
> > make[1]: *** [scripts/Makefile.build:272: scripts/mod/empty.o] Error 1
> > make[1]: *** Attesa per i processi non terminati....
> > make: *** [Makefile:1226: prepare0] Error 2
> > =

> > moreover I had to add LLVM_IAS=3D1, and ARCH=3Dpowerpc64 is not a valid=
 architecture (used powerpc instead).
> > =

> > Could you help me?
> > =

> =

> This is not a clang specific issue, I would not bother with trying to
> use the bot's reproducer steps.
> =

> I can reproduce it with GCC 11.1.0 using the following commands:
> =

> $ make -skj"$(nproc)" ARCH=3Di386 defconfig
> =

> $ scripts/config -e MMC -e STAGING -m RTL8723BS
> =

> $ make -skj"$(nproc)" ARCH=3Di386 olddefconfig drivers/staging/rtl8723bs/
> drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_w=
ep_encrypt=E2=80=99:
> drivers/staging/rtl8723bs/core/rtw_security.c:91:1: warning: the frame si=
ze of 1084 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
>    91 | }
>       | ^
> drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_w=
ep_decrypt=E2=80=99:
> drivers/staging/rtl8723bs/core/rtw_security.c:128:1: warning: the frame s=
ize of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
>   128 | }
>       | ^
> drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_t=
kip_encrypt=E2=80=99:
> drivers/staging/rtl8723bs/core/rtw_security.c:531:1: warning: the frame s=
ize of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
>   531 | }
>       | ^
> drivers/staging/rtl8723bs/core/rtw_security.c: In function =E2=80=98rtw_t=
kip_decrypt=E2=80=99:
> drivers/staging/rtl8723bs/core/rtw_security.c:633:1: warning: the frame s=
ize of 1084 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
>   633 | }
>       | ^

I could not get these warnings in a x86_64 build, so I tried
to reproduce exactly what the robot says. I should have tried
simply an i386 build :)

> =

> Your commit introduced this because the size of the arc4_ctx structure
> is 1032 bytes so allocating it on the stack will cause it to go over the
> 32-bit limit of 1024 bytes. The previous arc4context was only 264 bytes.
> For that large of structure, I would recommend allocating it on the heap
> with kzalloc() and freeing with kfree_sensitive().

I have already I fixed it by putting two arc4_ctx field in security_priv st=
ruct without
locally allocating each time encryption-decryption functions are called.
Hope this is good...

> =

> Cheers,
> Nathan

thank you for help,

fabio
--===============7363397810499084006==--

