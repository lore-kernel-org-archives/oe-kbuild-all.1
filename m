Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32843D3BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 17:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADDixrrB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697649795; x=1729185795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UdBe7hqt4ajlP6rkH/62cvH28e6YLrgqmePPO+p1iuo=;
  b=ADDixrrBGdTbG83f+ZR0okpbmKswUt3ZPY7mx0arN53MD9wtrNYgS17T
   I3YiqjyySgkht2VZwkr+2RUuGyjE5s0saTaknc5bHzelGCT3MSMwPvNDM
   O2xwPjRrWbkYxVYTsF+cOO4v4usuS8FWGAzmKZ/Rj6Zx+/y61+/X3+71Z
   kyXUzkMo8dzme9WMMFZEEqmUk16rHW2sEzVwcHLEJrz4tJBx6QzG/kOMC
   KBA63n3/XFuz3shwvA9fOLJj07QVn7sv6v6NDfkkC8GreaZpOpRikjLd+
   yGso7F6q3OzthTW10hrgzgi95U+t2A1pQ3S7d1428xA+3C8wDx2pZuERD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="384942693"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="384942693"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 10:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="706532444"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="706532444"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Oct 2023 10:23:12 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtAGD-0000kW-1e;
	Wed, 18 Oct 2023 17:23:09 +0000
Date: Thu, 19 Oct 2023 01:22:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1 is
 outside array bounds of 'const void[]'
Message-ID: <202310190159.mAUo9iEX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: c0317210012e3b985779ddd92a7c5db8424e1e97 RISC-V: Add arch functions to support hibernation/suspend-to-disk
date:   6 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190159.mAUo9iEX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190159.mAUo9iEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190159.mAUo9iEX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/page.h:12,
                    from arch/riscv/include/asm/thread_info.h:11,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/riscv/include/asm/cacheflush.h:9,
                    from arch/riscv/kernel/hibernate.c:11:
   arch/riscv/kernel/hibernate.c: In function 'pfn_is_nosave':
>> arch/riscv/kernel/hibernate.c:76:65: warning: array subscript -1 is outside array bounds of 'const void[]' [-Warray-bounds=]
      76 |         unsigned long nosave_end_pfn = sym_to_pfn(&__nosave_end - 1);
   include/linux/pfn.h:22:43: note: in definition of macro 'PHYS_PFN'
      22 | #define PHYS_PFN(x)     ((unsigned long)((x) >> PAGE_SHIFT))
         |                                           ^
   arch/riscv/include/asm/page.h:172:33: note: in expansion of macro '__phys_to_pfn'
     172 | #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
         |                                 ^~~~~~~~~~~~~
   arch/riscv/include/asm/page.h:156:44: note: in expansion of macro 'RELOC_HIDE'
     156 | #define __pa_symbol(x)  __phys_addr_symbol(RELOC_HIDE((unsigned long)(x), 0))
         |                                            ^~~~~~~~~~
   arch/riscv/include/asm/page.h:172:47: note: in expansion of macro '__pa_symbol'
     172 | #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
         |                                               ^~~~~~~~~~~
   arch/riscv/kernel/hibernate.c:76:40: note: in expansion of macro 'sym_to_pfn'
      76 |         unsigned long nosave_end_pfn = sym_to_pfn(&__nosave_end - 1);
         |                                        ^~~~~~~~~~
   In file included from arch/riscv/include/asm/sections.h:8,
                    from include/linux/interrupt.h:21,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/asm-generic/tlb.h:15,
                    from arch/riscv/include/asm/tlb.h:14,
                    from arch/riscv/include/asm/pgalloc.h:11,
                    from arch/riscv/kernel/hibernate.c:14:
   include/asm-generic/sections.h:59:45: note: at offset -1 into object '__nosave_end' of size [0, 9223372036854775807]
      59 | extern __visible const void __nosave_begin, __nosave_end;
         |                                             ^~~~~~~~~~~~


vim +76 arch/riscv/kernel/hibernate.c

    69	
    70	/*
    71	 * Check if the given pfn is in the 'nosave' section.
    72	 */
    73	int pfn_is_nosave(unsigned long pfn)
    74	{
    75		unsigned long nosave_begin_pfn = sym_to_pfn(&__nosave_begin);
  > 76		unsigned long nosave_end_pfn = sym_to_pfn(&__nosave_end - 1);
    77	
    78		return ((pfn >= nosave_begin_pfn) && (pfn <= nosave_end_pfn));
    79	}
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
