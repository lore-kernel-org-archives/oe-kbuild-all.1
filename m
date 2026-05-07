Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD86B1F09AD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778171903; cv=none; b=tTkXuPE4isE/+0Bb2f2rMeyuAxHv1WeNdVr26qruAJfRjRNxgZacOIW2cp3zzgLlbgRsNyIKmMrMXFhvJRA8AbNL5OJOgyJNlX1Kl00nJUiFAYqzjBipD3nMzzjcsyOopNEm8GpmD0097hXEJYWrRGWco8qgeK1jiTWugo/OXzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778171903; c=relaxed/simple;
	bh=C717Wrq1Ae/LxygcqRH5SBkFlGplPja2wzYG7A1EWR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KS2KS/JKj6MlfV4snbG1prp/16Dr66YWMTsl3WQNsWIJh33V/rXi2tDWVmii5UBHklqU5SKxgZ8giDxDlZO6caQMwugMnDcemOiOVtSdtY6D4sGraZ7/Za1O9Ow3fhvY90foarKzfUGwmaE7zidl1dVugpzj12Y07F+QwTaQ/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKjBC/oa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKjBC/oa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778171902; x=1809707902;
  h=date:from:to:cc:subject:message-id;
  bh=C717Wrq1Ae/LxygcqRH5SBkFlGplPja2wzYG7A1EWR4=;
  b=ZKjBC/oak7WmZUxCxvoEvaj5ZBbRLr3uqxcbknRB9bREu1adN3eRJdZP
   qd3mnZEwMpy1uHI6vVWPXvTVmg1jEzWzc3dl41ziaQUlfeIhZPEkQbLSt
   95vTCEHMmigjKAOqJqNmCvv1bg4UrjLm7r9b8Y3TBRyRqqXvDR3GfuddE
   pBRFS+/N+4S8SIg9X2oLgTCNG8kcj1uGifRv1MsglBgAWkcODwAb97s36
   XQXN8D7o9x+Q5VOyE+NPNB6/CYWWT94gZXqg/pQfpLTaZN8K8LK+f27f2
   frWp1L4TmCP3UYGEGBBS1hzIYvZK6gBkDbtO/hqZL8vYORaMvwhrb8vU/
   Q==;
X-CSE-ConnectionGUID: tSE2CdMjQ/WG/TCff6kkcg==
X-CSE-MsgGUID: xviLEe4JTyS93TkCm0Ue/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96557947"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96557947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 09:38:21 -0700
X-CSE-ConnectionGUID: F2OX/zePQX+4OQcOjcRq4g==
X-CSE-MsgGUID: ZyyceCrKThyvcKXvkrRQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="235672978"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 May 2026 09:38:19 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL1jt-000000000I1-1XVW;
	Thu, 07 May 2026 16:38:17 +0000
Date: Fri, 08 May 2026 00:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 7/18] mm/cow_context.c:425:30:
 sparse: sparse: cast to non-scalar
Message-ID: <202605080029.AH4jHUVC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 53591da634daa5ce534050b281052ab69defff58 [7/18] mm: add cow context write-side functionality
config: alpha-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080029.AH4jHUVC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080029.AH4jHUVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080029.AH4jHUVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/cow_context.c:425:30: sparse: sparse: cast to non-scalar
   mm/cow_context.c:702:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *entry @@     got struct list_head [noderef] * @@
   mm/cow_context.c:702:23: sparse:     expected struct list_head *entry
   mm/cow_context.c:702:23: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:717:17: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head const *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:717:17: sparse:     expected struct list_head const *head
   mm/cow_context.c:717:17: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:739:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *new @@     got struct list_head [noderef] * @@
   mm/cow_context.c:739:23: sparse:     expected struct list_head *new
   mm/cow_context.c:739:23: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:739:43: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct list_head *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:739:43: sparse:     expected struct list_head *head
   mm/cow_context.c:739:43: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:752:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:752:25: sparse:     expected struct list_head *list
   mm/cow_context.c:752:25: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:753:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:753:25: sparse:     expected struct list_head *list
   mm/cow_context.c:753:25: sparse:     got struct list_head [noderef] *

vim +425 mm/cow_context.c

   393	
   394	/*
   395	 * Reduce the count of remaps by 1, freeing the entry in the remaps maple tree
   396	 * if reduced to zero.
   397	 *
   398	 * RCU read lock must be held.
   399	 */
   400	static void shrink_remaps(struct cow_context *context,
   401				  struct ma_state *mas_remaps, pgoff_t pgoff,
   402				  pgoff_t pgoff_last, remaps_entry_t remaps)
   403	{
   404		int nr;
   405		remaps_entry_t new_remaps;
   406		pgoff_t pgoff_next;
   407	
   408		lockdep_assert_in_rcu_read_lock();
   409	
   410		/* mmap_downgrade() makes life hard. */
   411		spin_lock(&context->concurrent_unmap_lock);
   412	
   413		nr = nr_remaps(remaps);
   414	
   415		/* If multi, simple. */
   416		if (nr > 2) {
   417			dynarray_shrink(get_multi_remaps(remaps));
   418			spin_unlock(&context->concurrent_unmap_lock);
   419			return;
   420		}
   421	
   422		if (nr == 2)
   423			new_remaps = mk_simple_remap(get_remap(remaps, 0));
   424		else /* nr == 1 */
 > 425			new_remaps = EMPTY_REMAPS_ENTRY;
   426	
   427		pgoff_next = mas_remaps->last + 1;
   428	
   429		spin_unlock(&context->concurrent_unmap_lock);
   430		/* Now we're allocating so must drop the lock. RCU readers are safe. */
   431		rcu_read_unlock();
   432		store_new_remaps_entry(mas_remaps, pgoff, pgoff_last, new_remaps);
   433		free_remaps(remaps);
   434		mas_set(mas_remaps, pgoff_next);
   435		rcu_read_lock();
   436	}
   437	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
