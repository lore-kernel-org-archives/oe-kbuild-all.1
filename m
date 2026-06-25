Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8063CFF50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jun 2026 10:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782384242; cv=none; b=FQPLNbgZ66jka3l1DkGI4E8ab8wuygh+4U0mHggEMQ3QzLmTU0INMMYm2WXBO3oAR5BSJG2IIWeKy1NN2CjkVUodi9OQJP9Rzo507VEiruSXjl4FvM0Cox89gf7Zd7v9IWuKkRbAkHygLMx9Hr3JOiDPrNumuN26+3WSgEHt9wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782384242; c=relaxed/simple;
	bh=8uUM4W/zQdEDMgahrhQrnBigJ76UnMYbOWgE0oai1us=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ad2yFcLYLC293cWZlUyVrMnEqImJDsJC1Wa7iC49+v3ojgzx6wHkIVu4Pey5L8etxbZ9QxAoeruTD3XBkI7lYxv1CFxHlX8MR09M5yXdQ0DZtdLpeMjDVZzE0JTDMa1LbsOIYuz/B4ID4YJvTnJkXJ5/D+w1x7ZvwJlXtSnd1xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjFZt0iO; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjFZt0iO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782384240; x=1813920240;
  h=date:from:to:cc:subject:message-id;
  bh=8uUM4W/zQdEDMgahrhQrnBigJ76UnMYbOWgE0oai1us=;
  b=NjFZt0iO0RgKlMMQ1w1/UmVG3T9ecSRdO5g9cV3nLb9BXtuUoxdsvQPb
   +WgxoWdgk8XFtRRzrw94YwqqswsKr7dS3D+SQfqmtc+tz2mcakLivROUe
   3YZm+LKWkcxNllOysOnLPfGPibFTORawxFc/arALXbzilhKp67mtvKkaT
   Bstz8fkpcRl+yYLNYkS1JHvIiHtiF5vyo/3Hv/oLZml0Y9hnBGOq0D+jn
   7908zsSWNLYA1eVBoy6ewZx7MRMWI473EiF3+digbOtyRGu9sipcHhiHt
   K2Av6VQOgz/lRRSG/Otm2p1rXBQ15GO9AE7yVm/JYUtd8/k8hDihKyGFP
   Q==;
X-CSE-ConnectionGUID: n4+Tln7tQBiL/Jpbiiu4HQ==
X-CSE-MsgGUID: xJDm2vAeTwiGNQPkzLiTtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83254753"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="83254753"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 03:44:00 -0700
X-CSE-ConnectionGUID: zNRYiYb7QSynSsz8btbkMg==
X-CSE-MsgGUID: HbEbrn9UTiWDrBnyBuNXdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; 
   d="scan'208";a="250732196"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 25 Jun 2026 03:43:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wchYm-0000000045V-1jtH;
	Thu, 25 Jun 2026 10:43:52 +0000
Date: Thu, 25 Jun 2026 18:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: Codex <jullanggit@proton.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 38/65]
 fs/bcachefs/alloc/buckets.c:959:1: warning: the frame size of 1336 bytes is
 larger than 1024 bytes
Message-ID: <202606251841.crqW1giw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   d294b8d3e670ce73e23093e05a92747e0701bf8d
commit: 34c31c9633661a2b7901a1712d8516633f4fdbb6 [38/65] bcachefs: update reconcile-only backpointer flags in place
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260625/202606251841.crqW1giw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251841.crqW1giw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251841.crqW1giw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/alloc/buckets.c: In function 'bch2_trigger_extent_same_backpointers.constprop':
>> fs/bcachefs/alloc/buckets.c:959:1: warning: the frame size of 1336 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     959 | }
         | ^


vim +959 fs/bcachefs/alloc/buckets.c

   880	
   881	static int bch2_trigger_extent_same_backpointers(struct btree_trans *trans,
   882							 enum btree_id btree,
   883							 unsigned level,
   884							 struct bkey_s_c old,
   885							 struct bkey_s new,
   886							 bool *handled)
   887	{
   888		struct bch_fs *c = trans->c;
   889		struct bkey_i_backpointer old_bp[BCH_REPLICAS_MAX * 2];
   890		struct bkey_i_backpointer new_bp[BCH_REPLICAS_MAX * 2];
   891		struct bkey_ptrs_c ptrs;
   892		const union bch_extent_entry *entry;
   893		struct extent_ptr_decoded p;
   894		unsigned nr_old = 0, nr_new = 0;
   895		unsigned i;
   896	
   897		*handled = false;
   898		if (level)
   899			return 0;
   900	
   901		/*
   902		 * Reconcile-only updates do not move the extent, they only toggle the
   903		 * phys-work flag that is cached in rotational-data backpointers.  Do
   904		 * not delete+reinsert those backpointers through the write buffer when
   905		 * the key itself is unchanged: update the existing entry in place and
   906		 * adjust the reconcile_work_phys bit separately.
   907		 */
   908		ptrs = bch2_bkey_ptrs_c(old);
   909		bkey_for_each_ptr_decode(old.k, ptrs, p, entry) {
   910			BUG_ON(nr_old == ARRAY_SIZE(old_bp));
   911			bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
   912		}
   913	
   914		ptrs = bch2_bkey_ptrs_c(new.s_c);
   915		bkey_for_each_ptr_decode(new.k, ptrs, p, entry) {
   916			BUG_ON(nr_new == ARRAY_SIZE(new_bp));
   917			bch2_extent_ptr_to_bp(c, btree, level, new.s_c, p, entry, &new_bp[nr_new++]);
   918		}
   919	
   920		if (nr_old != nr_new)
   921			return 0;
   922	
   923		for (i = 0; i < nr_old; i++) {
   924			struct bch_backpointer old_v = old_bp[i].v;
   925			struct bch_backpointer new_v = new_bp[i].v;
   926	
   927			SET_BACKPOINTER_RECONCILE_PHYS(&old_v, 0);
   928			SET_BACKPOINTER_RECONCILE_PHYS(&new_v, 0);
   929	
   930			if (!bpos_eq(old_bp[i].k.p, new_bp[i].k.p) ||
   931			    memcmp(&old_v, &new_v, sizeof(old_v)))
   932				return 0;
   933		}
   934	
   935		for (i = 0; i < nr_old; i++) {
   936			unsigned old_phys = BACKPOINTER_RECONCILE_PHYS(&old_bp[i].v);
   937			unsigned new_phys = BACKPOINTER_RECONCILE_PHYS(&new_bp[i].v);
   938	
   939			if (!old_phys && !new_phys)
   940				continue;
   941	
   942			if (old_phys)
   943				try(bch2_btree_bit_mod_buffered(trans,
   944						reconcile_work_phys_btree[old_phys],
   945						old_bp[i].k.p, false));
   946	
   947			if (new_phys)
   948				try(bch2_btree_bit_mod_buffered(trans,
   949						reconcile_work_phys_btree[new_phys],
   950						new_bp[i].k.p, true));
   951	
   952			try(bch2_trans_update_buffered(trans,
   953					backpointer_btree(&new_bp[i].v),
   954					&new_bp[i].k_i));
   955		}
   956	
   957		*handled = true;
   958		return 0;
 > 959	}
   960	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
