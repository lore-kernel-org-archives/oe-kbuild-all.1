Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395502116E0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 19:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747683183; cv=none; b=Tgwl7kxJ2WBSz5kBFdyMqZE+VdmSLCdugW8rCUBKZ7rRMV+hwm3J2OXYytYXbjEyHcuXuaeNi9qGcXSeTUwZ+i7c3mqUKtJGqm+jwxEpKb3qijUZQUGy3KGSkY6KzGYNvl+5sjwp1tJ3af0yLO+xhGBFjrPSP4Ii+bHxlWa1HkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747683183; c=relaxed/simple;
	bh=pxsScTQRwE0en3dyM53xFkiu+96xHuxOpraRjKDNCQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMI5v7OuMOPcbKPmwYgDGojRIZcNtKjBrSjdU6LITXDn9dhWiXXr7K4LgtWXDx1pWlkhuPa3noLKbii1QMm6TGB4FaCtUF1A7aEtKq7tTQE8q4BnYZ1qloYj3CWHQ4vw6kxkPWAvsav6qPodYj/6/OlpAJCLQJEcEbMOz2dpBus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mz53hn7L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mz53hn7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747683182; x=1779219182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pxsScTQRwE0en3dyM53xFkiu+96xHuxOpraRjKDNCQs=;
  b=mz53hn7LzToe2dNYC56JfZmm3+2gJCvnlwVRlgdovj07ZjTTppHQp3zT
   sWqcGJScvfz1MX+L/2woCubIypu0HO5VcpTsc2JjEyXvtHoipTDEBOrOm
   riaRugeho0s4CpeEmWHXo8B+8oPhb+B0HeWzuoGZ9PAoW/pzn2/gCZIf5
   eZdRFNv1KA+iOZVykzkToyQHWg8WrU9KrGRUaqP1S4PHU9+rWucCPvLZI
   ETpS0GS+JWuFyrsO2b8tH3QY0g0d/Vfnee3u8sR4cSclIBPOxIstihO3j
   RH7BbLf0M+ICxaCaAl4+XEGhPXt/nbW/gqISqEves3JtxtdoEVGOAjicC
   w==;
X-CSE-ConnectionGUID: wLi8aVj+TAOjSWU1IJiJUQ==
X-CSE-MsgGUID: E3aG4wdYQvO6J2s7YMvbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49295903"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49295903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 12:33:01 -0700
X-CSE-ConnectionGUID: 15byFRUPTg6BXwixMWwiIg==
X-CSE-MsgGUID: NMNPFg8HRE+fsNZ+hgTrqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144219721"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 19 May 2025 12:33:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH6EL-000Lmm-2P;
	Mon, 19 May 2025 19:32:57 +0000
Date: Tue, 20 May 2025 03:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] lib/random32.c:462:12:
 warning: no previous prototype for function 'prandom_init_early'
Message-ID: <202505200359.edjuMxJ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xuchun,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   950b90b563b8c87ae35bb6edc4775609bc9471c2
commit: a4dcbd9992353bf019a4f37fef44f7416b6e2bbc [11/11] anolis: random32: put prandom_init_early in a earlier step
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250520/202505200359.edjuMxJ9-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200359.edjuMxJ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505200359.edjuMxJ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/random32.c:462:12: warning: no previous prototype for function 'prandom_init_early' [-Wmissing-prototypes]
     462 | int __init prandom_init_early(void)
         |            ^
   lib/random32.c:462:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     462 | int __init prandom_init_early(void)
         | ^
         | static 
   1 warning generated.


vim +/prandom_init_early +462 lib/random32.c

   457	
   458	/*
   459	 *	Generate some initially weak seeding values to allow
   460	 *	the prandom_u32() engine to be started.
   461	 */
 > 462	int __init prandom_init_early(void)
   463	{
   464		int i;
   465		unsigned long v0, v1, v2, v3;
   466	
   467		if (!arch_get_random_long(&v0))
   468			v0 = jiffies;
   469		if (!arch_get_random_long(&v1))
   470			v1 = random_get_entropy();
   471		v2 = v0 ^ PRND_K0;
   472		v3 = v1 ^ PRND_K1;
   473	
   474		for_each_possible_cpu(i) {
   475			struct siprand_state *state;
   476	
   477			v3 ^= i;
   478			PRND_SIPROUND(v0, v1, v2, v3);
   479			PRND_SIPROUND(v0, v1, v2, v3);
   480			v0 ^= i;
   481	
   482			state = per_cpu_ptr(&net_rand_state, i);
   483			state->v0 = v0;  state->v1 = v1;
   484			state->v2 = v2;  state->v3 = v3;
   485		}
   486	
   487		return 0;
   488	}
   489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
