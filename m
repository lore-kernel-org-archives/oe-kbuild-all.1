Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF3F1C68F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776124426; cv=none; b=Qly2niF41V+oNWYBIhZRl4uRVRsDSiLOUWbQ1zEbcpVLHhTmw3tUFOTNYumVK636NpsZUVXCLNKKanv5/d4Ma5+0wd7O6FSmW+lM9Nv76DV5SDln/BcUYKiu0nwF7Q2tA3GExd9NEP7AALPTlc3vQtFGuQk3zaciMrrfkixD7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776124426; c=relaxed/simple;
	bh=llHInJklYGMsk07O6YxKcg8KFF9ET4rpyVX3LUxBfA8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SV+ceezoUSlMeAgwECo4F58dBsaJdljN99C8+Nd8QfNVQ2je5Kd+bQT+OiUaBLOfIiodMAllccnU+WDm7JiI5a3X7drgevXfh/GLuayio+veaXYrULalkZuhnnCvG9Aem30L4tHY+Qx2GD4jnNQ5JDZ/StrrkdIopQcItHoSkJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmWWrwGe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmWWrwGe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776124424; x=1807660424;
  h=date:from:to:cc:subject:message-id;
  bh=llHInJklYGMsk07O6YxKcg8KFF9ET4rpyVX3LUxBfA8=;
  b=nmWWrwGeIFNfKF56BDiTboN/2qM46I/vD24aY0nIarE46b08ddmBuATp
   xPdNdt/XOekhrayk0WqfFG0YpN7e/RNpV4Bd+fex5TvfOrU5nIrmn2WU5
   nl53n1BKqkRfqLMvuY94mEbPibDrPuyqYNi8wJ4v/YxxrBGS1MP2pjG97
   ZGP7UUtJVqEfUCG1MxncI4UdjTvTibdop5paGfSXkftJrKZuP6d8Qwcsd
   IA0C2Z3f7wGnDMf0yThxNdzWZEVcKQfVCHTRmkXnQ6XWAe0k22s8Xz9XN
   3Or2D5K1b90FSgp74c8tl6hYYwAE5yWWCGflLerKRPqNQsXMUyXuJs7zy
   A==;
X-CSE-ConnectionGUID: vdsecMVPRWSJXOlUpLsJmw==
X-CSE-MsgGUID: N0U9b3s2QmWzDmteS9Q4EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88453077"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="88453077"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 16:53:44 -0700
X-CSE-ConnectionGUID: f3QEHzoVS82+te47bIhXmw==
X-CSE-MsgGUID: UfawWNmOTMquuh4XSUD7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="233958827"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Apr 2026 16:53:42 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCR64-000000000y5-01Xa;
	Mon, 13 Apr 2026 23:53:40 +0000
Date: Tue, 14 Apr 2026 07:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 7/69]
 fs/bcachefs/data/io_misc.c:71: undefined reference to `__udivdi3'
Message-ID: <202604140756.ADPnnqOw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   4a2379033a956e4f5f7bcd3d21386e552884a6b8
commit: 051eb168fb764a72a86dcbacc929903cdf54e7a7 [7/69] bcachefs: fallocate: use partial disk reservations
config: powerpc-randconfig-001-20260414 (https://download.01.org/0day-ci/archive/20260414/202604140756.ADPnnqOw-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140756.ADPnnqOw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140756.ADPnnqOw-lkp@intel.com/

Note: the koverstreet-bcachefs/master HEAD 4a2379033a956e4f5f7bcd3d21386e552884a6b8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   powerpc-linux-ld: fs/bcachefs/alloc/backpointers.o: in function `bch2_bp_scan_iter_peek':
   fs/bcachefs/alloc/backpointers.c:1407: undefined reference to `__udivdi3'
   powerpc-linux-ld: fs/bcachefs/data/io_misc.o: in function `bch2_extent_fallocate':
>> fs/bcachefs/data/io_misc.c:71: undefined reference to `__udivdi3'


vim +71 fs/bcachefs/data/io_misc.c

    28	
    29	/* Overwrites whatever was present with zeroes: */
    30	int bch2_extent_fallocate(struct btree_trans *trans,
    31				  subvol_inum inum,
    32				  struct btree_iter *iter,
    33				  u64 sectors,
    34				  struct bch_inode_opts opts,
    35				  s64 *i_sectors_delta,
    36				  struct write_point_specifier write_point)
    37	{
    38		struct bch_fs *c = trans->c;
    39		CLASS(disk_reservation, res)(c);
    40		struct open_buckets open_buckets = { 0 };
    41		unsigned sectors_allocated = 0, new_replicas;
    42		bool unwritten = opts.nocow &&
    43		    c->sb.version >= bcachefs_metadata_version_unwritten_extents;
    44		int ret;
    45	
    46		struct bkey_buf old __cleanup(bch2_bkey_buf_exit);
    47		bch2_bkey_buf_init(&old);
    48		struct bkey_buf new __cleanup(bch2_bkey_buf_exit);
    49		bch2_bkey_buf_init(&new);
    50	
    51		CLASS(closure_stack, cl)();
    52	
    53		struct bkey_s_c k = bkey_try(bch2_btree_iter_peek_slot(iter));
    54	
    55		sectors = min_t(u64, sectors, k.k->p.offset - iter->pos.offset);
    56		new_replicas = max(0, (int) opts.data_replicas -
    57				   (int) bch2_bkey_nr_ptrs_fully_allocated(c, k));
    58	
    59		/*
    60		 * Get a disk reservation before (in the nocow case) calling
    61		 * into the allocator:
    62		 */
    63		ret = bch2_disk_reservation_get(c, &res.r, sectors, new_replicas,
    64					       BCH_DISK_RESERVATION_PARTIAL);
    65		if (unlikely(!res.r.sectors && new_replicas)) {
    66			ret = bch_err_throw(c, ENOSPC_disk_reservation);
    67			goto err_noprint;
    68		}
    69	
    70		if (new_replicas)
  > 71			sectors = res.r.sectors / new_replicas;
    72	
    73		bch2_bkey_buf_reassemble(&old, k);
    74	
    75		if (!unwritten) {
    76			struct bkey_i_reservation *reservation;
    77	
    78			bch2_bkey_buf_realloc(&new, sizeof(*reservation) / sizeof(u64));
    79			reservation = bkey_reservation_init(new.k);
    80			reservation->k.p = iter->pos;
    81			bch2_key_resize(&reservation->k, sectors);
    82			reservation->v.nr_replicas = opts.data_replicas;
    83		} else {
    84			struct bkey_i_extent *e;
    85			struct bch_devs_list devs_have;
    86			struct write_point *wp;
    87	
    88			devs_have.nr = 0;
    89	
    90			bch2_bkey_buf_realloc(&new, BKEY_EXTENT_U64s_MAX);
    91	
    92			e = bkey_extent_init(new.k);
    93			e->k.p = iter->pos;
    94	
    95			struct alloc_request *req;
    96			ret = PTR_ERR_OR_ZERO(req = alloc_request_get(trans,
    97							opts.foreground_target,
    98							false,
    99							&devs_have,
   100							opts.data_replicas,
   101							opts.data_replicas,
   102							BCH_WATERMARK_normal,
   103							0, &cl)) ?:
   104				bch2_alloc_sectors_req(trans, req, write_point, &wp);
   105			if (bch2_err_matches(ret, BCH_ERR_operation_blocked)) {
   106				bch2_trans_unlock_long(trans);
   107				bch2_wait_on_allocator(c, req, ret, &cl);
   108				ret = bch_err_throw(c, transaction_restart_nested);
   109			}
   110			if (ret)
   111				goto err;
   112	
   113			sectors = min_t(u64, sectors, wp->sectors_free);
   114			sectors_allocated = sectors;
   115	
   116			bch2_key_resize(&e->k, sectors);
   117	
   118			bch2_open_bucket_get(c, wp, &open_buckets);
   119			bch2_alloc_sectors_append_ptrs(c, wp, &e->k_i, sectors, false);
   120			bch2_alloc_sectors_done(c, wp);
   121	
   122			extent_for_each_ptr(extent_i_to_s(e), ptr)
   123				ptr->unwritten = true;
   124		}
   125	
   126		ret = bch2_extent_update(trans, inum, iter, new.k, &res.r,
   127					 0, i_sectors_delta, true, 0);
   128	err:
   129		if (!ret && sectors_allocated)
   130			bch2_increment_clock(c, sectors_allocated, WRITE);
   131		if (should_print_err(ret)) {
   132			CLASS(printbuf, buf)();
   133			bch2_inum_offset_err_msg_trans(trans, &buf, inum.subvol, iter->pos);
   134			prt_printf(&buf, "fallocate error: %s", bch2_err_str(ret));
   135			bch_err_ratelimited(c, "%s", buf.buf);
   136		}
   137	err_noprint:
   138		bch2_open_buckets_put(c, &open_buckets);
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
