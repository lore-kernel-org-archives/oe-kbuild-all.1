Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADA64964F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766666005; cv=none; b=QtbiQ0j39UT62orFxguxEg0yMxCLuVgP/6O+CospJalESYvOTqg/CuAA0AQL42Py59CBURUJCEK7mGHTh7gIKye2uWlcxDYy7ElQwywUMYM81s+9Jjy8yenVLQoU5v6A/0gpPcDqD18vKnd9LXI/mDLw6pKIEZflGAv1N6YRbIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766666005; c=relaxed/simple;
	bh=h3ZE89Ni6XSH8705JzBZSAWKKqgotKZD2m/rvpYwRso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SV85D12r6d/McOA2Jej+W3hKXzjD/CIBFxbL8bWdSHHSBl2Av9At/4l55QUkvbofJyZDt8cm9rL/ljIuZ04Z7o3e7ySGfpL+GxTzl7QgB5KJmC4imCP07Wxw9zw0km95194RbB3CA58Br6KQMpb3ieD7uaw/D0DkTAltPwlI1H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAAodBqc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAAodBqc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766666001; x=1798202001;
  h=date:from:to:cc:subject:message-id;
  bh=h3ZE89Ni6XSH8705JzBZSAWKKqgotKZD2m/rvpYwRso=;
  b=eAAodBqcAm2g8ADeyMr9M181li2+3TnAOT2mdKVez7Kbn92B3VMCTc36
   L1uVydcO8ONU9gNyxmEF0H6RRVMKdN6j0jgOwnyYUzZNHtapayShVDLkL
   mc+aX9/M8/D+abWByTrHpJ2XdzFWBptsDVqxIqOHbTZ8vhfrVn2N27R6O
   ZHyAQ+z8Y0d99qqDx5NYVge3zaeAq3x5UWwy+i2x0XW/51pBjY785Mus8
   d6J+HRNkVn+dIXKFjH+B1a7VEx95Okc61nUKxso1VexQUqaWvY3JuHaDZ
   ysBK2U7zwLU3qSwCpg/xVtk9UvhiscX+mBX9tR3qFOO5K7Z67yfps+4Ti
   Q==;
X-CSE-ConnectionGUID: 26JvkHihSnSP+e/PyAAAFA==
X-CSE-MsgGUID: aX/RmEO6QLWfoFPTGg9rSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="79587350"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="79587350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 04:33:21 -0800
X-CSE-ConnectionGUID: JB3vi3BDSp6kMJu4s/yb3w==
X-CSE-MsgGUID: aghRMnWxSOKe7DyK1EtbLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="223691225"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2025 04:33:20 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYkWl-0000000045N-3QFP;
	Thu, 25 Dec 2025 12:33:13 +0000
Date: Thu, 25 Dec 2025 20:32:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bcachefs:master 869/1155]
 fs/bcachefs/data/reconcile.c:1724:17: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202512252130.b1Yh58TH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   74998f019920432b3554cc5e1c357e77d4679ce0
commit: de36aa8ea10e74ca3d8ed0e8c5814dd2210661bd [869/1155] bcachefs: fix CLASS()/goto build error
config: riscv-randconfig-r133-20251222 (https://download.01.org/0day-ci/archive/20251225/202512252130.b1Yh58TH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 185f5fd5ce4c65116ca8cf6df467a682ef090499)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512252130.b1Yh58TH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512252130.b1Yh58TH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zacas_zabha'
>> fs/bcachefs/data/reconcile.c:1724:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile.c:1724:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile.c:1724:17: sparse:     got restricted __le64 [addressable] [usertype] cookie
>> fs/bcachefs/data/reconcile.c:1724:17: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long long [usertype] cookie @@     got restricted __le64 [addressable] [usertype] cookie @@
   fs/bcachefs/data/reconcile.c:1724:17: sparse:     expected unsigned long long [usertype] cookie
   fs/bcachefs/data/reconcile.c:1724:17: sparse:     got restricted __le64 [addressable] [usertype] cookie
   fs/bcachefs/data/reconcile.c:525:9: sparse: sparse: invalid access past the end of 'r' (4 8)
   fs/bcachefs/data/reconcile.c:559:38: sparse: sparse: invalid access past the end of 'r' (4 8)
   fs/bcachefs/data/reconcile.c:604:28: sparse: sparse: invalid access past the end of 'r' (4 8)

vim +1724 fs/bcachefs/data/reconcile.c

96fc7d8adb7881 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-05  1632  
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1633  static int do_reconcile(struct moving_context *ctxt)
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1634  {
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1635  	struct btree_trans *trans = ctxt->trans;
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1636  	struct bch_fs *c = trans->c;
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1637  	struct bch_fs_reconcile *r = &c->reconcile;
730430f71bc812 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1638  	u64 sectors_scanned = 0;
9e2c3c2ed4772c fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-24  1639  	u32 kick = r->kick;
3c16c1d9609b81 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-05  1640  	int ret = 0;
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1641  
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1642  	CLASS(darray_reconcile_work, work)();
3c16c1d9609b81 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-05  1643  	try(darray_make_room(&work, REBALANCE_WORK_BUF_NR));
ca563dccb2f0fb fs/bcachefs/rebalance.c      Kent Overstreet 2024-04-09  1644  
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1645  	bch2_move_stats_init(&r->work_stats, "reconcile_work");
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1646  
03892bc23c11b7 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-12  1647  	CLASS(per_snapshot_io_opts, snapshot_io_opts)(c);
fc9fa20defa947 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1648  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1649  	static enum btree_id scan_btrees[] = {
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1650  		BTREE_ID_reconcile_scan,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1651  		BTREE_ID_reconcile_hipri,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1652  		BTREE_ID_reconcile_work,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1653  		BTREE_ID_reconcile_pending,
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1654  	};
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1655  	unsigned i = 0;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1656  	struct bpos work_pos = POS_MIN;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1657  
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1658  	struct bkey_i_cookie pending_cookie;
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1659  	bkey_init(&pending_cookie.k);
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1660  
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1661  	while (!bch2_move_ratelimit(ctxt)) {
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1662  		if (!bch2_reconcile_enabled(c)) {
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1663  			bch2_moving_ctxt_flush_all(ctxt);
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1664  			kthread_wait_freezable(bch2_reconcile_enabled(c) ||
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1665  					       kthread_should_stop());
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1666  			if (kthread_should_stop())
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1667  				break;
a45b2e247f505c fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-03  1668  		}
0c069781ddfa4e fs/bcachefs/rebalance.c      Daniel Hill     2023-11-26  1669  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1670  		if (kick != r->kick) {
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1671  			kick		= r->kick;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1672  			i		= 0;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1673  			work_pos	= POS_MIN;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1674  			work.nr		= 0;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1675  		}
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1676  
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1677  		struct bkey_s_c k = next_reconcile_entry(trans, &work, scan_btrees[i], &work_pos);
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1678  		ret = bkey_err(k);
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1679  		if (ret)
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1680  			break;
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1681  
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1682  		if (!k.k) {
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1683  			if (++i == ARRAY_SIZE(scan_btrees))
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1684  				break;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1685  
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1686  			work_pos = POS_MIN;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1687  
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1688  			if (scan_btrees[i] == BTREE_ID_reconcile_pending &&
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1689  			    bkey_deleted(&pending_cookie.k))
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1690  				break;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1691  			continue;
e972bd7734105b fs/bcachefs/data/reconcile.c Kent Overstreet 2025-08-23  1692  		}
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1693  
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1694  		if (k.k->type == KEY_TYPE_cookie &&
b5bc9e176a2cdf fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-13  1695  		    reconcile_scan_decode(c, k.k->p.offset).type == RECONCILE_SCAN_pending)
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1696  			bkey_reassemble(&pending_cookie.k_i, k);
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1697  
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1698  		if (k.k->type == KEY_TYPE_cookie)
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1699  			ret = do_reconcile_scan(ctxt, &snapshot_io_opts,
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1700  						k.k->p,
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1701  						le64_to_cpu(bkey_s_c_to_cookie(k).v->cookie),
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1702  						&sectors_scanned);
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1703  		else if (k.k->type == KEY_TYPE_backpointer)
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1704  			ret = do_reconcile_btree(ctxt, &snapshot_io_opts,
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1705  						 bkey_s_c_to_backpointer(k));
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1706  		else
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1707  			ret = lockrestart_do(trans,
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1708  				do_reconcile_extent(ctxt, &snapshot_io_opts,
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1709  						    rb_work_to_data_pos(k.k->p)));
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1710  
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1711  		if (bch2_err_matches(ret, BCH_ERR_transaction_restart)) {
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1712  			ret = 0;
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1713  			continue;
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1714  		}
08209c1a245fe1 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-09-28  1715  
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1716  		if (ret)
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1717  			break;
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1718  
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1719  		if (scan_btrees[i] == BTREE_ID_reconcile_scan)
14b396623bae92 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-08  1720  			work_pos = bpos_successor(work_pos);
e77e4efce31f37 fs/bcachefs/rebalance.c      Kent Overstreet 2020-04-07  1721  	}
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1722  
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1723  	if (!ret && !bkey_deleted(&pending_cookie.k))
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12 @1724  		try(bch2_clear_reconcile_needs_scan(trans,
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1725  				pending_cookie.k.p, pending_cookie.v.cookie));
463dd674455875 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-10-27  1726  
730430f71bc812 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1727  	bch2_move_stats_exit(&r->work_stats, c);
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1728  
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1729  	if (!ret &&
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1730  	    !kthread_should_stop() &&
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1731  	    !atomic64_read(&r->work_stats.sectors_seen) &&
730430f71bc812 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1732  	    !sectors_scanned &&
9e2c3c2ed4772c fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-24  1733  	    kick == r->kick) {
ef740a1e293937 fs/bcachefs/rebalance.c      Kent Overstreet 2024-01-15  1734  		bch2_moving_ctxt_flush_all(ctxt);
f82755e4e8b83a fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-30  1735  		bch2_trans_unlock_long(trans);
581f7e27bc9728 fs/bcachefs/data/reconcile.c Kent Overstreet 2025-11-12  1736  		reconcile_wait(c);
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1737  	}
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1738  
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1739  	if (!bch2_err_matches(ret, EROFS))
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1740  		bch_err_fn(c, ret);
fb3f57bb1177ae fs/bcachefs/rebalance.c      Kent Overstreet 2023-10-20  1741  	return ret;
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1742  }
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1743  

:::::: The code at line 1724 was first introduced by commit
:::::: 581f7e27bc9728b15e7f45d10784542b4ab23a90 bcachefs: s/rebalance/reconcile

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
