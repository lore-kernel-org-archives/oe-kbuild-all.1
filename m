Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74AD3EBF0F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 01:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771811697; cv=none; b=RkNkuueosVBQnmGEn3+vrKJY2+lyKJYHrqVkRXj0jLs/pLs/epUDvBOS0MPuYg/EvHX3Axtno9RsoXTa/22ckXu/i1AT5+BH7OiKqx39/CcvhKFTgDYpvmHosXawsAawvQpADIc7meghRBqC6bYiIITndIGT/F8BX199FfF8s98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771811697; c=relaxed/simple;
	bh=ihuDRgvOd2yxH6IzW0GGd3irO5dufqBowxsII8S9oHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RMkZXfZbPuDBRkso0pFZz7/gS8AiijcFEWBayAA5OmeNA3zmg1ONIPyGKluHkAOjqjC8+5Jk4u3uFoVmRIrIXpFAROj9hV9M2ebBO+vlbP0bLEAGSzwcklNRFoq+dNsJmm7jgsTuCRNutxg23qaJa5bS14s7A5q5xqUL4kQ+IYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3Pqk7Ya; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3Pqk7Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771811695; x=1803347695;
  h=date:from:to:cc:subject:message-id;
  bh=ihuDRgvOd2yxH6IzW0GGd3irO5dufqBowxsII8S9oHY=;
  b=K3Pqk7YaTGVbZkTO/I+GbxdJecDX5f9982PgRAQ5l/PpEz/T7hb8sDSf
   1t6xApCgQdhtRj+qc3hzf1Jj8S9k0AmufwRmIHqwjHAQVK0vsZk6V/EDD
   Rw0mSZhzGzFrUUnEXZQQANfL4Scc6JY0lPxMBvSQ+40AmpumOfXKQmrse
   VqsF1b5xgdV0WdEhlSUTUwhcLBuGCFTCTb6wa43guXqMzZrEL2wnPkIzB
   mNEMxjyTxGm/4ZlBHiIP3P4sFEjiTiu3cz98Gk/etbJKIrnIiAXkseaah
   NsR/ZGyNisrpLIxHwe8Qu/YDbqJCRtX5gHSqRHth6vHpAQDFgWjwu9b5q
   Q==;
X-CSE-ConnectionGUID: 4Z4hPQO3QhyFkbRDQxLryg==
X-CSE-MsgGUID: NiGUQUQFThq3zgLX71zrCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72509986"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72509986"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 17:54:54 -0800
X-CSE-ConnectionGUID: 8/d1VCHNSUCs3zsw6hI0gA==
X-CSE-MsgGUID: wUuFT7fyS9OZhhWsfoaLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="214342182"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 22 Feb 2026 17:54:52 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuL9u-000000000FJ-0eAm;
	Mon, 23 Feb 2026 01:54:50 +0000
Date: Mon, 23 Feb 2026 09:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/385]
 fs/bcachefs/data/reconcile/check.c:445:1: warning: the frame size of 1044
 bytes is larger than 1024 bytes
Message-ID: <202602230940.IMnp6AX8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   d4bd02beae9ffcc8e3c028b54cb3a25b06e95beb
commit: de374d7b7296203619ba70f976867051cebaf41b [223/385] bcachefs: Break up reconcile.c
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260223/202602230940.IMnp6AX8-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230940.IMnp6AX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230940.IMnp6AX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile/check.c: In function 'bch2_check_reconcile_work':
>> fs/bcachefs/data/reconcile/check.c:445:1: warning: the frame size of 1044 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     445 | }
         | ^


vim +445 fs/bcachefs/data/reconcile/check.c

   407	
   408	int bch2_check_reconcile_work(struct bch_fs *c)
   409	{
   410		CLASS(btree_trans, trans)(c);
   411		CLASS(btree_iter_uninit, extent_iter)(trans);
   412		CLASS(btree_iter, rb_w)(trans, BTREE_ID_reconcile_work, POS_MIN,
   413					BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
   414		CLASS(btree_iter, rb_h)(trans, BTREE_ID_reconcile_hipri, POS_MIN,
   415					BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
   416		CLASS(btree_iter, rb_p)(trans, BTREE_ID_reconcile_pending, POS_MIN,
   417					BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
   418	
   419		CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
   420	
   421		struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
   422		wb_maybe_flush_init(&last_flushed);
   423	
   424		struct progress_indicator progress;
   425		bch2_progress_init(&progress, __func__, c,
   426				   BIT_ULL(BTREE_ID_extents)|
   427				   BIT_ULL(BTREE_ID_reflink),
   428				   0);
   429	
   430		static const enum btree_id data_btrees[] = {
   431			BTREE_ID_stripes,
   432			BTREE_ID_reflink,
   433			BTREE_ID_extents,
   434		};
   435		for (unsigned i = 0; i < ARRAY_SIZE(data_btrees); i++)
   436			try(check_reconcile_work_data_btree(trans, data_btrees[i],
   437							    &rb_w, &rb_h, &rb_p,
   438							    &snapshot_io_opts, &progress, &last_flushed));
   439	
   440		try(check_reconcile_work_phys(trans));
   441		try(check_reconcile_work_btrees(trans));
   442		try(check_reconcile_btree_bps(trans));
   443	
   444		return 0;
 > 445	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
