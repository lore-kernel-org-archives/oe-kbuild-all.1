Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9992029D280
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 18:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768846807; cv=none; b=WS/dfwnOrwDejn3fam6i6Db4tDOZHtnAK4VF2HdHzaVaCCOmprZ3r3QAoLxQ8/Iw2OLm5JXZZ3MllRubBj0E3wkniyws+fdcVReAU0NYYYq2+28P2i9sITAb+63f1LJxmU/89/+ED9Wj4tlAfyF1EbjGSS1fPtuu9sBOHBCmBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768846807; c=relaxed/simple;
	bh=VoPGZhIcDNo42zyUzIZdOkCqNhEbphWRPS0xEK7HmlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z7nTmKpGGVzKihTOaMe+fu6NIothIV/yM2oL5BLMb4MfxjcUmyO5GZwuF2WZ3TnQnFSuPA0TfnZZtJv3LjyY6SHAd8dJsxvS1hONSOomZvjngZZwCAluvOTVriUROm8KF/0+tDcmoc8DVaRX1C7Pra3KIZ55o1eTW0JcCzLxyS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUOu9D61; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUOu9D61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768846805; x=1800382805;
  h=date:from:to:cc:subject:message-id;
  bh=VoPGZhIcDNo42zyUzIZdOkCqNhEbphWRPS0xEK7HmlQ=;
  b=nUOu9D61Me7dOtp/cmS6f8AtmWKwFQ5IEbqrzyYi7UxhHzGyaXYxZbig
   b4b0Xw8z4BT7sGj8WRs/s70l5F0jQ7tS2IHdW4PXLu5H/XwIix/G4usPT
   BxWThFQgw6V5yiyspsyhFYKgkoaSldXmIem8WPpRjAfkv85hiGH3JG5Le
   1u12effgL9sYlse/6mJWg7+cXaiu47m0RL6tom3KbQZ3YZJXLYjQ3Ol1e
   WX2Chm4h91fivnoFm3kHewzNm7JbwET7obEyEwy5QdaBIfGTYqdPO4p+H
   oS5HQSByxUmOzPorGu7TBMDb1oUICTSDRqAuzc285JRiLOYzUwTjPltTQ
   A==;
X-CSE-ConnectionGUID: jygDHgetRj6efkp1pZLODw==
X-CSE-MsgGUID: V6lDibPCRlmTK1M29/XR8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="69970112"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="69970112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 10:20:04 -0800
X-CSE-ConnectionGUID: ep9V6GQ0SmKi793Ef7nOhw==
X-CSE-MsgGUID: 03ghUIEHQC2Yw2O0EX2LJA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 10:20:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhtr7-00000000O9x-0OaW;
	Mon, 19 Jan 2026 18:20:01 +0000
Date: Tue, 20 Jan 2026 02:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/223]
 fs/bcachefs/data/reconcile/check.c:445:1: warning: the frame size of 1044
 bytes is larger than 1024 bytes
Message-ID: <202601200242.ybQLA69c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   1c240e59948ecca320c96b94db4ffae87581d477
commit: 1c240e59948ecca320c96b94db4ffae87581d477 [223/223] bcachefs: Break up reconcile.c
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260120/202601200242.ybQLA69c-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200242.ybQLA69c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200242.ybQLA69c-lkp@intel.com/

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
