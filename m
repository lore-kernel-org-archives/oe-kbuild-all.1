Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D16933E34D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 09:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769072878; cv=none; b=a55H4fgQX933spmS925gB5aLc0mr5uaspRccMwrGwYXeBHwO0D4xpGJ+L0OFbmI7sYK4qWsdYsXYUgsYziwCmm1XpWkfbpN/W/TLy/aMctJMvEa6jTPLBCiUYLrVBXZdokuZozd7s0SNkwMmPjIkmSpxyAMiDX9jWoZ6szb/xNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769072878; c=relaxed/simple;
	bh=01BDyd+C3+Szd5uj+Ed4RVvdlPgQo+TpkHmXD/av3GA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lboxcNnho/jynzjSqdT9n/4Xwdej09J/CBDVzj7G5PWMtHB52UN+jq3+7n4O1o00gONW27w13b62PKWNT5WT+0/3m43q6N62LxwDrBDyUvcHFytRvTaV4oEosCMl6fZou6sJR0j0tYz/AgMdmV7BtFG251pLGyjXZWgs6b/gZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV/zxjwz; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV/zxjwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769072877; x=1800608877;
  h=date:from:to:cc:subject:message-id;
  bh=01BDyd+C3+Szd5uj+Ed4RVvdlPgQo+TpkHmXD/av3GA=;
  b=XV/zxjwzxDlbdHy31Wnxlru2LCy0wFk5flE8ctKAi37N9Nx5fC/9KseT
   t+lo+8ei7X/YR/vgUu3eMDaPg/brebbE3ik76gV/lAB9h8KQ4idm/Usgs
   903nRUscpx7etjGgLr9kYO6RHOBOOV9b89QffsrZ/ftrEOkluWQ8Coh9H
   TpJWoZoksD54qMx6H3WP1p03GfTa7DDSXWIqIov2q4K28lQvwxSM5kytM
   aCH3cAph0rslXpk4EzNQvJrp/Mo8zLIaXWtJuCE/ahrAtiPv/+8t12els
   FCfb4vN3y1MPczs/hQ13uo6zar5rMfxGLoq+2r34ruoiJ4a7lFeJHAEiD
   w==;
X-CSE-ConnectionGUID: gVAxs1waR32KmTwvgc2LTA==
X-CSE-MsgGUID: F5pM9r7AS1uOyvy7QippSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="57874345"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="57874345"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 01:07:52 -0800
X-CSE-ConnectionGUID: muobPOB4RsqFKYC1CLOu/w==
X-CSE-MsgGUID: 1NSMoyVFTN2Y6Zn/eluARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="206734400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jan 2026 01:07:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viqfL-00000000Seb-0CLa;
	Thu, 22 Jan 2026 09:07:47 +0000
Date: Thu, 22 Jan 2026 17:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 223/236]
 fs/bcachefs/data/reconcile/work.c:1073:17: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202601221724.H7Azqkgo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs master
head:   46633c1858d37af603bfdbd62584611459f7cb1d
commit: de374d7b7296203619ba70f976867051cebaf41b [223/236] bcachefs: Break up reconcile.c
config: sh-randconfig-r112-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221724.H7Azqkgo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221724.H7Azqkgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221724.H7Azqkgo-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile/work.c:1073:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile/work.c:1073:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile/work.c:1073:17: sparse:     got restricted __le64 [addressable] [usertype] cookie
>> fs/bcachefs/data/reconcile/work.c:1073:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile/work.c:1073:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile/work.c:1073:17: sparse:     got restricted __le64 [addressable] [usertype] cookie

vim +1073 fs/bcachefs/data/reconcile/work.c

   940	
   941	static int do_reconcile(struct moving_context *ctxt)
   942	{
   943		struct btree_trans *trans = ctxt->trans;
   944		struct bch_fs *c = trans->c;
   945		struct bch_fs_reconcile *r = &c->reconcile;
   946		u64 sectors_scanned = 0;
   947		u32 kick = r->kick;
   948		u32 copygc_run_count = c->copygc.run_count;
   949		int ret = 0;
   950	
   951		CLASS(darray_reconcile_work, work)();
   952		try(darray_make_room(&work, REBALANCE_WORK_BUF_NR));
   953	
   954		bch2_move_stats_init(&r->work_stats, "reconcile_work");
   955	
   956		CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
   957	
   958		static enum btree_id scan_btrees[] = {
   959			BTREE_ID_reconcile_scan,
   960			BTREE_ID_reconcile_hipri_phys,
   961			BTREE_ID_reconcile_hipri,
   962			BTREE_ID_reconcile_work_phys,
   963			BTREE_ID_reconcile_work,
   964			BTREE_ID_reconcile_pending,
   965		};
   966		unsigned i = 0;
   967	
   968		r->work_pos = BBPOS(scan_btrees[i], POS_MIN);
   969	
   970		struct bkey_i_cookie pending_cookie;
   971		bkey_init(&pending_cookie.k);
   972	
   973		bch2_moving_ctxt_flush_all(ctxt);
   974		bch2_btree_write_buffer_flush_sync(trans);
   975	
   976		struct wb_maybe_flush last_flushed __cleanup(wb_maybe_flush_exit);
   977		wb_maybe_flush_init(&last_flushed);
   978	
   979		while (!bch2_move_ratelimit(ctxt)) {
   980			if (!bch2_reconcile_enabled(c)) {
   981				bch2_moving_ctxt_flush_all(ctxt);
   982				kthread_wait_freezable(bch2_reconcile_enabled(c) ||
   983						       kthread_should_stop());
   984				if (kthread_should_stop())
   985					break;
   986			}
   987	
   988			if (kick != r->kick) {
   989				kick		= r->kick;
   990				i		= 0;
   991				r->work_pos	= BBPOS(scan_btrees[i], POS_MIN);
   992				work.nr		= 0;
   993			}
   994	
   995			bch2_trans_begin(trans);
   996	
   997			struct bkey_s_c k = next_reconcile_entry(trans, &work, r->work_pos.btree, &r->work_pos.pos);
   998			ret = bkey_err(k);
   999			if (ret)
  1000				break;
  1001	
  1002			if (!k.k) {
  1003				if (++i == ARRAY_SIZE(scan_btrees))
  1004					break;
  1005	
  1006				r->work_pos = BBPOS(scan_btrees[i], POS_MIN);
  1007	
  1008				if (r->work_pos.btree == BTREE_ID_reconcile_pending &&
  1009				    bkey_deleted(&pending_cookie.k))
  1010					break;
  1011	
  1012				/* Avoid conflicts when switching between phys/normal */
  1013				bch2_moving_ctxt_flush_all(ctxt);
  1014				bch2_btree_write_buffer_flush_sync(trans);
  1015				continue;
  1016			}
  1017	
  1018			r->running = true;
  1019			r->work_pos.pos = k.k->p;
  1020	
  1021			if (k.k->type == KEY_TYPE_cookie &&
  1022			    reconcile_scan_decode(c, k.k->p.offset).type == RECONCILE_SCAN_pending)
  1023				bkey_reassemble(&pending_cookie.k_i, k);
  1024	
  1025			if (k.k->type == KEY_TYPE_cookie) {
  1026				ret = do_reconcile_scan(ctxt, &snapshot_io_opts,
  1027							k.k->p,
  1028							le64_to_cpu(bkey_s_c_to_cookie(k).v->cookie),
  1029							&sectors_scanned, &last_flushed);
  1030			} else if (k.k->type == KEY_TYPE_backpointer) {
  1031				if (k.k->p.inode == RECONCILE_WORK_pending &&
  1032				    bkey_deleted(&pending_cookie.k)) {
  1033					r->work_pos = BBPOS(scan_btrees[++i], POS_MIN);
  1034					continue;
  1035				}
  1036	
  1037				ret = do_reconcile_btree(ctxt, &snapshot_io_opts,
  1038							 r->work_pos, bkey_s_c_to_backpointer(k));
  1039			} else if (btree_is_reconcile_phys(r->work_pos.btree)) {
  1040				bch2_trans_unlock_long(trans);
  1041				ret = do_reconcile_phys(c, r->work_pos.btree);
  1042				r->work_pos = BBPOS(scan_btrees[++i], POS_MIN);
  1043			} else {
  1044				ret = lockrestart_do(trans,
  1045					do_reconcile_extent(ctxt, &snapshot_io_opts, r->work_pos));
  1046			}
  1047	
  1048			if (bch2_err_matches(ret, BCH_ERR_data_update_fail_need_copygc)) {
  1049				bch2_trans_unlock_long(trans);
  1050				bch2_copygc_wakeup(c);
  1051				wait_event(c->copygc.running_wq,
  1052					   c->copygc.run_count != copygc_run_count ||
  1053					   kthread_should_stop());
  1054				copygc_run_count = c->copygc.run_count;
  1055				ret = 0;
  1056				continue;
  1057			}
  1058	
  1059			if (bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
  1060				ret = 0;
  1061				continue;
  1062			}
  1063	
  1064			if (ret)
  1065				break;
  1066	
  1067			r->work_pos.pos = btree_type_has_snapshots(r->work_pos.btree)
  1068				? bpos_successor(r->work_pos.pos)
  1069				: bpos_nosnap_successor(r->work_pos.pos);
  1070		}
  1071	
  1072		if (!ret && !bkey_deleted(&pending_cookie.k))
> 1073			try(bch2_clear_reconcile_needs_scan(trans,
  1074					pending_cookie.k.p, pending_cookie.v.cookie));
  1075	
  1076		bch2_move_stats_exit(&r->work_stats, c);
  1077	
  1078		if (!ret &&
  1079		    !kthread_should_stop() &&
  1080		    !atomic64_read(&r->work_stats.sectors_seen) &&
  1081		    !sectors_scanned &&
  1082		    kick == r->kick) {
  1083			bch2_moving_ctxt_flush_all(ctxt);
  1084			bch2_trans_unlock_long(trans);
  1085			reconcile_wait(c);
  1086		}
  1087	
  1088		if (!bch2_err_matches(ret, EROFS))
  1089			bch_err_fn(c, ret);
  1090		return ret;
  1091	}
  1092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
