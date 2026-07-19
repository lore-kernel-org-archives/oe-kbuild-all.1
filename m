Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E343F084
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 01:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784426229; cv=none; b=tKX1gv6G/zhM4nOrasw9UgQ2yQ1rrDSLOabcd3fNMFvrqdUIPiVH5tI/+FTjxzhb1bobKElQ7MwKClKlOuaEl4IISzkyIBe/dqnSjjdevSQArPuu4rGGhnAGENDlkIeepkFaQFmRbvIhpPRaxzSP9P9+kTOwqPdjmvt9wk7L2V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784426229; c=relaxed/simple;
	bh=/v1AnX1Jm5kan9y9iOk9j/G+Wxa9YJjJr9P7eVeze1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DzZbErldm3JSQL7hyEUb5JklDTKGBrI0Ks3m430tNoMDEDoUKdHcnXWaG6LISJCc7+VUdsA2kcCkSaz7sEkAYVQefKBJ6tKmj5EFF/tgfPnu6LZYeqHIQEUcAB6z4T6lBK4MNK4F0VwBpEAu96VypXl6XaXz091PUHls8FOGBPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8QJsmS8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8QJsmS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784426226; x=1815962226;
  h=date:from:to:cc:subject:message-id;
  bh=/v1AnX1Jm5kan9y9iOk9j/G+Wxa9YJjJr9P7eVeze1I=;
  b=S8QJsmS8JrbthDZx2l+63IYZdDNyejSufj5/S+6/yAp3MWw/yTn38i/N
   4zlDndhP1P9o62axS1ZmkA4z5WUN5aAQMaXLMpAl9dcXt+NjPSDDbTQwu
   Hewchw6O270sdgJBtB5XlmtXu/0LhEj6B1MGWMukRkacjGYXFDwm7LYAR
   Su/y2SDw9gGxp43bJAz7QdPeB2C5KhZ2qVEQdTuyYuD0sai5r7doiFi0v
   5sbzQj6pFtsVRwJfqMSdRC4yLlY29U4KRxwM1iG1Oyb1fX360bpJ6NbT0
   OaejniLaBFgkC9SUoglzbLX0GYAByKcOVdemseMre6b22OYiV/DJ6QVn8
   w==;
X-CSE-ConnectionGUID: YauNuEOkQBe9iAKZjRN2Zw==
X-CSE-MsgGUID: bK95OIzaT2+oHNxHkTwf5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="95696147"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="95696147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 18:57:06 -0700
X-CSE-ConnectionGUID: j1F8As3dRBC1f9ArTL74Tg==
X-CSE-MsgGUID: VLUm/DjATk+X1qndMauQ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="280402768"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 Jul 2026 18:57:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlGm6-00000000VFO-0WT4;
	Sun, 19 Jul 2026 01:57:02 +0000
Date: Sun, 19 Jul 2026 09:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 fs/bcachefs/btree_key_cache.c:759:9: sparse: sparse: dereference of noderef
 expression
Message-ID: <202607190905.jry1tu6N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: f2bfe7e83765f3bd84382cc75d8ac3ca619de39a [12/12] bcachefs: Rip out freelists from btree key cache
config: x86_64-randconfig-r111-20260716 (https://download.01.org/0day-ci/archive/20260719/202607190905.jry1tu6N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190905.jry1tu6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f2bfe7e83765 ("bcachefs: Rip out freelists from btree key cache")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190905.jry1tu6N-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/bcachefs/btree_key_cache.c: note: in included file:
   fs/bcachefs/bcachefs.h:996:9: sparse: sparse: array of flexible structures
   fs/bcachefs/btree_key_cache.c:688:32: sparse: sparse: context imbalance in 'bch2_fs_btree_key_cache_exit' - different lock contexts for basic block
>> fs/bcachefs/btree_key_cache.c:759:9: sparse: sparse: dereference of noderef expression

vim +759 fs/bcachefs/btree_key_cache.c

   673	
   674	void bch2_fs_btree_key_cache_exit(struct btree_key_cache *bc)
   675	{
   676		struct bch_fs *c = container_of(bc, struct bch_fs, btree_key_cache);
   677		struct bucket_table *tbl;
   678		struct bkey_cached *ck;
   679		struct rhash_head *pos;
   680		LIST_HEAD(items);
   681		unsigned i;
   682	
   683		shrinker_free(bc->shrink);
   684	
   685		/*
   686		 * The loop is needed to guard against racing with rehash:
   687		 */
 > 688		while (atomic_long_read(&bc->nr_keys)) {
   689			rcu_read_lock();
   690			tbl = rht_dereference_rcu(bc->table.tbl, &bc->table);
   691			if (tbl) {
   692				if (tbl->nest) {
   693					/* wait for in progress rehash */
   694					rcu_read_unlock();
   695					mutex_lock(&bc->table.mutex);
   696					mutex_unlock(&bc->table.mutex);
   697					rcu_read_lock();
   698					continue;
   699				}
   700				for (i = 0; i < tbl->size; i++)
   701					while (pos = rht_ptr_rcu(&tbl->buckets[i]), !rht_is_a_nulls(pos)) {
   702						ck = container_of(pos, struct bkey_cached, hash);
   703						BUG_ON(!bkey_cached_evict(bc, ck));
   704						kfree(ck->k);
   705						kmem_cache_free(bch2_key_cache, ck);
   706					}
   707			}
   708			rcu_read_unlock();
   709		}
   710	
   711		if (atomic_long_read(&bc->nr_dirty) &&
   712		    !bch2_journal_error(&c->journal) &&
   713		    test_bit(BCH_FS_was_rw, &c->flags))
   714			panic("btree key cache shutdown error: nr_dirty nonzero (%li)\n",
   715			      atomic_long_read(&bc->nr_dirty));
   716	
   717		if (atomic_long_read(&bc->nr_keys))
   718			panic("btree key cache shutdown error: nr_keys nonzero (%li)\n",
   719			      atomic_long_read(&bc->nr_keys));
   720	
   721		if (bc->table_init_done)
   722			rhashtable_destroy(&bc->table);
   723	}
   724	
   725	void bch2_fs_btree_key_cache_init_early(struct btree_key_cache *c)
   726	{
   727	}
   728	
   729	int bch2_fs_btree_key_cache_init(struct btree_key_cache *bc)
   730	{
   731		struct bch_fs *c = container_of(bc, struct bch_fs, btree_key_cache);
   732		struct shrinker *shrink;
   733	
   734		if (rhashtable_init(&bc->table, &bch2_btree_key_cache_params))
   735			return -BCH_ERR_ENOMEM_fs_btree_cache_init;
   736	
   737		bc->table_init_done = true;
   738	
   739		shrink = shrinker_alloc(0, "%s-btree_key_cache", c->name);
   740		if (!shrink)
   741			return -BCH_ERR_ENOMEM_fs_btree_cache_init;
   742		bc->shrink = shrink;
   743		shrink->count_objects	= bch2_btree_key_cache_count;
   744		shrink->scan_objects	= bch2_btree_key_cache_scan;
   745		shrink->batch		= 1 << 14;
   746		shrink->seeks		= 0;
   747		shrink->private_data	= c;
   748		shrinker_register(shrink);
   749		return 0;
   750	}
   751	
   752	void bch2_btree_key_cache_to_text(struct printbuf *out, struct btree_key_cache *bc)
   753	{
   754		printbuf_tabstop_push(out, 24);
   755		printbuf_tabstop_push(out, 12);
   756	
   757		prt_printf(out, "keys:\t%lu\r\n",		atomic_long_read(&bc->nr_keys));
   758		prt_printf(out, "dirty:\t%lu\r\n",		atomic_long_read(&bc->nr_dirty));
 > 759		prt_printf(out, "table size:\t%u\r\n",		bc->table.tbl->size);
   760	
   761		prt_printf(out, "\nshrinker:\n");
   762		prt_printf(out, "requested_to_free:\t%lu\r\n",	bc->requested_to_free);
   763		prt_printf(out, "freed:\t%lu\r\n",		bc->freed);
   764		prt_printf(out, "skipped_dirty:\t%lu\r\n",	bc->skipped_dirty);
   765		prt_printf(out, "skipped_accessed:\t%lu\r\n",	bc->skipped_accessed);
   766		prt_printf(out, "skipped_lock_fail:\t%lu\r\n",	bc->skipped_lock_fail);
   767	}
   768	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
