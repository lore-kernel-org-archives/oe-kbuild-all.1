Content-Type: multipart/mixed; boundary="===============4851497516584525937=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 7243/9662] sh4-linux-ar: net/netlink/genetlink.o: No such file or directory
Date: Mon, 18 May 2020 23:57:01 -0700
Message-ID: <fb54b602-df32-5f6a-1d19-5138754faa41@fb.com>
In-Reply-To: <202005181356.0fNjbZBA%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4851497516584525937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/17/20 10:26 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
> commit: 138d0be35b141e09f6b267c6ae4094318d4e4491 [7243/9662] net: bpf: Ad=
d netlink and ipv6_route bpf_iter targets
> config: sh-randconfig-r011-20200518 (attached as .config)
> compiler: sh4-linux-gcc (GCC) 9.3.0
> reproduce:
>          wget https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__raw.=
githubusercontent.com_intel_lkp-2Dtests_master_sbin_make.cross&d=3DDwIBAg&c=
=3D5VD0RTtNlTh3ycd41b3MUw&r=3DDA8e1B5r073vIqRrFz7MRA&m=3DZEUE_FuLqzKIPDfHr2=
LDcyw45w-bQu3XyWM9eWH70_I&s=3DVH-IY80daIafAHNJ3oi0dmt1gariGhYp2iE6aztEOug&e=
=3D  -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          git checkout 138d0be35b141e09f6b267c6ae4094318d4e4491
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day GCC_VERSION=3D9.3.0 make.cros=
s ARCH=3Dsh
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>, old ones prefixed by <<):
> =

>>> sh4-linux-ar: net/netlink/genetlink.o: No such file or directory

Somehow I cannot make it work.

scripts/kconfig/conf  --syncconfig Kconfig
/home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.3.=
0/cc1: =

error while loading shared libraries: libmpfr.so.6: cannot open shared =

object file: No such file or directory
/home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.3.=
0/cc1: =

error while loading shared libraries: libmpfr.so.6: cannot open shared =

object file: No such file or directory

-bash-4.4$ ldd =

/home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.3.=
0/cc1
         linux-vdso.so.1 =3D>  (0x00007ffdef5ba000)
         libisl.so.22 =3D> not found
         libmpc.so.3 =3D> /lib64/libmpc.so.3 (0x00007f4b7ffa1000)
         libmpfr.so.6 =3D> not found
         libgmp.so.10 =3D> /lib64/libgmp.so.10 (0x00007f4b7fd29000)
         libdl.so.2 =3D> /lib64/libdl.so.2 (0x00007f4b7fb25000)
         libm.so.6 =3D> /lib64/libm.so.6 (0x00007f4b7f823000)
         libc.so.6 =3D> /lib64/libc.so.6 (0x00007f4b7f455000)
         /lib64/ld-linux-x86-64.so.2 (0x00007f4b801b9000)
         libmpfr.so.4 =3D> /lib64/libmpfr.so.4 (0x00007f4b7f1fa000)
-bash-4.4$

I do have libmpfr.so.4, but no libmpfr.so.6.

Also, the error is
 >>> sh4-linux-ar: net/netlink/genetlink.o: No such file or directory

I double checked the commit. It is not clearly to me why my commit
affect the net/netlink/genetliink.c compilation. Could you send
me the genetlink.c compilation error message? This may make it
easier to debug.

Thanks!

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_hyper=
kitty_list_kbuild-2Dall-40lists.01.org&d=3DDwIBAg&c=3D5VD0RTtNlTh3ycd41b3MU=
w&r=3DDA8e1B5r073vIqRrFz7MRA&m=3DZEUE_FuLqzKIPDfHr2LDcyw45w-bQu3XyWM9eWH70_=
I&s=3DFqtN4wRMFzzOSQyiBkpM1TppJhvHUjlgyAU2gtU6wkg&e=3D
>=20
--===============4851497516584525937==--

