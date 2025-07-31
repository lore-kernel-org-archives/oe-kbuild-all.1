Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE902F24
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Jul 2025 14:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753971960; cv=none; b=g3MtcENFmEq6duPH0zDFfWPt2I2Er0QYgT84BxmHZqp2u7vc8G+1sS6qwa9n3IaONr4JnZf2Am/oO2g416bOMFkOynVIxPTI1BiQZPiL9yxaDaigH3JWi1i/rtApDmyCgv1nDwDHYyQqM8C4ZNXKmf+jbyXlf9F54EaMhAY68iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753971960; c=relaxed/simple;
	bh=hwjxx9Z2PS6jJZ8n3YUDxNGgDYttahq05CDNngwxJUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IngXAZCz+ndW2ufMQXU9urhWILlC8K0dWjNOcr8z4yH6k2FwmJNClyp4MgFDwUUtXWNLdyrD8fO3z/eP89BPHcnRQGu9kTaz+Ht20YA+gVL5A00cZ2w4xIUYkca191XUM7ZsKGhtU+mR9TGGczyMlsppnCXFEKCezA2o+yb1kuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGtAHZaU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGtAHZaU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971958; x=1785507958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hwjxx9Z2PS6jJZ8n3YUDxNGgDYttahq05CDNngwxJUA=;
  b=eGtAHZaUI8ykKz01eo/gWW5qEqtnO8CfqK05flk57zysVoFqkU5Mi7YH
   e2zxjJvwZNJBiGHB6cGeLI/5KCQLtwgnbuv945zYo605S0OB7G993IFak
   ThHngzS7/Zuw/DQYqDIM46vMtqbQntjb2Zhj5T+ob6an0qmhvkIpxePGB
   nstVZGbTBYQOnic6Zx491NmkWMwK602fcsvbi4aD/ZqBiz47UVQW9FvlS
   FVysBkiPpjk0l6JOpMGUFQFDsKqS9Mrsr78y6L1BF3YHP+eblKzZCnLg+
   2jPJmsYqrccWth9R5lA7SBHOjXA0bxb6i6C5zuE/RZ4cgJuAHWNL4kBrM
   w==;
X-CSE-ConnectionGUID: 9ysK/n4zRqiVSlmJquFF0w==
X-CSE-MsgGUID: YsSNmCg9RqS4KQl0u60Byw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56182084"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="56182084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:25:57 -0700
X-CSE-ConnectionGUID: kFGw0Ig3Qb+TWwgdI0+xhw==
X-CSE-MsgGUID: WZHWrb/cSgSY+yIR/DgnfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="163727262"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Jul 2025 07:25:56 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhUEE-0003qC-0Q;
	Thu, 31 Jul 2025 14:25:54 +0000
Date: Thu, 31 Jul 2025 22:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 232/232]
 fs/bcachefs/subvolume.c:176:1: warning: the frame size of 1536 bytes is
 larger than 1280 bytes
Message-ID: <202507312231.U4LZb5ZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   74b85025fe4d4fd02655a01d53c8b492ae4be913
commit: 74b85025fe4d4fd02655a01d53c8b492ae4be913 [232/232] bcachefs: Kill most bch2_bkey_get_iter() uses
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250731/202507312231.U4LZb5ZB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250731/202507312231.U4LZb5ZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507312231.U4LZb5ZB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/subvolume.c: In function 'check_subvol':
>> fs/bcachefs/subvolume.c:176:1: warning: the frame size of 1536 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     176 | }
         | ^


vim +176 fs/bcachefs/subvolume.c

b26d79147f5ffa Kent Overstreet 2024-01-21   43  
4ab35c34d5ab25 Kent Overstreet 2022-07-14   44  static int check_subvol(struct btree_trans *trans,
6738dd19db5c96 Kent Overstreet 2022-07-17   45  			struct btree_iter *iter,
6738dd19db5c96 Kent Overstreet 2022-07-17   46  			struct bkey_s_c k)
4ab35c34d5ab25 Kent Overstreet 2022-07-14   47  {
1c59b483a3d249 Kent Overstreet 2023-03-29   48  	struct bch_fs *c = trans->c;
d86b99c3f773c4 Kent Overstreet 2025-07-15   49  	struct bch_subvolume subvol;
35f1a5034d8141 Kent Overstreet 2022-07-14   50  	struct bch_snapshot snapshot;
d714e058e51bd3 Kent Overstreet 2025-07-14   51  	CLASS(printbuf, buf)();
35f1a5034d8141 Kent Overstreet 2022-07-14   52  	unsigned snapid;
1c59b483a3d249 Kent Overstreet 2023-03-29   53  	int ret = 0;
4ab35c34d5ab25 Kent Overstreet 2022-07-14   54  
4ab35c34d5ab25 Kent Overstreet 2022-07-14   55  	if (k.k->type != KEY_TYPE_subvolume)
4ab35c34d5ab25 Kent Overstreet 2022-07-14   56  		return 0;
4ab35c34d5ab25 Kent Overstreet 2022-07-14   57  
d86b99c3f773c4 Kent Overstreet 2025-07-15   58  	bkey_val_copy(&subvol, bkey_s_c_to_subvolume(k));
d86b99c3f773c4 Kent Overstreet 2025-07-15   59  	snapid = le32_to_cpu(subvol.snapshot);
8e877caaad8185 Kent Overstreet 2023-08-16   60  	ret = bch2_snapshot_lookup(trans, snapid, &snapshot);
35f1a5034d8141 Kent Overstreet 2022-07-14   61  
1c59b483a3d249 Kent Overstreet 2023-03-29   62  	if (bch2_err_matches(ret, ENOENT))
d4b30ed90c778b Kent Overstreet 2025-05-14   63  		return bch2_run_print_explicit_recovery_pass(c,
3c24020119a5f5 Kent Overstreet 2025-04-26   64  					BCH_RECOVERY_PASS_reconstruct_snapshots) ?: ret;
35f1a5034d8141 Kent Overstreet 2022-07-14   65  	if (ret)
35f1a5034d8141 Kent Overstreet 2022-07-14   66  		return ret;
4ab35c34d5ab25 Kent Overstreet 2022-07-14   67  
d86b99c3f773c4 Kent Overstreet 2025-07-15   68  	if (BCH_SUBVOLUME_UNLINKED(&subvol)) {
4ab35c34d5ab25 Kent Overstreet 2022-07-14   69  		ret = bch2_subvolume_delete(trans, iter->pos.offset);
e46c181af9e230 Kent Overstreet 2023-09-11   70  		bch_err_msg(c, ret, "deleting subvolume %llu", iter->pos.offset);
86cf5b626ea5af Kent Overstreet 2025-06-26   71  		return ret ?: bch_err_throw(c, transaction_restart_nested);
4ab35c34d5ab25 Kent Overstreet 2022-07-14   72  	}
4ab35c34d5ab25 Kent Overstreet 2022-07-14   73  
d86b99c3f773c4 Kent Overstreet 2025-07-15   74  	if (fsck_err_on(k.k->p.offset == BCACHEFS_ROOT_SUBVOL &&
d86b99c3f773c4 Kent Overstreet 2025-07-15   75  			subvol.fs_path_parent,
a850bde6498b46 Kent Overstreet 2024-02-08   76  			trans, subvol_root_fs_path_parent_nonzero,
b8628a2529e7d6 Kent Overstreet 2024-02-08   77  			"root subvolume has nonzero fs_path_parent\n%s",
b8628a2529e7d6 Kent Overstreet 2024-02-08   78  			(bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
b8628a2529e7d6 Kent Overstreet 2024-02-08   79  		struct bkey_i_subvolume *n =
d86b99c3f773c4 Kent Overstreet 2025-07-15   80  			bch2_bkey_make_mut_typed(trans, iter, &k, 0, subvolume);
b8628a2529e7d6 Kent Overstreet 2024-02-08   81  		ret = PTR_ERR_OR_ZERO(n);
b8628a2529e7d6 Kent Overstreet 2024-02-08   82  		if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30   83  			return ret;
b8628a2529e7d6 Kent Overstreet 2024-02-08   84  
b8628a2529e7d6 Kent Overstreet 2024-02-08   85  		n->v.fs_path_parent = 0;
b8628a2529e7d6 Kent Overstreet 2024-02-08   86  	}
b8628a2529e7d6 Kent Overstreet 2024-02-08   87  
d86b99c3f773c4 Kent Overstreet 2025-07-15   88  	if (subvol.fs_path_parent) {
74b85025fe4d4f Kent Overstreet 2025-07-30   89  		CLASS(btree_iter, subvol_children_iter)(trans,
74b85025fe4d4f Kent Overstreet 2025-07-30   90  					BTREE_ID_subvolume_children, subvolume_children_pos(k), 0);
74b85025fe4d4f Kent Overstreet 2025-07-30   91  		struct bkey_s_c subvol_children_k = bch2_btree_iter_peek_slot(&subvol_children_iter);
b26d79147f5ffa Kent Overstreet 2024-01-21   92  		ret = bkey_err(subvol_children_k);
b26d79147f5ffa Kent Overstreet 2024-01-21   93  		if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30   94  			return ret;
b26d79147f5ffa Kent Overstreet 2024-01-21   95  
b26d79147f5ffa Kent Overstreet 2024-01-21   96  		if (fsck_err_on(subvol_children_k.k->type != KEY_TYPE_set,
a850bde6498b46 Kent Overstreet 2024-02-08   97  				trans, subvol_children_not_set,
b26d79147f5ffa Kent Overstreet 2024-01-21   98  				"subvolume not set in subvolume_children btree at %llu:%llu\n%s",
74b85025fe4d4f Kent Overstreet 2025-07-30   99  				subvol_children_iter.pos.inode, subvol_children_iter.pos.offset,
b26d79147f5ffa Kent Overstreet 2024-01-21  100  				(printbuf_reset(&buf),
b26d79147f5ffa Kent Overstreet 2024-01-21  101  				 bch2_bkey_val_to_text(&buf, c, k), buf.buf))) {
74b85025fe4d4f Kent Overstreet 2025-07-30  102  			ret = bch2_btree_bit_mod(trans, BTREE_ID_subvolume_children, subvol_children_iter.pos, true);
b26d79147f5ffa Kent Overstreet 2024-01-21  103  			if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30  104  				return ret;
b26d79147f5ffa Kent Overstreet 2024-01-21  105  		}
b26d79147f5ffa Kent Overstreet 2024-01-21  106  	}
b26d79147f5ffa Kent Overstreet 2024-01-21  107  
4c20278eb18ac2 Kent Overstreet 2024-02-05  108  	struct bch_inode_unpacked inode;
951dd86e7c59a6 Kent Overstreet 2024-09-23  109  	ret = bch2_inode_find_by_inum_nowarn_trans(trans,
d86b99c3f773c4 Kent Overstreet 2025-07-15  110  				    (subvol_inum) { k.k->p.offset, le64_to_cpu(subvol.inode) },
951dd86e7c59a6 Kent Overstreet 2024-09-23  111  				    &inode);
951dd86e7c59a6 Kent Overstreet 2024-09-23  112  	if (!ret) {
d86b99c3f773c4 Kent Overstreet 2025-07-15  113  		if (fsck_err_on(inode.bi_subvol != k.k->p.offset,
a850bde6498b46 Kent Overstreet 2024-02-08  114  				trans, subvol_root_wrong_bi_subvol,
4c20278eb18ac2 Kent Overstreet 2024-02-05  115  				"subvol root %llu:%u has wrong bi_subvol field: got %u, should be %llu",
951dd86e7c59a6 Kent Overstreet 2024-09-23  116  				inode.bi_inum, inode.bi_snapshot,
d86b99c3f773c4 Kent Overstreet 2025-07-15  117  				inode.bi_subvol, k.k->p.offset)) {
d86b99c3f773c4 Kent Overstreet 2025-07-15  118  			inode.bi_subvol = k.k->p.offset;
d86b99c3f773c4 Kent Overstreet 2025-07-15  119  			inode.bi_snapshot = le32_to_cpu(subvol.snapshot);
72350ee0ea22c0 Kent Overstreet 2024-09-30  120  			ret = __bch2_fsck_write_inode(trans, &inode);
4c20278eb18ac2 Kent Overstreet 2024-02-05  121  			if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30  122  				return ret;
4c20278eb18ac2 Kent Overstreet 2024-02-05  123  		}
951dd86e7c59a6 Kent Overstreet 2024-09-23  124  	} else if (bch2_err_matches(ret, ENOENT)) {
951dd86e7c59a6 Kent Overstreet 2024-09-23  125  		if (fsck_err(trans, subvol_to_missing_root,
951dd86e7c59a6 Kent Overstreet 2024-09-23  126  			     "subvolume %llu points to missing subvolume root %llu:%u",
d86b99c3f773c4 Kent Overstreet 2025-07-15  127  			     k.k->p.offset, le64_to_cpu(subvol.inode),
d86b99c3f773c4 Kent Overstreet 2025-07-15  128  			     le32_to_cpu(subvol.snapshot))) {
29cc6fb7c068c7 Kent Overstreet 2025-06-02  129  			/*
29cc6fb7c068c7 Kent Overstreet 2025-06-02  130  			 * Recreate - any contents that are still disconnected
29cc6fb7c068c7 Kent Overstreet 2025-06-02  131  			 * will then get reattached under lost+found
29cc6fb7c068c7 Kent Overstreet 2025-06-02  132  			 */
29cc6fb7c068c7 Kent Overstreet 2025-06-02  133  			bch2_inode_init_early(c, &inode);
29cc6fb7c068c7 Kent Overstreet 2025-06-02  134  			bch2_inode_init_late(c, &inode, bch2_current_time(c),
29cc6fb7c068c7 Kent Overstreet 2025-06-02  135  					     0, 0, S_IFDIR|0700, 0, NULL);
d86b99c3f773c4 Kent Overstreet 2025-07-15  136  			inode.bi_inum			= le64_to_cpu(subvol.inode);
d86b99c3f773c4 Kent Overstreet 2025-07-15  137  			inode.bi_snapshot		= le32_to_cpu(subvol.snapshot);
29cc6fb7c068c7 Kent Overstreet 2025-06-02  138  			inode.bi_subvol			= k.k->p.offset;
d86b99c3f773c4 Kent Overstreet 2025-07-15  139  			inode.bi_parent_subvol		= le32_to_cpu(subvol.fs_path_parent);
29cc6fb7c068c7 Kent Overstreet 2025-06-02  140  			ret = __bch2_fsck_write_inode(trans, &inode);
29cc6fb7c068c7 Kent Overstreet 2025-06-02  141  			if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30  142  				return ret;
951dd86e7c59a6 Kent Overstreet 2024-09-23  143  		}
951dd86e7c59a6 Kent Overstreet 2024-09-23  144  	} else {
74b85025fe4d4f Kent Overstreet 2025-07-30  145  		return ret;
951dd86e7c59a6 Kent Overstreet 2024-09-23  146  	}
4c20278eb18ac2 Kent Overstreet 2024-02-05  147  
d86b99c3f773c4 Kent Overstreet 2025-07-15  148  	if (!BCH_SUBVOLUME_SNAP(&subvol)) {
d86b99c3f773c4 Kent Overstreet 2025-07-15  149  		u32 snapshot_root = bch2_snapshot_root(c, le32_to_cpu(subvol.snapshot));
18dad454cd16cb Kent Overstreet 2025-05-24  150  		u32 snapshot_tree = bch2_snapshot_tree(c, snapshot_root);
8479938d7a0f6c Kent Overstreet 2023-07-12  151  
18dad454cd16cb Kent Overstreet 2025-05-24  152  		struct bch_snapshot_tree st;
cb1b479dc1c78d Kent Overstreet 2023-04-28  153  		ret = bch2_snapshot_tree_lookup(trans, snapshot_tree, &st);
1c59b483a3d249 Kent Overstreet 2023-03-29  154  
1c59b483a3d249 Kent Overstreet 2023-03-29  155  		bch2_fs_inconsistent_on(bch2_err_matches(ret, ENOENT), c,
1c59b483a3d249 Kent Overstreet 2023-03-29  156  				"%s: snapshot tree %u not found", __func__, snapshot_tree);
1c59b483a3d249 Kent Overstreet 2023-03-29  157  
1c59b483a3d249 Kent Overstreet 2023-03-29  158  		if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30  159  			return ret;
1c59b483a3d249 Kent Overstreet 2023-03-29  160  
d86b99c3f773c4 Kent Overstreet 2025-07-15  161  		if (fsck_err_on(le32_to_cpu(st.master_subvol) != k.k->p.offset,
a850bde6498b46 Kent Overstreet 2024-02-08  162  				trans, subvol_not_master_and_not_snapshot,
1c59b483a3d249 Kent Overstreet 2023-03-29  163  				"subvolume %llu is not set as snapshot but is not master subvolume",
1c59b483a3d249 Kent Overstreet 2023-03-29  164  				k.k->p.offset)) {
1c59b483a3d249 Kent Overstreet 2023-03-29  165  			struct bkey_i_subvolume *s =
d86b99c3f773c4 Kent Overstreet 2025-07-15  166  				bch2_bkey_make_mut_typed(trans, iter, &k, 0, subvolume);
1c59b483a3d249 Kent Overstreet 2023-03-29  167  			ret = PTR_ERR_OR_ZERO(s);
1c59b483a3d249 Kent Overstreet 2023-03-29  168  			if (ret)
74b85025fe4d4f Kent Overstreet 2025-07-30  169  				return ret;
1c59b483a3d249 Kent Overstreet 2023-03-29  170  
1c59b483a3d249 Kent Overstreet 2023-03-29  171  			SET_BCH_SUBVOLUME_SNAP(&s->v, true);
1c59b483a3d249 Kent Overstreet 2023-03-29  172  		}
1c59b483a3d249 Kent Overstreet 2023-03-29  173  	}
1c59b483a3d249 Kent Overstreet 2023-03-29  174  fsck_err:
1c59b483a3d249 Kent Overstreet 2023-03-29  175  	return ret;
4ab35c34d5ab25 Kent Overstreet 2022-07-14 @176  }
4ab35c34d5ab25 Kent Overstreet 2022-07-14  177  

:::::: The code at line 176 was first introduced by commit
:::::: 4ab35c34d5ab258fdd7325315fe5d94699e51eb4 bcachefs: Fix subvol/snapshot deleting in recovery

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
