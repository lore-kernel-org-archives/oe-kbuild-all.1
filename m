Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67C8242D72
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 00:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773967769; cv=none; b=hFA9k6yJkLMsSLm0tQxdjQtHjn7uuKdoXH8K0zdpG+3hPxO/mK83oRwcRo1ZmCBxk8XOfmBfVeONGsDJvWjLThsaui4431trlEvGeUwhXhwYlDEDGqlcCg/joqbKSAVqe5xsl5m9/OuuFQ6mH2ZwXZy2QvTHeIHUUgUxfOxJxPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773967769; c=relaxed/simple;
	bh=drBajCOHFeNy1BpswxFLaJfFxhjKUBmCxzFzKSr82Bg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DDjAu/WIpG6Oe1ZcucFSas3wvwi9KG5ebguBuAXmFmKLRc/1JVna2RncG+7JVtcyL4LSawwsdR2esof5HsdQCsqQIm2aJ29JJ1IFRqDBimIsEh9Re3mnQdBWQAer+6Lxt0wy1z6opPMH20eS6m4pu5Z7G/scqfvLcmePC9rSWqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEpolwI3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEpolwI3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773967767; x=1805503767;
  h=date:from:to:cc:subject:message-id;
  bh=drBajCOHFeNy1BpswxFLaJfFxhjKUBmCxzFzKSr82Bg=;
  b=GEpolwI3MhUZI6lEQNDSpYm91e1SjZaQMVNzU9GzFQzrWSDK4RXcG9zw
   YKoQ6yVzM8DpTFEospOwGzy/H7F4mrbQso6fTmzMRiRNMbe2BeaG/eV67
   uAouLqT8o1/cTUD+ArgjVVtX0ecADoTiDiHRjke1QP1H5FGUFFEqWDcBl
   hj+AVwlJ/bWuuOL0n+Tin42xJUuJVNyUf2nnVh77AyGsB2NhKGW73pP8d
   T6O3Ugw6UzJMFK3QjZeSFhN6bqlMx2313ufu6Fg3lwPvLV8ofMCxpj5cE
   4AQlXKaoXpv64i/yzMcIQrMKy82oF39WFqX/v69ZNdhsg1LQqe8Ha7Y96
   A==;
X-CSE-ConnectionGUID: dQSLI7OPQqaSBisFgZUm/A==
X-CSE-MsgGUID: i7XJ24ZuQx69XO2tK+XPmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74940489"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74940489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 17:49:27 -0700
X-CSE-ConnectionGUID: 8y9xM2VzRhKNDjhQkMnPzA==
X-CSE-MsgGUID: E0wx4BXsQJy2C8vrw2dhog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="223355583"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 19 Mar 2026 17:49:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3O3H-000000004wH-2SMr;
	Fri, 20 Mar 2026 00:49:23 +0000
Date: Fri, 20 Mar 2026 01:49:09 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 11/11]
 kernel/futex/core.c:1460:51: error: 'struct futex_unlock_cs_range' has no
 member named 'cs_pop_size32'; did you mean 'pop_size32'?
Message-ID: <202603200159.YRHXhMYf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0
commit: 5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0 [11/11] x86/vdso: Implement __vdso_futex_robust_try_unlock()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260320/202603200159.YRHXhMYf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200159.YRHXhMYf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200159.YRHXhMYf-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/futex/core.c: In function '__futex_fixup_robust_unlock':
>> kernel/futex/core.c:1460:51: error: 'struct futex_unlock_cs_range' has no member named 'cs_pop_size32'; did you mean 'pop_size32'?
    1460 |         futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
         |                                                   ^~~~~~~~~~~~~
         |                                                   pop_size32


vim +1460 kernel/futex/core.c

091f92a56d090b Thomas Gleixner 2026-03-14  1451  
663a342874dcae Thomas Gleixner 2026-03-14  1452  #ifdef CONFIG_FUTEX_ROBUST_UNLOCK
663a342874dcae Thomas Gleixner 2026-03-14  1453  void __futex_fixup_robust_unlock(struct pt_regs *regs, struct futex_unlock_cs_range *csr)
663a342874dcae Thomas Gleixner 2026-03-14  1454  {
663a342874dcae Thomas Gleixner 2026-03-14  1455  	void __user *pop = arch_futex_robust_unlock_get_pop(regs);
663a342874dcae Thomas Gleixner 2026-03-14  1456  
663a342874dcae Thomas Gleixner 2026-03-14  1457  	if (!pop)
663a342874dcae Thomas Gleixner 2026-03-14  1458  		return;
663a342874dcae Thomas Gleixner 2026-03-14  1459  
663a342874dcae Thomas Gleixner 2026-03-14 @1460  	futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
663a342874dcae Thomas Gleixner 2026-03-14  1461  }
663a342874dcae Thomas Gleixner 2026-03-14  1462  #endif /* CONFIG_FUTEX_ROBUST_UNLOCK */
663a342874dcae Thomas Gleixner 2026-03-14  1463  

:::::: The code at line 1460 was first introduced by commit
:::::: 663a342874dcaee9a1192cb7fd250d47749fd78f futex: Provide infrastructure to plug the non contended robust futex unlock race

:::::: TO: Thomas Gleixner <tglx@kernel.org>
:::::: CC: Thomas Gleixner <tglx@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
