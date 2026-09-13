Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955062AD3C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Sep 2026 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789279256; cv=none; b=Z1z6rxaMWNbCkysA+kbqJ/UrkDcgSJutBw3nG3Dq8aN/Is0JPgSHZNGtw/VADgWskoidr2P2MgE0zRvlCRsCz1x8b26MyCoGFlVTvt83tASB4RZdiciX6kKDuc/WvmlJStouLAsmkc8tx5bZX0dy8AOvjhYYHB7ZorOH4009BsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789279256; c=relaxed/simple;
	bh=2J3NOqyWOf0t/Z5MWL2BzjgTYuRIr8vNp6a44NTkNrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNfPvH/u3+52DqSFd6gc0mWk28nuYEZTBZdij9fHcer3ajSCnh69fUIVz2rwUvC/iANavg6n4jZuWMaw9ZLkqusXZhLG8xYLFWgM0OGeXB6UfWQ+1Q+mbdr+e5vDaPjlAInxhmgmsTAZCPfZjRPMAzloNPloFFfCdz/kiMlcxUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A8sXMiPC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A8sXMiPC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789279253; x=1820815253;
  h=date:from:to:cc:subject:message-id;
  bh=2J3NOqyWOf0t/Z5MWL2BzjgTYuRIr8vNp6a44NTkNrg=;
  b=A8sXMiPCNjRRMuircl791/4KtDZy9RJWdlqQtj+CI7mXEjHxN9Fm0+At
   SyjP1+4TpHkaHEmpVH6F9qtcI4FEk7avY6llRX3NxOUMdCBfbUQjF6l0K
   sj4sGxlN8z2xzrOSY3w8bs184/ywSPtfGWV73ig3H5NDHBnYAahnxG+kf
   4v35zeBG758A7c0n7+XjrHXVjvcONI3QT4ekvOS6YLlisYnTONC6bbE4V
   C3F6zvPBfMsGNfb/0hxiXfbJFDThO7iKC+JHU5akcJpaf7Mgfejnpm7oX
   25dd0LkjOVWo/tim/HHTmFg8ElB2VR9CAa6xvabTJjYk2pjsl1F46eKON
   w==;
X-CSE-ConnectionGUID: GZquYfMFTeqMKbUR2GPbBA==
X-CSE-MsgGUID: z1E5GUW4Qu+IjBiVjrwwqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89558315"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89558315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 23:00:52 -0700
X-CSE-ConnectionGUID: rcNFiMTcTbmR4tmedLfQwA==
X-CSE-MsgGUID: fOd6HccETZu5i7C9I965iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="277577724"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Sep 2026 23:00:51 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5dGj-000000001XM-1DPw;
	Sun, 13 Sep 2026 06:00:49 +0000
Date: Sun, 13 Sep 2026 07:59:50 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 489/799]
 fs/bcachefs/data/reflink.c:719:1: warning: the frame size of 1064 bytes is
 larger than 1024 bytes
Message-ID: <202609130756.bovlHOst-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: b0d675b2a2498b67a10f17a11fff3490b7708376 [489/799] bcachefs: DEFINE_CLASS(btree_iter_uninit)
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260913/202609130756.bovlHOst-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260913/202609130756.bovlHOst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609130756.bovlHOst-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/reflink.c: In function 'bch2_remap_range':
>> fs/bcachefs/data/reflink.c:719:1: warning: the frame size of 1064 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     719 | }
         | ^


vim +719 fs/bcachefs/data/reflink.c

76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  556  
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  557  s64 bch2_remap_range(struct bch_fs *c,
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  558  		     subvol_inum dst_inum, u64 dst_offset,
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  559  		     subvol_inum src_inum, u64 src_offset,
68a2054d88f7cd fs/bcachefs/reflink.c      Kent Overstreet 2021-11-05  560  		     u64 remap_sectors,
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  561  		     u64 new_i_size, s64 *i_sectors_delta,
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  562  		     bool may_change_src_io_path_opts)
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  563  {
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  564  	struct bkey_s_c src_k;
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  565  	struct bkey_buf new_dst, new_src;
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  566  	struct bpos dst_start = POS(dst_inum.inum, dst_offset);
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  567  	struct bpos src_start = POS(src_inum.inum, src_offset);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  568  	struct bpos dst_end = dst_start, src_end = src_start;
649d9a4dfc8342 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-20  569  	struct bpos src_want;
fb3f57bb1177ae fs/bcachefs/reflink.c      Kent Overstreet 2023-10-20  570  	u64 dst_done = 0;
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  571  	u32 dst_snapshot, src_snapshot;
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  572  	bool reflink_p_may_update_opts_field =
6422bf8117cc2a fs/bcachefs/reflink.c      Kent Overstreet 2025-02-28  573  		!bch2_request_incompat_feature(c, bcachefs_metadata_version_reflink_p_may_update_opts);
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  574  	int ret = 0, ret2 = 0;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  575  
c9b1d94a2196fc fs/bcachefs/reflink.c      Kent Overstreet 2025-04-18  576  	if (!enumerated_ref_tryget(&c->writes, BCH_WRITE_REF_reflink))
09b9c72bd4b77a fs/bcachefs/reflink.c      Kent Overstreet 2025-05-28  577  		return bch_err_throw(c, erofs_no_writes);
2a9101a9898920 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-19  578  
1c3ff72c0fa946 fs/bcachefs/reflink.c      Kent Overstreet 2019-12-28  579  	bch2_check_set_feature(c, BCH_FEATURE_reflink);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  580  
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  581  	dst_end.offset += remap_sectors;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  582  	src_end.offset += remap_sectors;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  583  
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  584  	bch2_bkey_buf_init(&new_dst);
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  585  	bch2_bkey_buf_init(&new_src);
c7870044af329c fs/bcachefs/reflink.c      Kent Overstreet 2025-07-14  586  	CLASS(btree_trans, trans)(c);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  587  
b0d675b2a2498b fs/bcachefs/data/reflink.c Kent Overstreet 2025-08-08  588  	CLASS(btree_iter, src_iter)(trans, BTREE_ID_extents, src_start, BTREE_ITER_intent);
b0d675b2a2498b fs/bcachefs/data/reflink.c Kent Overstreet 2025-08-08  589  	CLASS(btree_iter, dst_iter)(trans, BTREE_ID_extents, dst_start, BTREE_ITER_intent);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  590  
549d173c1bd9b5 fs/bcachefs/reflink.c      Kent Overstreet 2022-07-17  591  	while ((ret == 0 ||
549d173c1bd9b5 fs/bcachefs/reflink.c      Kent Overstreet 2022-07-17  592  		bch2_err_matches(ret, BCH_ERR_transaction_restart)) &&
e88a75ebe86c1d fs/bcachefs/reflink.c      Kent Overstreet 2022-11-24  593  	       bkey_lt(dst_iter.pos, dst_end)) {
2e8f9d23cbc75a fs/bcachefs/reflink.c      Kent Overstreet 2021-05-17  594  		struct disk_reservation disk_res = { 0 };
2e8f9d23cbc75a fs/bcachefs/reflink.c      Kent Overstreet 2021-05-17  595  
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  596  		bch2_trans_begin(trans);
a8abd3a7f63efe fs/bcachefs/reflink.c      Kent Overstreet 2019-12-20  597  
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  598  		if (fatal_signal_pending(current)) {
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  599  			ret = -EINTR;
50dc0f692a0dbe fs/bcachefs/reflink.c      Kent Overstreet 2021-03-19  600  			break;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  601  		}
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  602  
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  603  		ret = bch2_subvolume_get_snapshot(trans, src_inum.subvol,
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  604  						  &src_snapshot);
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  605  		if (ret)
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  606  			continue;
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  607  
7c84dc243819ab fs/bcachefs/reflink.c      Kent Overstreet 2025-07-30  608  		bch2_btree_iter_set_snapshot(&src_iter, src_snapshot);
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  609  
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  610  		ret = bch2_subvolume_get_snapshot(trans, dst_inum.subvol,
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  611  						  &dst_snapshot);
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  612  		if (ret)
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  613  			continue;
6fed42bb7750e2 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-16  614  
7c84dc243819ab fs/bcachefs/reflink.c      Kent Overstreet 2025-07-30  615  		bch2_btree_iter_set_snapshot(&dst_iter, dst_snapshot);
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  616  
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  617  		if (dst_inum.inum < src_inum.inum) {
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  618  			/* Avoid some lock cycle transaction restarts */
7c84dc243819ab fs/bcachefs/reflink.c      Kent Overstreet 2025-07-30  619  			ret = bch2_btree_iter_traverse(&dst_iter);
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  620  			if (ret)
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  621  				continue;
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  622  		}
57f2d2097603fe fs/bcachefs/reflink.c      Kent Overstreet 2024-01-10  623  
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  624  		dst_done = dst_iter.pos.offset - dst_start.offset;
649d9a4dfc8342 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-20  625  		src_want = POS(src_start.inode, src_start.offset + dst_done);
7c84dc243819ab fs/bcachefs/reflink.c      Kent Overstreet 2025-07-30  626  		bch2_btree_iter_set_pos(&src_iter, src_want);
649d9a4dfc8342 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-20  627  
7c84dc243819ab fs/bcachefs/reflink.c      Kent Overstreet 2025-07-30  628  		src_k = get_next_src(&src_iter, src_end);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  629  		ret = bkey_err(src_k);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  630  		if (ret)
50dc0f692a0dbe fs/bcachefs/reflink.c      Kent Overstreet 2021-03-19  631  			continue;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  632  
e88a75ebe86c1d fs/bcachefs/reflink.c      Kent Overstreet 2022-11-24  633  		if (bkey_lt(src_want, src_iter.pos)) {
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  634  			ret = bch2_fpunch_at(trans, &dst_iter, dst_inum,
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  635  					min(dst_end.offset,
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  636  					    dst_iter.pos.offset +
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  637  					    src_iter.pos.offset - src_want.offset),
68a2054d88f7cd fs/bcachefs/reflink.c      Kent Overstreet 2021-11-05  638  					i_sectors_delta);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  639  			continue;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  640  		}
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  641  
801a3de6427924 fs/bcachefs/reflink.c      Kent Overstreet 2020-10-24  642  		if (src_k.k->type != KEY_TYPE_reflink_p) {
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  643  			bch2_btree_iter_set_pos_to_extent_start(&src_iter);
8c3f6da9fc526e fs/bcachefs/reflink.c      Kent Overstreet 2021-06-14  644  
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  645  			bch2_bkey_buf_reassemble(&new_src, c, src_k);
35189e09ab4678 fs/bcachefs/reflink.c      Kent Overstreet 2019-11-09  646  			src_k = bkey_i_to_s_c(new_src.k);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  647  
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  648  			ret = bch2_make_extent_indirect(trans, &src_iter,
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  649  						new_src.k,
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  650  						reflink_p_may_update_opts_field);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  651  			if (ret)
50dc0f692a0dbe fs/bcachefs/reflink.c      Kent Overstreet 2021-03-19  652  				continue;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  653  
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  654  			BUG_ON(src_k.k->type != KEY_TYPE_reflink_p);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  655  		}
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  656  
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  657  		if (src_k.k->type == KEY_TYPE_reflink_p) {
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  658  			struct bkey_s_c_reflink_p src_p =
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  659  				bkey_s_c_to_reflink_p(src_k);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  660  			struct bkey_i_reflink_p *dst_p =
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  661  				bkey_reflink_p_init(new_dst.k);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  662  
61f854da4cba97 fs/bcachefs/reflink.c      Kent Overstreet 2024-10-28  663  			u64 offset = REFLINK_P_IDX(src_p.v) +
649d9a4dfc8342 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-20  664  				(src_want.offset -
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  665  				 bkey_start_offset(src_k.k));
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  666  
61f854da4cba97 fs/bcachefs/reflink.c      Kent Overstreet 2024-10-28  667  			SET_REFLINK_P_IDX(&dst_p->v, offset);
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  668  
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  669  			if (reflink_p_may_update_opts_field &&
7098ba57c44386 fs/bcachefs/reflink.c      Kent Overstreet 2025-05-24  670  			    may_change_src_io_path_opts &&
7098ba57c44386 fs/bcachefs/reflink.c      Kent Overstreet 2025-05-24  671  			    REFLINK_P_MAY_UPDATE_OPTIONS(src_p.v))
ea4f9e75ecfb12 fs/bcachefs/reflink.c      Kent Overstreet 2024-11-06  672  				SET_REFLINK_P_MAY_UPDATE_OPTIONS(&dst_p->v, true);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  673  		} else {
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  674  			BUG();
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  675  		}
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  676  
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  677  		new_dst.k->k.p = dst_iter.pos;
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  678  		bch2_key_resize(&new_dst.k->k,
649d9a4dfc8342 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-20  679  				min(src_k.k->p.offset - src_want.offset,
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  680  				    dst_end.offset - dst_iter.pos.offset));
8c6d298ab22fc1 fs/bcachefs/reflink.c      Kent Overstreet 2021-03-12  681  
d83a3e491f7a4c fs/bcachefs/reflink.c      Kent Overstreet 2025-08-23  682  		ret = bch2_extent_update(trans, dst_inum, &dst_iter,
a1ee777bfcceeb fs/bcachefs/reflink.c      Kent Overstreet 2022-11-03  683  					 new_dst.k, &disk_res,
a6336910b1c307 fs/bcachefs/reflink.c      Kent Overstreet 2021-05-20  684  					 new_i_size, i_sectors_delta,
a983668fdef752 fs/bcachefs/reflink.c      Kent Overstreet 2025-08-23  685  					 true, 0);
2e8f9d23cbc75a fs/bcachefs/reflink.c      Kent Overstreet 2021-05-17  686  		bch2_disk_reservation_put(c, &disk_res);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  687  	}
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  688  
e88a75ebe86c1d fs/bcachefs/reflink.c      Kent Overstreet 2022-11-24  689  	BUG_ON(!ret && !bkey_eq(dst_iter.pos, dst_end));
e88a75ebe86c1d fs/bcachefs/reflink.c      Kent Overstreet 2022-11-24  690  	BUG_ON(bkey_gt(dst_iter.pos, dst_end));
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  691  
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  692  	dst_done = dst_iter.pos.offset - dst_start.offset;
67e0dd8f0d8b4b fs/bcachefs/reflink.c      Kent Overstreet 2021-08-30  693  	new_i_size = min(dst_iter.pos.offset << 9, new_i_size);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  694  
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  695  	do {
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  696  		struct bch_inode_unpacked inode_u;
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  697  
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  698  		bch2_trans_begin(trans);
700c25b32a776a fs/bcachefs/reflink.c      Kent Overstreet 2021-07-24  699  
b0d675b2a2498b fs/bcachefs/data/reflink.c Kent Overstreet 2025-08-08  700  		CLASS(btree_iter_uninit, inode_iter)(trans);
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  701  		ret2 = bch2_inode_peek(trans, &inode_iter, &inode_u,
5dd8c60e1e0448 fs/bcachefs/reflink.c      Kent Overstreet 2024-04-07  702  				       dst_inum, BTREE_ITER_intent);
76426098e419c1 fs/bcachefs/reflink.c      Kent Overstreet 2019-08-16  703  
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  704  		if (!ret2 &&
677fc0562a237f fs/bcachefs/reflink.c      Kent Overstreet 2019-11-04  705  		    inode_u.bi_size < new_i_size) {
677fc0562a237f fs/bcachefs/reflink.c      Kent Overstreet 2019-11-04  706  			inode_u.bi_size = new_i_size;
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  707  			ret2  = bch2_inode_write(trans, &inode_iter, &inode_u) ?:
6bd68ec266ad71 fs/bcachefs/reflink.c      Kent Overstreet 2023-09-12  708  				bch2_trans_commit(trans, NULL, NULL,
cb52d23e77a6e5 fs/bcachefs/reflink.c      Kent Overstreet 2023-11-11  709  						  BCH_TRANS_COMMIT_no_enospc);
677fc0562a237f fs/bcachefs/reflink.c      Kent Overstreet 2019-11-04  710  		}
549d173c1bd9b5 fs/bcachefs/reflink.c      Kent Overstreet 2022-07-17  711  	} while (bch2_err_matches(ret2, BCH_ERR_transaction_restart));
d83a3e491f7a4c fs/bcachefs/reflink.c      Kent Overstreet 2025-08-23  712  
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  713  	bch2_bkey_buf_exit(&new_src, c);
07a1006ae81580 fs/bcachefs/reflink.c      Kent Overstreet 2020-12-17  714  	bch2_bkey_buf_exit(&new_dst, c);
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  715  
c9b1d94a2196fc fs/bcachefs/reflink.c      Kent Overstreet 2025-04-18  716  	enumerated_ref_put(&c->writes, BCH_WRITE_REF_reflink);
2a9101a9898920 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-19  717  
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10  718  	return dst_done ?: ret ?: ret2;
2e87eae1fb7a61 fs/bcachefs/reflink.c      Kent Overstreet 2019-10-10 @719  }
3d338378d76391 fs/bcachefs/reflink.c      Kent Overstreet 2024-10-31  720  

:::::: The code at line 719 was first introduced by commit
:::::: 2e87eae1fb7a61e72d98af9c0ef8cbaad1a6d497 bcachefs: Convert bch2_fpunch to bch2_extent_update()

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
