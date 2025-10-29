Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A50274FE8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 07:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761724179; cv=none; b=aVzqRou/xsNty/BYwKkgVd5TQoNm1dWZXF49nOjmkvwIxLpI+thhSPxo3ihjme8xC2B4Fe96YHnnZsnPgPA68DPykhPdjGBIDIYWLBeuUB/9xM/Pex0hsM6GD3a0zc7c+rFMMSUz5zkhri2baIBjR/vwuuqQaW3kGYS2dDhtRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761724179; c=relaxed/simple;
	bh=ZKYfRXtsP22XIez/CFLLf8gyoVEpbAJ91dWIbDs7cYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBmCtbC8Yjn96BmsyBhxXrrvHk0tlaMq5ZH3nWTcQjpBeak9ula9mzmaj+OA4vEh1nktG02zGnKWUfXyWPH/Uypu6AusYxMClfnVJX1ag7oTDuvuleyVMXjFzhT/OIGjzd3fzllismJR2QAiM0x+7KiDD6zTi6Qx51JjQGhKmnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHQaUe+4; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHQaUe+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761724178; x=1793260178;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZKYfRXtsP22XIez/CFLLf8gyoVEpbAJ91dWIbDs7cYQ=;
  b=GHQaUe+4wzye8AWwCmMq5kTdJJY5Pqiflp+yBz3UaUKRTrqhJ4W3pf6g
   vP5+GGF2PsgRVEukwhTJZDikbY8EbxE+FjYEFW3JRXh/1rkvnmPAtGzDc
   he3anc0z5Dtd1yWGt16QwPV4HjsDcCv+el0ARqf3miNGrWodbrdmEZb7L
   DRk/NkXw0SKHnVeZOys4dZy0NqiIiHz0ht9Zs2N+aO00aE0XBWJlsJ5mu
   8lBUUZPKTqqIYugPkkzOG25I5WmUWH+JVyVGsGGVHqQeQysYD2MDNEyz4
   lSruKG8SQD3ZZjQ+TlraGPe9AxhtxWMWSsscMhLlp8c3k3YeXtlSy4LDF
   w==;
X-CSE-ConnectionGUID: NmyUAI7VTo+0t9RJlXW/sQ==
X-CSE-MsgGUID: taQg5nWMT1GTVWrlZQdoEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62864888"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="62864888"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 00:49:37 -0700
X-CSE-ConnectionGUID: z1AhrZiQRPOZF47HYCAq/Q==
X-CSE-MsgGUID: 7Xm0Ml7vTVCNKXF4PWXCwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185472743"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2025 00:49:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE0w1-000KMp-1d;
	Wed, 29 Oct 2025 07:49:33 +0000
Date: Wed, 29 Oct 2025 15:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [linux-next:master 3923/4731]
 arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction
 format
Message-ID: <202510291500.a2Lg0OSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: 44aa25c000b41d7afcb030ac1b8a38f06dabef0a [3923/4731] riscv: asm: use .insn for making custom instructions
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20251029/202510291500.a2Lg0OSH-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291500.a2Lg0OSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291500.a2Lg0OSH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:47:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   RISCV_PAUSE, /* Original RISC‑V pause insn */ \
                   ^
   arch/riscv/include/asm/insn-def.h:259:21: note: expanded from macro 'RISCV_PAUSE'
   #define RISCV_PAUSE     ASM_INSN_I("0x100000f")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:5:7: note: instantiated into assembly here
   .insn 0x100000f
         ^
   In file included from <built-in>:4:
   In file included from lib/vdso/gettimeofday.c:6:
   In file included from include/vdso/datapage.h:21:
   In file included from include/vdso/processor.h:10:
>> arch/riscv/include/asm/vdso/processor.h:23:2: error: expected instruction format
           ALT_RISCV_PAUSE();
           ^
   arch/riscv/include/asm/errata_list.h:48:3: note: expanded from macro 'ALT_RISCV_PAUSE'
                   MIPS_PAUSE, /* Replacement for MIPS P8700 */    \
                   ^
   arch/riscv/include/asm/vendor_extensions/mips.h:33:20: note: expanded from macro 'MIPS_PAUSE'
   #define MIPS_PAUSE      ASM_INSN_I("0x00501013\n\t")
                           ^
   arch/riscv/include/asm/asm.h:16:26: note: expanded from macro 'ASM_INSN_I'
   #define ASM_INSN_I(__x) ".insn " __x
                            ^
   <inline asm>:21:7: note: instantiated into assembly here
   .insn 0x00501013
         ^
   14 errors generated.
   make[3]: *** [scripts/Makefile.build:287: arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:175: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +23 arch/riscv/include/asm/vdso/processor.h

3c349eacc55996 Palmer Dabbelt    2023-01-31  18  
8eb060e10185cf Dao Lu            2022-06-20  19  	/*
8eb060e10185cf Dao Lu            2022-06-20  20  	 * Reduce instruction retirement.
8eb060e10185cf Dao Lu            2022-06-20  21  	 * This assumes the PC changes.
8eb060e10185cf Dao Lu            2022-06-20  22  	 */
0b0ca959d20689 Djordje Todorovic 2025-07-24 @23  	ALT_RISCV_PAUSE();
ad5d1122b82fbd Vincent Chen      2020-06-09  24  	barrier();
ad5d1122b82fbd Vincent Chen      2020-06-09  25  }
ad5d1122b82fbd Vincent Chen      2020-06-09  26  

:::::: The code at line 23 was first introduced by commit
:::::: 0b0ca959d20689fece038954bbf1d7b14c0b11c3 riscv: errata: Fix the PAUSE Opcode for MIPS P8700

:::::: TO: Djordje Todorovic <djordje.todorovic@htecgroup.com>
:::::: CC: Paul Walmsley <pjw@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
