Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861CD1ADC83
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 00:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761697239; cv=none; b=I7WIBhy/YUtbUejHE1XMgM86BZpJSXB+4tGQlbeseTsR07upasV+1FHSM3LvZuf5BYyRGvMiYXEqq4p5etqAaCTb9Ifr7f3Qw7dMRkgwXikXRoo/4X9Z5yb/E9B3OOuQWqUvP8CSXvSEbK659qyz2OBmSs6dE9H9of5pyzonHSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761697239; c=relaxed/simple;
	bh=p5tjNFnsHr8xqX8fqUa0tXTwWj1tlXr8McOLJx8pdPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtNS10bvy/6LqRlIZUufvTetXfjlXZOJ625LyIuMng6LFxJgIFT1/Zm1fD+uQ/zYhZ012oZrdmvS33VhjhHKw87ZCTLAK1IWNMhv7Bw/EAR+7U41/cLdxJPLBs9Yshg4IE/GtWGqRTFC00GBuCG1CU0tVF4sZyg3Qv2ONmhKcNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khKnT2Sk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khKnT2Sk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761697237; x=1793233237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5tjNFnsHr8xqX8fqUa0tXTwWj1tlXr8McOLJx8pdPc=;
  b=khKnT2SkZtHfmM6Sy4eLWsA/MhyKvJ0Qo0FmUZ58AJgYGhIKQ2V951AE
   waIV3+88r/ZPzeFx7jp0k0WB/pIuvgSTd+/V5UkHbjQJdQ3rB8MXw9mX9
   0I6DdWcxplyjIqb0JnWOz9ZfpiZrQpn/xcrqfQTiOjwjIkD3sTxDn6yKW
   TZk/6EgT8WVIXIXcdZG4Q8aDCHkvQxVHYaX+kDvolHctbjA7ShQkpE3nt
   +EpHkG97T3uDQ4CweZfPW5TBzuXZDMO1gQQXB5N7lpGcd9FdivkEjDZVy
   1KrsUwCylnlQP797AGJBrz7e0MWumm39Z+mVgNb4Cfsez9u7HiEsmlCTa
   w==;
X-CSE-ConnectionGUID: Rj7hFv1AT9qlBlOaGAZW3Q==
X-CSE-MsgGUID: FBVOWjraQlSVfU1vsFOO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62838729"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="62838729"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 17:20:37 -0700
X-CSE-ConnectionGUID: FHdHTqnbRfiIM+KxtTTysg==
X-CSE-MsgGUID: WMlGW3dFRnqGOSeGVLR/mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="190682379"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 28 Oct 2025 17:20:35 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDtvV-000Jvd-2g;
	Wed, 29 Oct 2025 00:20:33 +0000
Date: Wed, 29 Oct 2025 08:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: Martin KaFai Lau <martin.lau@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Martin KaFai Lau <martin.lau@linux.dev>
Subject: [martin-lau-bpf-next:ls.rqspin.v2.2 3/3]
 kernel/bpf/bpf_local_storage.c:497:29: warning: variable 'owner_storage_ptr'
 set but not used
Message-ID: <202510290843.DB4DN2Fk-lkp@intel.com>
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
config: sparc64-randconfig-r054-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290843.DB4DN2Fk-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290843.DB4DN2Fk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290843.DB4DN2Fk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/bpf_local_storage.c: In function 'bpf_local_storage_alloc':
>> kernel/bpf/bpf_local_storage.c:497:29: warning: variable 'owner_storage_ptr' set but not used [-Wunused-but-set-variable]
     struct bpf_local_storage **owner_storage_ptr;
                                ^~~~~~~~~~~~~~~~~


vim +/owner_storage_ptr +497 kernel/bpf/bpf_local_storage.c

450af8d0f6be2e KP Singh         2020-08-25  490  
450af8d0f6be2e KP Singh         2020-08-25  491  int bpf_local_storage_alloc(void *owner,
450af8d0f6be2e KP Singh         2020-08-25  492  			    struct bpf_local_storage_map *smap,
b00fa38a9c1cba Joanne Koong     2022-03-17  493  			    struct bpf_local_storage_elem *first_selem,
b00fa38a9c1cba Joanne Koong     2022-03-17  494  			    gfp_t gfp_flags)
450af8d0f6be2e KP Singh         2020-08-25  495  {
450af8d0f6be2e KP Singh         2020-08-25  496  	struct bpf_local_storage *prev_storage, *storage;
450af8d0f6be2e KP Singh         2020-08-25 @497  	struct bpf_local_storage **owner_storage_ptr;
16b59442646c80 Amery Hung       2025-10-02  498  	struct bpf_local_storage_map_bucket *b;
16b59442646c80 Amery Hung       2025-10-02  499  	unsigned long flags;
450af8d0f6be2e KP Singh         2020-08-25  500  	int err;
450af8d0f6be2e KP Singh         2020-08-25  501  
450af8d0f6be2e KP Singh         2020-08-25  502  	err = mem_charge(smap, owner, sizeof(*storage));
450af8d0f6be2e KP Singh         2020-08-25  503  	if (err)
450af8d0f6be2e KP Singh         2020-08-25  504  		return err;
450af8d0f6be2e KP Singh         2020-08-25  505  
4855a75ebf485f Hou Tao          2025-01-08  506  	if (smap->bpf_ma)
6ae9d5e99e1dd2 Martin KaFai Lau 2023-03-22  507  		storage = bpf_mem_cache_alloc_flags(&smap->storage_ma, gfp_flags);
4855a75ebf485f Hou Tao          2025-01-08  508  	else
e9aae8beba825e Roman Gushchin   2020-12-01  509  		storage = bpf_map_kzalloc(&smap->map, sizeof(*storage),
b00fa38a9c1cba Joanne Koong     2022-03-17  510  					  gfp_flags | __GFP_NOWARN);
450af8d0f6be2e KP Singh         2020-08-25  511  	if (!storage) {
450af8d0f6be2e KP Singh         2020-08-25  512  		err = -ENOMEM;
450af8d0f6be2e KP Singh         2020-08-25  513  		goto uncharge;
450af8d0f6be2e KP Singh         2020-08-25  514  	}
450af8d0f6be2e KP Singh         2020-08-25  515  
fc6652aab6ad54 Martin KaFai Lau 2023-03-07  516  	RCU_INIT_POINTER(storage->smap, smap);
450af8d0f6be2e KP Singh         2020-08-25  517  	INIT_HLIST_HEAD(&storage->list);
fe3c7ea310ef41 Amery Hung       2025-10-02  518  	raw_res_spin_lock_init(&storage->lock);
450af8d0f6be2e KP Singh         2020-08-25  519  	storage->owner = owner;
b735af227349c9 Martin KaFai Lau 2025-10-22  520  	storage->bpf_ma = smap->bpf_ma;
b735af227349c9 Martin KaFai Lau 2025-10-22  521  	storage->owner_storage_ptr = owner_storage(smap, owner);
450af8d0f6be2e KP Singh         2020-08-25  522  	bpf_selem_link_storage_nolock(storage, first_selem);
16b59442646c80 Amery Hung       2025-10-02  523  
16b59442646c80 Amery Hung       2025-10-02  524  	b = select_bucket(smap, storage);
fe3c7ea310ef41 Amery Hung       2025-10-02  525  	err = raw_res_spin_lock_irqsave(&b->lock, flags);
fe3c7ea310ef41 Amery Hung       2025-10-02  526  	if (err)
fe3c7ea310ef41 Amery Hung       2025-10-02  527  		goto uncharge;
fe3c7ea310ef41 Amery Hung       2025-10-02  528  
16b59442646c80 Amery Hung       2025-10-02  529  	bpf_selem_link_map_nolock(smap, first_selem, b);
450af8d0f6be2e KP Singh         2020-08-25  530  
b735af227349c9 Martin KaFai Lau 2025-10-22  531  	owner_storage_ptr = storage->owner_storage_ptr;
b735af227349c9 Martin KaFai Lau 2025-10-22  532  
450af8d0f6be2e KP Singh         2020-08-25  533  	/* Publish storage to the owner.
450af8d0f6be2e KP Singh         2020-08-25  534  	 * Instead of using any lock of the kernel object (i.e. owner),
450af8d0f6be2e KP Singh         2020-08-25  535  	 * cmpxchg will work with any kernel object regardless what
450af8d0f6be2e KP Singh         2020-08-25  536  	 * the running context is, bh, irq...etc.
450af8d0f6be2e KP Singh         2020-08-25  537  	 *
450af8d0f6be2e KP Singh         2020-08-25  538  	 * From now on, the owner->storage pointer (e.g. sk->sk_bpf_storage)
450af8d0f6be2e KP Singh         2020-08-25  539  	 * is protected by the storage->lock.  Hence, when freeing
450af8d0f6be2e KP Singh         2020-08-25  540  	 * the owner->storage, the storage->lock must be held before
450af8d0f6be2e KP Singh         2020-08-25  541  	 * setting owner->storage ptr to NULL.
450af8d0f6be2e KP Singh         2020-08-25  542  	 */
b735af227349c9 Martin KaFai Lau 2025-10-22  543  	prev_storage = cmpxchg(unrcu_pointer(storage->owner_storage_ptr), NULL, storage);
450af8d0f6be2e KP Singh         2020-08-25  544  	if (unlikely(prev_storage)) {
16b59442646c80 Amery Hung       2025-10-02  545  		bpf_selem_unlink_map_nolock(first_selem);
fe3c7ea310ef41 Amery Hung       2025-10-02  546  		raw_res_spin_unlock_irqrestore(&b->lock, flags);
450af8d0f6be2e KP Singh         2020-08-25  547  		err = -EAGAIN;
450af8d0f6be2e KP Singh         2020-08-25  548  		goto uncharge;
450af8d0f6be2e KP Singh         2020-08-25  549  
450af8d0f6be2e KP Singh         2020-08-25  550  		/* Note that even first_selem was linked to smap's
450af8d0f6be2e KP Singh         2020-08-25  551  		 * bucket->list, first_selem can be freed immediately
450af8d0f6be2e KP Singh         2020-08-25  552  		 * (instead of kfree_rcu) because
450af8d0f6be2e KP Singh         2020-08-25  553  		 * bpf_local_storage_map_free() does a
0fe4b381a59ebc KP Singh         2021-12-24  554  		 * synchronize_rcu_mult (waiting for both sleepable and
0fe4b381a59ebc KP Singh         2021-12-24  555  		 * normal programs) before walking the bucket->list.
450af8d0f6be2e KP Singh         2020-08-25  556  		 * Hence, no one is accessing selem from the
450af8d0f6be2e KP Singh         2020-08-25  557  		 * bucket->list under rcu_read_lock().
450af8d0f6be2e KP Singh         2020-08-25  558  		 */
450af8d0f6be2e KP Singh         2020-08-25  559  	}
fe3c7ea310ef41 Amery Hung       2025-10-02  560  	raw_res_spin_unlock_irqrestore(&b->lock, flags);
450af8d0f6be2e KP Singh         2020-08-25  561  
450af8d0f6be2e KP Singh         2020-08-25  562  	return 0;
450af8d0f6be2e KP Singh         2020-08-25  563  
450af8d0f6be2e KP Singh         2020-08-25  564  uncharge:
b735af227349c9 Martin KaFai Lau 2025-10-22  565  	bpf_local_storage_free(storage, smap, true);
450af8d0f6be2e KP Singh         2020-08-25  566  	mem_uncharge(smap, owner, sizeof(*storage));
450af8d0f6be2e KP Singh         2020-08-25  567  	return err;
450af8d0f6be2e KP Singh         2020-08-25  568  }
450af8d0f6be2e KP Singh         2020-08-25  569  

:::::: The code at line 497 was first introduced by commit
:::::: 450af8d0f6be2e7dd2a528a3fb054bb726bf1747 bpf: Split bpf_local_storage to bpf_sk_storage

:::::: TO: KP Singh <kpsingh@google.com>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
