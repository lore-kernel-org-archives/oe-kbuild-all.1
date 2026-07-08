Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4395F3B19D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 19:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540286; cv=none; b=C7jTXozgST0u/dIrOtjiFznRkyTds2mAOkq14q1OCn/v0UbTNPFVG20WuUDm9gkKv5ehrvBNRQSnRIX62UfA3WIJfGLYrDyI/NXGgh0+ImVndKf0OZawVSEL23flsj0/gsdXWLNTwOQ8D3Wo4v1ipbMw1qoxL+xRPsNl3sJY4UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540286; c=relaxed/simple;
	bh=sMDud6mOgndDacvHHIb8n9fQfoDGvOl9uPiLKpuO8CA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BG6geXpcsLsjjU27Wkre/xF2XfvFmH4DMf69UdnynxZlHXQ+OENKTYzGhh+rb4oFze0PmlA/JTNDJoXopJ6RxoFYO84v4REzAZiNgWTYq7kDt8+Pd5MeMIFS5/nZhhWdl3bVb9zpeoYApOUHmTeNH8d99NQigXzHwq0lPn7k/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cYdnFUif; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cYdnFUif"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783540284; x=1815076284;
  h=date:from:to:cc:subject:message-id;
  bh=sMDud6mOgndDacvHHIb8n9fQfoDGvOl9uPiLKpuO8CA=;
  b=cYdnFUif+Lc6NMgUg+uW+lS78UQwAVRL+zSFcsUIL7YiAkSOhqtVjGXH
   SVxrzMs831f7g6mOFuFWhe+ymVqWSSmJCfeyicgv4sgSozB+SSTSliQO0
   uL4KoR7fVePVRvVdS0rHUFw822LoqXQOMHPS5ax2KjPk6SKJhA236QV7b
   Yg7o3t2auKYmr55zxZvWhMbrLuDH1O1d/77VWq7GfNA1MH0Ax49v8nmfd
   BXBqHyZxhmvmD4FBdOWzk87n19U7swk0akhC6tHN34hHuzH+BQP6tRWvd
   Ez8t4bI9R7GuOMWdD7uYjJ1gLtoABIq3O0aKh1A3YLLLzxFnf6vr5fmco
   A==;
X-CSE-ConnectionGUID: 88PO/kTZRmKweCvzYV/Qng==
X-CSE-MsgGUID: Oub3sTMaRcmioSHmLFMcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94823205"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94823205"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 12:51:22 -0700
X-CSE-ConnectionGUID: HSfde3l8RLKU9t6EgFisMA==
X-CSE-MsgGUID: pnwu6O3cSlCM+WVhF1IRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277603928"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jul 2026 12:51:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whYIf-00000000Gnn-2g6n;
	Wed, 08 Jul 2026 19:51:17 +0000
Date: Thu, 09 Jul 2026 03:50:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-09 0/3]
 fs/bcachefs/alloc_foreground.c:605: warning: Function parameter or struct
 member 'nowait' not described in 'bch2_bucket_alloc_trans'
Message-ID: <202607090334.gVrgdPgA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-09
head:   663e9bb6cae3f0a070521ec7710b7c48a4bf339b
commit: a977f3e162924ef82536ad23448364f2b3e9f026 [0/3] bcachefs: BCH_WRITE_ALLOC_NOWAIT no longer applies to open bucket allocation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260709/202607090334.gVrgdPgA-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090334.gVrgdPgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a977f3e16292 ("bcachefs: BCH_WRITE_ALLOC_NOWAIT no longer applies to open bucket allocation")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090334.gVrgdPgA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_foreground.c:605: warning: Function parameter or struct member 'nowait' not described in 'bch2_bucket_alloc_trans'


vim +605 fs/bcachefs/alloc_foreground.c

40574946b8a5179 Kent Overstreet 2024-05-04  586  
f25d8215f499418 Kent Overstreet 2022-01-09  587  /**
96dea3d599dbc31 Kent Overstreet 2023-09-12  588   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc31 Kent Overstreet 2023-09-12  589   * @trans:	transaction object
96dea3d599dbc31 Kent Overstreet 2023-09-12  590   * @ca:		device to allocate from
96dea3d599dbc31 Kent Overstreet 2023-09-12  591   * @watermark:	how important is this allocation?
e7f63c67fcb4a47 Kent Overstreet 2024-04-20  592   * @data_type:	BCH_DATA_journal, btree, user...
96dea3d599dbc31 Kent Overstreet 2023-09-12  593   * @cl:		if not NULL, closure to be used to wait if buckets not available
96dea3d599dbc31 Kent Overstreet 2023-09-12  594   * @usage:	for secondarily also returning the current device usage
f25d8215f499418 Kent Overstreet 2022-01-09  595   *
96dea3d599dbc31 Kent Overstreet 2023-09-12  596   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627e Kent Overstreet 2022-10-19  597   */
f25d8215f499418 Kent Overstreet 2022-01-09  598  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
f25d8215f499418 Kent Overstreet 2022-01-09  599  				      struct bch_dev *ca,
e53a961c6b1ced2 Kent Overstreet 2023-06-24  600  				      enum bch_watermark watermark,
e7f63c67fcb4a47 Kent Overstreet 2024-04-20  601  				      enum bch_data_type data_type,
ed80c5699a23c40 Kent Overstreet 2022-10-21  602  				      struct closure *cl,
a977f3e162924ef Kent Overstreet 2024-09-01  603  				      bool nowait,
ed80c5699a23c40 Kent Overstreet 2022-10-21  604  				      struct bch_dev_usage *usage)
f25d8215f499418 Kent Overstreet 2022-01-09 @605  {
f25d8215f499418 Kent Overstreet 2022-01-09  606  	struct bch_fs *c = trans->c;
f25d8215f499418 Kent Overstreet 2022-01-09  607  	struct open_bucket *ob = NULL;
f2b542ba42a8b35 Kent Overstreet 2022-12-11  608  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
822835ffeae411b Kent Overstreet 2022-04-01  609  	u64 avail;
c6705091342c06c Kent Overstreet 2024-04-20  610  	struct bucket_alloc_state s = {
c6705091342c06c Kent Overstreet 2024-04-20  611  		.btree_bitmap = data_type == BCH_DATA_btree,
c6705091342c06c Kent Overstreet 2024-04-20  612  	};
a977f3e162924ef Kent Overstreet 2024-09-01  613  	bool waiting = nowait;
f25d8215f499418 Kent Overstreet 2022-01-09  614  again:
ed80c5699a23c40 Kent Overstreet 2022-10-21  615  	bch2_dev_usage_read_fast(ca, usage);
e53a961c6b1ced2 Kent Overstreet 2023-06-24  616  	avail = dev_buckets_free(ca, *usage, watermark);
822835ffeae411b Kent Overstreet 2022-04-01  617  
ed80c5699a23c40 Kent Overstreet 2022-10-21  618  	if (usage->d[BCH_DATA_need_discard].buckets > avail)
64ee1431cc7d11e Kent Overstreet 2024-06-23  619  		bch2_dev_do_discards(ca);
822835ffeae411b Kent Overstreet 2022-04-01  620  
ed80c5699a23c40 Kent Overstreet 2022-10-21  621  	if (usage->d[BCH_DATA_need_gc_gens].buckets > avail)
103304021e54bfb Kent Overstreet 2024-04-19  622  		bch2_gc_gens_async(c);
822835ffeae411b Kent Overstreet 2022-04-01  623  
ed80c5699a23c40 Kent Overstreet 2022-10-21  624  	if (should_invalidate_buckets(ca, *usage))
64ee1431cc7d11e Kent Overstreet 2024-06-23  625  		bch2_dev_do_invalidates(ca);
822835ffeae411b Kent Overstreet 2022-04-01  626  
f25d8215f499418 Kent Overstreet 2022-01-09  627  	if (!avail) {
822835ffeae411b Kent Overstreet 2022-04-01  628  		if (cl && !waiting) {
f25d8215f499418 Kent Overstreet 2022-01-09  629  			closure_wait(&c->freelist_wait, cl);
822835ffeae411b Kent Overstreet 2022-04-01  630  			waiting = true;
f25d8215f499418 Kent Overstreet 2022-01-09  631  			goto again;
f25d8215f499418 Kent Overstreet 2022-01-09  632  		}
f25d8215f499418 Kent Overstreet 2022-01-09  633  
f1ca1abfb0275db Kent Overstreet 2024-03-13  634  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
f25d8215f499418 Kent Overstreet 2022-01-09  635  
615f867c14b2d70 Kent Overstreet 2022-07-17  636  		ob = ERR_PTR(-BCH_ERR_freelist_empty);
f25d8215f499418 Kent Overstreet 2022-01-09  637  		goto err;
f25d8215f499418 Kent Overstreet 2022-01-09  638  	}
f25d8215f499418 Kent Overstreet 2022-01-09  639  
822835ffeae411b Kent Overstreet 2022-04-01  640  	if (waiting)
822835ffeae411b Kent Overstreet 2022-04-01  641  		closure_wake_up(&c->freelist_wait);
f2b542ba42a8b35 Kent Overstreet 2022-12-11  642  alloc:
f2b542ba42a8b35 Kent Overstreet 2022-12-11  643  	ob = likely(freespace)
e53a961c6b1ced2 Kent Overstreet 2023-06-24  644  		? bch2_bucket_alloc_freelist(trans, ca, watermark, &s, cl)
e53a961c6b1ced2 Kent Overstreet 2023-06-24  645  		: bch2_bucket_alloc_early(trans, ca, watermark, &s, cl);
ae10fe017bf5465 Kent Overstreet 2022-11-04  646  
ae10fe017bf5465 Kent Overstreet 2022-11-04  647  	if (s.skipped_need_journal_commit * 2 > avail)
f25d8215f499418 Kent Overstreet 2022-01-09  648  		bch2_journal_flush_async(&c->journal, NULL);
f2b542ba42a8b35 Kent Overstreet 2022-12-11  649  
c6705091342c06c Kent Overstreet 2024-04-20  650  	if (!ob && s.btree_bitmap != BTREE_BITMAP_ANY) {
c6705091342c06c Kent Overstreet 2024-04-20  651  		s.btree_bitmap = BTREE_BITMAP_ANY;
c6705091342c06c Kent Overstreet 2024-04-20  652  		goto alloc;
c6705091342c06c Kent Overstreet 2024-04-20  653  	}
c6705091342c06c Kent Overstreet 2024-04-20  654  
067d228bb0c4054 Kent Overstreet 2023-07-07  655  	if (!ob && freespace && c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b35 Kent Overstreet 2022-12-11  656  		freespace = false;
f2b542ba42a8b35 Kent Overstreet 2022-12-11  657  		goto alloc;
f2b542ba42a8b35 Kent Overstreet 2022-12-11  658  	}
f25d8215f499418 Kent Overstreet 2022-01-09  659  err:
f25d8215f499418 Kent Overstreet 2022-01-09  660  	if (!ob)
615f867c14b2d70 Kent Overstreet 2022-07-17  661  		ob = ERR_PTR(-BCH_ERR_no_buckets_found);
f25d8215f499418 Kent Overstreet 2022-01-09  662  
e7f63c67fcb4a47 Kent Overstreet 2024-04-20  663  	if (!IS_ERR(ob))
e7f63c67fcb4a47 Kent Overstreet 2024-04-20  664  		ob->data_type = data_type;
e7f63c67fcb4a47 Kent Overstreet 2024-04-20  665  
674cfc26240b780 Kent Overstreet 2022-08-27  666  	if (!IS_ERR(ob))
40574946b8a5179 Kent Overstreet 2024-05-04  667  		count_event(c, bucket_alloc);
adf16c6dfa279fe Kent Overstreet 2022-10-17  668  	else if (!bch2_err_matches(PTR_ERR(ob), BCH_ERR_transaction_restart))
40574946b8a5179 Kent Overstreet 2024-05-04  669  		count_event(c, bucket_alloc_fail);
40574946b8a5179 Kent Overstreet 2024-05-04  670  
40574946b8a5179 Kent Overstreet 2024-05-04  671  	if (!IS_ERR(ob)
40574946b8a5179 Kent Overstreet 2024-05-04  672  	    ? trace_bucket_alloc_enabled()
40574946b8a5179 Kent Overstreet 2024-05-04  673  	    : trace_bucket_alloc_fail_enabled())
40574946b8a5179 Kent Overstreet 2024-05-04  674  		trace_bucket_alloc2(c, ca, watermark, data_type, cl, usage, &s, ob);
f25d8215f499418 Kent Overstreet 2022-01-09  675  
f25d8215f499418 Kent Overstreet 2022-01-09  676  	return ob;
f25d8215f499418 Kent Overstreet 2022-01-09  677  }
f25d8215f499418 Kent Overstreet 2022-01-09  678  

:::::: The code at line 605 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
