Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364C7383C95
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 15:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350974; cv=none; b=jXkx26HgvxpQYmyJGEtAodFBbhATVr9nRZYb3092z4Dxa6YWxTUqq7tjJ8/I4vVmLVx+MdRo/Ed/hOAA/d5HFP5t0zZiMgwGXp4h/NhrLhsbPRc//wCe35ljQQlrkVqYHqpDc1KwAlzUP+eGOrAEvdBa1NSdo9W45ZtkLm8a8Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350974; c=relaxed/simple;
	bh=WOtWgPybXnT/xZm4SwLOipnGNoY1INkhI3y6TculfRc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UaOJAomZ8arfd3rpR2L6xPqxGVKFuEDsrxBMLnepeGe0HzpdEJQ7Bc+dFKsseOj9/NFiw/hUFlyn/axr/JA3B3eQUg5K09BhV65kEXsU/Do45K8bqhc0ElrnVhXXniRBR/ThcGxFDypxn26n9ox+LVphHbUhWA7P+hkI5ByNlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EivdWmgj; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EivdWmgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783350973; x=1814886973;
  h=date:from:to:cc:subject:message-id;
  bh=WOtWgPybXnT/xZm4SwLOipnGNoY1INkhI3y6TculfRc=;
  b=EivdWmgj9FCcVwdZB+QEKckcISYR5bBYM2ch87GG70eETbYuVYoXIi9d
   C3op0mVxJS++e7y28M80U6oE97vVTSOkrBX/OxK87SN1pCCnHKe8L27wz
   qb2d4KJFEuGobTbu2xiCGYd6BGBpBjCbSe51zlEibD1ftf+p0GlNtyxhD
   WQr1S5onsz7JCOiuG/6QMwjcosIvrRW4mB0dRYhL6ebnzu6tDGi2WNKjp
   Vg/DB2OW70pJWgl61yy2tCo0wZQoB3KQ2ArRtIib8WLHwvkJaCKV+1wli
   L7Eu9p/sNVUb3yYz1TECDxAga46qHUQoXgblsAGq8xjp0RPv6ZBLJVfzW
   w==;
X-CSE-ConnectionGUID: AvQ00OxRRPakNrPLIZpVVQ==
X-CSE-MsgGUID: BShsfyt1TEGCgYo1mRBETA==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84079245"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="84079245"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 08:16:10 -0700
X-CSE-ConnectionGUID: aVrBqcOXRWabS9koENGU3g==
X-CSE-MsgGUID: cB/G1BcJTru14y/gR4et3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="253274251"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Jul 2026 08:16:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgl3G-00000000EU3-2vM8;
	Mon, 06 Jul 2026 15:16:06 +0000
Date: Mon, 06 Jul 2026 23:15:18 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 24/66]
 arch/hexagon/kernel/hexagon_debug.c:5:5: sparse: sparse: symbol 'sample_u32'
 was not declared. Should it be static?
Message-ID: <202607062224.avOJtkbw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   29facc8c3b3fe50f4914c90aec24a76217fa35c1
commit: 8be2af9ea122e286ca475227495296847336bb9d [24/66] hexagon: add debug infrastructure
config: hexagon-randconfig-r113-20260706 (https://download.01.org/0day-ci/archive/20260706/202607062224.avOJtkbw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607062224.avOJtkbw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607062224.avOJtkbw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/hexagon/kernel/hexagon_debug.c: note: in included file (through arch/hexagon/include/asm/timex.h, include/linux/timex.h, include/linux/time32.h, include/linux/time.h, ...):
   arch/hexagon/include/asm/hexagon_vm.h:51:5: sparse: sparse: undefined preprocessor identifier '__HEXAGON_ARCH__'
>> arch/hexagon/kernel/hexagon_debug.c:5:5: sparse: sparse: symbol 'sample_u32' was not declared. Should it be static?
>> arch/hexagon/kernel/hexagon_debug.c:8:5: sparse: sparse: symbol 'zebu_pmu_dump' was not declared. Should it be static?
>> arch/hexagon/kernel/hexagon_debug.c:9:5: sparse: sparse: symbol 'memory_debug' was not declared. Should it be static?

vim +/sample_u32 +5 arch/hexagon/kernel/hexagon_debug.c

     3	
     4	/*  Skeleton for stuffing stuff in debugfs  */
   > 5	u32 sample_u32;
     6	u32 kernel_strace;
     7	u32 sig_debug;
   > 8	u32 zebu_pmu_dump;
   > 9	u32 memory_debug;
    10	
    11	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
