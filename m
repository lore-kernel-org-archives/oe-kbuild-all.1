Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744B242E8E9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783600692; cv=none; b=a1wA24+QpUQgpPIKehVKaA/FbF3Ft4TEcKCPfEZIJ3YGIecOidrNCSZSQ60xkrs8sUCrCLbas5pjRP5kakeSzNW++2KLe4STPOQEP0cl8TzqoNUPYjyyRmFgE0m3fMgjfFJa/iFU3ef0eQ3NBVpet4bdiQ2mjp+2isOlSwUEHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783600692; c=relaxed/simple;
	bh=CvMW/162P9k6XYurScoGj3PNfGe/kS/IntF2z/lMs7A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rw/bKMg8a9wF0umWpbGbXbLfDAxA76skm79yOXBkpoVY3IWNxyhgQNEhkCT32WJPCfSEWg8Tpuz9pbzijsJSNu9u3ULO0YTUZdEjIfL/CjOKuULw7+DRaQyWCnrF/WX/xm/G5rCqt6YbKY1xORKsOYHwIAQds5kw2cNh5fvyn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkWinoMX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkWinoMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783600690; x=1815136690;
  h=date:from:to:cc:subject:message-id;
  bh=CvMW/162P9k6XYurScoGj3PNfGe/kS/IntF2z/lMs7A=;
  b=nkWinoMXLvBteIT0ahlp4SLc7TwTp60jzi6ihFrTKdhH7fDIp7/2LpsU
   AsfFgFfSZfs8W/jR43R47G+g5kTGlBLOrAyhTAuovKDWmJA16NZpa4MEj
   SxIvYrjX6S5KqdEj4WfrSopO4etBFtrtDzfo+XdPm/HWndZr1cPGRXCSn
   XRm0K9C1Cs5Sttwnf2fzlFvuiYtvG55lzMRb6XOAgdT9NtshqHBXVKosg
   2rDX9xcuqpk6l5U/MToxTKd67hNX5CihxSTxsLigQyZEpJKfZyi7e6PQV
   b7KjclVksjAZEOyyQui7EAbMFtwOHnuSKkIljuEvZ5cu9wGeO4W1ByfjG
   Q==;
X-CSE-ConnectionGUID: 5bRD9FTFRwy2K0r006YTvw==
X-CSE-MsgGUID: 4zAE8VTMQvOQHX63qlp3WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109826255"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109826255"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 05:38:09 -0700
X-CSE-ConnectionGUID: EqosAjhqRy6Q/mcQY9IvOg==
X-CSE-MsgGUID: 70AzKzgqQBO1Wf8aKckmaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253480709"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Jul 2026 05:38:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1who0z-00000000HgT-43jM;
	Thu, 09 Jul 2026 12:38:05 +0000
Date: Thu, 09 Jul 2026 20:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folded_pgtable 28/32]
 arch/x86/platform/olpc/olpc_ofw.c:26:16: warning: variable 'ofw_pde' set but
 not used
Message-ID: <202607092037.bS6aWcUf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux folded_pgtable
head:   0551ca68b7552b7d71f1d2882635809a573d6c79
commit: 4d449742015c33fd18a4aebf1ee795675c2b532f [28/32] mm/pgtable: disallow calling folded set_pgd/set_p4d/set_pud
config: i386-randconfig-r131-20260709 (https://download.01.org/0day-ci/archive/20260709/202607092037.bS6aWcUf-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607092037.bS6aWcUf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607092037.bS6aWcUf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/platform/olpc/olpc_ofw.c:26:16: warning: variable 'ofw_pde' set but not used [-Wunused-but-set-variable]
      26 |         pgd_t *base, *ofw_pde;
         |                       ^
   1 warning generated.


vim +/ofw_pde +26 arch/x86/platform/olpc/olpc_ofw.c

fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  23  
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  24  void __init setup_olpc_ofw_pgd(void)
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  25  {
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18 @26  	pgd_t *base, *ofw_pde;
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  27  
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  28  	if (!olpc_ofw_cif)
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  29  		return;
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  30  
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  31  	/* fetch OFW's PDE */
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  32  	base = early_ioremap(olpc_ofw_pgd, sizeof(olpc_ofw_pgd) * PTRS_PER_PGD);
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  33  	if (!base) {
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  34  		printk(KERN_ERR "failed to remap OFW's pgd - disabling OFW!\n");
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  35  		olpc_ofw_cif = NULL;
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  36  		return;
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  37  	}
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  38  	ofw_pde = &base[OLPC_OFW_PDE_NR];
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  39  
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  40  	/* install OFW's PDE permanently into the kernel's pgtable */
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  41  	set_pgd(&swapper_pg_dir[OLPC_OFW_PDE_NR], *ofw_pde);
75a9cac430a1bd arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-23  42  	/* implicit optimization barrier here due to uninline function return */
75a9cac430a1bd arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-23  43  
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  44  	early_iounmap(base, sizeof(olpc_ofw_pgd) * PTRS_PER_PGD);
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  45  }
fd699c76552bbf arch/x86/kernel/olpc_ofw.c Andres Salomon 2010-06-18  46  

:::::: The code at line 26 was first introduced by commit
:::::: fd699c76552bbfa66631f019be415a87dbb08237 x86, olpc: Add support for calling into OpenFirmware

:::::: TO: Andres Salomon <dilinger@queued.net>
:::::: CC: H. Peter Anvin <hpa@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
