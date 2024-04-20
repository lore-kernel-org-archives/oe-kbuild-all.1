Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5DD1DA4E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Apr 2024 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713656174; cv=none; b=jRoJkh63oJteGNaT0+FsZ94GVOzt2wAYLl/oTS798TNzTS6rbdNNkcqZs04kYqPDVsJ82VgA7TRSNJDsh6+U6gxfTFg2FJWInQVprjPVXQ0a/S41JVTBukVMb2dWu1xoRp7OsTmLHiHYQuTz62Sw84kZp6HFT2Os1obK6fO/KRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713656174; c=relaxed/simple;
	bh=D7SgEtOOZPVlIagdgXGlx3UMUp9wOik6GbxdGfRrxdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kn3n5nJu3TK91OA8A3ZO8TnuYRpRZJ0i0Vzt+3yE9IGVkY6GwvT9cjlgIhMROam1QU/cxGNs2F9340dyIq56sJzdiiCb/jfwu2NhodVwTxY4BNrkCUC/w9fjxTicCinFInDFPFNf70g6D/yNRuKfWvwIH8n/mQ/b6ZxQQU3yO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSYXue+S; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSYXue+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713656171; x=1745192171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D7SgEtOOZPVlIagdgXGlx3UMUp9wOik6GbxdGfRrxdE=;
  b=bSYXue+SNTINKPgvem46ALgh7JAhGlynveJaZSeECbtwT8I2TcHb6ZOC
   ZWrKP/mxmdHxDzGzC7aHw5C+gXZjRgyVp+gcPDBGeXkTfwY44k0FGFAnU
   RAt1QRpyLlcGmFTaLFTVskn6YT0Eh32CWuPNkwcdfcKU7uIPQTLsJb3cX
   IG69CJTCADsWnJnL6cPw1a5QbYcZ7fuoMnYZ2VNEzJFGKIzK3B09f4j6F
   wKRNm1RsXsw25jX69BSNwh8OgtRIlVNXBytE0WpMNE7/Ru7zmFjk/1UNZ
   3K34sWv9YuqCuQsFphnTNSPSuxlGCVP97oE55LBLCoEJxOAv9QQUtCSMP
   g==;
X-CSE-ConnectionGUID: z/Y1Es0TSfe5JGkRdCJGTA==
X-CSE-MsgGUID: 8mFF3KjIT8u90blJOeJxtA==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9387235"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9387235"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 16:36:11 -0700
X-CSE-ConnectionGUID: CFLTaYhNTKWpHoNfooF26Q==
X-CSE-MsgGUID: /TRE+l2PTWiXrmWNPUyUvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="28178896"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 20 Apr 2024 16:36:09 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryKFb-000BZC-1F;
	Sat, 20 Apr 2024 23:36:07 +0000
Date: Sun, 21 Apr 2024 07:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 178/179]
 fs/bcachefs/alloc_foreground.c:530: warning: Function parameter or struct
 member 'data_type' not described in 'bch2_bucket_alloc_trans'
Message-ID: <202404210756.agnX3G74-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   cf79d98ce3b3c319cd79f9a046657ab256d32415
commit: 4935a4c3d6ab87166b7fe24648a958d3719cdef0 [178/179] bcachefs: plumb data_type into bch2_bucket_alloc_trans()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240421/202404210756.agnX3G74-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210756.agnX3G74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404210756.agnX3G74-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_foreground.c:530: warning: Function parameter or struct member 'data_type' not described in 'bch2_bucket_alloc_trans'


vim +530 fs/bcachefs/alloc_foreground.c

f25d8215f49941 Kent Overstreet 2022-01-09  513  
f25d8215f49941 Kent Overstreet 2022-01-09  514  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  515   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc3 Kent Overstreet 2023-09-12  516   * @trans:	transaction object
96dea3d599dbc3 Kent Overstreet 2023-09-12  517   * @ca:		device to allocate from
96dea3d599dbc3 Kent Overstreet 2023-09-12  518   * @watermark:	how important is this allocation?
96dea3d599dbc3 Kent Overstreet 2023-09-12  519   * @cl:		if not NULL, closure to be used to wait if buckets not available
96dea3d599dbc3 Kent Overstreet 2023-09-12  520   * @usage:	for secondarily also returning the current device usage
f25d8215f49941 Kent Overstreet 2022-01-09  521   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  522   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627 Kent Overstreet 2022-10-19  523   */
f25d8215f49941 Kent Overstreet 2022-01-09  524  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
f25d8215f49941 Kent Overstreet 2022-01-09  525  				      struct bch_dev *ca,
e53a961c6b1ced Kent Overstreet 2023-06-24  526  				      enum bch_watermark watermark,
4935a4c3d6ab87 Kent Overstreet 2024-04-20  527  				      enum bch_data_type data_type,
ed80c5699a23c4 Kent Overstreet 2022-10-21  528  				      struct closure *cl,
ed80c5699a23c4 Kent Overstreet 2022-10-21  529  				      struct bch_dev_usage *usage)
f25d8215f49941 Kent Overstreet 2022-01-09 @530  {
f25d8215f49941 Kent Overstreet 2022-01-09  531  	struct bch_fs *c = trans->c;
f25d8215f49941 Kent Overstreet 2022-01-09  532  	struct open_bucket *ob = NULL;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  533  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
822835ffeae411 Kent Overstreet 2022-04-01  534  	u64 avail;
ae10fe017bf546 Kent Overstreet 2022-11-04  535  	struct bucket_alloc_state s = { 0 };
822835ffeae411 Kent Overstreet 2022-04-01  536  	bool waiting = false;
f25d8215f49941 Kent Overstreet 2022-01-09  537  again:
ed80c5699a23c4 Kent Overstreet 2022-10-21  538  	bch2_dev_usage_read_fast(ca, usage);
e53a961c6b1ced Kent Overstreet 2023-06-24  539  	avail = dev_buckets_free(ca, *usage, watermark);
822835ffeae411 Kent Overstreet 2022-04-01  540  
ed80c5699a23c4 Kent Overstreet 2022-10-21  541  	if (usage->d[BCH_DATA_need_discard].buckets > avail)
822835ffeae411 Kent Overstreet 2022-04-01  542  		bch2_do_discards(c);
822835ffeae411 Kent Overstreet 2022-04-01  543  
ed80c5699a23c4 Kent Overstreet 2022-10-21  544  	if (usage->d[BCH_DATA_need_gc_gens].buckets > avail)
cae53d3b8235cd Kent Overstreet 2024-04-19  545  		bch2_gc_gens_async(c);
822835ffeae411 Kent Overstreet 2022-04-01  546  
ed80c5699a23c4 Kent Overstreet 2022-10-21  547  	if (should_invalidate_buckets(ca, *usage))
822835ffeae411 Kent Overstreet 2022-04-01  548  		bch2_do_invalidates(c);
822835ffeae411 Kent Overstreet 2022-04-01  549  
f25d8215f49941 Kent Overstreet 2022-01-09  550  	if (!avail) {
822835ffeae411 Kent Overstreet 2022-04-01  551  		if (cl && !waiting) {
f25d8215f49941 Kent Overstreet 2022-01-09  552  			closure_wait(&c->freelist_wait, cl);
822835ffeae411 Kent Overstreet 2022-04-01  553  			waiting = true;
f25d8215f49941 Kent Overstreet 2022-01-09  554  			goto again;
f25d8215f49941 Kent Overstreet 2022-01-09  555  		}
f25d8215f49941 Kent Overstreet 2022-01-09  556  
f1ca1abfb0275d Kent Overstreet 2024-03-13  557  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
f25d8215f49941 Kent Overstreet 2022-01-09  558  
615f867c14b2d7 Kent Overstreet 2022-07-17  559  		ob = ERR_PTR(-BCH_ERR_freelist_empty);
f25d8215f49941 Kent Overstreet 2022-01-09  560  		goto err;
f25d8215f49941 Kent Overstreet 2022-01-09  561  	}
f25d8215f49941 Kent Overstreet 2022-01-09  562  
822835ffeae411 Kent Overstreet 2022-04-01  563  	if (waiting)
822835ffeae411 Kent Overstreet 2022-04-01  564  		closure_wake_up(&c->freelist_wait);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  565  alloc:
f2b542ba42a8b3 Kent Overstreet 2022-12-11  566  	ob = likely(freespace)
e53a961c6b1ced Kent Overstreet 2023-06-24  567  		? bch2_bucket_alloc_freelist(trans, ca, watermark, &s, cl)
e53a961c6b1ced Kent Overstreet 2023-06-24  568  		: bch2_bucket_alloc_early(trans, ca, watermark, &s, cl);
ae10fe017bf546 Kent Overstreet 2022-11-04  569  
ae10fe017bf546 Kent Overstreet 2022-11-04  570  	if (s.skipped_need_journal_commit * 2 > avail)
f25d8215f49941 Kent Overstreet 2022-01-09  571  		bch2_journal_flush_async(&c->journal, NULL);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  572  
067d228bb0c405 Kent Overstreet 2023-07-07  573  	if (!ob && freespace && c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b3 Kent Overstreet 2022-12-11  574  		freespace = false;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  575  		goto alloc;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  576  	}
f25d8215f49941 Kent Overstreet 2022-01-09  577  err:
f25d8215f49941 Kent Overstreet 2022-01-09  578  	if (!ob)
615f867c14b2d7 Kent Overstreet 2022-07-17  579  		ob = ERR_PTR(-BCH_ERR_no_buckets_found);
f25d8215f49941 Kent Overstreet 2022-01-09  580  
4935a4c3d6ab87 Kent Overstreet 2024-04-20  581  	if (!IS_ERR(ob))
4935a4c3d6ab87 Kent Overstreet 2024-04-20  582  		ob->data_type = data_type;
4935a4c3d6ab87 Kent Overstreet 2024-04-20  583  
674cfc26240b78 Kent Overstreet 2022-08-27  584  	if (!IS_ERR(ob))
674cfc26240b78 Kent Overstreet 2022-08-27  585  		trace_and_count(c, bucket_alloc, ca,
e53a961c6b1ced Kent Overstreet 2023-06-24  586  				bch2_watermarks[watermark],
68b6cd194ab23d Kent Overstreet 2022-09-26  587  				ob->bucket,
ed80c5699a23c4 Kent Overstreet 2022-10-21  588  				usage->d[BCH_DATA_free].buckets,
8ef98313994043 Kent Overstreet 2022-07-17  589  				avail,
8ef98313994043 Kent Overstreet 2022-07-17  590  				bch2_copygc_wait_amount(c),
8ef98313994043 Kent Overstreet 2022-07-17  591  				c->copygc_wait - atomic64_read(&c->io_clock[WRITE].now),
ae10fe017bf546 Kent Overstreet 2022-11-04  592  				&s,
615f867c14b2d7 Kent Overstreet 2022-07-17  593  				cl == NULL,
615f867c14b2d7 Kent Overstreet 2022-07-17  594  				"");
adf16c6dfa279f Kent Overstreet 2022-10-17  595  	else if (!bch2_err_matches(PTR_ERR(ob), BCH_ERR_transaction_restart))
674cfc26240b78 Kent Overstreet 2022-08-27  596  		trace_and_count(c, bucket_alloc_fail, ca,
e53a961c6b1ced Kent Overstreet 2023-06-24  597  				bch2_watermarks[watermark],
68b6cd194ab23d Kent Overstreet 2022-09-26  598  				0,
ed80c5699a23c4 Kent Overstreet 2022-10-21  599  				usage->d[BCH_DATA_free].buckets,
8ef98313994043 Kent Overstreet 2022-07-17  600  				avail,
8ef98313994043 Kent Overstreet 2022-07-17  601  				bch2_copygc_wait_amount(c),
8ef98313994043 Kent Overstreet 2022-07-17  602  				c->copygc_wait - atomic64_read(&c->io_clock[WRITE].now),
ae10fe017bf546 Kent Overstreet 2022-11-04  603  				&s,
615f867c14b2d7 Kent Overstreet 2022-07-17  604  				cl == NULL,
615f867c14b2d7 Kent Overstreet 2022-07-17  605  				bch2_err_str(PTR_ERR(ob)));
f25d8215f49941 Kent Overstreet 2022-01-09  606  
f25d8215f49941 Kent Overstreet 2022-01-09  607  	return ob;
f25d8215f49941 Kent Overstreet 2022-01-09  608  }
f25d8215f49941 Kent Overstreet 2022-01-09  609  

:::::: The code at line 530 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
