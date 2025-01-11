Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB5A1CFBC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 04:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736568168; cv=none; b=JazUiAuGUWgAATwhfCqkqYDxxTiBq5s/EMSu1SVA7FQ09jcmRsDeJJrfrJq3QCkDHcnGkYQ09kw1oTfDTWjMqXhttkGDeuETBC8St6cz8UqShHi7GH0W6730at6eowdRJECnouZ7u0GlU9QrhZnbWpbi+ADgo5JhOqNkYNeXuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736568168; c=relaxed/simple;
	bh=nzAGvvGjQ3CR1U3mnQEscphdrryax4t3oGKtJo9CtcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P2bbLA1U6N+uAqH7+qBl6I21PkZ5kpvcYHC8kpdBGmcM8gE18ncEGReCiAr2DvgDP6NGIl2eD1vL4hBWn3eD/uzUqWL9VbxYrliqL7eR9h+YL9Ssr35pTPxcefndmb+8s2Ve+Y5R1z0pNy+C1J2vhXvgIRGadHufb0imcBzIlW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLZgAz9A; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLZgAz9A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736568167; x=1768104167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nzAGvvGjQ3CR1U3mnQEscphdrryax4t3oGKtJo9CtcY=;
  b=NLZgAz9A8KpkGaxrATQQFw2HctiSAQXRArHMNFbE+uN8KvstDMePjnGp
   80V+WO7K0qwXeAU6srDTQf5s8Wi1eXRlXPqJACL1o29dYl9zYGvhS4T5m
   mLp9g+hI6BWUp6GGhi15qfzymPVnpZt0AzSl8xFSwmPkaUbYSof2Zh8xA
   nLaalv2Tos2ywgSLARlMftQQCVIbnvxm4aI87Y0S0Qcz1lquk0EIhP97l
   IosgQDWa+BSF5ywj6nV5v69WCR0A5PFXjFGk6af55W02gk0RyQt6Qgd3z
   5Gpg5Y6n7sMgSIpUmlxPK6TLRWTvjwYTyBMPZcamwN1jAf550ebdQ/lal
   A==;
X-CSE-ConnectionGUID: 1eLMBpHVSSuMhbIOp87pcA==
X-CSE-MsgGUID: g++r2C66TVilbF4THOVX1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40809615"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="40809615"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 20:02:46 -0800
X-CSE-ConnectionGUID: CTqG0oDkSaWY9kZp4K58jQ==
X-CSE-MsgGUID: 7yEhmsbDRn2z8CQRVKjyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141202272"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2025 20:02:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWShu-000K83-0e;
	Sat, 11 Jan 2025 04:02:42 +0000
Date: Sat, 11 Jan 2025 12:02:28 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver O'Halloran <oohall@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/kernel/eeh_pe.c:261: warning: Function parameter or
 struct member 'pe' not described in '__eeh_pe_get'
Message-ID: <202501111127.8w266r3J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Oliver,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   77a903cd8e5a91d120ee014c8f8eae74d6c5d0f6
commit: 35d64734b64315f2c5716c5a0a380ed1ba8fbe4a powerpc/eeh: Clean up PE addressing
date:   4 years, 3 months ago
config: powerpc64-randconfig-002-20231105 (https://download.01.org/0day-ci/archive/20250111/202501111127.8w266r3J-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111127.8w266r3J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111127.8w266r3J-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/eeh_pe.c:261: warning: Function parameter or struct member 'pe' not described in '__eeh_pe_get'
>> arch/powerpc/kernel/eeh_pe.c:261: warning: Function parameter or struct member 'flag' not described in '__eeh_pe_get'
   arch/powerpc/kernel/eeh_pe.c:516: warning: Function parameter or struct member 'root' not described in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:516: warning: Function parameter or struct member 'state' not described in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:516: warning: Excess function parameter 'pe' description in 'eeh_pe_state_mark'
   arch/powerpc/kernel/eeh_pe.c:534: warning: Function parameter or struct member 'root' not described in 'eeh_pe_mark_isolated'
   arch/powerpc/kernel/eeh_pe.c:534: warning: Excess function parameter 'pe' description in 'eeh_pe_mark_isolated'
   arch/powerpc/kernel/eeh_pe.c:567: warning: Function parameter or struct member 'mode' not described in 'eeh_pe_dev_mode_mark'
   arch/powerpc/kernel/eeh_pe.c:567: warning: expecting prototype for eeh_pe_dev_state_mark(). Prototype was for eeh_pe_dev_mode_mark() instead
   arch/powerpc/kernel/eeh_pe.c:582: warning: Function parameter or struct member 'root' not described in 'eeh_pe_state_clear'
   arch/powerpc/kernel/eeh_pe.c:582: warning: Excess function parameter 'data' description in 'eeh_pe_state_clear'
   arch/powerpc/kernel/eeh_pe.c:774: warning: Function parameter or struct member 'edev' not described in 'eeh_restore_one_device_bars'
   arch/powerpc/kernel/eeh_pe.c:774: warning: Excess function parameter 'data' description in 'eeh_restore_one_device_bars'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HOTPLUG_PCI_POWERNV
   Depends on [n]: PCI [=y] && HOTPLUG_PCI [=n] && PPC_POWERNV [=y] && EEH [=y]
   Selected by [y]:
   - OCXL [=y] && PPC_POWERNV [=y] && PCI [=y] && EEH [=y] && PPC_XIVE_NATIVE [=y]


vim +261 arch/powerpc/kernel/eeh_pe.c

9e6d2cf65e3dba arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  251  
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  252  /**
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  253   * __eeh_pe_get - Check the PE address
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  254   *
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  255   * For one particular PE, it can be identified by PE address
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  256   * or tranditional BDF address. BDF address is composed of
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  257   * Bus/Device/Function number. The extra data referred by flag
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  258   * indicates which type of address should be used.
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  259   */
d6c4932fbf2421 arch/powerpc/kernel/eeh_pe.c            Sam Bobroff       2018-05-25  260  static void *__eeh_pe_get(struct eeh_pe *pe, void *flag)
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07 @261  {
35d64734b64315 arch/powerpc/kernel/eeh_pe.c            Oliver O'Halloran 2020-09-18  262  	int *target_pe = flag;
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  263  
35d64734b64315 arch/powerpc/kernel/eeh_pe.c            Oliver O'Halloran 2020-09-18  264  	/* PHB PEs are special and should be ignored */
5efc3ad7325d81 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-11  265  	if (pe->type & EEH_PE_PHB)
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  266  		return NULL;
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  267  
35d64734b64315 arch/powerpc/kernel/eeh_pe.c            Oliver O'Halloran 2020-09-18  268  	if (*target_pe == pe->addr)
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  269  		return pe;
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  270  
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  271  	return NULL;
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  272  }
22f4ab123f10e1 arch/powerpc/platforms/pseries/eeh_pe.c Gavin Shan        2012-09-07  273  

:::::: The code at line 261 was first introduced by commit
:::::: 22f4ab123f10e1862579785c73d9e60fa24afd4f powerpc/eeh: Search PE based on requirement

:::::: TO: Gavin Shan <shangw@linux.vnet.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
