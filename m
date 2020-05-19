Content-Type: multipart/mixed; boundary="===============7105952609338614104=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 7243/9662] sh4-linux-ar: net/netlink/genetlink.o: No such file or directory
Date: Tue, 19 May 2020 15:17:29 +0800
Message-ID: <21a5d49b-c5ad-31f8-281a-29f678524f8d@intel.com>
In-Reply-To: <fb54b602-df32-5f6a-1d19-5138754faa41@fb.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7105952609338614104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/19/20 2:57 PM, Yonghong Song wrote:
>
>
> On 5/17/20 10:26 PM, kbuild test robot wrote:
>> tree: =

>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git =

>> master
>> head:=C2=A0=C2=A0 bdecf38f228bcca73b31ada98b5b7ba1215eb9c9
>> commit: 138d0be35b141e09f6b267c6ae4094318d4e4491 [7243/9662] net: =

>> bpf: Add netlink and ipv6_route bpf_iter targets
>> config: sh-randconfig-r011-20200518 (attached as .config)
>> compiler: sh4-linux-gcc (GCC) 9.3.0
>> reproduce:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget =

>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__raw.githubusercon=
tent.com_intel_lkp-2Dtests_master_sbin_make.cross&d=3DDwIBAg&c=3D5VD0RTtNlT=
h3ycd41b3MUw&r=3DDA8e1B5r073vIqRrFz7MRA&m=3DZEUE_FuLqzKIPDfHr2LDcyw45w-bQu3=
XyWM9eWH70_I&s=3DVH-IY80daIafAHNJ3oi0dmt1gariGhYp2iE6aztEOug&e=3D =

>> -O ~/bin/make.cross
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin/make.cro=
ss
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 138d0be35b=
141e09f6b267c6ae4094318d4e4491
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the attached .co=
nfig to linux build tree
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTALL_PATH=
=3D$HOME/0day GCC_VERSION=3D9.3.0 =

>> make.cross ARCH=3Dsh
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>
>>>> sh4-linux-ar: net/netlink/genetlink.o: No such file or directory
>
> Somehow I cannot make it work.
>
> scripts/kconfig/conf=C2=A0 --syncconfig Kconfig
> /home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.=
3.0/cc1: =

> error while loading shared libraries: libmpfr.so.6: cannot open shared =

> object file: No such file or directory
> /home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.=
3.0/cc1: =

> error while loading shared libraries: libmpfr.so.6: cannot open shared =

> object file: No such file or directory
>
> -bash-4.4$ ldd =

> /home/yhs/0day/gcc-9.3.0-nolibc/sh4-linux/bin/../libexec/gcc/sh4-linux/9.=
3.0/cc1
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linux-vdso.so.1 =3D>=C2=A0 (0x=
00007ffdef5ba000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libisl.so.22 =3D> not found
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmpc.so.3 =3D> /lib64/libmpc=
.so.3 (0x00007f4b7ffa1000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmpfr.so.6 =3D> not found
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libgmp.so.10 =3D> /lib64/libgm=
p.so.10 (0x00007f4b7fd29000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib64/libdl.s=
o.2 (0x00007f4b7fb25000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib64/libm.so.=
6 (0x00007f4b7f823000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib64/libc.so.=
6 (0x00007f4b7f455000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0=
x00007f4b801b9000)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmpfr.so.4 =3D> /lib64/libmp=
fr.so.4 (0x00007f4b7f1fa000)
> -bash-4.4$
>
> I do have libmpfr.so.4, but no libmpfr.so.6.

Hi Yonghong,

You might need to install libmpfr6 and libisl22.

Best Regards,
Rong Chen

>
> Also, the error is
> >>> sh4-linux-ar: net/netlink/genetlink.o: No such file or directory
>
> I double checked the commit. It is not clearly to me why my commit
> affect the net/netlink/genetliink.c compilation. Could you send
> me the genetlink.c compilation error message? This may make it
> easier to debug.
>
> Thanks!
>
>>
>> ---
>> 0-DAY CI Kernel Test Service, Intel Corporation
>> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.01.org_hype=
rkitty_list_kbuild-2Dall-40lists.01.org&d=3DDwIBAg&c=3D5VD0RTtNlTh3ycd41b3M=
Uw&r=3DDA8e1B5r073vIqRrFz7MRA&m=3DZEUE_FuLqzKIPDfHr2LDcyw45w-bQu3XyWM9eWH70=
_I&s=3DFqtN4wRMFzzOSQyiBkpM1TppJhvHUjlgyAU2gtU6wkg&e=3D =

>>
>>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============7105952609338614104==--

