Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32B2BE7A1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247628; cv=none; b=rWkCNCK1IJUIi4vZjDkAAsMN6P6nyCG2qNfjXZV4Tw6434iwY6RFeJXvsVu7unTnagy8MbD4GKiHTlH/Ow/ODGNYIWm25lpX2LsQjIyCXzwss3q897sqrsX9cH+m4CkgQ4SSesLMINNeGzGRnUYYEBoHWQMtb2sZFE4RPtGcYyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247628; c=relaxed/simple;
	bh=eRbCnAuWUzY0bKlL3A9ioAOmpx8zoAeyJMbFb1liEas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KyygwvpLdAm0BMHF0bMR7HLLSJClRD7l4aUSZJ9T5/gvny00d8J3Igg+Brag8wNb+94/dWNxLALiQ4j7HaAmqEpNWnc60a276XcDI6UURumEmBwVp5ejEvjS61uNUE1qmjo9TZNz7O1Nz94o5WmgfCwxlF4eJnuwR7GfIQdgnJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZMHc1a2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZMHc1a2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247627; x=1797783627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eRbCnAuWUzY0bKlL3A9ioAOmpx8zoAeyJMbFb1liEas=;
  b=kZMHc1a2Vo2Qsy6UlcUAk8Z6ZgBFv3LQ0cI1OUeSgFGbLCYbQQ6+6hLK
   QaQxV0nCMeXXhkTJd0lEgZZTEY0FD6ANCoFhEtTLZjU6iW9R9xjoC1fhX
   XHVD0p5puFNDX+fh8TM/F9Dx+etmnZkEyFs0ossmfhqVf91UGUs2MVvTK
   QQGzf9/lnv7K3lP97MxsfnLCvru9H1S7lj48Fy9E/zakkLC6RfT32daiQ
   jG5k2lWuZIyDlHIHogUA5XwzQeKvaKK3GjlfanvuyI92u8ZMf0UjstziB
   Uh861em/Alc6HuWb7yCXgDuJtSkmCXOvxCoWeQTXPnEeA/Uj9CkZnvgOD
   g==;
X-CSE-ConnectionGUID: pwXmYOcuSVmBIUM46PtKMw==
X-CSE-MsgGUID: SgCfnOmlSXGG+dQ39JBsfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78814623"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78814623"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:20:26 -0800
X-CSE-ConnectionGUID: xiL3FdHISdSKoofjoUYcfA==
X-CSE-MsgGUID: KrXLBeFKSeeowbdFC+DQNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199167919"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Dec 2025 08:20:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzgs-000000004rP-1XGv;
	Sat, 20 Dec 2025 16:20:22 +0000
Date: Sun, 21 Dec 2025 00:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:master 843/1155] fs/bcachefs/data/reconcile.c:1693:1:
 warning: the frame size of 1648 bytes is larger than 1536 bytes
Message-ID: <202512210035.fy3mZtEi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   04888b6f068a4574da7e132fdf3d0fceab2b7c36
commit: e972bd7734105b5b324987d0814b42c93d07ab85 [843/1155] bcachefs: reconcile_work_(hipri|pending) btrees
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20251221/202512210035.fy3mZtEi-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210035.fy3mZtEi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210035.fy3mZtEi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reconcile.c: In function 'bch2_check_rebalance_work':
>> fs/bcachefs/data/reconcile.c:1693:1: warning: the frame size of 1648 bytes is larger than 1536 bytes [-Wframe-larger-than=]
    1693 | }
         | ^


vim +1693 fs/bcachefs/data/reconcile.c

834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1660  
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1661  int bch2_check_rebalance_work(struct bch_fs *c)
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1662  {
ec23ab66752e8b fs/bcachefs/rebalance.c      Kent Overstreet 2025-07-14  1663  	CLASS(btree_trans, trans)(c);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1664  	CLASS(btree_iter_uninit, extent_iter)(trans);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1665  	CLASS(btree_iter, rb_w)(trans, BTREE_ID_reconcile_work, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1666  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1667  	CLASS(btree_iter, rb_h)(trans, BTREE_ID_reconcile_hipri, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1668  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1669  	CLASS(btree_iter, rb_p)(trans, BTREE_ID_reconcile_pending, POS_MIN,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1670  				BTREE_ITER_prefetch|BTREE_ITER_all_snapshots);
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1671  
d772c15601e0ae fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  1672  	CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
d772c15601e0ae fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  1673  
a417a8f59a4808 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-21  1674  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
a417a8f59a4808 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-21  1675  	wb_maybe_flush_init(&last_flushed);
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1676  
3c2cf54107fc88 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-11-08  1677  	struct progress_indicator progress;
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  1678  	bch2_progress_init(&progress, c,
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  1679  			   BIT_ULL(BTREE_ID_extents)|
76abd7ed021be2 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-19  1680  			   BIT_ULL(BTREE_ID_reflink));
9479568b781dc9 fs/bcachefs/rebalance.c      Kent Overstreet 2025-07-20  1681  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1682  	static const enum btree_id rebalance_work_data_btrees[] = {
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1683  		BTREE_ID_stripes,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1684  		BTREE_ID_reflink,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1685  		BTREE_ID_extents,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1686  	};
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1687  	for (unsigned i = 0; i < ARRAY_SIZE(rebalance_work_data_btrees); i++)
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1688  		try(check_rebalance_work_data_btree(trans, rebalance_work_data_btrees[i],
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1689  						    &rb_w, &rb_h, &rb_p,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1690  						    &snapshot_io_opts, &progress, &last_flushed));
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14  1691  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1692  	return 0;
834f9475aabd84 fs/bcachefs/rebalance.c      Kent Overstreet 2025-03-14 @1693  }

:::::: The code at line 1693 was first introduced by commit
:::::: 834f9475aabd84f60760ac8ceffc45eedff4a176 bcachefs: bch2_check_rebalance_work()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
