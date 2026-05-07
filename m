Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95CB3101BC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 11:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778152033; cv=none; b=R0NyfZXvtJoZtKW2s8k3E7ClJ6Cl+uZ7a5o4ENkvE8q0Ulk+1Ejyb9P4qW09m32NEP6O3TEiE/nVWkX/+/aabgOje1HFEY3I2x08iLIYSykTDY5zymOUVWB3sa/C1fvbV2zOG4gmg6wBAI0zY9YADlNjc/X+Y3C07XOhr9FtBDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778152033; c=relaxed/simple;
	bh=pp42QTMRqNCySFmAjUeS7qsIxhCvFbeyzdlxUQBw3kY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eOmuvKu2ZycxjEh3UR/Va4ZwlIZeR3NVLu2aTirsroxn5JhUknavEs3D+oeUcBjrYvkM4tHeivzpZqjiN4jcsu8BwfTUpYFtbC+v0WVe3JkcgaUDYO9n8vkn8gEUHV8NrwSPx3wcTGZ/ZmBwfwVa/odG0Qlu4ruYvFiHBGkQYdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWtuGNBu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWtuGNBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778152032; x=1809688032;
  h=date:from:to:cc:subject:message-id;
  bh=pp42QTMRqNCySFmAjUeS7qsIxhCvFbeyzdlxUQBw3kY=;
  b=HWtuGNBuNu/ncM8C5vgCl2Ddeqjdbq9cDVhU9yOXTA2gc4dZI5bGrwQG
   x9An+PK0V/Kvj0/QGrHHxB7/zMEGZI1eVEWmQ43wLIsz2k5OQbCadA8pG
   3oP+Hue3hlIXCg+Z2BRjOPKIF/aDdPd+Q6HyVGK6lYYj+irXDQnC1EsaK
   o/gz/SmBOmv1A2KudFHoT/rq2aoRRKKVMPlBgbwUujAne7s7r1DRT0pN+
   cKZ4IHIxS/DwTwYqLwqXBfjNZsg30tovRB+oDqt26FEx4RubAZuuuJ+UW
   p/xfok17tjZyuFo/e4F1eYhWgR1ZHn6lzVF2s2kM4icfAnkFt3Wzl0Fqo
   Q==;
X-CSE-ConnectionGUID: 6XBvKbeVSGOMzJuWF6nWWg==
X-CSE-MsgGUID: XuClb4XRSiGLWzCxGRGeUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="101774863"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="101774863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:07:12 -0700
X-CSE-ConnectionGUID: tP4v366hQkO0FNEke3edJw==
X-CSE-MsgGUID: /dYGRT1LQFOFtRYNShlcBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="232074603"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 May 2026 04:07:09 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKwZP-000000000Cn-2ILk;
	Thu, 07 May 2026 11:07:07 +0000
Date: Thu, 07 May 2026 19:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 7/18] mm/cow_context.c:425:30:
 sparse: sparse: cast to non-scalar
Message-ID: <202605071913.7YeveUhZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 53591da634daa5ce534050b281052ab69defff58 [7/18] mm: add cow context write-side functionality
config: alpha-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071913.7YeveUhZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071913.7YeveUhZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071913.7YeveUhZ-lkp@intel.com/

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
