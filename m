Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C3847D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id C233024E328;
	Fri, 20 Oct 2023 17:15:33 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Oct
 2023 17:15:33 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 20 Oct
 2023 17:15:32 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 20 Oct 2023 17:15:33 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Mason Huo
	<mason.huo@starfivetech.com>, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: RE: arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1
 is outside array bounds of 'const void[]'
Thread-Topic: arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1
 is outside array bounds of 'const void[]'
Thread-Index: AQHaAefzQM1zvD33BUG0QDMQLERe07BSZdXQ
Date: Fri, 20 Oct 2023 09:15:33 +0000
Message-ID: <06e2dfdcd9ab409f97d1eb0a12d391db@EXMBX066.cuchost.com>
References: <202310190159.mAUo9iEX-lkp@intel.com>
In-Reply-To: <202310190159.mAUo9iEX-lkp@intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [219.93.91.231]
x-yovoleruleagent: yovoleflag
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

I followed the reproduction steps provided at the link: https://download.01=
.org/0day-ci/archive/20231019/202310190159.mAUo9iEX-lkp@intel.com/reproduce=
 to download the Linux kernel, compiler version, and the config found here:=
 https://download.01.org/0day-ci/archive/20231019/202310190159.mAUo9iEX-lkp=
@intel.com/config.
Indeed, I was able to reproduce the issue, but only with kernel v6.3-rc1.

When I tested with the same compiler version and config on kernel v6.6-rc6,=
 I found no issues. Given these findings, do you believe it's still necessa=
ry to address the problem?

Thanks
Regards
Jee Heng

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Thursday, October 19, 2023 1:23 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>
> Cc: oe-kbuild-all@lists.linux.dev; linux-kernel@vger.kernel.org; Palmer D=
abbelt <palmer@rivosinc.com>; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>; Mason Huo <mason.huo@starfivetech.com>; C=
onor Dooley <conor.dooley@microchip.com>;
> Andrew Jones <ajones@ventanamicro.com>
> Subject: arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1=
 is outside array bounds of 'const void[]'
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
> commit: c0317210012e3b985779ddd92a7c5db8424e1e97 RISC-V: Add arch functio=
ns to support hibernation/suspend-to-disk
> date:   6 months ago
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231=
019/202310190159.mAUo9iEX-lkp@intel.com/config)
> compiler: riscv64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231019/202310190159.mAUo9iEX-
> lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310190159.mAUo9iEX-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from arch/riscv/include/asm/page.h:12,
>                     from arch/riscv/include/asm/thread_info.h:11,
>                     from include/linux/thread_info.h:60,
>                     from include/asm-generic/preempt.h:5,
>                     from ./arch/riscv/include/generated/asm/preempt.h:1,
>                     from include/linux/preempt.h:78,
>                     from include/linux/spinlock.h:56,
>                     from include/linux/mmzone.h:8,
>                     from include/linux/gfp.h:7,
>                     from include/linux/mm.h:7,
>                     from arch/riscv/include/asm/cacheflush.h:9,
>                     from arch/riscv/kernel/hibernate.c:11:
>    arch/riscv/kernel/hibernate.c: In function 'pfn_is_nosave':
> >> arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1 is ou=
tside array bounds of 'const void[]' [-Warray-bounds=3D]
>       76 |         unsigned long nosave_end_pfn =3D sym_to_pfn(&__nosave_=
end - 1);
>    include/linux/pfn.h:22:43: note: in definition of macro 'PHYS_PFN'
>       22 | #define PHYS_PFN(x)     ((unsigned long)((x) >> PAGE_SHIFT))
>          |                                           ^
>    arch/riscv/include/asm/page.h:172:33: note: in expansion of macro '__p=
hys_to_pfn'
>      172 | #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
>          |                                 ^~~~~~~~~~~~~
>    arch/riscv/include/asm/page.h:156:44: note: in expansion of macro 'REL=
OC_HIDE'
>      156 | #define __pa_symbol(x)  __phys_addr_symbol(RELOC_HIDE((unsigne=
d long)(x), 0))
>          |                                            ^~~~~~~~~~
>    arch/riscv/include/asm/page.h:172:47: note: in expansion of macro '__p=
a_symbol'
>      172 | #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
>          |                                               ^~~~~~~~~~~
>    arch/riscv/kernel/hibernate.c:76:40: note: in expansion of macro 'sym_=
to_pfn'
>       76 |         unsigned long nosave_end_pfn =3D sym_to_pfn(&__nosave_=
end - 1);
>          |                                        ^~~~~~~~~~
>    In file included from arch/riscv/include/asm/sections.h:8,
>                     from include/linux/interrupt.h:21,
>                     from include/linux/kernel_stat.h:9,
>                     from include/linux/cgroup.h:26,
>                     from include/linux/memcontrol.h:13,
>                     from include/linux/swap.h:9,
>                     from include/asm-generic/tlb.h:15,
>                     from arch/riscv/include/asm/tlb.h:14,
>                     from arch/riscv/include/asm/pgalloc.h:11,
>                     from arch/riscv/kernel/hibernate.c:14:
>    include/asm-generic/sections.h:59:45: note: at offset -1 into object '=
__nosave_end' of size [0, 9223372036854775807]
>       59 | extern __visible const void __nosave_begin, __nosave_end;
>          |                                             ^~~~~~~~~~~~
>=20
>=20
> vim +76 arch/riscv/kernel/hibernate.c
>=20
>     69
>     70	/*
>     71	 * Check if the given pfn is in the 'nosave' section.
>     72	 */
>     73	int pfn_is_nosave(unsigned long pfn)
>     74	{
>     75		unsigned long nosave_begin_pfn =3D sym_to_pfn(&__nosave_begin);
>   > 76		unsigned long nosave_end_pfn =3D sym_to_pfn(&__nosave_end - 1);
>     77
>     78		return ((pfn >=3D nosave_begin_pfn) && (pfn <=3D nosave_end_pfn))=
;
>     79	}
>     80
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
