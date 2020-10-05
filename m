Content-Type: multipart/mixed; boundary="===============0988099632506003854=="
MIME-Version: 1.0
From: Mike Travis <mike.travis@hpe.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 06/13] x86/platform/uv: Add and Decode Arch Type in UVsystab
Date: Sun, 04 Oct 2020 17:28:43 -0700
Message-ID: <441dbf0a-a499-ba0e-a6ca-77f0f68ba22d@hpe.com>
In-Reply-To: <202010021943.mRKeV8Kq-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0988099632506003854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,  I'm not sure I understand this one.  I've tried a number of ways to =

trick the compiler into not giving an error but to no avail.  The =

premise is it always copies one less bytes to a null filled character =

list.  This insures that a copy of N chars will still be in an N+1 list =

with a NULL at the end.

But the complaint is about copying 7 chars from a string of 7 chars. =

This should work fine since the target will have 8 chars with a NULL at =

the end.

Thanks for any explanation,
Mike

On 10/2/2020 4:16 AM, kernel test robot wrote:
>     In function 'uv_stringify',
>         inlined from 'decode_arch_type' at arch/x86/kernel/apic/x2apic_uv=
_x.c:315:3,
>         inlined from 'early_get_arch_type' at arch/x86/kernel/apic/x2apic=
_uv_x.c:359:8,
>         inlined from 'uv_set_system_type' at arch/x86/kernel/apic/x2apic_=
uv_x.c:372:7,
>         inlined from 'uv_acpi_madt_oem_check' at arch/x86/kernel/apic/x2a=
pic_uv_x.c:456:6:
>>> arch/x86/kernel/apic/x2apic_uv_x.c:287:2: warning: 'strncpy' output may=
 be truncated copying 7 bytes from a string of length 7 [-Wstringop-truncat=
ion]
>       287 |  strncpy(to, from, len-1);
>           |  ^~~~~~~~~~~~~~~~~~~~~~~~
> =

> vim +/strncpy +287 arch/x86/kernel/apic/x2apic_uv_x.c
> =

> c8f730b1ab825f0 Russ Anderson 2010-10-26  283
> 61e5ddca9c2a312 Mike Travis   2019-09-10  284  static void __init uv_stri=
ngify(int len, char *to, char *from)
> 61e5ddca9c2a312 Mike Travis   2019-09-10  285  {
> 61e5ddca9c2a312 Mike Travis   2019-09-10  286  	/* Relies on 'to' being N=
ULL chars so result will be NULL terminated */
> 61e5ddca9c2a312 Mike Travis   2019-09-10 @287  	strncpy(to, from, len-1);
> 61e5ddca9c2a312 Mike Travis   2019-09-10  288  }
> 61e5ddca9c2a312 Mike Travis   2019-09-10  289
> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0988099632506003854==--

