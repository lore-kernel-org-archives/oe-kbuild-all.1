Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2B132D45C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 06:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770705571; cv=none; b=KdQUGzeldeZMgqe/2Fjcs7LbCRKK25qOUiUh9RvCGzIALqDzqUYMURvdSLD1uYvR0PnahES1xO/u91QclmyV7UUDv5e1rVHIHevg3YrW4+RwdKBWguczbB2Vz1VOl+Z+8gxruvShMBMVGM/e2D6PfyWiTrdbfG+j6s5+f7ZOcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770705571; c=relaxed/simple;
	bh=htdEMPcUOHKwMwIsURO0HhcJzjSJv4BvM68mM0RtX8I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EoyAsWUYT3JhPJ4Nh7lkW5kZzPnK6lshOgsNETuc7/YYkRzkRrY+DailXEntLHfX2WV8NBRBMBBhvTfBbuBsdmAkcr8AxJ0Vp4Xv/r2245zeQCcmfUtxhF/TiJLumAEs9LN2R72ffvkrsQWeBe4C8wFlou/9qQin2X5+mPJ5cXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKX0fVW1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKX0fVW1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770705570; x=1802241570;
  h=date:from:to:cc:subject:message-id;
  bh=htdEMPcUOHKwMwIsURO0HhcJzjSJv4BvM68mM0RtX8I=;
  b=kKX0fVW1V9f4v5FW1l64v3dm0kf3pyj8cES8Zkp7RfTtUfBK/OML5AP7
   1bnyNhzXFAMl7paqcbAhbXu6gnN7t1iiGkR1AAEhokpitSEPZsAEC/pBQ
   uVt0jHVqfEh1l/1GIUsla5Ly6h8fwyZ3LiJx/zMYnYNF+iJZytgCxwuv9
   3KT0G7XQ25dM5COWCKDautT5CerlpsKD43NKfofoXR6SOAVq4FDYt0c//
   GDgavP6w2fnlFfwUUYWxWXShQ3O2LIfV+3e4WsRCakD4dvqVsGUkyQ0gm
   +YQuw2ORFgB7b3vRgeRY9IY8uDMVxqFr85rJwoKFrvxUgePJSq5ypMNkT
   w==;
X-CSE-ConnectionGUID: mkM9nw+fTqKTk3Ehh2LK7Q==
X-CSE-MsgGUID: lRimQrwhQ+6I/Oey2z5UlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="72009669"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="72009669"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 22:39:28 -0800
X-CSE-ConnectionGUID: CdjAQno8R3qRGuM1ij/Lfw==
X-CSE-MsgGUID: tDv3ZvWBRw2oIc3l5dxOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="215999491"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 22:39:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphP9-00000000ojE-39Qp;
	Tue, 10 Feb 2026 06:39:23 +0000
Date: Tue, 10 Feb 2026 14:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 493/799]
 fs/bcachefs/btree/check.c:266:5-8: Unneeded variable: "ret". Return "0" on
 line 286
Message-ID: <202602101423.kPrE40p0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 0e99a115359559dd47510e6779d3c9b927e72397 [493/799] bcachefs: btree check cleanup
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101423.kPrE40p0-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101423.kPrE40p0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/btree/check.c:266:5-8: Unneeded variable: "ret". Return "0" on line 286

vim +266 fs/bcachefs/btree/check.c

1c6fdbd8f2465d fs/bcachefs/btree_gc.c    Kent Overstreet 2017-03-16  262  
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  263  static int btree_check_root_boundaries(struct btree_trans *trans, struct btree *b)
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  264  {
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  265  	struct bch_fs *c = trans->c;
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01 @266  	int ret = 0;
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  267  
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  268  	BUG_ON(b->key.k.type == KEY_TYPE_btree_ptr_v2 &&
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  269  	       !bpos_eq(bkey_i_to_btree_ptr_v2(&b->key)->v.min_key,
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  270  			b->data->min_key));
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  271  
0e99a115359559 fs/bcachefs/btree/check.c Kent Overstreet 2025-10-06  272  	CLASS(printbuf, buf)();
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  273  	prt_str(&buf, "  at ");
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  274  	bch2_btree_pos_to_text(&buf, c, b);
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  275  
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  276  	if (mustfix_fsck_err_on(!bpos_eq(b->data->min_key, POS_MIN),
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  277  				trans, btree_node_topology_bad_root_min_key,
0e99a115359559 fs/bcachefs/btree/check.c Kent Overstreet 2025-10-06  278  			     "btree root with incorrect min_key%s", buf.buf))
0e99a115359559 fs/bcachefs/btree/check.c Kent Overstreet 2025-10-06  279  		try(set_node_min(c, b, POS_MIN));
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  280  
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  281  	if (mustfix_fsck_err_on(!bpos_eq(b->data->max_key, SPOS_MAX),
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  282  				trans, btree_node_topology_bad_root_max_key,
0e99a115359559 fs/bcachefs/btree/check.c Kent Overstreet 2025-10-06  283  			     "btree root with incorrect min_key%s", buf.buf))
0e99a115359559 fs/bcachefs/btree/check.c Kent Overstreet 2025-10-06  284  		try(set_node_max(c, b, SPOS_MAX));
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  285  fsck_err:
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01 @286  	return ret;
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  287  }
7a46fa26bf1217 fs/bcachefs/btree_gc.c    Kent Overstreet 2025-08-01  288  

:::::: The code at line 266 was first introduced by commit
:::::: 7a46fa26bf1217fb7a63cf0a54a33ca070c45b4e bcachefs: btree_check_root_boundaries()

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
