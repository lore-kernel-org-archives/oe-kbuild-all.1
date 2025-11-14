Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724DC320A3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 14:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130107; cv=none; b=VGfe/hsv6e1SHdG7x1EYdXaekxs58wAZgVSCEc/Yju7zCgLB3RqMIVTEOT1scbEapdxRvVdwufjH9WbvwnIJLLDH/Syl61RsplvxKwYsF99iKdV7x2zYhr87Mxo2E8GyZXAVrP4n0f88Ah+o0GHbY6J5OQQc3/hlunqdAGhzbZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130107; c=relaxed/simple;
	bh=r0d1RV5ncayZ7KWKyKgJM2wySDgG315+x3DmSDmpTxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKqrOgLQUgPdNfYVNi2aWEjo1xeB4bOV7xhrb8mheLf+4kNNghP/uZoT5+zQBUv0QprTLFitMzG/M99sXsBJnLOCRnWPWQdD19hvM59R81rvkWDPpfZrxWC/6O5iVOIVff4j3mTO6d3JubKu+ZQtLwctfxuMrbQeqOmoBkS7thE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN2EcXFw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN2EcXFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763130105; x=1794666105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r0d1RV5ncayZ7KWKyKgJM2wySDgG315+x3DmSDmpTxY=;
  b=FN2EcXFw/439oU7JL4BGYzuAEc7xz2CXp/iDBYm4GYhOD819xJ+5gQ5o
   XCVRNdqaJ49bDdkCqxj7Dtf4vV6vWirkH+SHPFyD1zUL3wru50VHgLCP9
   cew2TRwY/smPVeZ8nnwt4ZkV+WBCdZXMseKYCyvUP1B0SfQIjAumvyBtb
   cZEpHaoRvFrJ6oSnwghS3Jda8AqGpS1OcPg5BCpUTG87dO0VGLlFY8vL9
   1AL3rLCRAjxTXE8hRfp6OAVwEkINbamD9S6DigCfRNVwFx4z6TD5ZsR5x
   m3VEGdVUMlH6Zth6HAc1kSqh2VtiBXCJTn/xcRPE1RK39q60QDmCw+5Yb
   g==;
X-CSE-ConnectionGUID: TahaURh4TZGpTniuMmvDvA==
X-CSE-MsgGUID: As7BUB1rStyHAa7OZFs6wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="65323019"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="65323019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 06:21:45 -0800
X-CSE-ConnectionGUID: wqcdHuyDTqqMJJXBIhEXLg==
X-CSE-MsgGUID: fjhNLG0FT4C0rxbOdqcqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; 
   d="scan'208";a="189433976"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Nov 2025 06:21:44 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJugH-0006f5-2S;
	Fri, 14 Nov 2025 14:21:41 +0000
Date: Fri, 14 Nov 2025 22:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 836/875]
 fs/bcachefs/data/reconcile.c:569:21-22: Unneeded semicolon
Message-ID: <202511142240.cyL4UZN8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ab3c04679170b0e63c55680f725ceb4218b2b04c
commit: 76abd7ed021be25494b61aec4db5897d9c8cd286 [836/875] bcachefs: bcachefs_metadata_version_reconcile
config: um-randconfig-r061-20251114 (https://download.01.org/0day-ci/archive/20251114/202511142240.cyL4UZN8-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511142240.cyL4UZN8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile.c:569:21-22: Unneeded semicolon

vim +569 fs/bcachefs/data/reconcile.c

a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  559  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  560  static struct bkey_i *next_rebalance_entry(struct btree_trans *trans,
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  561  					 darray_rebalance_work *buf, struct bpos *work_pos)
fb3f57bb1177ae fs/bcachefs/rebalance.c Kent Overstreet 2023-10-20  562  {
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  563  	if (unlikely(!buf->nr)) {
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  564  		/*
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  565  		 * Avoid contention with write buffer flush: buffer up rebalance
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  566  		 * work entries in a darray
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  567  		 */
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  568  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03 @569  		BUG_ON(!buf->size);;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  570  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  571  		bch2_trans_begin(trans);
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  572  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  573  		for_each_btree_key(trans, iter, BTREE_ID_rebalance_work, *work_pos,
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  574  				   BTREE_ITER_all_snapshots|BTREE_ITER_prefetch, k, ({
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  575  			/* we previously used darray_make_room */
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  576  			BUG_ON(bkey_bytes(k.k) > sizeof(buf->data[0]));
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  577  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  578  			bkey_reassemble(&darray_top(*buf).k_i, k);
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  579  			buf->nr++;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  580  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  581  			*work_pos = bpos_successor(iter.pos);
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  582  			if (buf->nr == buf->size)
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  583  				break;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  584  			0;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  585  		}));
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  586  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  587  		if (!buf->nr)
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  588  			return NULL;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  589  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  590  		unsigned l = 0, r = buf->nr - 1;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  591  		while (l < r) {
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  592  			swap(buf->data[l], buf->data[r]);
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  593  			l++;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  594  			--r;
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  595  		}
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  596  	}
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  597  
a45b2e247f505c fs/bcachefs/rebalance.c Kent Overstreet 2025-08-03  598  	return &(&darray_pop(buf))->k_i;
7f5c5d20f01483 fs/bcachefs/rebalance.c Kent Overstreet 2022-06-13  599  }
7f5c5d20f01483 fs/bcachefs/rebalance.c Kent Overstreet 2022-06-13  600  

:::::: The code at line 569 was first introduced by commit
:::::: a45b2e247f505c26e3e211b1c7d72d444c8540ee bcachefs: rebalance: Batch reads from rebalance_work btree

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
