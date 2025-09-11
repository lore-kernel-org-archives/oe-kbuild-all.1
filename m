Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD86B2E36E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757584782; cv=none; b=ewW/fqhr2mA/dkOuPvIKnRJNbWN4REU2UHNCCrd8d8KVx/oYplYEZ7m9+k5gzcECeZC8il4x3UdnRi1bxWQZhmteOuAhADVm/9fLtG22LoYeY5eeYiF78JlMPG3zHhAv/VhWpH4gmMS/fP8nqNaUYPOCUNxFt5kW66wjZgAgkcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757584782; c=relaxed/simple;
	bh=vjZ8/5qclFVog6Olz8J7lfYeFEEbnzkxEVazBWgUrzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bLP2PbxAfsCtp9eeWr57+ZeqBjyhDBRZgw5kipbruwuilBMGi65OBDllAz+/gy16F+LyhAScojhlk2nWkLZ0cw6d3e93gSIjjdzc7Wur2tCIPXjBw1pK7Kf0xIwfOENc1vi/WqKj2HlaDnu8n3UBveg/UO/cJyA2tVzYvYSWYHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cq9OjcVW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cq9OjcVW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757584781; x=1789120781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vjZ8/5qclFVog6Olz8J7lfYeFEEbnzkxEVazBWgUrzA=;
  b=cq9OjcVWIcpq/Jm66lBJ+rV0kLS/jxZ5SNSFPP9YNIb8fJ4R1tSLoBZO
   8kTwmL0IDhPwWlmWzj/DZ9jwinIx2tj/LPkvPcch/AvXKbuZMZCkzWX/H
   UTItKZg/S81YMowXNLtn8+ybThH2W1w9zVsBRVd6wVfd1NiNAxMNLzGV0
   XFCOUvYKkERmPLNvJjinmrrTyTiqvZC9KD4ogQ0e6uuRe9Vk4G/WPK0/9
   gtF9z5fIQGDEgqBX8Lw0N4JhqyVYBPdhU9XYAV5u+eU9XlwAAM91GMH5A
   b71m283RNwcYvD9WUXWZKilf+moEvQyAcTCxwkO4I71ooMyD7OpqgYelt
   g==;
X-CSE-ConnectionGUID: blVoRzqcSRaTaDcCymfF5A==
X-CSE-MsgGUID: /6wcLq37RmGnz+dYkQ5Y/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77363917"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77363917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 02:59:41 -0700
X-CSE-ConnectionGUID: FZEknPRYQki7zJKQblbkXw==
X-CSE-MsgGUID: OmPPRFrYQByA/dqvsvPoUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="173216832"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Sep 2025 02:59:39 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwe5Y-0000DA-35;
	Thu, 11 Sep 2025 09:59:36 +0000
Date: Thu, 11 Sep 2025 17:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 316/409]
 fs/bcachefs/backpointers.c:967:4: error: implicit declaration of function
 '__WARN'; did you mean 'WARN'?
Message-ID: <202509111753.zBDtec2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   6d7c2990a1637e9cd663b576c325281ab921a006
commit: 715d66cf1ceae5e3ca2290bb5490ff7a81aa5ac2 [316/409] bcachefs: Fix infinite loop in backpointers fsck on upgrade
config: sh-randconfig-001-20250911 (https://download.01.org/0day-ci/archive/20250911/202509111753.zBDtec2B-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509111753.zBDtec2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509111753.zBDtec2B-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/backpointers.c: In function 'check_bucket_backpointer_mismatch':
>> fs/bcachefs/backpointers.c:967:4: error: implicit declaration of function '__WARN'; did you mean 'WARN'? [-Werror=implicit-function-declaration]
     967 |    __WARN();
         |    ^~~~~~
         |    WARN
   cc1: some warnings being treated as errors


vim +967 fs/bcachefs/backpointers.c

   864	
   865	static int check_bucket_backpointers_to_extents(struct btree_trans *, struct bch_dev *, struct bpos,
   866							struct bkey_buf *last_flushed);
   867	
   868	static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
   869						     bool *had_mismatch,
   870						     struct bkey_buf *last_flushed,
   871						     struct bpos *last_pos,
   872						     unsigned *nr_iters)
   873	{
   874		struct bch_fs *c = trans->c;
   875		struct bch_alloc_v4 a_convert;
   876		const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
   877		bool need_commit = false;
   878	
   879		if (!bpos_eq(*last_pos, alloc_k.k->p))
   880			*nr_iters = 0;
   881	
   882		*last_pos = alloc_k.k->p;
   883	
   884		*had_mismatch = false;
   885	
   886		if (a->data_type == BCH_DATA_sb ||
   887		    a->data_type == BCH_DATA_journal ||
   888		    a->data_type == BCH_DATA_parity)
   889			return 0;
   890	
   891		u32 sectors[ALLOC_SECTORS_NR];
   892		memset(sectors, 0, sizeof(sectors));
   893	
   894		CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
   895		if (!ca)
   896			return 0;
   897	
   898		struct bkey_s_c bp_k;
   899		int ret = 0;
   900		for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   901					bucket_pos_to_bp_start(ca, alloc_k.k->p),
   902					bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   903			if (bp_k.k->type != KEY_TYPE_backpointer)
   904				continue;
   905	
   906			struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
   907	
   908			if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
   909			    (bp.v->bucket_gen != a->gen ||
   910			     bp.v->pad)) {
   911				ret = bch2_backpointer_del(trans, bp_k.k->p);
   912				if (ret)
   913					return ret;
   914	
   915				need_commit = true;
   916				continue;
   917			}
   918	
   919			if (bp.v->bucket_gen != a->gen)
   920				continue;
   921	
   922			int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
   923			if (alloc_counter < 0)
   924				continue;
   925	
   926			sectors[alloc_counter] += bp.v->bucket_len;
   927		};
   928		if (ret)
   929			return ret;
   930	
   931		if (need_commit) {
   932			ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
   933			if (ret)
   934				return ret;
   935		}
   936	
   937		if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
   938		    sectors[ALLOC_cached] > a->cached_sectors ||
   939		    sectors[ALLOC_stripe] > a->stripe_sectors) {
   940			if (*nr_iters) {
   941				CLASS(printbuf, buf)();
   942				bch2_log_msg_start(c, &buf);
   943	
   944				prt_printf(&buf, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
   945					   "bucket %llu:%llu data type %s, counters\n",
   946					   alloc_k.k->p.inode,
   947					   alloc_k.k->p.offset,
   948					   __bch2_data_types[a->data_type]);
   949				if (sectors[ALLOC_dirty]  > a->dirty_sectors)
   950					prt_printf(&buf, "dirty: %u > %u\n",
   951						   sectors[ALLOC_dirty], a->dirty_sectors);
   952				if (sectors[ALLOC_cached] > a->cached_sectors)
   953					prt_printf(&buf, "cached: %u > %u\n",
   954						   sectors[ALLOC_cached], a->cached_sectors);
   955				if (sectors[ALLOC_stripe] > a->stripe_sectors)
   956					prt_printf(&buf, "stripe: %u > %u\n",
   957						   sectors[ALLOC_stripe], a->stripe_sectors);
   958	
   959				for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
   960							bucket_pos_to_bp_start(ca, alloc_k.k->p),
   961							bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
   962					bch2_bkey_val_to_text(&buf, c, bp_k);
   963					prt_newline(&buf);
   964				}
   965	
   966				bch2_print_str(c, KERN_ERR, buf.buf);
 > 967				__WARN();
   968				return ret;
   969			}
   970	
   971			*nr_iters += 1;
   972	
   973			return check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p, last_flushed) ?:
   974				bch_err_throw(c, transaction_restart_nested);
   975		}
   976	
   977		if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
   978		    sectors[ALLOC_cached] != a->cached_sectors ||
   979		    sectors[ALLOC_stripe] != a->stripe_sectors) {
   980			/*
   981			 * Post 1.14 upgrade, we assume that backpointers are mostly
   982			 * correct and a sector count mismatch is probably due to a
   983			 * write buffer race
   984			 *
   985			 * Pre upgrade, we expect all the buckets to be wrong, a write
   986			 * buffer flush is pointless:
   987			 */
   988			if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen) {
   989				ret = bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed);
   990				if (ret)
   991					return ret;
   992			}
   993	
   994			bool empty = (sectors[ALLOC_dirty] +
   995				      sectors[ALLOC_stripe] +
   996				      sectors[ALLOC_cached]) == 0;
   997	
   998			ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
   999						     alloc_k.k->p.offset) ?:
  1000				(empty
  1001				 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
  1002							  alloc_k.k->p.offset)
  1003				 : 0);
  1004	
  1005			*had_mismatch = true;
  1006		}
  1007	
  1008		return 0;
  1009	}
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
