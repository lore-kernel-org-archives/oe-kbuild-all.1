Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE991E571A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 21:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544008; cv=none; b=qpW2xpbrBEZF8vmsxfwgJk/ejTLppJjnxpgWRHzFPyAnDuDQh6/GpLMzLPRQsGGmcN8RrG9g1rXr3Hv8ftl7Y0YMarIxqJgum0JTS2OavISRpPhCdqp+TAUwO0Y7uw4kGfXagBi+bQLIpNGV8NeG8McWvNp3/wJfW7DUMURp9LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544008; c=relaxed/simple;
	bh=Lm+j0DpNdXaNvW+5egw9W1CXbjSJhjOW4k/Arwxdvoc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F/z/dlXAnSJhCjA4k59CyNGa+4d6mS5SfTrUu9x/sSwffG57lw8Jr/Fi2RQ/5sjrKL/pWqzirmsKE2pSykZcWSnKCNJ1lPymXUF07CbTP/rDq6hChPDIlYxaiB2i0HBtfUe8oZBQYbKuucQnUQph/UDF7qjNwCwSjKIaYyUTwlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2QNV93i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2QNV93i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743544006; x=1775080006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lm+j0DpNdXaNvW+5egw9W1CXbjSJhjOW4k/Arwxdvoc=;
  b=Y2QNV93iypFKk8Ea+6BpLwrx8KtWx8HtKVwPcjxUncryjzaQxpvptsJg
   FYhR03L2a4Y5p15mAB49hqrmDLnFAZtTHychpI3po9VXRww+Qei9Fg4wm
   zXNrb5TDkH/O8k32uJtU0oTVQqMVIOWGklmdQGIqT72m8X8ysiiOyxeet
   TmRLu9rr1sziAMBdnG/4tIUAPU/jUOlYKEkzPZIIII6lT0qSAApkHhhxg
   JQdq/AG/lb2NuEYqBgr+79aG61yW5fIYM7ZEX0fXrZvcuuhtPihjxNZCb
   zn35IIaATDJnMJgeYeNUdIum7cUPVyRnb+JBrYKqyTTMIUyCYSvy70shG
   w==;
X-CSE-ConnectionGUID: M+ZxXk47R/O+tGW5WXRF9w==
X-CSE-MsgGUID: MgKxZ0QmSnGwSxktG2qigw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55522062"
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="55522062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 14:46:44 -0700
X-CSE-ConnectionGUID: y0TAwr4sSLydkddmA24mzA==
X-CSE-MsgGUID: 5wcwbpsbSZSD6WxcYGvL/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,294,1736841600"; 
   d="scan'208";a="126466870"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Apr 2025 14:46:44 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzjRO-000A9i-2K;
	Tue, 01 Apr 2025 21:46:39 +0000
Date: Wed, 2 Apr 2025 05:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 255/258]
 fs/bcachefs/alloc_foreground.c:504: warning: Excess function parameter 'ca'
 description in 'bch2_bucket_alloc_trans'
Message-ID: <202504020520.ggwGY4sT-lkp@intel.com>
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
commit: a1bb0b445efe6b9a4cae443135428ecb1091981b [255/258] bcachefs: alloc_request.ca
config: nios2-randconfig-001-20250402 (https://download.01.org/0day-ci/archive/20250402/202504020520.ggwGY4sT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250402/202504020520.ggwGY4sT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504020520.ggwGY4sT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_foreground.c:504: warning: Excess function parameter 'ca' description in 'bch2_bucket_alloc_trans'
   fs/bcachefs/alloc_foreground.c:504: warning: Excess function parameter 'usage' description in 'bch2_bucket_alloc_trans'


vim +504 fs/bcachefs/alloc_foreground.c

40574946b8a517 Kent Overstreet 2024-05-04  488  
f25d8215f49941 Kent Overstreet 2022-01-09  489  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  490   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc3 Kent Overstreet 2023-09-12  491   * @trans:	transaction object
a0f858ba39869f Kent Overstreet 2025-03-31  492   * @req:	state for the entire allocation
96dea3d599dbc3 Kent Overstreet 2023-09-12  493   * @ca:		device to allocate from
96dea3d599dbc3 Kent Overstreet 2023-09-12  494   * @cl:		if not NULL, closure to be used to wait if buckets not available
2f8d5edf556a74 Yang Li         2024-11-29  495   * @nowait:	if true, do not wait for buckets to become available
96dea3d599dbc3 Kent Overstreet 2023-09-12  496   * @usage:	for secondarily also returning the current device usage
f25d8215f49941 Kent Overstreet 2022-01-09  497   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  498   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627 Kent Overstreet 2022-10-19  499   */
f25d8215f49941 Kent Overstreet 2022-01-09  500  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
1a926cc1580a76 Kent Overstreet 2025-03-21  501  						   struct alloc_request *req,
ed80c5699a23c4 Kent Overstreet 2022-10-21  502  						   struct closure *cl,
114ea0537c6a20 Kent Overstreet 2025-03-31  503  						   bool nowait)
f25d8215f49941 Kent Overstreet 2022-01-09 @504  {
f25d8215f49941 Kent Overstreet 2022-01-09  505  	struct bch_fs *c = trans->c;
a1bb0b445efe6b Kent Overstreet 2025-03-31  506  	struct bch_dev *ca = req->ca;
f25d8215f49941 Kent Overstreet 2022-01-09  507  	struct open_bucket *ob = NULL;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  508  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
822835ffeae411 Kent Overstreet 2022-04-01  509  	u64 avail;
a977f3e162924e Kent Overstreet 2024-09-01  510  	bool waiting = nowait;
7ae47d978c5c3d Kent Overstreet 2025-03-31  511  
7ae47d978c5c3d Kent Overstreet 2025-03-31  512  	req->btree_bitmap = req->data_type == BCH_DATA_btree;
7ae47d978c5c3d Kent Overstreet 2025-03-31  513  	memset(&req->counters, 0, sizeof(req->counters));
f25d8215f49941 Kent Overstreet 2022-01-09  514  again:
114ea0537c6a20 Kent Overstreet 2025-03-31  515  	bch2_dev_usage_read_fast(ca, &req->usage);
114ea0537c6a20 Kent Overstreet 2025-03-31  516  	avail = dev_buckets_free(ca, req->usage, req->watermark);
822835ffeae411 Kent Overstreet 2022-04-01  517  
114ea0537c6a20 Kent Overstreet 2025-03-31  518  	if (req->usage.buckets[BCH_DATA_need_discard] > avail)
64ee1431cc7d11 Kent Overstreet 2024-06-23  519  		bch2_dev_do_discards(ca);
822835ffeae411 Kent Overstreet 2022-04-01  520  
114ea0537c6a20 Kent Overstreet 2025-03-31  521  	if (req->usage.buckets[BCH_DATA_need_gc_gens] > avail)
103304021e54bf Kent Overstreet 2024-04-19  522  		bch2_gc_gens_async(c);
822835ffeae411 Kent Overstreet 2022-04-01  523  
114ea0537c6a20 Kent Overstreet 2025-03-31  524  	if (should_invalidate_buckets(ca, req->usage))
64ee1431cc7d11 Kent Overstreet 2024-06-23  525  		bch2_dev_do_invalidates(ca);
822835ffeae411 Kent Overstreet 2022-04-01  526  
f25d8215f49941 Kent Overstreet 2022-01-09  527  	if (!avail) {
1a926cc1580a76 Kent Overstreet 2025-03-21  528  		if (req->watermark > BCH_WATERMARK_normal &&
828552ca74a458 Kent Overstreet 2024-11-24  529  		    c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_allocations)
828552ca74a458 Kent Overstreet 2024-11-24  530  			goto alloc;
828552ca74a458 Kent Overstreet 2024-11-24  531  
822835ffeae411 Kent Overstreet 2022-04-01  532  		if (cl && !waiting) {
f25d8215f49941 Kent Overstreet 2022-01-09  533  			closure_wait(&c->freelist_wait, cl);
822835ffeae411 Kent Overstreet 2022-04-01  534  			waiting = true;
f25d8215f49941 Kent Overstreet 2022-01-09  535  			goto again;
f25d8215f49941 Kent Overstreet 2022-01-09  536  		}
f25d8215f49941 Kent Overstreet 2022-01-09  537  
f1ca1abfb0275d Kent Overstreet 2024-03-13  538  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
f25d8215f49941 Kent Overstreet 2022-01-09  539  
615f867c14b2d7 Kent Overstreet 2022-07-17  540  		ob = ERR_PTR(-BCH_ERR_freelist_empty);
f25d8215f49941 Kent Overstreet 2022-01-09  541  		goto err;
f25d8215f49941 Kent Overstreet 2022-01-09  542  	}
f25d8215f49941 Kent Overstreet 2022-01-09  543  
822835ffeae411 Kent Overstreet 2022-04-01  544  	if (waiting)
822835ffeae411 Kent Overstreet 2022-04-01  545  		closure_wake_up(&c->freelist_wait);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  546  alloc:
f2b542ba42a8b3 Kent Overstreet 2022-12-11  547  	ob = likely(freespace)
a1bb0b445efe6b Kent Overstreet 2025-03-31  548  		? bch2_bucket_alloc_freelist(trans, req, cl)
a1bb0b445efe6b Kent Overstreet 2025-03-31  549  		: bch2_bucket_alloc_early(trans, req, cl);
ae10fe017bf546 Kent Overstreet 2022-11-04  550  
7ae47d978c5c3d Kent Overstreet 2025-03-31  551  	if (req->counters.need_journal_commit * 2 > avail)
f25d8215f49941 Kent Overstreet 2022-01-09  552  		bch2_journal_flush_async(&c->journal, NULL);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  553  
7ae47d978c5c3d Kent Overstreet 2025-03-31  554  	if (!ob && req->btree_bitmap != BTREE_BITMAP_ANY) {
7ae47d978c5c3d Kent Overstreet 2025-03-31  555  		req->btree_bitmap = BTREE_BITMAP_ANY;
c6705091342c06 Kent Overstreet 2024-04-20  556  		goto alloc;
c6705091342c06 Kent Overstreet 2024-04-20  557  	}
c6705091342c06 Kent Overstreet 2024-04-20  558  
067d228bb0c405 Kent Overstreet 2023-07-07  559  	if (!ob && freespace && c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b3 Kent Overstreet 2022-12-11  560  		freespace = false;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  561  		goto alloc;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  562  	}
f25d8215f49941 Kent Overstreet 2022-01-09  563  err:
f25d8215f49941 Kent Overstreet 2022-01-09  564  	if (!ob)
615f867c14b2d7 Kent Overstreet 2022-07-17  565  		ob = ERR_PTR(-BCH_ERR_no_buckets_found);
f25d8215f49941 Kent Overstreet 2022-01-09  566  
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  567  	if (!IS_ERR(ob))
1a926cc1580a76 Kent Overstreet 2025-03-21  568  		ob->data_type = req->data_type;
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  569  
674cfc26240b78 Kent Overstreet 2022-08-27  570  	if (!IS_ERR(ob))
40574946b8a517 Kent Overstreet 2024-05-04  571  		count_event(c, bucket_alloc);
adf16c6dfa279f Kent Overstreet 2022-10-17  572  	else if (!bch2_err_matches(PTR_ERR(ob), BCH_ERR_transaction_restart))
40574946b8a517 Kent Overstreet 2024-05-04  573  		count_event(c, bucket_alloc_fail);
40574946b8a517 Kent Overstreet 2024-05-04  574  
40574946b8a517 Kent Overstreet 2024-05-04  575  	if (!IS_ERR(ob)
40574946b8a517 Kent Overstreet 2024-05-04  576  	    ? trace_bucket_alloc_enabled()
40574946b8a517 Kent Overstreet 2024-05-04  577  	    : trace_bucket_alloc_fail_enabled())
a1bb0b445efe6b Kent Overstreet 2025-03-31  578  		trace_bucket_alloc2(c, req, cl, ob);
f25d8215f49941 Kent Overstreet 2022-01-09  579  
f25d8215f49941 Kent Overstreet 2022-01-09  580  	return ob;
f25d8215f49941 Kent Overstreet 2022-01-09  581  }
f25d8215f49941 Kent Overstreet 2022-01-09  582  

:::::: The code at line 504 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
