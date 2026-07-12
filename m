Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F793750CA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 23:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900678; cv=none; b=ncjfe6+vgvutBiQCPztav7wViVrIM/uluxucf9L03THGDYJ2MwhhXMMIOCutaktErSPzmCU0J0kq7pI6TjMgVQGD1MgEF+5dKTsadRYO1mWW1ALZW8ch4FwbpAqBAlQTGHC4oL3B7TbLwv2x64kzTTEX5tPNfn7MjrJw1AMAQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900678; c=relaxed/simple;
	bh=Et+6NuWp/57dNEKBRR5QyiF7mXf2ogHwa23tgjxyiII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uchqRuCuoqDxKVNy8ATzUIX/s6Jc8JsAHlRaXZpeSs08+1Zvkzd/2KdC7eNeo+duYtnpQogK48JeaUxm35+Y9wYlIRbzU1PnE9U3nbqR74A6QbIRvgUDcg+K/c/dIN6OZOqUc2VIcbRc+zYNNGMn1zZ5iHW82YaT0vFZ9KulTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lTYde90l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lTYde90l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783900676; x=1815436676;
  h=date:from:to:cc:subject:message-id;
  bh=Et+6NuWp/57dNEKBRR5QyiF7mXf2ogHwa23tgjxyiII=;
  b=lTYde90l63SSdVmWflN6T4DaSROm6hbbOqeGVKBGbGGNRxOwyoGlrdW+
   k2Ei+QB3ffKy2dksN1JG02pzZquAgezHSS2Ww1/5aL6BSw/H4s+mBlpLu
   wmRAPM3VBwZuIn6X3Ksxw4Hxq0dcKmYfzAHu+Y8eon08IWN+831uJdlSF
   9Y2/7jfM0YpooF47zQflpZXOkANYAIuO/wdn3Mg7UeqJJRUxzgFYPSyHj
   w8vth0syjnZmsevyEKsfCbQNx7fUmWuUv2EovHt1pzvluZnCl9RkW1YQd
   r8oyAD0V3m6QlXMJFcdfqS5tm9bfk9oil20hUwMxupLR9AH45QMaMFGJk
   Q==;
X-CSE-ConnectionGUID: EL/l0RMpSaKwlVdj2zfleg==
X-CSE-MsgGUID: 7b3174/ASoeB2JIMvhD56g==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84390264"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84390264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 16:57:56 -0700
X-CSE-ConnectionGUID: ViK7xtZ3T1+u3iNAXDFm+A==
X-CSE-MsgGUID: ObBD3IoYRzW6ELK8PPEP3g==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2026 16:57:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj43U-00000000LDL-17Mv;
	Sun, 12 Jul 2026 23:57:52 +0000
Date: Mon, 13 Jul 2026 07:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 3/59] arch/s390/mm/init.c:301:24:
 error: call to undeclared function 'get_random_u32_inclusive'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202607130757.Z2pJQSAT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
config: s390-randconfig-r134-20260713 (https://download.01.org/0day-ci/archive/20260713/202607130757.Z2pJQSAT-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130757.Z2pJQSAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130757.Z2pJQSAT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/mm/init.c:301:24: error: call to undeclared function 'get_random_u32_inclusive'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     301 |                 module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;
         |                                      ^
   1 error generated.


vim +/get_random_u32_inclusive +301 arch/s390/mm/init.c

0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  294) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  295) struct execmem_info __init *execmem_arch_setup(void)
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  296) {
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  297) 	unsigned long module_load_offset = 0;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  298) 	unsigned long start;
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  299) 
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05  300) 	if (kaslr_enabled())
0cc2dc4902f425 Mike Rapoport (IBM  2024-05-05 @301) 		module_load_offset = get_random_u32_inclusive(1, 1024) * PAGE_SIZE;

:::::: The code at line 301 was first introduced by commit
:::::: 0cc2dc4902f425e346d46deeea2352d9fba75375 arch: make execmem setup available regardless of CONFIG_MODULES

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Luis Chamberlain <mcgrof@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
