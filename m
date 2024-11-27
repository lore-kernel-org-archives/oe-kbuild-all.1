Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C2813BC35
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732748149; cv=none; b=Ie9lqpuvcpt72bhF00TWd++f4E6r1lezJGVAr7UMjXR+kW7/cop+urWw4B/ppCYd5zBxCj3Y2f2jp47aPGU4KMH4B1JuOpPgbaH0BdK7x2LYwG9S1F439Fz9byYwImGr8x5dPkARSaJVilVjhNBxP9zViFhmPfBuS722TBpdRVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732748149; c=relaxed/simple;
	bh=HQ7zkpOm0BHmeGoi3dHHjLTXc0XlTrFkA6lQ2KR+tmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GSRiEhDl52mnDDSAaJ2JG+xl+aE06GHnvPgQVJiKiJnQmpMmma6bJnIalXJM3lFBin1VTdditBLursNe25mZoc1B4UVoaiFx5ULoUzjEVX0ty8JmLja6G19RUxrReL3k09Yud/qcxT5AguCMW1/WmzjCpZOqgiFT6Cpm0m5K/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JxAfBN19; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxAfBN19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732748148; x=1764284148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HQ7zkpOm0BHmeGoi3dHHjLTXc0XlTrFkA6lQ2KR+tmQ=;
  b=JxAfBN19JMkszy5vSgVITNsU8BmzqJQpKknxqObV1Na5zgXkh/OvHR6W
   nA5NLmKbF/gpNVycmKYwcdMvWQb0Ejv3HAvbn3hDaHaO8eX61UCUNT5Bk
   Y6POOX/0C2LNJ1S9T95oFg/bYNTnQSSk2/eSM38o1xAJZJWxFzfZGTUMv
   5k12wLK5JD+szE+jl9eZH6srhAQuj2+lJ2puAF1L+29vhC66Zm69zymNj
   oICdJzBo08323GkRegmIAAAqQDE91v50Cj7WGiulv6qr7NXm67zp2Im95
   R9G4bBm5b02hoXeV3GKVDotHqEqVY/HqfvJEQ751h5C1mxVTcm0cRdkuo
   w==;
X-CSE-ConnectionGUID: THb5hLvcRI+E9DjUZlk06w==
X-CSE-MsgGUID: H/LPisdvRLWX+UZbFpWOTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33123355"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="33123355"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 14:55:47 -0800
X-CSE-ConnectionGUID: dxv5lwuvQ3eCVI2IEXUPqg==
X-CSE-MsgGUID: Q7tsZx5rQi63uAKlf0u7fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92464410"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Nov 2024 14:55:46 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGQwh-0008Q2-2D;
	Wed, 27 Nov 2024 22:55:43 +0000
Date: Thu, 28 Nov 2024 06:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 3/12]
 arch/arm/include/asm/opcodes.h:92:34: error: passing argument 4 of
 'uprobe_write_opcode' makes pointer from integer without a cast
Message-ID: <202411280611.mgHUC8DV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: e4bd7580c798ae727d6c9c8dc7040d8970e054b6 [3/12] uprobes: Add nbytes argument to uprobe_write_opcode
config: arm-tegra_defconfig (https://download.01.org/0day-ci/archive/20241128/202411280611.mgHUC8DV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280611.mgHUC8DV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280611.mgHUC8DV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from arch/arm/probes/uprobes/core.c:9:
   arch/arm/probes/uprobes/core.c: In function 'set_swbp':
>> arch/arm/include/asm/opcodes.h:92:34: error: passing argument 4 of 'uprobe_write_opcode' makes pointer from integer without a cast [-Wint-conversion]
      92 | #define ___opcode_identity32(x) ((u32)(x))
         |                                 ~^~~~~~~~~
         |                                  |
         |                                  unsigned int
   arch/arm/include/asm/opcodes.h:109:32: note: in expansion of macro '___opcode_identity32'
     109 | #define __opcode_to_mem_arm(x) ___opcode_identity32(x)
         |                                ^~~~~~~~~~~~~~~~~~~~
   arch/arm/probes/uprobes/core.c:33:20: note: in expansion of macro '__opcode_to_mem_arm'
      33 |                    __opcode_to_mem_arm(auprobe->bpinsn));
         |                    ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/mm_types.h:16,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs.h:13:
   include/linux/uprobes.h:185:49: note: expected 'uprobe_opcode_t *' {aka 'unsigned int *'} but argument is of type 'unsigned int'
     185 |                                uprobe_opcode_t *insn, int nbytes);
         |                                ~~~~~~~~~~~~~~~~~^~~~
>> arch/arm/probes/uprobes/core.c:32:16: error: too few arguments to function 'uprobe_write_opcode'
      32 |         return uprobe_write_opcode(auprobe, mm, vaddr,
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/uprobes.h:184:12: note: declared here
     184 | extern int uprobe_write_opcode(struct arch_uprobe *auprobe, struct mm_struct *mm, unsigned long vaddr,
         |            ^~~~~~~~~~~~~~~~~~~
>> arch/arm/probes/uprobes/core.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
      34 | }
         | ^


vim +/uprobe_write_opcode +92 arch/arm/include/asm/opcodes.h

f5f5195487affe Dave Martin 2012-02-01  87  
0ce3de23f2a520 Dave Martin 2012-09-03  88  #define ___opcode_swab32(x) swab32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  89  #define ___opcode_swab16(x) swab16(x)
0ce3de23f2a520 Dave Martin 2012-09-03  90  #define ___opcode_swahb32(x) swahb32(x)
0ce3de23f2a520 Dave Martin 2012-09-03  91  #define ___opcode_swahw32(x) swahw32(x)
0ce3de23f2a520 Dave Martin 2012-09-03 @92  #define ___opcode_identity32(x) ((u32)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  93  #define ___opcode_identity16(x) ((u16)(x))
0ce3de23f2a520 Dave Martin 2012-09-03  94  

:::::: The code at line 92 was first introduced by commit
:::::: 0ce3de23f2a520a6ac8c2179fb8f88342c4992ef ARM: 7509/1: opcodes: Make opcode byteswapping macros assembly-compatible

:::::: TO: Dave Martin <dave.martin@linaro.org>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
