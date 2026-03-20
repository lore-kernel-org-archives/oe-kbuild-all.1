Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7381F92E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 07:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773990416; cv=none; b=W7tsXZisxyp5sMlP1J3+iWmnnieuNi33hrk1Y+iysTy7/ryggm9/e6FzZXH1rABufrYmhSbxf55GQPWw1IKuU3sKkgm/QDZx63CvLkeSyc4gPvpzMgxG9Xs0n4kRhO/Pnx6UhnliNL7N3q2gAJgilYAFdBEuyI2ZDBw7Yl90+O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773990416; c=relaxed/simple;
	bh=X80GIyn3bG+qR44T6EApKZ7kweUXmEJ3OyFQAq/HNAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rKlLzRMEUdszEgHhzZpnMECe9eVABX7AmOjZIEKtT6GQVW1chHA5fiiykqhpK9fpiLxYU+Ai4VlxxbQ1FlEdaLJ5p13jUs0U+UQIk81IvvZO/wDlBPhh1fvGpOUekVTPxKMqQxl8TFtXRZqBtD503OpyhU/SvE8fuv6in3s6+go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WssD29ld; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WssD29ld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773990415; x=1805526415;
  h=date:from:to:cc:subject:message-id;
  bh=X80GIyn3bG+qR44T6EApKZ7kweUXmEJ3OyFQAq/HNAI=;
  b=WssD29ldJuizQ5Csd3ZwCp2Wbem76sYmSxjaA/cK2nXa3gb23DlM5z9Q
   zrwkXuAP5g4hrEo0k3AjTLHL7T6bMsKNu11OyNmaJYseVK/LyTrfmgNvI
   TbsQzZ4BjFsfJoJmhbHwXYY0pEJlfMQwfAmoqrB01GNP5P6AxlZDQM0ei
   5ueMB+bnVCdnRUWVyE3ncNjCoXRnm36B1aTMLPu6UOXiA0Lf6k2/YgCav
   Pb7xmOnHOkX+kHxm4FZqgdCkv63vV6w50+R7sepRA2+K7dU2E6GIln5aJ
   LTNc83xOr/WC7moBDdzV0WmODOMoM9D2EW7/rcpZMPrRq+HqIpGlLaBEd
   A==;
X-CSE-ConnectionGUID: 8l1Hep1tTIOZeo2E/NZR/g==
X-CSE-MsgGUID: /E/liz5hRFK+zu+FcotNuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75104797"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="75104797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 00:06:53 -0700
X-CSE-ConnectionGUID: p6wfH0dCTPmqTrWhhD2eag==
X-CSE-MsgGUID: Gf5mBCe+RxiUcjbYRV3l8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="220124472"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Mar 2026 00:06:52 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3TwX-0000000025r-27dp;
	Fri, 20 Mar 2026 07:06:49 +0000
Date: Fri, 20 Mar 2026 15:06:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 11/11]
 kernel/futex/core.c:1460:51: error: 'struct futex_unlock_cs_range' has no
 member named 'cs_pop_size32'; did you mean 'pop_size32'?
Message-ID: <202603201428.jdjQQc2c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0
commit: 5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0 [11/11] x86/vdso: Implement __vdso_futex_robust_try_unlock()
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20260320/202603201428.jdjQQc2c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201428.jdjQQc2c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201428.jdjQQc2c-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function '__futex_fixup_robust_unlock':
>> kernel/futex/core.c:1460:51: error: 'struct futex_unlock_cs_range' has no member named 'cs_pop_size32'; did you mean 'pop_size32'?
    1460 |         futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
         |                                                   ^~~~~~~~~~~~~
         |                                                   pop_size32


vim +1460 kernel/futex/core.c

091f92a56d090b9 Thomas Gleixner 2026-03-14  1451  
663a342874dcaee Thomas Gleixner 2026-03-14  1452  #ifdef CONFIG_FUTEX_ROBUST_UNLOCK
663a342874dcaee Thomas Gleixner 2026-03-14  1453  void __futex_fixup_robust_unlock(struct pt_regs *regs, struct futex_unlock_cs_range *csr)
663a342874dcaee Thomas Gleixner 2026-03-14  1454  {
663a342874dcaee Thomas Gleixner 2026-03-14  1455  	void __user *pop = arch_futex_robust_unlock_get_pop(regs);
663a342874dcaee Thomas Gleixner 2026-03-14  1456  
663a342874dcaee Thomas Gleixner 2026-03-14  1457  	if (!pop)
663a342874dcaee Thomas Gleixner 2026-03-14  1458  		return;
663a342874dcaee Thomas Gleixner 2026-03-14  1459  
663a342874dcaee Thomas Gleixner 2026-03-14 @1460  	futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
663a342874dcaee Thomas Gleixner 2026-03-14  1461  }
663a342874dcaee Thomas Gleixner 2026-03-14  1462  #endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
663a342874dcaee Thomas Gleixner 2026-03-14  1463  

:::::: The code at line 1460 was first introduced by commit
:::::: 663a342874dcaee9a1192cb7fd250d47749fd78f futex: Provide infrastructure to plug the non contended robust futex unlock race

:::::: TO: Thomas Gleixner <tglx@kernel.org>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
