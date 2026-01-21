Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03082BD11
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jan 2026 15:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009627; cv=none; b=gzS9uQvgC62cryQUjjPmIVCJhGCNQwM51gQAKbSDaXZrNVK/OyJJ47Ar4Pkppz/pibtHztcwnlDcTx2IouWIR2Tbuy4HHbUiqnRGqhMFraNWkzn0gRHvLeP6x8Zfre89o74e9UwGM2srlK5NZL3KWlu6AMdOmRQff5uc7gu2nnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009627; c=relaxed/simple;
	bh=TLW8fj0FahSY3BeiGZMox2XFBwr3A7jR+RsVDix9gww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R/uO/DfLNiLAj3FyJlTIjz5P84lmktrogFXrZmyJRQ/Ey+J9Dks92NnJX/4QCvLFaz65rCBonJ4kCfkdXVN0GBds3wNZ4zqgbfvuoHAkof/huwyULQyFqAZTriSARSKL3USGTDyxd3eBZCNJHex6+Ip0EQ4+hpvMrJlrWIeJmlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQYWyJIq; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQYWyJIq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769009626; x=1800545626;
  h=date:from:to:cc:subject:message-id;
  bh=TLW8fj0FahSY3BeiGZMox2XFBwr3A7jR+RsVDix9gww=;
  b=RQYWyJIqdelr07FMeQ9BZv0GQFVFaIEqn9GouuP6IIDwHpSkRgsP9iqB
   UN/qOZoj5s6dEamtbLdmUu/rp78mgmPp+DGAHZTGA5oyvWDA6FEmYiHRk
   h9LxCozjTyGYweFUkZEtWBt2yqFqDlRxglQy92CreuwDhF/zzttyk/IeQ
   z+Jn25iVDDm9l8MJeuKuUfYF4BGhUlE9zNsqU8CVMqEvAMYNm5gD+G9Ui
   CmO4c/TEjARR/WTaGiLlYcCGay2WqSzD+mnZVCEj0IAshBQSLj+5jNVLj
   ClP6/j2nwKnnsAb9MxNLCpGfmizqWyFpqKmFD1GYmGrtEVL8FCDl/4jZu
   A==;
X-CSE-ConnectionGUID: vB3n7RB8RKeRwPTjLcf20Q==
X-CSE-MsgGUID: mndnjMxsTpGBwtp2PNx73g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80958745"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80958745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:33:45 -0800
X-CSE-ConnectionGUID: zpn0pgceTdOUN6lt5NC1Nw==
X-CSE-MsgGUID: kbQiV3CvTqOjA2xNYCWWnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="205609758"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jan 2026 07:33:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viaDE-00000000RLX-1Rvz;
	Wed, 21 Jan 2026 15:33:40 +0000
Date: Wed, 21 Jan 2026 23:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Filipe Manana <fdmanana@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [kdave-btrfs-devel:misc-next 83/86]
 fs/btrfs/block-group.c:4752:2: error: member reference type 'spinlock_t' (aka
 'struct spinlock') is not a pointer; did you mean to use '.'?
Message-ID: <202601212308.uu6EDSOb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   fd51fd608e8d64de4488c833cc7456dfed45cbe9
commit: 09a427462342fb4a4ac21d222e5ded616f90238f [83/86] btrfs: assert block group is locked in btrfs_use_block_group_size_class()
config: hexagon-randconfig-r072-20260121 (https://download.01.org/0day-ci/archive/20260121/202601212308.uu6EDSOb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601212308.uu6EDSOb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601212308.uu6EDSOb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/btrfs/block-group.c:4752:2: error: member reference type 'spinlock_t' (aka 'struct spinlock') is not a pointer; did you mean to use '.'?
    4752 |         lockdep_assert_held(bg->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:52: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                             ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
>> fs/btrfs/block-group.c:4752:2: error: cannot take the address of an rvalue of type 'struct lockdep_map'
    4752 |         lockdep_assert_held(bg->lock);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:285:17: note: expanded from macro 'lockdep_assert_held'
     285 |         lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
         |         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:252:45: note: expanded from macro 'lockdep_is_held'
     252 | #define lockdep_is_held(lock)           lock_is_held(&(lock)->dep_map)
         |                                                      ^
   include/linux/lockdep.h:279:32: note: expanded from macro 'lockdep_assert'
     279 |         do { WARN_ON(debug_locks && !(cond)); } while (0)
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:155:25: note: expanded from macro 'WARN_ON'
     155 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   2 errors generated.


vim +4752 fs/btrfs/block-group.c

  4728	
  4729	/*
  4730	 * Handle a block group allocating an extent in a size class
  4731	 *
  4732	 * @bg:				The block group we allocated in.
  4733	 * @size_class:			The size class of the allocation.
  4734	 * @force_wrong_size_class:	Whether we are desperate enough to allow
  4735	 *				mismatched size classes.
  4736	 *
  4737	 * Returns: 0 if the size class was valid for this block_group, -EAGAIN in the
  4738	 * case of a race that leads to the wrong size class without
  4739	 * force_wrong_size_class set.
  4740	 *
  4741	 * find_free_extent will skip block groups with a mismatched size class until
  4742	 * it really needs to avoid ENOSPC. In that case it will set
  4743	 * force_wrong_size_class. However, if a block group is newly allocated and
  4744	 * doesn't yet have a size class, then it is possible for two allocations of
  4745	 * different sizes to race and both try to use it. The loser is caught here and
  4746	 * has to retry.
  4747	 */
  4748	int btrfs_use_block_group_size_class(struct btrfs_block_group *bg,
  4749					     enum btrfs_block_group_size_class size_class,
  4750					     bool force_wrong_size_class)
  4751	{
> 4752		lockdep_assert_held(bg->lock);
  4753		ASSERT(size_class != BTRFS_BG_SZ_NONE);
  4754	
  4755		/* The new allocation is in the right size class, do nothing */
  4756		if (bg->size_class == size_class)
  4757			return 0;
  4758		/*
  4759		 * The new allocation is in a mismatched size class.
  4760		 * This means one of two things:
  4761		 *
  4762		 * 1. Two tasks in find_free_extent for different size_classes raced
  4763		 *    and hit the same empty block_group. Make the loser try again.
  4764		 * 2. A call to find_free_extent got desperate enough to set
  4765		 *    'force_wrong_slab'. Don't change the size_class, but allow the
  4766		 *    allocation.
  4767		 */
  4768		if (bg->size_class != BTRFS_BG_SZ_NONE) {
  4769			if (force_wrong_size_class)
  4770				return 0;
  4771			return -EAGAIN;
  4772		}
  4773		/*
  4774		 * The happy new block group case: the new allocation is the first
  4775		 * one in the block_group so we set size_class.
  4776		 */
  4777		bg->size_class = size_class;
  4778	
  4779		return 0;
  4780	}
  4781	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
