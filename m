Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342620B7E1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743536429; cv=none; b=SG587CgCttGKLqDZN9gUIshHqC/AkWq9G7rjuRHdfW2W0+IdOxAoLN8MP5OiiM0O3AIflXOOj3wlr5gpjpxpoAszcaq/xy/fTAJ0IhbLnqYpN46NNDV9jc5O9WMaSzNE7m95xkHJ2Wds6gflTGs2cLvYco3q4h3EqKj+EssqB7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743536429; c=relaxed/simple;
	bh=bQXzFW1GkJoSxJJ4R5XooKdR/q4ZxNDeuQbyNl5GSyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0lqj2OWYQZgXXZ5nGvOPZPjBp+HHhCu2JHLAKNUslHKBfqMxv7HU+E4obDcdeymEUuOcBQIgUnDf+/7YC6t/DrCfrlmaKQSm9eYT8Dkxu9C3E8IUG80BqEoetOo0nHekQueo6sldTfEtpe89rSy7gp1vxzxy+RpQsRiSVeLnAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkvZZoMC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkvZZoMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743536427; x=1775072427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQXzFW1GkJoSxJJ4R5XooKdR/q4ZxNDeuQbyNl5GSyc=;
  b=DkvZZoMCi+kuNQn0dCiQo1xSEL+2iY3dFY8XhOtbLvhd2EhIrSy0cTTB
   7reZZSXhEX9el3qWPQFCeHJpoevkkR2i0lWBWji5INqp5PycjYQV5sGJE
   ogTs1AbS3oAiCwsJOXoQ3ZWyLfv7hkBmc3eo//k1HQWW2IUDHeKajOr1X
   HidzO74vH0p822Ccbh7ayZyqej/twMlw6hEdpPJO/eDcTUMwd5aejmygq
   YuM/AEohT7kSMKPWpH7Fka06yRGgEgaCQuTM+MU86nliXrP80Adm1/p79
   brgsk+iZXRYbGMdKmIIybXTzWyS53P4+rW9BR7nYceeJgn16Pd+nn8B1d
   w==;
X-CSE-ConnectionGUID: PfB8EUDHRBaXYzvTfjQqVQ==
X-CSE-MsgGUID: cpXuR8StQ9Sx3e3Ez+mAKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45051658"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="45051658"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 12:40:27 -0700
X-CSE-ConnectionGUID: sNDSr2OIQwyHX0xpaSS+Yg==
X-CSE-MsgGUID: /1OMp8ZYShq7E+3+Jyyr7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126462612"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 01 Apr 2025 12:40:26 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzhTD-000A5e-1X;
	Tue, 01 Apr 2025 19:40:23 +0000
Date: Wed, 2 Apr 2025 03:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 253/257]
 fs/bcachefs/alloc_foreground.c:509: warning: Excess function parameter
 'usage' description in 'bch2_bucket_alloc_trans'
Message-ID: <202504020324.KJDMTUBN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   7c713306773a5eb4693733e9a2aff3a188b46c08
commit: 114ea0537c6a20fc464be95e6fb63e69c935d58f [253/257] bcachefs: alloc_request.usage
config: nios2-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020324.KJDMTUBN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020324.KJDMTUBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020324.KJDMTUBN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_foreground.c:509: warning: Excess function parameter 'usage' description in 'bch2_bucket_alloc_trans'


vim +509 fs/bcachefs/alloc_foreground.c

40574946b8a517 Kent Overstreet 2024-05-04  492  
f25d8215f49941 Kent Overstreet 2022-01-09  493  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  494   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc3 Kent Overstreet 2023-09-12  495   * @trans:	transaction object
a0f858ba39869f Kent Overstreet 2025-03-31  496   * @req:	state for the entire allocation
96dea3d599dbc3 Kent Overstreet 2023-09-12  497   * @ca:		device to allocate from
96dea3d599dbc3 Kent Overstreet 2023-09-12  498   * @cl:		if not NULL, closure to be used to wait if buckets not available
2f8d5edf556a74 Yang Li         2024-11-29  499   * @nowait:	if true, do not wait for buckets to become available
96dea3d599dbc3 Kent Overstreet 2023-09-12  500   * @usage:	for secondarily also returning the current device usage
f25d8215f49941 Kent Overstreet 2022-01-09  501   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  502   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627 Kent Overstreet 2022-10-19  503   */
f25d8215f49941 Kent Overstreet 2022-01-09  504  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
1a926cc1580a76 Kent Overstreet 2025-03-21  505  						   struct alloc_request *req,
f25d8215f49941 Kent Overstreet 2022-01-09  506  						   struct bch_dev *ca,
ed80c5699a23c4 Kent Overstreet 2022-10-21  507  						   struct closure *cl,
114ea0537c6a20 Kent Overstreet 2025-03-31  508  						   bool nowait)
f25d8215f49941 Kent Overstreet 2022-01-09 @509  {
f25d8215f49941 Kent Overstreet 2022-01-09  510  	struct bch_fs *c = trans->c;
f25d8215f49941 Kent Overstreet 2022-01-09  511  	struct open_bucket *ob = NULL;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  512  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
822835ffeae411 Kent Overstreet 2022-04-01  513  	u64 avail;
c6705091342c06 Kent Overstreet 2024-04-20  514  	struct bucket_alloc_state s = {
1a926cc1580a76 Kent Overstreet 2025-03-21  515  		.btree_bitmap = req->data_type == BCH_DATA_btree,
c6705091342c06 Kent Overstreet 2024-04-20  516  	};
a977f3e162924e Kent Overstreet 2024-09-01  517  	bool waiting = nowait;
f25d8215f49941 Kent Overstreet 2022-01-09  518  again:
114ea0537c6a20 Kent Overstreet 2025-03-31  519  	bch2_dev_usage_read_fast(ca, &req->usage);
114ea0537c6a20 Kent Overstreet 2025-03-31  520  	avail = dev_buckets_free(ca, req->usage, req->watermark);
822835ffeae411 Kent Overstreet 2022-04-01  521  
114ea0537c6a20 Kent Overstreet 2025-03-31  522  	if (req->usage.buckets[BCH_DATA_need_discard] > avail)
64ee1431cc7d11 Kent Overstreet 2024-06-23  523  		bch2_dev_do_discards(ca);
822835ffeae411 Kent Overstreet 2022-04-01  524  
114ea0537c6a20 Kent Overstreet 2025-03-31  525  	if (req->usage.buckets[BCH_DATA_need_gc_gens] > avail)
103304021e54bf Kent Overstreet 2024-04-19  526  		bch2_gc_gens_async(c);
822835ffeae411 Kent Overstreet 2022-04-01  527  
114ea0537c6a20 Kent Overstreet 2025-03-31  528  	if (should_invalidate_buckets(ca, req->usage))
64ee1431cc7d11 Kent Overstreet 2024-06-23  529  		bch2_dev_do_invalidates(ca);
822835ffeae411 Kent Overstreet 2022-04-01  530  
f25d8215f49941 Kent Overstreet 2022-01-09  531  	if (!avail) {
1a926cc1580a76 Kent Overstreet 2025-03-21  532  		if (req->watermark > BCH_WATERMARK_normal &&
828552ca74a458 Kent Overstreet 2024-11-24  533  		    c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_allocations)
828552ca74a458 Kent Overstreet 2024-11-24  534  			goto alloc;
828552ca74a458 Kent Overstreet 2024-11-24  535  
822835ffeae411 Kent Overstreet 2022-04-01  536  		if (cl && !waiting) {
f25d8215f49941 Kent Overstreet 2022-01-09  537  			closure_wait(&c->freelist_wait, cl);
822835ffeae411 Kent Overstreet 2022-04-01  538  			waiting = true;
f25d8215f49941 Kent Overstreet 2022-01-09  539  			goto again;
f25d8215f49941 Kent Overstreet 2022-01-09  540  		}
f25d8215f49941 Kent Overstreet 2022-01-09  541  
f1ca1abfb0275d Kent Overstreet 2024-03-13  542  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
f25d8215f49941 Kent Overstreet 2022-01-09  543  
615f867c14b2d7 Kent Overstreet 2022-07-17  544  		ob = ERR_PTR(-BCH_ERR_freelist_empty);
f25d8215f49941 Kent Overstreet 2022-01-09  545  		goto err;
f25d8215f49941 Kent Overstreet 2022-01-09  546  	}
f25d8215f49941 Kent Overstreet 2022-01-09  547  
822835ffeae411 Kent Overstreet 2022-04-01  548  	if (waiting)
822835ffeae411 Kent Overstreet 2022-04-01  549  		closure_wake_up(&c->freelist_wait);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  550  alloc:
f2b542ba42a8b3 Kent Overstreet 2022-12-11  551  	ob = likely(freespace)
1a926cc1580a76 Kent Overstreet 2025-03-21  552  		? bch2_bucket_alloc_freelist(trans, ca, req->watermark, &s, cl)
1a926cc1580a76 Kent Overstreet 2025-03-21  553  		: bch2_bucket_alloc_early(trans, ca, req->watermark, &s, cl);
ae10fe017bf546 Kent Overstreet 2022-11-04  554  
9e9033522ad1e4 Kent Overstreet 2025-01-27  555  	if (s.need_journal_commit * 2 > avail)
f25d8215f49941 Kent Overstreet 2022-01-09  556  		bch2_journal_flush_async(&c->journal, NULL);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  557  
c6705091342c06 Kent Overstreet 2024-04-20  558  	if (!ob && s.btree_bitmap != BTREE_BITMAP_ANY) {
c6705091342c06 Kent Overstreet 2024-04-20  559  		s.btree_bitmap = BTREE_BITMAP_ANY;
c6705091342c06 Kent Overstreet 2024-04-20  560  		goto alloc;
c6705091342c06 Kent Overstreet 2024-04-20  561  	}
c6705091342c06 Kent Overstreet 2024-04-20  562  
067d228bb0c405 Kent Overstreet 2023-07-07  563  	if (!ob && freespace && c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b3 Kent Overstreet 2022-12-11  564  		freespace = false;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  565  		goto alloc;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  566  	}
f25d8215f49941 Kent Overstreet 2022-01-09  567  err:
f25d8215f49941 Kent Overstreet 2022-01-09  568  	if (!ob)
615f867c14b2d7 Kent Overstreet 2022-07-17  569  		ob = ERR_PTR(-BCH_ERR_no_buckets_found);
f25d8215f49941 Kent Overstreet 2022-01-09  570  
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  571  	if (!IS_ERR(ob))
1a926cc1580a76 Kent Overstreet 2025-03-21  572  		ob->data_type = req->data_type;
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  573  
674cfc26240b78 Kent Overstreet 2022-08-27  574  	if (!IS_ERR(ob))
40574946b8a517 Kent Overstreet 2024-05-04  575  		count_event(c, bucket_alloc);
adf16c6dfa279f Kent Overstreet 2022-10-17  576  	else if (!bch2_err_matches(PTR_ERR(ob), BCH_ERR_transaction_restart))
40574946b8a517 Kent Overstreet 2024-05-04  577  		count_event(c, bucket_alloc_fail);
40574946b8a517 Kent Overstreet 2024-05-04  578  
40574946b8a517 Kent Overstreet 2024-05-04  579  	if (!IS_ERR(ob)
40574946b8a517 Kent Overstreet 2024-05-04  580  	    ? trace_bucket_alloc_enabled()
40574946b8a517 Kent Overstreet 2024-05-04  581  	    : trace_bucket_alloc_fail_enabled())
114ea0537c6a20 Kent Overstreet 2025-03-31  582  		trace_bucket_alloc2(c, ca, req, cl, &s, ob);
f25d8215f49941 Kent Overstreet 2022-01-09  583  
f25d8215f49941 Kent Overstreet 2022-01-09  584  	return ob;
f25d8215f49941 Kent Overstreet 2022-01-09  585  }
f25d8215f49941 Kent Overstreet 2022-01-09  586  

:::::: The code at line 509 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
