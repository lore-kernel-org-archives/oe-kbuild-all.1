Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7026E34AAE9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137318; cv=none; b=jAmN5e2gvUH/AGzhDt4jf+nQlyaydNp/hD/IN0STn+4GqdgUI3PvsW7KOh1ifNEYlDPf175+L9LZgdvdehCwi6FfJALXggdFsN5RtEC7CwPPA1j30xTBSy5mIyviUohc7dle4Cd1bWIF6aEp2DqfecgHaInPCznMzo9FwpczFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137318; c=relaxed/simple;
	bh=hybkGxKQq47khVMDroz5rh/UKtBTnwbYWrxezmxPJj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m6VpMXM0e4G9nLzZDnxYKdli2g6tn3L0FkWsnCmyFO1Cvq5bS4GEeWNpkDS5qO5SNYH0S0iZwu/Pbvh1Ql68Z/IhXUjZEf5pIB//Y0Xb8Kz4AYx4BcGjPhESQ4RIFkAymszx7r1sN70v1dmp9zqBmzWbHWaCLSDnGkEhFXhdi1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vym1Dwnt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vym1Dwnt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778137316; x=1809673316;
  h=date:from:to:cc:subject:message-id;
  bh=hybkGxKQq47khVMDroz5rh/UKtBTnwbYWrxezmxPJj4=;
  b=Vym1DwntYdvzB+MaEbQmHxqf0kXdMJBfmpZgk8qyswOS3KqsmKTAUcaW
   2WtxU4dFtRaaeDOsJ9n5TQ58eyRWtJ8wHRORQnFMfSfQ3o0yIeYO7PN+E
   HPp7qLhdM/EQKlxcndJ9W/rat3nNMM2GE69TqQOqLtd6PLIeQ8jHTD5Wc
   uAu7XUjEkUXvJp7kDZIWHnFYGo7yw4+5+zKh2hV/joB+BnZ93IFJPW6IZ
   JxHmyx41spCXegD6ADyR78WRZrTJRpDK/Mukg44/XhAF1wmHAKEySTZdM
   kYP3qv0YM7CMMNCM3p+xtq7C3Y3iq/VpJS+ftA0AkyL0f5OK5T9cqRmcu
   Q==;
X-CSE-ConnectionGUID: Ntsfjlh1RLiN93E9SlC53A==
X-CSE-MsgGUID: VKd+n1GjSquF6qnmALu+bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101755408"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="101755408"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 00:01:54 -0700
X-CSE-ConnectionGUID: /I/hQe2dRk+NdYAlpX1F5Q==
X-CSE-MsgGUID: tJufFLYARli8mO1n841TJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="229990692"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 00:01:52 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKsk1-00000000055-2HYN;
	Thu, 07 May 2026 07:01:49 +0000
Date: Thu, 07 May 2026 15:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 1/18] kernel/fork.c:738:9: error:
 implicit declaration of function 'drop_cow_context'
Message-ID: <202605071433.7rpLF9zl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 1be9d553f4be97b754471cc04735f215e75c4bf2 [1/18] mm/rmap: add cow_context data structure and assign to mm
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20260507/202605071433.7rpLF9zl-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071433.7rpLF9zl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071433.7rpLF9zl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function '__mmdrop':
>> kernel/fork.c:738:9: error: implicit declaration of function 'drop_cow_context' [-Wimplicit-function-declaration]
     738 |         drop_cow_context(mm);
         |         ^~~~~~~~~~~~~~~~
   kernel/fork.c: In function 'mm_init':
>> kernel/fork.c:1097:9: error: implicit declaration of function 'mm_init_cow_context'; did you mean 'init_new_context'? [-Wimplicit-function-declaration]
    1097 |         mm_init_cow_context(mm);
         |         ^~~~~~~~~~~~~~~~~~~
         |         init_new_context


vim +/drop_cow_context +738 kernel/fork.c

   714	
   715	/*
   716	 * Called when the last reference to the mm
   717	 * is dropped: either by a lazy thread or by
   718	 * mmput. Free the page directory and the mm.
   719	 */
   720	void __mmdrop(struct mm_struct *mm)
   721	{
   722		BUG_ON(mm == &init_mm);
   723		WARN_ON_ONCE(mm == current->mm);
   724	
   725		/* Ensure no CPUs are using this as their lazy tlb mm */
   726		cleanup_lazy_tlbs(mm);
   727	
   728		WARN_ON_ONCE(mm == current->active_mm);
   729		mm_free_pgd(mm);
   730		mm_free_id(mm);
   731		destroy_context(mm);
   732		mmu_notifier_subscriptions_destroy(mm);
   733		check_mm(mm);
   734		put_user_ns(mm->user_ns);
   735		mm_pasid_drop(mm);
   736		mm_destroy_cid(mm);
   737		percpu_counter_destroy_many(mm->rss_stat, NR_MM_COUNTERS);
 > 738		drop_cow_context(mm);
   739	
   740		free_mm(mm);
   741	}
   742	EXPORT_SYMBOL_GPL(__mmdrop);
   743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
