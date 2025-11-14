Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F049328267
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 14:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130770; cv=none; b=bcugkodYY+QV8fKZJ85rjnl8Oovz/vAv62cq2O1sKViB7BsYpJQqZFB+AoeTbcuzAriEIiBPuyvztkW3GDAGj2nGXGMJrNnrj66jv75BOVmhdXm71lhA27dfFqzYC7JQgB4w/k0AMU6yhTvHFV73FrKRinwRLkE000JONWL7C3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130770; c=relaxed/simple;
	bh=Ee2wmHnTtaDkc1vEFUyuph6Nk1Z2CNzsqggzNgFkQUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bKiJgp3wiMee3lHcSM5H+l22D3/1kuiJV20XaoGDr/KwHTuApkUGXHlI5KxkVrHvNoF5WlEYrpYUG1zCfDW8nWA+uzrqN0D0PdHqPQHvx0spHf9KFOKchhOHAPqRR0e8/6pwrA5iPiYH5G//zoq8GIAjpVMipWYGlfCaAojKs8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSI0NrGz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSI0NrGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763130768; x=1794666768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ee2wmHnTtaDkc1vEFUyuph6Nk1Z2CNzsqggzNgFkQUE=;
  b=DSI0NrGzJHmKqd5XLf3LUnhJCX96MUrfUyrXbHXeDV81z/6xGP6Loa6r
   8z1v4201FB0BLZXDv3Nmnk7oR+OA2u/g0Tp/cYvo3ZM8y+FzD1UghHwxT
   s4fR4VdicQdBBD0fWGwFskH48qYWhM9NNXmYECDEQaqSz03A8PowNlkgu
   XoAXVFL7qjtjH8skK4/B76h4DPtvZuSODepfHeS39Obx5kXsm6G/gZg8y
   WuGnR47lrk0DCWdeQ2vQLU/LRMq0kz0wCL9fVtJN0dGAL73iZXcRO4wwg
   UwnSK+RU+kwN885HHT9rgVhJr947cuwL+2cLDt8jkFjzlm+51zw6Q8mYl
   Q==;
X-CSE-ConnectionGUID: f+4qy1kPQMS4Ch/JkdJyTg==
X-CSE-MsgGUID: DdEepI+SSHWba6C5x5plfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="82857881"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="82857881"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:32:46 -0800
X-CSE-ConnectionGUID: Z+De4QkVS2aCRfUtfqL2sw==
X-CSE-MsgGUID: EvkJYGHpR5e0Tf3ThUTFwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="227134932"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 06:32:45 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJuqw-0006fX-1r;
	Fri, 14 Nov 2025 14:32:42 +0000
Date: Fri, 14 Nov 2025 22:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 851/875]
 fs/bcachefs/data/reconcile.c:2161:1: warning: the frame size of 1068 bytes
 is larger than 1024 bytes
Message-ID: <202511142231.dZwiw51z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: 08209c1a245fe1ca0b78b31747565a552670f76e [851/875] bcachefs: bch_extent_rebalance_bp
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251114/202511142231.dZwiw51z-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511142231.dZwiw51z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142231.dZwiw51z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile.c: In function 'bch2_check_rebalance_work':
>> fs/bcachefs/data/reconcile.c:2161:1: warning: the frame size of 1068 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    2161 | }
         | ^


vim +2161 fs/bcachefs/data/reconcile.c

08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  2124  
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  2125  int bch2_check_rebalance_work(struct bch_fs *c)
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  2126  {
ec23ab66752e8b fs/bcachefs/rebalance.c      Kent Overstreet 2025-07-14  2127  	CLASS(btree_trans, trans)(c);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2128  	CLASS(btree_iter_uninit, extent_iter)(trans);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2129  	CLASS(btree_iter, rb_w)(trans, BTREE_ID_reconcile_work, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2130  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2131  	CLASS(btree_iter, rb_h)(trans, BTREE_ID_reconcile_hipri, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2132  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2133  	CLASS(btree_iter, rb_p)(trans, BTREE_ID_reconcile_pending, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2134  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  2135  
d772c15601e0ae fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  2136  	CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
d772c15601e0ae fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  2137  
a417a8f59a4808 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-21  2138  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
a417a8f59a4808 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-21  2139  	wb_maybe_flush_init(&last_flushed);
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  2140  
3c2cf54107fc88 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-11-08  2141  	struct progress_indicator progress;
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  2142  	bch2_progress_init(&progress, c,
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  2143  			   BIT_ULL(BTREE_ID_extents)|
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  2144  			   BIT_ULL(BTREE_ID_reflink));
9479568b781dc9 fs/bcachefs/rebalance.c      Kent Overstreet 2025-07-20  2145  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2146  	static const enum btree_id rebalance_work_data_btrees[] = {
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2147  		BTREE_ID_stripes,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2148  		BTREE_ID_reflink,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2149  		BTREE_ID_extents,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2150  	};
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2151  	for (unsigned i = 0; i < ARRAY_SIZE(rebalance_work_data_btrees); i++)
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2152  		try(check_rebalance_work_data_btree(trans, rebalance_work_data_btrees[i],
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2153  						    &rb_w, &rb_h, &rb_p,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2154  						    &snapshot_io_opts, &progress, &last_flushed));
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  2155  
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  2156  	/* progress indicator for metadata? */
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  2157  	try(check_rebalance_work_btrees(trans));
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  2158  	try(check_rebalance_btree_bps(trans));
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  2159  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  2160  	return 0;
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14 @2161  }

:::::: The code at line 2161 was first introduced by commit
:::::: 834f9475aabd84f60760ac8ceffc45eedff4a176 bcachefs: bch2_check_rebalance_work()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
