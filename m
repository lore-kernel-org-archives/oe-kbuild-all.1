Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FB31EA7F1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738849531; cv=none; b=De8rtyVzaC7/gavFxHesmF8J313TIhvaZryWfXcbBO9hUFBFSsAHkl5uHGDNljTFFkG2Xd0Ve93OMjR92gvU5SoJhu3Qrh/02n0EpiDqbLUnqen/h2sXWpOjH4bEaD70rhyU43UmucJl56MtBPVu3E+RdOZSjWVBKFIWdA6FfxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738849531; c=relaxed/simple;
	bh=SRSvG5HwxZt0UO+3dEaQjyiR3UkWZ2T7gx9rUKQKTv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IvG0qLYEEztL4ZcsdJ8l93e5i/KCnijHN7iF1sL8/DLeEJ8yR6RGsnw8CU0Rzbh0HmxC32J8/HY9UDPOj9WZzEhxsII3CTVcDSXyVYuzo7VOph2pcx1PM8ZKNvPSPq+6JOxdG7ZGUK9RGm4mqYa4ehFLuMbpv7SHJ4ABLIJkWqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgOhjPwf; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgOhjPwf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738849528; x=1770385528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SRSvG5HwxZt0UO+3dEaQjyiR3UkWZ2T7gx9rUKQKTv0=;
  b=DgOhjPwfK4qYCY3f/BACpa6Enu+Drxt1ObHfEPeTTOg5TWagBWRwWMNc
   s79iddah8e9u2WVDsEE1zmfLLdlkqxXlfU2A4iaqDHJcmHaqPIjMR/Od2
   rRLhfzBnSHmdKi70r7NAP4FDaQscJ+qbAobZ+wL8YFejRscfQmlCMXZH7
   s3LWcWVCLH8xonfJHPa1taigFdrTvEAvN9Jw7+Ih+gq/hrXd9h2ne6IJc
   KACKQD8qhTVFOWEIWz/nx0REomQ/mUN2rPAwWLzpT4YMFwQuzJ8ntaR5c
   AJDdo+W/6/AbDlRP4aOlC5fAMHLi8euoFEhcV51ZoFh05af6d56YrgUME
   Q==;
X-CSE-ConnectionGUID: eIM8LYIdRP6TF1FDcQo6HA==
X-CSE-MsgGUID: DGXyd/M3RACerUPoyDTFpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64803896"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="64803896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 05:45:28 -0800
X-CSE-ConnectionGUID: f6o1KvPERWmcUIdi0hW5Jg==
X-CSE-MsgGUID: j6bZKlHnRX2bF3BT7lMIGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116247325"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2025 05:45:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg2C4-000wvz-2H;
	Thu, 06 Feb 2025 13:45:24 +0000
Date: Thu, 6 Feb 2025 21:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Gelmini <andrea.gelmini@gelma.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/739 1/1] fs/bcachefs/btree_cache.c:834:31:
 error: 'PF_MEMALLOC_NORECLAIM' undeclared; did you mean 'PF_MEMALLOC_NOIO'?
Message-ID: <202502062140.gyZ0XhQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs pr/739
head:   8fd3bb46913c536490fe0c180ce57dc1c0d630ba
commit: e3b1a703e7d59c52b87285f06275155c49b4c3ac [1/1] Fix typos
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20250206/202502062140.gyZ0XhQe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502062140.gyZ0XhQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502062140.gyZ0XhQe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/bcachefs/btree_locking.h:13,
                    from fs/bcachefs/btree_io.h:7,
                    from fs/bcachefs/btree_cache.c:7:
   fs/bcachefs/btree_cache.c: In function 'bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:834:31: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     834 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_cache.c:834:31: note: each undeclared identifier is reported only once for each function it appears in
     834 |         if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
         |                               ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
--
   In file included from fs/bcachefs/btree_key_cache.c:5:
   fs/bcachefs/btree_key_cache.c: In function 'bkey_cached_alloc':
>> fs/bcachefs/btree_iter.h:900:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:900:44: note: each undeclared identifier is reported only once for each function it appears in
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:900:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:149:14: note: in expansion of macro 'allocate_dropping_locks'
     149 |         ck = allocate_dropping_locks(trans, ret,
         |              ^~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_key_cache.c: In function 'btree_key_cache_create':
>> fs/bcachefs/btree_iter.h:900:44: error: 'PF_MEMALLOC_NORECLAIM' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOIO'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:245:40: note: in expansion of macro 'allocate_dropping_locks'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~
>> fs/bcachefs/btree_iter.h:900:66: error: 'PF_MEMALLOC_NOWARN' undeclared (first use in this function); did you mean 'PF_MEMALLOC_NOFS'?
     900 |         typeof(_do) _p = memalloc_flags_do(PF_MEMALLOC_NORECLAIM|PF_MEMALLOC_NOWARN, _do);\
         |                                                                  ^~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_iter.h:882:53: note: in definition of macro 'memalloc_flags_do'
     882 |         unsigned _saved_flags = memalloc_flags_save(_flags);                    \
         |                                                     ^~~~~~
   fs/bcachefs/btree_key_cache.c:245:40: note: in expansion of macro 'allocate_dropping_locks'
     245 |                 struct bkey_i *new_k = allocate_dropping_locks(trans, ret,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~


vim +834 fs/bcachefs/btree_cache.c

   774	
   775	struct btree *bch2_btree_node_mem_alloc(struct btree_trans *trans, bool pcpu_read_locks)
   776	{
   777		struct bch_fs *c = trans->c;
   778		struct btree_cache *bc = &c->btree_cache;
   779		struct list_head *freed = pcpu_read_locks
   780			? &bc->freed_pcpu
   781			: &bc->freed_nonpcpu;
   782		struct btree *b, *b2;
   783		u64 start_time = local_clock();
   784	
   785		mutex_lock(&bc->lock);
   786	
   787		/*
   788		 * We never free struct btree itself, just the memory that holds the on
   789		 * disk node. Check the freed list before allocating a new one:
   790		 */
   791		list_for_each_entry(b, freed, list)
   792			if (!btree_node_reclaim(c, b, false)) {
   793				list_del_init(&b->list);
   794				goto got_node;
   795			}
   796	
   797		b = __btree_node_mem_alloc(c, GFP_NOWAIT|__GFP_NOWARN);
   798		if (!b) {
   799			mutex_unlock(&bc->lock);
   800			bch2_trans_unlock(trans);
   801			b = __btree_node_mem_alloc(c, GFP_KERNEL);
   802			if (!b)
   803				goto err;
   804			mutex_lock(&bc->lock);
   805		}
   806	
   807		bch2_btree_lock_init(&b->c, pcpu_read_locks ? SIX_LOCK_INIT_PCPU : 0);
   808	
   809		BUG_ON(!six_trylock_intent(&b->c.lock));
   810		BUG_ON(!six_trylock_write(&b->c.lock));
   811	
   812	got_node:
   813		/*
   814		 * btree_free() doesn't free memory; it sticks the node on the end of
   815		 * the list. Check if there's any freed nodes there:
   816		 */
   817		list_for_each_entry(b2, &bc->freeable, list)
   818			if (!btree_node_reclaim(c, b2, false)) {
   819				swap(b->data, b2->data);
   820				swap(b->aux_data, b2->aux_data);
   821	
   822				list_del_init(&b2->list);
   823				--bc->nr_freeable;
   824				btree_node_to_freedlist(bc, b2);
   825				mutex_unlock(&bc->lock);
   826	
   827				six_unlock_write(&b2->c.lock);
   828				six_unlock_intent(&b2->c.lock);
   829				goto got_mem;
   830			}
   831	
   832		mutex_unlock(&bc->lock);
   833	
 > 834		if (memalloc_flags_do(PF_MEMALLOC_NORECLAIM,
   835				      btree_node_data_alloc(c, b, GFP_KERNEL|__GFP_NOWARN))) {
   836			bch2_trans_unlock(trans);
   837			if (btree_node_data_alloc(c, b, GFP_KERNEL|__GFP_NOWARN))
   838				goto err;
   839		}
   840	
   841	got_mem:
   842		BUG_ON(!list_empty(&b->list));
   843		BUG_ON(btree_node_hashed(b));
   844		BUG_ON(btree_node_dirty(b));
   845		BUG_ON(btree_node_write_in_flight(b));
   846	out:
   847		b->flags		= 0;
   848		b->written		= 0;
   849		b->nsets		= 0;
   850		b->sib_u64s[0]		= 0;
   851		b->sib_u64s[1]		= 0;
   852		b->whiteout_u64s	= 0;
   853		bch2_btree_keys_init(b);
   854		set_btree_node_accessed(b);
   855	
   856		bch2_time_stats_update(&c->times[BCH_TIME_btree_node_mem_alloc],
   857				       start_time);
   858	
   859		int ret = bch2_trans_relock(trans);
   860		if (unlikely(ret)) {
   861			bch2_btree_node_to_freelist(c, b);
   862			return ERR_PTR(ret);
   863		}
   864	
   865		return b;
   866	err:
   867		mutex_lock(&bc->lock);
   868	
   869		/* Try to cannibalize another cached btree node: */
   870		if (bc->alloc_lock == current) {
   871			b2 = btree_node_cannibalize(c);
   872			clear_btree_node_just_written(b2);
   873			__bch2_btree_node_hash_remove(bc, b2);
   874	
   875			if (b) {
   876				swap(b->data, b2->data);
   877				swap(b->aux_data, b2->aux_data);
   878				btree_node_to_freedlist(bc, b2);
   879				six_unlock_write(&b2->c.lock);
   880				six_unlock_intent(&b2->c.lock);
   881			} else {
   882				b = b2;
   883			}
   884	
   885			BUG_ON(!list_empty(&b->list));
   886			mutex_unlock(&bc->lock);
   887	
   888			trace_and_count(c, btree_cache_cannibalize, trans);
   889			goto out;
   890		}
   891	
   892		mutex_unlock(&bc->lock);
   893		return ERR_PTR(-BCH_ERR_ENOMEM_btree_node_mem_alloc);
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
