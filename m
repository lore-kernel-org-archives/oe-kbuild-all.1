Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158798;
	b=S/22dfIgslGRmCbEzVPd9jVGM+ZhFbNrtIrSwpI6ftj7DQmEuKrGKl9peCRH/MK6xR6/
	 pCIazSVooIIDDmjEG0q1pFm1kT2h5kI9hkckHX4Lbwr1y32N/toiKcCtThM3SNxnPNGtR
	 Cu8NZ6tbqonEkDSRruCmZaXWfW6gtbkfwq8AUz0PHH3U6uGXJdtswkQmb4pVYI9PWBruL
	 J5RDlWXb0pKlDtuc2vdN0VK/ltbq+25otNJYirUevb700qc8SB2Ak3t7teBGPLrdi2Nhn
	 HnpTKOmNqZASGYpJfHrPg8WmxhrZxfOMY9+YDRK1BKd5n9qkWojmis2vMjFZxO776yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158798;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=o7qlSg3qaYoh+uryYlZSd1HPhJYghTjMmWEQgNmAufQ=;
	b=juDHX8eWG95iycGC0oyFpE4JN0n0Z5xqn2okRquaecR8G+rL3zYjXBnOOA6qsNlfQCzK
	 +JRDiG5HJD0/94yVuhmI0Kh9tKmxm0CD6BcxaPlFtlzZtzrUOXXqPVhX49nCiw5mkqGnR
	 NR57ACG/cgUe6NhhpGHyyJsuxg7uHlrZZW7oEqWuBrMRQZsp9m3DNR4YoIlZVQ3e2F85I
	 39CcIegqkMfSLCBQ7Kk2wUKnyOuB3YMGVrkznkMUQklmFDLLeALQsGMDlFotxZkfdvBCc
	 ZjqoUw2FaeXR339H1cQ/WRZ6IyNbQf5KVtNlLtaXxiUpHhA9ujYUu34EH5uHx4CsmZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIXe+T9a;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29EE606A326
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 07:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F29EE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YIXe+T9a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795158798; x=1826694798;
  h=date:from:to:cc:subject:message-id;
  bh=sUeoVGQ69zpCENH7oLtRWR7DhvQtbUUyhsmnHXQSVd8=;
  b=YIXe+T9aDCjCd6fwL0NwfQJZBgQcLrgZr9FzfUDmz3e1KuBwDp7klYoE
   yWyUgXN1NkocEFA1rTmpOgzDgP/towE4mr264lnyndDhfvn36Ej/WhElm
   8wGheKngjOEOjOznNvNmuAJjr3xZ18ApljioZAmaEyMD87hMmMMcZU1C9
   BH2PhQgehd6lUP9217fjlwKm9xicqnuw92zxIzEyBTWYyH72yNUyLjaWC
   ssK1H7akDIxQ/8BpQbPHUEtw+IMarznYF+JR05jAl5HUGViAHj3JW/05+
   3ljT1FiNJNBYw0xQIe7VX1wadnYGlqDA8CvTDga5MlfzuTlzI33zRWOk1
   w==;
X-CSE-ConnectionGUID: VPbj/Z0sSZuD0yJJuTBj3Q==
X-CSE-MsgGUID: 1PgyCqWqSj2wqlchKfrIfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4112348"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4112348"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:13:17 -0800
X-CSE-ConnectionGUID: pbBL0kajRG+NB9oY7MGIGg==
X-CSE-MsgGUID: fMYjgV9WSgOe2JEVvqMtMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12630170"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 19 Nov 2026 23:13:16 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUIo5-000000003yn-2uv3;
	Fri, 20 Nov 2026 07:13:13 +0000
Date: Fri, 20 Nov 2026 08:13:12 +0100
From: kernel test robot <lkp@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v3 74/74]
 arch/x86/kernel/cpu/resctrl/core.c:570:13: warning: 'mba_wrmsr_intel' defined
 but not used
Message-ID: <20261120080333.xST1LnDm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v3
head:   44ee005039e7353a899dad21df48075ed1699ebb
commit: 44ee005039e7353a899dad21df48075ed1699ebb [74/74] x86/resctrl: SAMPLE: Emulated controls
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261120/20261120080333.xST1LnDm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/20261120080333.xST1LnDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261120080333.xST1LnDm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/resctrl/core.c:570:13: warning: 'mba_wrmsr_intel' defined but not used [-Wunused-function]
     570 | static void mba_wrmsr_intel(struct msr_param *m)
         |             ^~~~~~~~~~~~~~~


vim +/mba_wrmsr_intel +570 arch/x86/kernel/cpu/resctrl/core.c

44ee005039e735 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-08-03  569  
bd4955d4bc2182 arch/x86/kernel/cpu/resctrl/core.c Tony Luck       2024-03-08 @570  static void mba_wrmsr_intel(struct msr_param *m)
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  571  {
cae2bcb6a2c691 arch/x86/kernel/cpu/resctrl/core.c Tony Luck       2024-06-28  572  	struct rdt_hw_ctrl_domain *hw_dom = resctrl_to_arch_ctrl_dom(m->dom);
56eb6bbc637686 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-05-28  573  	struct resctrl_hw_ctrl *hw_ctrl = resctrl_to_arch_ctrl(m->ctrl);
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  574  	unsigned int i;
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  575  
3a35a01a4e7d79 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-07-21  576  	if (!test_bit(RESCTRL_SCALAR_FLAG_LINEAR, m->ctrl->scalar.flags)) {
9bb210ebbd44b2 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-11-04  577  		pr_warn_once("Non-linear MBA delay values not supported\n");
9bb210ebbd44b2 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-11-04  578  		return;
9bb210ebbd44b2 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-11-04  579  	}
9bb210ebbd44b2 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-11-04  580  
9bb210ebbd44b2 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-11-04  581  	/* Program bandwidth percentage mapped to linear delay value. */
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  582  	for (i = m->low; i < m->high; i++)
56eb6bbc637686 arch/x86/kernel/cpu/resctrl/core.c Reinette Chatre 2026-05-28  583  		wrmsrq(hw_ctrl->msr_base + i, MAX_MBA_BW - hw_dom->ctrl_val[i]);
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  584  }
05b93417ce5b92 arch/x86/kernel/cpu/intel_rdt.c    Vikas Shivappa  2017-04-07  585  

:::::: The code at line 570 was first introduced by commit
:::::: bd4955d4bc2182ccb660c9c30a4dd7f36feaf943 x86/resctrl: Simplify call convention for MSR update functions

:::::: TO: Tony Luck <tony.luck@intel.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
