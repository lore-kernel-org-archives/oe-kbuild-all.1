Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF419343B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726063862; cv=none; b=NvSwo2Ykw58uyIv6+coex2pX6Fgb4pv5AGk/Jl05brmqiGWZhR2aYN3To19SqR5XC98Eo1WnPeFsEMXzxjJjvac92k+ePQNllu7/2WW07GLH8ofCB26JD57XVz4/f8nv4F/HEyz9TKKdWPS8nBga5VBOoRBrZgo35VoXp+f9S40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726063862; c=relaxed/simple;
	bh=p5gmolZjzQBvwEBiiga93t2Pw/gLHekFerxyfDcc4/8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7Fl2rPwS8IurOm6pqjlWAzFZXe7xNkKO4ithndr4vUFFbQMZcme7+waKMWRQScXIekxKslPjHi8dMlvaPnaiPNN4TPWORHs3uR2W55ZPG/Yl0aW7w5JFDhQGnV5ZnCP/xJEC3NFeQYhBc+c2tTjhTzMlls24HfsdOS6QgVakD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7AaggTW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7AaggTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726063861; x=1757599861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p5gmolZjzQBvwEBiiga93t2Pw/gLHekFerxyfDcc4/8=;
  b=c7AaggTWVVM1TgzDHCyUq/fAUvRf2p1WjJvjr65Z7T/QWqSvSwSkZiXs
   qgErFLZrNhwFqy6zwYd6O3frmuNbi3EL/kYq2yU0bGbmqwqrNUOqulscd
   NFYrsSHnJsFy3W+Ys+m8j9VFRZJVfNo2fl3AOHDte3TcKK+eAJ4nsBoDv
   XhDmtive7FWc9mgkL0GzsUxToGC7RV2K1dgzXAtOaqvxNvUP9lngU29QD
   HQ4m8kwpDmThLyPQBdVjH3pjdH4gXmeoDkb6ZMI8gHZJGK1mrya8dLtdd
   Qd3IZGuwMblpmhzmKi3DdUgWvfJq2tP8crLoB0UxzusN4jwnz1geF7LGD
   Q==;
X-CSE-ConnectionGUID: gJciTZRzRs2Nwbc0jyo4iQ==
X-CSE-MsgGUID: v7ftTIQBQ/C+wzszQoz3cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36253974"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36253974"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 07:10:58 -0700
X-CSE-ConnectionGUID: WaGUhO/UTQGO08nmGiok4A==
X-CSE-MsgGUID: uZsAnaBxQbumAFfdKO9HHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67001192"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 07:10:57 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soO3a-0003gg-3D;
	Wed, 11 Sep 2024 14:10:54 +0000
Date: Wed, 11 Sep 2024 22:10:29 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10182/10862] fs/bcachefs/btree_cache.c:452:13-14:
 Unneeded semicolon
Message-ID: <202409112245.V7Yx5g8S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: 4a4dd0714322bb7338902cd7efad725307ea0dee [10182/10862] bcachefs: Don't count "skipped access bit" as touched in btree cache scan
config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240911/202409112245.V7Yx5g8S-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409112245.V7Yx5g8S-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree_cache.c:452:13-14: Unneeded semicolon

vim +452 fs/bcachefs/btree_cache.c

   391	
   392	static unsigned long bch2_btree_cache_scan(struct shrinker *shrink,
   393						   struct shrink_control *sc)
   394	{
   395		struct bch_fs *c = shrink->private_data;
   396		struct btree_cache *bc = &c->btree_cache;
   397		struct btree *b, *t;
   398		unsigned long nr = sc->nr_to_scan;
   399		unsigned long can_free = 0;
   400		unsigned long freed = 0;
   401		unsigned long touched = 0;
   402		unsigned i, flags;
   403		unsigned long ret = SHRINK_STOP;
   404		bool trigger_writes = atomic_read(&bc->dirty) + nr >=
   405			bc->used * 3 / 4;
   406	
   407		if (bch2_btree_shrinker_disabled)
   408			return SHRINK_STOP;
   409	
   410		mutex_lock(&bc->lock);
   411		flags = memalloc_nofs_save();
   412	
   413		/*
   414		 * It's _really_ critical that we don't free too many btree nodes - we
   415		 * have to always leave ourselves a reserve. The reserve is how we
   416		 * guarantee that allocating memory for a new btree node can always
   417		 * succeed, so that inserting keys into the btree can always succeed and
   418		 * IO can always make forward progress:
   419		 */
   420		can_free = btree_cache_can_free(bc);
   421		nr = min_t(unsigned long, nr, can_free);
   422	
   423		i = 0;
   424		list_for_each_entry_safe(b, t, &bc->freeable, list) {
   425			/*
   426			 * Leave a few nodes on the freeable list, so that a btree split
   427			 * won't have to hit the system allocator:
   428			 */
   429			if (++i <= 3)
   430				continue;
   431	
   432			touched++;
   433	
   434			if (touched >= nr)
   435				goto out;
   436	
   437			if (!btree_node_reclaim(c, b, true)) {
   438				btree_node_data_free(c, b);
   439				six_unlock_write(&b->c.lock);
   440				six_unlock_intent(&b->c.lock);
   441				freed++;
   442				bc->freed++;
   443			}
   444		}
   445	restart:
   446		list_for_each_entry_safe(b, t, &bc->live, list) {
   447			touched++;
   448	
   449			if (btree_node_accessed(b)) {
   450				clear_btree_node_accessed(b);
   451				bc->not_freed[BCH_BTREE_CACHE_NOT_FREED_access_bit]++;
 > 452				--touched;;
   453			} else if (!btree_node_reclaim(c, b, true)) {
   454				freed++;
   455				btree_node_data_free(c, b);
   456				bc->freed++;
   457	
   458				bch2_btree_node_hash_remove(bc, b);
   459				six_unlock_write(&b->c.lock);
   460				six_unlock_intent(&b->c.lock);
   461	
   462				if (freed == nr)
   463					goto out_rotate;
   464			} else if (trigger_writes &&
   465				   btree_node_dirty(b) &&
   466				   !btree_node_will_make_reachable(b) &&
   467				   !btree_node_write_blocked(b) &&
   468				   six_trylock_read(&b->c.lock)) {
   469				list_move(&bc->live, &b->list);
   470				mutex_unlock(&bc->lock);
   471				__bch2_btree_node_write(c, b, BTREE_WRITE_cache_reclaim);
   472				six_unlock_read(&b->c.lock);
   473				if (touched >= nr)
   474					goto out_nounlock;
   475				mutex_lock(&bc->lock);
   476				goto restart;
   477			}
   478	
   479			if (touched >= nr)
   480				break;
   481		}
   482	out_rotate:
   483		if (&t->list != &bc->live)
   484			list_move_tail(&bc->live, &t->list);
   485	out:
   486		mutex_unlock(&bc->lock);
   487	out_nounlock:
   488		ret = freed;
   489		memalloc_nofs_restore(flags);
   490		trace_and_count(c, btree_cache_scan, sc->nr_to_scan, can_free, ret);
   491		return ret;
   492	}
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
