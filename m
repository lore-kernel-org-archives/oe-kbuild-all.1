Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5642D1CD215
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 04:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755231216; cv=none; b=AsoShr+MDPQd1p/z8qaDw08Gt1B/exKl4exT703oaFYrPE8ZG7pqq4+eXxu+2DVPKeaRJGrO2YFTcrJt2C7cAHvUjkLLGejXpdbZACJTUCLI8/7e3pI9SB9OFZ5gBjJ0iyCwBxrI7j+k1dxOgusb3JZIfullMlABAwA94q/KT0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755231216; c=relaxed/simple;
	bh=JkqDgB/ojUAzB392Ht7LEpn9XeNHkgDvkwnehUzGCDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i1tef0JrLcxY9Q9G0XQ1tjSbLWtwOIXPRBbCq2M0KLauPw8+1p06+GuhOBG0R7WZ13cyV4ykaRxX23SWV8hsAFc0PAS8NhJ1S9cwXoWYMCJMpK7S20ccAhcyzK4ofzhXhQejy4TdB88gNtHOOou+Wr9slOAEP5gGBC1wO3FwDj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=InbpXPsh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="InbpXPsh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755231216; x=1786767216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JkqDgB/ojUAzB392Ht7LEpn9XeNHkgDvkwnehUzGCDg=;
  b=InbpXPshUx+hxIgrcmLjMu/yxyoaL541H/MV7XD2v4B5rHgGsI/olWaE
   pFf91AeMZv4qzAHKkLOfN/0WAng55PJdeyN5FwPtSEPc8z+40LnYIMehY
   mhsx/A3P5h298ZdTxsf9D09sY/qAX1jZZirrM/tYPqQA8SUzazIR5SoQk
   7R3aT92U+8plppsDe72DxUGLcPc7bGEEbtlaNGQ5Pb5eOv9hpTa1AAWLj
   67at7M5Fwx7Ieow0dBNUPf+/vc5tzyWOcRl9OqxgEkcguTg4EFhxtJMsm
   WHqirdMPrIbPYEIE+fPTgvxlguQUcQpB+NvWCrLza7mGqIfSJlPu1yyvw
   A==;
X-CSE-ConnectionGUID: 4SUXzEk6RamMO+tC4NwdxA==
X-CSE-MsgGUID: 4CglMUhPQl6ckT3jq/+l9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68161800"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68161800"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 21:13:34 -0700
X-CSE-ConnectionGUID: UDjdMnOHRX+ELdVqqA+eng==
X-CSE-MsgGUID: kvneXBABTuCe4gXIKHkL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166145167"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 21:13:33 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umloo-0000QF-2w;
	Fri, 15 Aug 2025 04:13:30 +0000
Date: Fri, 15 Aug 2025 06:13:11 +0200
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new 4/5] lib/group_cpus.c:24:3: error: call to undeclared
 function 'for_each_cpu_and_andnot_from'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508150653.knkan8hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux new
head:   27da1bc692ded269f7cd2aff5dc30a2d0ecc09e8
commit: 76c06f98eb6ec33fd7bdfb7c08a2a7a9907d23e2 [4/5] group_cpus: simplify inner loop in grp_spread_init_one()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250815/202508150653.knkan8hw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150653.knkan8hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150653.knkan8hw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/group_cpus.c:24:3: error: call to undeclared function 'for_each_cpu_and_andnot_from'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      24 |                 for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
         |                 ^
>> lib/group_cpus.c:24:52: error: expected ';' after expression
      24 |                 for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
         |                                                                  ^
         |                                                                  ;
   2 errors generated.


vim +/for_each_cpu_and_andnot_from +24 lib/group_cpus.c

    13	
    14	static void grp_spread_init_one(struct cpumask *irqmsk, struct cpumask *nmsk,
    15					unsigned int cpus_per_grp)
    16	{
    17		const struct cpumask *siblmsk;
    18		int cpu, sibl;
    19	
    20		for_each_cpu(cpu, nmsk) {
    21			/* If the cpu has siblings, use them first */
    22			siblmsk = topology_sibling_cpumask(cpu);
    23			sibl = cpu;
  > 24			for_each_cpu_and_andnot_from(sibl, nmsk, siblmsk) {
    25				__cpumask_set_cpu(sibl, irqmsk);
    26				if (--cpus_per_grp)
    27					return;
    28				cpu = sibl + 1;
    29			}
    30		}
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
