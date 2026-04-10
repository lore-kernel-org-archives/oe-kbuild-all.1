Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDAE346E68
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848868; cv=none; b=OpNJ3cKHD4WJG9YRrF7HrWSuAlZ0mbj+4hPP2Nw5Gw4UiOeOkEY7dB9MA+E1CkjuBYF7fQs6Ca8y2CGOepMPcI+seWLHXWGJPX9ChJk1ujTe4SoflPE3GrGdBt6OGcAbxkQVQiiT/d2hokrqOnFCgpnx/ys9GAam3HMV7IWvSUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848868; c=relaxed/simple;
	bh=N1pnIeDeM6HVDNt0VwYDW+2WsZFaQiC3/sUIzZHHgJA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DKOxjIL8/Bn5sw2nbNGM2PmMC17t3e0XhjyLMNEaTjwROma7C1NzKmQb9kYDwnPgDoEVb6jx/zdPPcSAniCJ9chZYNiV+vPt2vrsZfMDtYXHI1VLzke0WN/DyxR47tedsPczLxxlP8zh46I95siIYEPvfYRMZagIde2YbAKQ+ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Li9KraYm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Li9KraYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775848867; x=1807384867;
  h=date:from:to:cc:subject:message-id;
  bh=N1pnIeDeM6HVDNt0VwYDW+2WsZFaQiC3/sUIzZHHgJA=;
  b=Li9KraYm/K5e5r9rEaLyHB7WdGoyqiEuLI3dPVvFYYWcI3qPkg0vK1M8
   POQuDNU181yewl6UHmS1dVzY0hwwYIDzkkhPv9bUqdM6J3/atNvHu7ywL
   4qbPz/QTgGJQo72RclAA7ZJ/NaP/4pr5tjVkTTvjKRjf14Z2oq7aqCwAV
   xlOhLePVTPlGTMZlu3CfejDJti1i4SKUd/gwsNHVdcL1arIE6rmh+ehmq
   9jGspcnlnnSQcV0Duo529Zv5xWgxDTvrI2nxwK8eOXCRlnrkmiPijaRwK
   MvFlJnTr31L8vdAGGrPhdOTUhAz4pDIwRwgh+Op89S+jq2MxBRyFqcY13
   Q==;
X-CSE-ConnectionGUID: BplkgopETumV9d1TxLIJ0g==
X-CSE-MsgGUID: 95QMdWGdSzKt/3UfIW6COg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87165695"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="87165695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:21:06 -0700
X-CSE-ConnectionGUID: w7Zfh1QbRbu+6q4+Blvjgg==
X-CSE-MsgGUID: DiMyOuKeRx2wjQjVfO8VMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="224851578"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Apr 2026 12:21:04 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBHPZ-0000000006r-3Wkk;
	Fri, 10 Apr 2026 19:21:01 +0000
Date: Sat, 11 Apr 2026 03:20:35 +0800
From: kernel test robot <lkp@intel.com>
To: ProofOfConcept <poc@bcachefs.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 49/52]
 fs/bcachefs/alloc/check.c:606:1: warning: the frame size of 1584 bytes is
 larger than 1536 bytes
Message-ID: <202604110336.X4nCiJcu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fb7dce73e6871585b0721da899e854c348902770
commit: 6599adff6bf26b0397db4b969f5236ab27f9ac10 [49/52] bcachefs: Reindex need_discard btree by journal seq
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604110336.X4nCiJcu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604110336.X4nCiJcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604110336.X4nCiJcu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/check.c: In function 'check_btree_alloc':
>> fs/bcachefs/alloc/check.c:606:1: warning: the frame size of 1584 bytes is larger than 1536 bytes [-Wframe-larger-than=]
     606 | }
         | ^


vim +606 fs/bcachefs/alloc/check.c

3fdc7b4035515f Kent Overstreet 2025-10-04  579  
f066f962fcae77 Kent Overstreet 2025-11-09  580  static int check_btree_alloc(struct btree_trans *trans)
f066f962fcae77 Kent Overstreet 2025-11-09  581  {
f066f962fcae77 Kent Overstreet 2025-11-09  582  	struct progress_indicator progress;
f89dd8a7c48ba1 Kent Overstreet 2025-11-30  583  	bch2_progress_init(&progress, __func__, trans->c, BIT_ULL(BTREE_ID_alloc), 0);
f066f962fcae77 Kent Overstreet 2025-11-09  584  
f066f962fcae77 Kent Overstreet 2025-11-09  585  	CLASS(btree_iter, iter)(trans, BTREE_ID_alloc, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77 Kent Overstreet 2025-11-09  586  	CLASS(btree_iter, discard_iter)(trans, BTREE_ID_need_discard, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77 Kent Overstreet 2025-11-09  587  	CLASS(btree_iter, freespace_iter)(trans, BTREE_ID_freespace, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77 Kent Overstreet 2025-11-09  588  	CLASS(btree_iter, bucket_gens_iter)(trans, BTREE_ID_bucket_gens, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77 Kent Overstreet 2025-11-09  589  
6599adff6bf26b ProofOfConcept  2026-03-19  590  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
6599adff6bf26b ProofOfConcept  2026-03-19  591  	wb_maybe_flush_init(&last_flushed);
6599adff6bf26b ProofOfConcept  2026-03-19  592  
f066f962fcae77 Kent Overstreet 2025-11-09  593  	struct bch_dev *ca __free(bch2_dev_put) = NULL;
f066f962fcae77 Kent Overstreet 2025-11-09  594  	int ret = 0;
f066f962fcae77 Kent Overstreet 2025-11-09  595  
f066f962fcae77 Kent Overstreet 2025-11-09  596  	while (!(ret = lockrestart_do(trans,
f066f962fcae77 Kent Overstreet 2025-11-09  597  				check_btree_alloc_iter(trans, &ca, &iter,
f066f962fcae77 Kent Overstreet 2025-11-09  598  						       &discard_iter,
f066f962fcae77 Kent Overstreet 2025-11-09  599  						       &freespace_iter,
f066f962fcae77 Kent Overstreet 2025-11-09  600  						       &bucket_gens_iter,
6599adff6bf26b ProofOfConcept  2026-03-19  601  						       &progress,
6599adff6bf26b ProofOfConcept  2026-03-19  602  						       &last_flushed))))
f066f962fcae77 Kent Overstreet 2025-11-09  603  		;
f066f962fcae77 Kent Overstreet 2025-11-09  604  
0496470fb60895 Kent Overstreet 2025-10-24  605  	return min(0, ret);
0496470fb60895 Kent Overstreet 2025-10-24 @606  }
0496470fb60895 Kent Overstreet 2025-10-24  607  

:::::: The code at line 606 was first introduced by commit
:::::: 0496470fb6089562784d996d0fa12a611ef08029 bcachefs: Break up bch2_check_alloc_info()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
