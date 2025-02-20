Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDDB4C6C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 03:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740022844; cv=none; b=dmJKg/mdkJm+2zZk1lHbzQMKSe5uo+qnQ3gwHL/v2FuUBFu9fdYamTozFfomXfO/L2TKDjEmdTerXlZn0nNT8Y/U5YMOUIUM6AsGoBL1hBrHNuLNIPQWskhnr6j3eeikKijwWaK2W9jXBXVz+WZC9+lXjLFA9PGJtAAnST0vGbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740022844; c=relaxed/simple;
	bh=ouKQvyKpjjAu/7a3xMbvNmgly8S6o/1pUUwJjTgFUfg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=glVMjQb/A/kGR711CEARESTXL/RoCfmDinxDBkxl821gf/54Is4V31P2RoQhn/p0yXn/I1NfEu0spT4Xsd1PynUl/a+mhs24l5etXdsWFWRW5LFD7Yh6PbiIs+kb4UZke+PhEevx3tauZ6Ic9+yIha7h9hxdW4XqrIIhpGAe7QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R8WWPH4W; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R8WWPH4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740022843; x=1771558843;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ouKQvyKpjjAu/7a3xMbvNmgly8S6o/1pUUwJjTgFUfg=;
  b=R8WWPH4WDXiIfr+ZT1RkSZcCvbq8Z8vin0ezamGiAlnBG+QlJlhMeiJ5
   YrQlGqf0GlJm1mg62cNgoxA+5Ti8W6vTxcK7IicXLThtWyOlVb7XgLw2f
   5kmZcI4KOu0MqFq2BDf+rB8vAB/H9cS8R6lVb0pHOcIc2FvsDtNwPtVdc
   voGofcw5ONXDo1fTljpM2thSIzNyylEpznv4GELVNnl9RJxchOKuCp3ku
   FX8o5YKrzZO6Gq8T9XsDN+MhmIaZ6WSlBdTnzpkh50BS/ar/YNKL6gDRx
   7UT/hvdhVS9d4FtC8x3C4e2Y3vdzZxsrCZUKKRKJ7GA9ZbSH1WgWWZdtT
   w==;
X-CSE-ConnectionGUID: fUUDeu3vR4KsY42NygGTvQ==
X-CSE-MsgGUID: bRBCQ5/aRVGES9dAQiS+VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="66143745"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="66143745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 19:40:41 -0800
X-CSE-ConnectionGUID: RBChe4XISUCfc2m0M1WsSQ==
X-CSE-MsgGUID: Z5bJ/sI7QyysgnTCsWHkPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="114897098"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 19:40:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkxQV-0003pN-0E
	for oe-kbuild-all@lists.linux.dev;
	Thu, 20 Feb 2025 03:40:39 +0000
Date: Thu, 20 Feb 2025 11:40:33 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/riscv/kernel/smp.c:74:6: warning: no
 previous prototype for 'arch_match_cpu_phys_id'
Message-ID: <202502201157.vkZoaE22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Atish,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 70114560b2855853126c65cccdc49a33187327d0 [1/1] RISC-V: Add RISC-V specific arch_match_cpu_phys_id
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20250220/202502201157.vkZoaE22-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502201157.vkZoaE22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502201157.vkZoaE22-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/smp.c:74:6: warning: no previous prototype for 'arch_match_cpu_phys_id' [-Wmissing-prototypes]
      74 | bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/smp.c:80:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
      80 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/smp.c: Assembler messages:
   arch/riscv/kernel/smp.c:98: Error: unrecognized opcode `csrc sip,2', extension `zicsr' required
   arch/riscv/include/asm/cacheflush.h:25: Error: unrecognized opcode `fence.i', extension `zifencei' required


vim +/arch_match_cpu_phys_id +74 arch/riscv/kernel/smp.c

    73	
  > 74	bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
    75	{
    76		return phys_id == cpuid_to_hartid_map(cpu);
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
