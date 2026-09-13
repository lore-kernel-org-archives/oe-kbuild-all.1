Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9124B3290C9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789319961; cv=none; b=Euswgl3FWlFlDJ1x5I/c1MWhyNyFaAFwauPC2wX5V1A4fiiGsVJFzEfZO/msxRbgVED7tGq3th1rCKyt4cpULSFQj6Ur2ugP1W1eu9db4fLfhbtyjue7lFpH2TGVn3yRXLatqDFxn3DJZSyduvmpXzGmmHeABpX+uX5UOHwesZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789319961; c=relaxed/simple;
	bh=4wv9jYFVb8PZoNv7h/idOtOlpWZkadQLc0l2ciJS6rc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cbsK7OPMph+cXxvhCa033kAVRhjPNy0OQ63cwzJgYVhV0Btmf8hF7Ipwk9wFc9CnNyIg7Z8CcHXOUwUBn44pbykDCltCVV+9ZjNYIAtsJlWirkn9yvuukLOfa12MWe7auThxAAOlhRmqTdDpYr5RV5PFqNvytIxP1PwCX//d510=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxTtSUMx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxTtSUMx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789319960; x=1820855960;
  h=date:from:to:cc:subject:message-id;
  bh=4wv9jYFVb8PZoNv7h/idOtOlpWZkadQLc0l2ciJS6rc=;
  b=dxTtSUMxkqIWMFR1rOKXEyLmPzZstMW3fS/t0pp/OxUMpfdTs1LmxSJa
   QypB10v5GTTdRSmjEXWwRmx4Sa1LOb1SEnhSaedwX8bd6bmlooDfTL+TI
   n53lZYrEB0ZsAu6wxdMUa6/j2Spkw1nwrndmOC7uAPxOyTG5L/rpSUU0H
   gHn7+O8HI0F+oLoPCa3SVXx0PaKZ2pyPsFWT9cWuBBB2PpsCx7Cw56gpL
   BvMUSK/nr2CnCirUhjaDGFOn8JAUQOm9BQQY90NShYYMdR98MGi9i6a32
   AquVUgK281lTmIYhkfmQdXRj9yMGBCiutgyL/0NSylYW0zyI69INbAEiC
   g==;
X-CSE-ConnectionGUID: uAS1lsm3Qs6cdnb8q3QuAA==
X-CSE-MsgGUID: Brkohu22QsCQyF398DFC0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88836150"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="88836150"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 10:19:19 -0700
X-CSE-ConnectionGUID: 42Hp1hnXT2SOwd8ORKthKA==
X-CSE-MsgGUID: pT7AxYuPSkCa+hWMrfhFJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="270645386"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Sep 2026 10:19:17 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5nrG-000000001f5-3yaf;
	Sun, 13 Sep 2026 17:19:14 +0000
Date: Sun, 13 Sep 2026 19:18:33 +0200
From: kernel test robot <lkp@intel.com>
To: ProofOfConcept <poc@bcachefs.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 54/101]
 fs/bcachefs/alloc/check.c:606:1: warning: the frame size of 1584 bytes is
 larger than 1536 bytes
Message-ID: <202609131905.WKeVUgwe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ca944a61e079450f82be88c91e349638c75cf4b6
commit: fe43d8a0c1bbefdea2776bd64851ae18a2f1abc7 [54/101] bcachefs: Reindex need_discard btree by journal seq
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260913/202609131905.WKeVUgwe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609131905.WKeVUgwe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609131905.WKeVUgwe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/check.c: In function 'check_btree_alloc':
>> fs/bcachefs/alloc/check.c:606:1: warning: the frame size of 1584 bytes is larger than 1536 bytes [-Wframe-larger-than=]
     606 | }
         | ^


vim +606 fs/bcachefs/alloc/check.c

3fdc7b4035515f7 Kent Overstreet 2025-10-04  579  
f066f962fcae77d Kent Overstreet 2025-11-09  580  static int check_btree_alloc(struct btree_trans *trans)
f066f962fcae77d Kent Overstreet 2025-11-09  581  {
f066f962fcae77d Kent Overstreet 2025-11-09  582  	struct progress_indicator progress;
f89dd8a7c48ba10 Kent Overstreet 2025-11-30  583  	bch2_progress_init(&progress, __func__, trans->c, BIT_ULL(BTREE_ID_alloc), 0);
f066f962fcae77d Kent Overstreet 2025-11-09  584  
f066f962fcae77d Kent Overstreet 2025-11-09  585  	CLASS(btree_iter, iter)(trans, BTREE_ID_alloc, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77d Kent Overstreet 2025-11-09  586  	CLASS(btree_iter, discard_iter)(trans, BTREE_ID_need_discard, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77d Kent Overstreet 2025-11-09  587  	CLASS(btree_iter, freespace_iter)(trans, BTREE_ID_freespace, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77d Kent Overstreet 2025-11-09  588  	CLASS(btree_iter, bucket_gens_iter)(trans, BTREE_ID_bucket_gens, POS_MIN, BTREE_ITER_prefetch);
f066f962fcae77d Kent Overstreet 2025-11-09  589  
fe43d8a0c1bbefd ProofOfConcept  2026-03-19  590  	struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
fe43d8a0c1bbefd ProofOfConcept  2026-03-19  591  	wb_maybe_flush_init(&last_flushed);
fe43d8a0c1bbefd ProofOfConcept  2026-03-19  592  
f066f962fcae77d Kent Overstreet 2025-11-09  593  	struct bch_dev *ca __free(bch2_dev_put) = NULL;
f066f962fcae77d Kent Overstreet 2025-11-09  594  	int ret = 0;
f066f962fcae77d Kent Overstreet 2025-11-09  595  
f066f962fcae77d Kent Overstreet 2025-11-09  596  	while (!(ret = lockrestart_do(trans,
f066f962fcae77d Kent Overstreet 2025-11-09  597  				check_btree_alloc_iter(trans, &ca, &iter,
f066f962fcae77d Kent Overstreet 2025-11-09  598  						       &discard_iter,
f066f962fcae77d Kent Overstreet 2025-11-09  599  						       &freespace_iter,
f066f962fcae77d Kent Overstreet 2025-11-09  600  						       &bucket_gens_iter,
fe43d8a0c1bbefd ProofOfConcept  2026-03-19  601  						       &progress,
fe43d8a0c1bbefd ProofOfConcept  2026-03-19  602  						       &last_flushed))))
f066f962fcae77d Kent Overstreet 2025-11-09  603  		;
f066f962fcae77d Kent Overstreet 2025-11-09  604  
0496470fb608956 Kent Overstreet 2025-10-24  605  	return min(0, ret);
0496470fb608956 Kent Overstreet 2025-10-24 @606  }
0496470fb608956 Kent Overstreet 2025-10-24  607  

:::::: The code at line 606 was first introduced by commit
:::::: 0496470fb6089562784d996d0fa12a611ef08029 bcachefs: Break up bch2_check_alloc_info()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
