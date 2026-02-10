Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC97431A558
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 11:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770723701; cv=none; b=PlIwxGW7WCry2SI14v3UByJv3Fo5r5ykgsXJOmd+TUIaq4k9WGxjeXOPOwDW1UpcRmujwg4ETNb/btTZxDS3sv8akFWl1Xi4dFfz2sdyr3jhOZ2pe+UF0QiuMzoTPrjemyLEdOPILi7+bs1pDqBtWKnEQ4CI4wQDPdh15fqvLts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770723701; c=relaxed/simple;
	bh=a1Xq+Whf1kQZxOVA6t2oOkDmpHegeBcp1zp7f3PiyAU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=j3oD2NIsr9EHO9MlTFHhGHAJ+Xj1lDUvwBV/mLFcPUov83UJDh+M2fYKdUAT3hfQhh8nsImaeo/XIWvswwMk9lo5cr30GGT6dOSLlwjkN+bxIFeYi+cStvZZO30Svd4KnTKnZqWUmYtARKq3tRtqpRiLDqmVCRBgtSC+iyv922I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htcHUEn+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htcHUEn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770723700; x=1802259700;
  h=date:from:to:cc:subject:message-id;
  bh=a1Xq+Whf1kQZxOVA6t2oOkDmpHegeBcp1zp7f3PiyAU=;
  b=htcHUEn+9Z76EXSTM6fxCf+sESSxC0K6gHce0/ZYq2Ihk6GeVcmdk+lo
   wlAX4HKe07Qo4GMcwR+ASXJ85n7fCy0T0gbr4RHe/GAVY/16/fHl6dz5z
   pMEZkjVbIU9AnzIYzJL/U8wcVnhfT7dNHK729X8MMdeWgZTAuWBpz7Pp+
   eYcN2zUHiAPX9ZmVnr7WvFE5XjNLSEP/Ihe41I+JNQh2zOr99GnpX88vT
   urD4kgok5/9LULIvONaedn7HNWHYsWEeCIx4fibxp8DMa1Z1t+Cv1twSH
   sRTq9EKEJFgudKLGCz5jryCMxB9rdFo57Oal644XKSRVeATQ2gG196KzB
   w==;
X-CSE-ConnectionGUID: Q459QdDdSkm9om8+DWd0Sg==
X-CSE-MsgGUID: Kp350YR3SUGTiOi9CjhwoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83287878"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83287878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 03:41:40 -0800
X-CSE-ConnectionGUID: KlNOX692TjKUdPOVSBdjtw==
X-CSE-MsgGUID: IQTuC+cuTg2/nD1zaDTXWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216858364"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Feb 2026 03:41:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpm7c-00000000oyK-0Br9;
	Tue, 10 Feb 2026 11:41:36 +0000
Date: Tue, 10 Feb 2026 19:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 528/799]
 fs/bcachefs/fs/namei.c:737:5-8: Unneeded variable: "ret". Return "0" on line
 763
Message-ID: <202602101919.3OEtBH9a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: ffb9000e105b51f652c471ecb2df248e51b809a9 [528/799] bcachefs: more errptr_try() conversions
config: arc-randconfig-r063-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101919.3OEtBH9a-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101919.3OEtBH9a-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs/namei.c:737:5-8: Unneeded variable: "ret". Return "0" on line 763

vim +737 fs/bcachefs/fs/namei.c

758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  728  
9b0d00a3693bbab fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  729  int __bch2_check_dirent_target(struct btree_trans *trans,
9b0d00a3693bbab fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  730  			       struct btree_iter *dirent_iter,
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  731  			       struct bkey_s_c_dirent d,
9b0d00a3693bbab fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  732  			       struct bch_inode_unpacked *target,
9b0d00a3693bbab fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  733  			       bool in_fsck)
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  734  {
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  735  	struct bch_fs *c = trans->c;
027a611a8fecaeb fs/bcachefs/namei.c    Kent Overstreet 2025-07-14  736  	CLASS(printbuf, buf)();
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20 @737  	int ret = 0;
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  738  
ffb9000e105b51f fs/bcachefs/fs/namei.c Kent Overstreet 2025-10-11  739  	try(bch2_check_dirent_inode_dirent(trans, d, target, in_fsck));
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  740  
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  741  	if (fsck_err_on(d.v->d_type != inode_d_type(target),
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  742  			trans, dirent_d_type_wrong,
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  743  			"incorrect d_type: got %s, should be %s:\n%s",
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  744  			bch2_d_type_str(d.v->d_type),
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  745  			bch2_d_type_str(inode_d_type(target)),
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  746  			(printbuf_reset(&buf),
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  747  			 bch2_bkey_val_to_text(&buf, c, d.s_c), buf.buf))) {
ffb9000e105b51f fs/bcachefs/fs/namei.c Kent Overstreet 2025-10-11  748  		struct bkey_i_dirent *n = errptr_try(bch2_trans_kmalloc(trans, bkey_bytes(d.k)));
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  749  
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  750  		bkey_reassemble(&n->k_i, d.s_c);
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  751  		n->v.d_type = inode_d_type(target);
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  752  		if (n->v.d_type == DT_SUBVOL) {
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  753  			n->v.d_parent_subvol = cpu_to_le32(target->bi_parent_subvol);
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  754  			n->v.d_child_subvol = cpu_to_le32(target->bi_subvol);
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  755  		} else {
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  756  			n->v.d_inum = cpu_to_le64(target->bi_inum);
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  757  		}
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  758  
ffb9000e105b51f fs/bcachefs/fs/namei.c Kent Overstreet 2025-10-11  759  		try(bch2_trans_update(trans, dirent_iter, &n->k_i,
ffb9000e105b51f fs/bcachefs/fs/namei.c Kent Overstreet 2025-10-11  760  				      BTREE_UPDATE_internal_snapshot_node));
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  761  	}
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  762  fsck_err:
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20 @763  	return ret;
758ea4ff812b4df fs/bcachefs/namei.c    Kent Overstreet 2025-03-20  764  }
4ba99dde330b2d4 fs/bcachefs/namei.c    Kent Overstreet 2025-05-19  765  

:::::: The code at line 737 was first introduced by commit
:::::: 758ea4ff812b4dfd4cef6dba0eb4b0025a7b147e bcachefs: Move bch2_check_dirent_target() to namei.c

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
