Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB0732C8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761745928; cv=none; b=scRLMxU5qXAIbQ4fQCqfvKI3pd48L1rrZF8mGThXEVlX1wBS+HUfENnfoOpGPQ2rQeVIYVsS9pT7jHid5c52cNMCgkwY/de+RCXzNcmNYn4XLPhOoVLontWWCMo9K/IiPJI/vDlhuVrcKr4rGPaw1yOOBKULD1St3RdwemJpKW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761745928; c=relaxed/simple;
	bh=q+9LZB/xXyMiYwOJafPj5k/p5lzV5dcKH0HCvl9m6FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M4zXP6xW2dz0cucKMEmqQDjBIFagTOcXL12r2VKD7sDIJJw0IZaN0MJOJJo4FpDHS8BQAMXgwhQzEFtad7/DsXk3PvNUW4M9HfY3PDG1ptOmrJdb727CYskIW+Ax8z/C7fFlRK9yG5rdW6qLexvlUpTsKZANPZ8kDkex6rvsi0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWCo8wW2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWCo8wW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761745927; x=1793281927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q+9LZB/xXyMiYwOJafPj5k/p5lzV5dcKH0HCvl9m6FQ=;
  b=aWCo8wW2E964VMVR6QsT5XGF8YBIg642pEpLHFpZ4RJPkv2b9lFhX3bM
   ltUPp69qNM2GjP4r1R8kM6hgnweJo/xfL9pwEqilfDWbHdVDAvGABd4+T
   etV5q5bcxbxMEa8PH2Z2rvs5acObWGxwpbVatKOvd/9ippJx48B0PRNnh
   9wGeaMETaWEkuLzu5tZ76t8NRJxfR3iYp9lTR3ZZkxR/Q3ywSPtVgbh/d
   6jeANXBXNMHbmOu/sTW4GKL80E2wqSPfGR2fq7sPTNKQ/1eKITvG3T/z6
   S4VFmAazMHadhq5rMlZ5RsWoxROz/qKfdIL2mNILdsY6mKuZkOs3ywJFo
   A==;
X-CSE-ConnectionGUID: oFHaFBiNTSaJ+3kCf6zqsg==
X-CSE-MsgGUID: xf5cr+L5RIOKRkvWtP6OJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63901950"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="63901950"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 06:52:04 -0700
X-CSE-ConnectionGUID: hpBWlDk+TMCJbWDmqBkH/Q==
X-CSE-MsgGUID: UM0XWXCgQaG/UsY7Zcm6qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="185308090"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Oct 2025 06:52:03 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE6am-000Kev-1D;
	Wed, 29 Oct 2025 13:52:00 +0000
Date: Wed, 29 Oct 2025 21:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:ls.rqspin.v2.2 3/3]
 kernel/bpf/bpf_local_storage.c:531:27: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202510292157.tcpDH2R4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/martin.lau/bpf-next.git ls.rqspin.v2.2
head:   b735af227349c9ef167cae8acf8bc8864e13f636
commit: b735af227349c9ef167cae8acf8bc8864e13f636 [3/3] [DONT PUSH]
config: alpha-randconfig-r134-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292157.tcpDH2R4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292157.tcpDH2R4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292157.tcpDH2R4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/bpf/bpf_local_storage.c:531:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct bpf_local_storage **owner_storage_ptr @@     got struct bpf_local_storage [noderef] __rcu **owner_storage_ptr @@
   kernel/bpf/bpf_local_storage.c:531:27: sparse:     expected struct bpf_local_storage **owner_storage_ptr
   kernel/bpf/bpf_local_storage.c:531:27: sparse:     got struct bpf_local_storage [noderef] __rcu **owner_storage_ptr
>> kernel/bpf/bpf_local_storage.c:543:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/bpf_local_storage.c:543:24: sparse:    struct bpf_local_storage [noderef] __rcu *[noderef] __rcu *
   kernel/bpf/bpf_local_storage.c:543:24: sparse:    struct bpf_local_storage [noderef] __rcu **
>> kernel/bpf/bpf_local_storage.c:543:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/bpf/bpf_local_storage.c:543:24: sparse:    struct bpf_local_storage [noderef] __rcu *[noderef] __rcu *
   kernel/bpf/bpf_local_storage.c:543:24: sparse:    struct bpf_local_storage [noderef] __rcu **

vim +531 kernel/bpf/bpf_local_storage.c

   490	
   491	int bpf_local_storage_alloc(void *owner,
   492				    struct bpf_local_storage_map *smap,
   493				    struct bpf_local_storage_elem *first_selem,
   494				    gfp_t gfp_flags)
   495	{
   496		struct bpf_local_storage *prev_storage, *storage;
   497		struct bpf_local_storage **owner_storage_ptr;
   498		struct bpf_local_storage_map_bucket *b;
   499		unsigned long flags;
   500		int err;
   501	
   502		err = mem_charge(smap, owner, sizeof(*storage));
   503		if (err)
   504			return err;
   505	
   506		if (smap->bpf_ma)
   507			storage = bpf_mem_cache_alloc_flags(&smap->storage_ma, gfp_flags);
   508		else
   509			storage = bpf_map_kzalloc(&smap->map, sizeof(*storage),
   510						  gfp_flags | __GFP_NOWARN);
   511		if (!storage) {
   512			err = -ENOMEM;
   513			goto uncharge;
   514		}
   515	
   516		RCU_INIT_POINTER(storage->smap, smap);
   517		INIT_HLIST_HEAD(&storage->list);
   518		raw_res_spin_lock_init(&storage->lock);
   519		storage->owner = owner;
   520		storage->bpf_ma = smap->bpf_ma;
   521		storage->owner_storage_ptr = owner_storage(smap, owner);
   522		bpf_selem_link_storage_nolock(storage, first_selem);
   523	
   524		b = select_bucket(smap, storage);
   525		err = raw_res_spin_lock_irqsave(&b->lock, flags);
   526		if (err)
   527			goto uncharge;
   528	
   529		bpf_selem_link_map_nolock(smap, first_selem, b);
   530	
 > 531		owner_storage_ptr = storage->owner_storage_ptr;
   532	
   533		/* Publish storage to the owner.
   534		 * Instead of using any lock of the kernel object (i.e. owner),
   535		 * cmpxchg will work with any kernel object regardless what
   536		 * the running context is, bh, irq...etc.
   537		 *
   538		 * From now on, the owner->storage pointer (e.g. sk->sk_bpf_storage)
   539		 * is protected by the storage->lock.  Hence, when freeing
   540		 * the owner->storage, the storage->lock must be held before
   541		 * setting owner->storage ptr to NULL.
   542		 */
 > 543		prev_storage = cmpxchg(unrcu_pointer(storage->owner_storage_ptr), NULL, storage);
   544		if (unlikely(prev_storage)) {
   545			bpf_selem_unlink_map_nolock(first_selem);
   546			raw_res_spin_unlock_irqrestore(&b->lock, flags);
   547			err = -EAGAIN;
   548			goto uncharge;
   549	
   550			/* Note that even first_selem was linked to smap's
   551			 * bucket->list, first_selem can be freed immediately
   552			 * (instead of kfree_rcu) because
   553			 * bpf_local_storage_map_free() does a
   554			 * synchronize_rcu_mult (waiting for both sleepable and
   555			 * normal programs) before walking the bucket->list.
   556			 * Hence, no one is accessing selem from the
   557			 * bucket->list under rcu_read_lock().
   558			 */
   559		}
   560		raw_res_spin_unlock_irqrestore(&b->lock, flags);
   561	
   562		return 0;
   563	
   564	uncharge:
   565		bpf_local_storage_free(storage, smap, true);
   566		mem_uncharge(smap, owner, sizeof(*storage));
   567		return err;
   568	}
   569	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
