Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391430C608
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 05:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782970338; cv=none; b=krrjItnascQAS6MXpA5TFPXP9oTyuGrI8c5+IyIgKFfbTU6GCJwMDWNOUZ0JJtcc0+6/koX8/KXRtMapErvFrcJCCPzas9tLcyj7uSjl8h7X6uITxOxI6O/ZnCTATJ3lXw9C7PnQCCjnqPBCWXZNNGMdsyg1aLKucaYZxw1wRgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782970338; c=relaxed/simple;
	bh=ruBKUZcQlWGl5YUDVatneltdPoKrE10YndzleHRn/+o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aNGvTpmOyDVpO94Rzdbf656LG521ZgyhWq9rx1olVI0efYAPlXYTOX7X/spUiZodZ5LyVbHDooygClnrGAHNSmUoxkY8DmTMqxIKahkLAGFfAHwqIgZkXG8li5x01T9WAXjAZs6SghsolWnKSJl3EaWcAD08rBwxQVPO8G2ihfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JSAQs4tL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JSAQs4tL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782970335; x=1814506335;
  h=date:from:to:cc:subject:message-id;
  bh=ruBKUZcQlWGl5YUDVatneltdPoKrE10YndzleHRn/+o=;
  b=JSAQs4tLV7W8e7H+/dBxPF4e5W/TFONw4+Dx4bBnmcX4RY6pRDfUjdf/
   //1KAAvSZHc0aBBGzsNfPoEKXfx0JjKUVB6ZmYDOx1CmXKgcTatxR9FFH
   BEPfUqN6ttkwuMggeBoOvWtpqeFxBwsw27kfZGCwTz6JIFbMbN9lSTk6I
   0L5Y1QjjzpMNphqGQQ5h573VhmBgNghfBcnKife/7s4razz9yHgT1R/yU
   MguBfLg2ixMjHHjwLRO2xi0zqdhxLfPRwcJIhNXU5bthLmCiiXMRWpKEi
   VhvxOzegFdo1OoLL33V1IqpCz3mGpGdMfYXRI8uVsGgpMuDK+RbvTJybl
   Q==;
X-CSE-ConnectionGUID: vjI+VgAEQ0KO20/jNEIEQw==
X-CSE-MsgGUID: sqiym7I3Rvi6QBVr6vzYEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="109257434"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="109257434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 22:32:15 -0700
X-CSE-ConnectionGUID: jbCf3fQEQCyjK9G3uqHoAA==
X-CSE-MsgGUID: X+hL6n7oSL2D9+RCPf/6eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257650578"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 01 Jul 2026 22:32:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfA1y-00000000A13-3SNN;
	Thu, 02 Jul 2026 05:32:10 +0000
Date: Thu, 02 Jul 2026 13:31:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jul Lang <jullanggit@proton.me>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:pr/1073 8/9]
 fs/bcachefs/alloc/buckets.c:902:49: error: 'level' undeclared
Message-ID: <202607021327.l2TgUTZX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs pr/1073
head:   f74372111084f9b50dc52eaeb9e8ec40399b2609
commit: d3c3cc61c9901c4e26f719f9b905c6766e8ca06d [8/9] bcachefs: rename bch2_trigger_extent_same_backpointers to bch2_trigger_extent_reconcile_phys_update and update comments
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260702/202607021327.l2TgUTZX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021327.l2TgUTZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021327.l2TgUTZX-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/alloc/buckets.c: In function 'bch2_trigger_extent_reconcile_phys_update':
>> fs/bcachefs/alloc/buckets.c:902:49: error: 'level' undeclared (first use in this function)
     902 |                 bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
         |                                                 ^~~~~
   fs/bcachefs/alloc/buckets.c:902:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/level +902 fs/bcachefs/alloc/buckets.c

1f34c21bc685f6b fs/bcachefs/buckets.c       Kent Overstreet 2023-12-29  880  
d3c3cc61c9901c4 fs/bcachefs/alloc/buckets.c Jul Lang        2026-07-01  881  /* in-place update RECONCILE_PHYS if it is the only thing that changed */
d3c3cc61c9901c4 fs/bcachefs/alloc/buckets.c Jul Lang        2026-07-01  882  static int bch2_trigger_extent_reconcile_phys_update(struct btree_trans *trans,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  883  						 enum btree_id btree,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  884  						 struct bkey_s_c old,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  885  						 struct bkey_s new,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  886  						 bool *handled)
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  887  {
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  888  	struct bch_fs *c = trans->c;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  889  	struct bkey_i_backpointer old_bp[BCH_REPLICAS_MAX * 2];
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  890  	struct bkey_i_backpointer new_bp[BCH_REPLICAS_MAX * 2];
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  891  	struct bkey_ptrs_c ptrs;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  892  	const union bch_extent_entry *entry;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  893  	struct extent_ptr_decoded p;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  894  	unsigned nr_old = 0, nr_new = 0;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  895  	unsigned i;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  896  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  897  	*handled = false;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  898  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  899  	ptrs = bch2_bkey_ptrs_c(old);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  900  	bkey_for_each_ptr_decode(old.k, ptrs, p, entry) {
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  901  		BUG_ON(nr_old == ARRAY_SIZE(old_bp));
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13 @902  		bch2_extent_ptr_to_bp(c, btree, level, old, p, entry, &old_bp[nr_old++]);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  903  	}
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  904  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  905  	ptrs = bch2_bkey_ptrs_c(new.s_c);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  906  	bkey_for_each_ptr_decode(new.k, ptrs, p, entry) {
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  907  		BUG_ON(nr_new == ARRAY_SIZE(new_bp));
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  908  		bch2_extent_ptr_to_bp(c, btree, level, new.s_c, p, entry, &new_bp[nr_new++]);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  909  	}
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  910  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  911  	if (nr_old != nr_new)
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  912  		return 0;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  913  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  914  	for (i = 0; i < nr_old; i++) {
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  915  		struct bch_backpointer old_v = old_bp[i].v;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  916  		struct bch_backpointer new_v = new_bp[i].v;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  917  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  918  		SET_BACKPOINTER_RECONCILE_PHYS(&old_v, 0);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  919  		SET_BACKPOINTER_RECONCILE_PHYS(&new_v, 0);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  920  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  921  		if (!bpos_eq(old_bp[i].k.p, new_bp[i].k.p) ||
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  922  		    memcmp(&old_v, &new_v, sizeof(old_v)))
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  923  			return 0;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  924  	}
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  925  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  926  	for (i = 0; i < nr_old; i++) {
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  927  		unsigned old_phys = BACKPOINTER_RECONCILE_PHYS(&old_bp[i].v);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  928  		unsigned new_phys = BACKPOINTER_RECONCILE_PHYS(&new_bp[i].v);
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  929  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  930  		if (!old_phys && !new_phys)
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  931  			continue;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  932  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  933  		if (old_phys)
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  934  			try(bch2_btree_bit_mod_buffered(trans,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  935  					reconcile_work_phys_btree[old_phys],
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  936  					old_bp[i].k.p, false));
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  937  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  938  		if (new_phys)
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  939  			try(bch2_btree_bit_mod_buffered(trans,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  940  					reconcile_work_phys_btree[new_phys],
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  941  					new_bp[i].k.p, true));
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  942  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  943  		try(bch2_trans_update_buffered(trans,
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  944  				backpointer_btree(&new_bp[i].v),
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  945  				&new_bp[i].k_i));
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  946  	}
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  947  
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  948  	*handled = true;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  949  	return 0;
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  950  }
34c31c9633661a2 fs/bcachefs/alloc/buckets.c Codex           2026-04-13  951  

:::::: The code at line 902 was first introduced by commit
:::::: 34c31c9633661a2b7901a1712d8516633f4fdbb6 bcachefs: update reconcile-only backpointer flags in place

:::::: TO: Codex <jullanggit@proton.me>
:::::: CC: Jul Lang <jullanggit@proton.me>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
