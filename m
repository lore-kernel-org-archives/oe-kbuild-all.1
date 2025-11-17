Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58591946DF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763423530; cv=none; b=nCLtWLOEcPmYWz5Tx9ucJEOCnH1JLC01xZsjI6B1Tl/pBH4YMJI1D+uqgPn6qdI+/8WAbi7/qnOVwc4KWlVL7OFxQs3+7ifvaq6erNUAxwYBIr4LotwwJKVh5LSr4clivpyYgSaPInGTd7a1OsrhUhb1DUCb4q1ro3Am8m4TuOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763423530; c=relaxed/simple;
	bh=Ptj9uMrCai+MpEpOx3zydYVGHiF/1eqne5Q2O4zc9+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JTw+/WF1cszUmSTGxJeZ265GQPlFD3Wo71J+Jlpv9VyqxINiEgAaeQ8AhwoYL+JU5ifVaKo2OtmJhHIgyPQU88fiPiHtMTvIxMOQ3WWge7Dkp7WJHmg/RLjWDOXcbvVgcTGHJaT8uQoqVYYiqd/IPBTto0YRGFG6F69W/6iPO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWsqvIZ8; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWsqvIZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763423528; x=1794959528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ptj9uMrCai+MpEpOx3zydYVGHiF/1eqne5Q2O4zc9+Y=;
  b=hWsqvIZ8SckGKmWlFE7Tk0mQvKZRsvBkL7x7M6Uhxm21X4Hf8KSgQjK6
   a9td7fZuwqR7ox/XUEszd79Ndw5M9iFQ4usewAALvcXhw/3FDlTdZojyH
   BJVnm/afw5m8TRnCFByYbyWagYA0nMkVav7OeuxtQAGy9ErSnlq2vrMmG
   XEoHzhKXv/IWDJuqElVX9CfRE8plypCuPXMHTjwhIKw2qLyvF5NU9XSZA
   9OOrGEFJVypW+W8TPGUFTmU393viYqUwuYCzdxe4BEjD5OXFj5sInYBXi
   zxVqN76dakkjr4t83lX3kugYfUie27IbfKtxD1ttLpIqEMY8RGvPrRNiA
   g==;
X-CSE-ConnectionGUID: X45RiVTQTriyOzSYRHtrjQ==
X-CSE-MsgGUID: y8sOZU0JSK2cyD6ufe++9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="64635178"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="64635178"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 15:52:07 -0800
X-CSE-ConnectionGUID: 4gdIC3dJQCC3WrYLvwtSng==
X-CSE-MsgGUID: EX1hcrLCSDaGj07Wa6RA2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="221501632"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Nov 2025 15:52:06 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL90t-0001A5-1Y;
	Mon, 17 Nov 2025 23:52:03 +0000
Date: Tue, 18 Nov 2025 07:51:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 845/928]
 fs/bcachefs/data/reconcile.c:1369:17: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202511180706.v3Q8hyOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   ed77c4321ba4c4b1ecee84bf4d12d98cd4c4949f
commit: 463dd6744558757e5667fae2d5da73c918424f1b [845/928] bcachefs: REBALANCE_SCAN_pending
config: m68k-randconfig-r112-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180706.v3Q8hyOZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180706.v3Q8hyOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180706.v3Q8hyOZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/data/reconcile.c:1369:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile.c:1369:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile.c:1369:17: sparse:     got restricted __le64 [addressable] [usertype] cookie
>> fs/bcachefs/data/reconcile.c:1369:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile.c:1369:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile.c:1369:17: sparse:     got restricted __le64 [addressable] [usertype] cookie
   fs/bcachefs/data/reconcile.c: note: in included file (through include/linux/bitops.h, include/linux/radix-tree.h, include/linux/backing-dev-defs.h, ...):
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable
   arch/m68k/include/asm/bitops.h:527:27: sparse: sparse: not addressable

vim +1369 fs/bcachefs/data/reconcile.c

  1294	
  1295	static int do_rebalance(struct moving_context *ctxt)
  1296	{
  1297		struct btree_trans *trans = ctxt->trans;
  1298		struct bch_fs *c = trans->c;
  1299		struct bch_fs_rebalance *r = &c->rebalance;
  1300		u64 sectors_scanned = 0;
  1301		u32 kick = r->kick;
  1302		int ret = 0;
  1303	
  1304		CLASS(darray_rebalance_work, work)();
  1305		try(darray_make_room(&work, REBALANCE_WORK_BUF_NR));
  1306	
  1307		bch2_move_stats_init(&r->work_stats, "rebalance_work");
  1308	
  1309		CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
  1310	
  1311		static enum btree_id scan_btrees[] = {
  1312			BTREE_ID_reconcile_scan,
  1313			BTREE_ID_reconcile_hipri,
  1314			BTREE_ID_reconcile_work,
  1315			BTREE_ID_reconcile_pending,
  1316		};
  1317		unsigned i = 0;
  1318		struct bpos work_pos = POS_MIN;
  1319	
  1320		struct bkey_i_cookie pending_cookie;
  1321		bkey_init(&pending_cookie.k);
  1322	
  1323		while (!bch2_move_ratelimit(ctxt)) {
  1324			if (!bch2_rebalance_enabled(c)) {
  1325				bch2_moving_ctxt_flush_all(ctxt);
  1326				kthread_wait_freezable(bch2_rebalance_enabled(c) ||
  1327						       kthread_should_stop());
  1328				if (kthread_should_stop())
  1329					break;
  1330			}
  1331	
  1332			if (kick != r->kick) {
  1333				kick		= r->kick;
  1334				i		= 0;
  1335				work_pos	= POS_MIN;
  1336				work.nr		= 0;
  1337			}
  1338	
  1339			struct bkey_i *k = next_rebalance_entry(trans, &work, scan_btrees[i], &work_pos);
  1340			if (!k) {
  1341				if (++i == ARRAY_SIZE(scan_btrees))
  1342					break;
  1343	
  1344				work_pos = POS_MIN;
  1345	
  1346				if (scan_btrees[i] == BTREE_ID_reconcile_pending &&
  1347				    bkey_deleted(&pending_cookie.k))
  1348					break;
  1349				continue;
  1350			}
  1351	
  1352			if (k->k.type == KEY_TYPE_cookie &&
  1353			    rebalance_scan_decode(c, k->k.p.offset).type == REBALANCE_SCAN_pending)
  1354				bkey_copy(&pending_cookie.k_i, k);
  1355	
  1356			ret = k->k.type == KEY_TYPE_cookie
  1357				? do_rebalance_scan(ctxt, &snapshot_io_opts,
  1358						    k->k.p,
  1359						    le64_to_cpu(bkey_i_to_cookie(k)->v.cookie),
  1360						    &sectors_scanned)
  1361				: lockrestart_do(trans,
  1362					do_rebalance_extent(ctxt, &snapshot_io_opts,
  1363							    rb_work_to_data_pos(k->k.p)));
  1364			if (ret)
  1365				break;
  1366		}
  1367	
  1368		if (!ret && !bkey_deleted(&pending_cookie.k))
> 1369			try(bch2_clear_rebalance_needs_scan(trans,
  1370					pending_cookie.k.p, pending_cookie.v.cookie));
  1371	
  1372		bch2_move_stats_exit(&r->work_stats, c);
  1373	
  1374		if (!ret &&
  1375		    !kthread_should_stop() &&
  1376		    !atomic64_read(&r->work_stats.sectors_seen) &&
  1377		    !sectors_scanned &&
  1378		    kick == r->kick) {
  1379			bch2_moving_ctxt_flush_all(ctxt);
  1380			bch2_trans_unlock_long(trans);
  1381			rebalance_wait(c);
  1382		}
  1383	
  1384		if (!bch2_err_matches(ret, EROFS))
  1385			bch_err_fn(c, ret);
  1386		return ret;
  1387	}
  1388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
