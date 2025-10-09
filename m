Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DFC2D9EDF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 13:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760017177; cv=none; b=keTsgtRvVBDaLgAwIsUg5T+uPh03oqtW9MGca9Lf1riyUIe5Z+P5xAV4DFR+rugN/lwU+pphkwkFo9yRcSUqJboTAFuRg9DIItJBMqNY/8TuQVOb/eKRNaXqTot6noDlyxuoVYYxtQPza/HBTdJ5Eo7aUOxrCDzUkk2ZBDdOSHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760017177; c=relaxed/simple;
	bh=IK2LO1UtoWCqy4ecUJrO56T6E8yvkopd/iZjBVjVpxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R3ZuzoB7MbkzeF3nzpShAcl/CPFVfktJfaobFj6LeXTyxWUWobr5Fp5tzv+vFslbUjCPkWD921F/pPmcxoJu+Zzm19BV5xguAerAemftae68JzzUGh6ViLEeXyyS4WgLOKZqXqFALHShMMFT4ar0g5lSy8hDV/bXG2u89ZNsDGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n2l0xVVu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n2l0xVVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760017175; x=1791553175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IK2LO1UtoWCqy4ecUJrO56T6E8yvkopd/iZjBVjVpxE=;
  b=n2l0xVVuePNwDRDD6FvMbipKRpKIuyCdTlYsVJeVlgVQbYmdMWM+ayJX
   pir/hii0i2G3+o+7DALYuew3BRiQYXFD/irAlLHcoUruvf6aVdUQd8oVp
   KeB6/Kp98FZ3AnyJ4IPuuJc5yF4BHQBh4im6hZ8aNGzz3+WLUuZSGsLF0
   haCD9ukSarsVY59+tp18NWNvoXGU65ZpUKoxosziDmHTRPUK/aXJH0+Qt
   NLHw3J1enJ3ZmCMxgaAC3oJyIKJxuvln7Shs7AGIPynNnhpZJG22X7PP+
   78DoRGnVbI0tO4YHDwUvePXAYAN4zIx9XDXRh1JfCSjMvcN5sUMf7s3V+
   g==;
X-CSE-ConnectionGUID: TID3+tARReOVy/N7gPARyw==
X-CSE-MsgGUID: MCNkYrIATpWX+a776ztVtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62110136"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="62110136"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 06:39:34 -0700
X-CSE-ConnectionGUID: 7ZsgJHZsRlqr6e7sbQSVSw==
X-CSE-MsgGUID: 7Ck5nB9ARFGaWUx1qganIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="185093208"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 06:39:33 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6qrj-0000kt-0E;
	Thu, 09 Oct 2025 13:39:31 +0000
Date: Thu, 9 Oct 2025 21:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 458/541]
 fs/bcachefs/alloc/backpointers.c:986:25: error: implicit declaration of
 function '__WARN'; did you mean '__warn'?
Message-ID: <202510092137.WTFJVnBA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kent,

First bad commit (maybe != root cause):

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   844a56feb885b00aaaa93b55a7eb27e6495b3379
commit: 0151e9a63908fe0c0e6f7393d8677b62bb3cb71c [458/541] bcachefs: move alloc files to subdir
config: nios2-randconfig-002-20251009 (https://download.01.org/0day-ci/archive/20251009/202510092137.WTFJVnBA-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251009/202510092137.WTFJVnBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510092137.WTFJVnBA-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/alloc/backpointers.c: In function 'check_bucket_backpointer_mismatch':
>> fs/bcachefs/alloc/backpointers.c:986:25: error: implicit declaration of function '__WARN'; did you mean '__warn'? [-Werror=implicit-function-declaration]
     986 |                         __WARN();
         |                         ^~~~~~
         |                         __warn
   cc1: some warnings being treated as errors


vim +986 fs/bcachefs/alloc/backpointers.c

c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   883  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   884  static int check_bucket_backpointers_to_extents(struct btree_trans *, struct bch_dev *, struct bpos,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   885  						struct bkey_buf *last_flushed);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   886  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   887  static int check_bucket_backpointer_mismatch(struct btree_trans *trans, struct bkey_s_c alloc_k,
39cea302f13a0a fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   888  					     bool *had_mismatch,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   889  					     struct bkey_buf *last_flushed,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   890  					     struct bpos *last_pos,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   891  					     unsigned *nr_iters)
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   892  {
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   893  	struct bch_fs *c = trans->c;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   894  	struct bch_alloc_v4 a_convert;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   895  	const struct bch_alloc_v4 *a = bch2_alloc_to_v4(alloc_k, &a_convert);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   896  	bool need_commit = false;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   897  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   898  	if (!bpos_eq(*last_pos, alloc_k.k->p))
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   899  		*nr_iters = 0;
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   900  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   901  	*last_pos = alloc_k.k->p;
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   902  
39cea302f13a0a fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   903  	*had_mismatch = false;
39cea302f13a0a fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09   904  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   905  	if (a->data_type == BCH_DATA_sb ||
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   906  	    a->data_type == BCH_DATA_journal ||
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   907  	    a->data_type == BCH_DATA_parity)
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   908  		return 0;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   909  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   910  	u32 sectors[ALLOC_SECTORS_NR];
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   911  	memset(sectors, 0, sizeof(sectors));
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   912  
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   913  	CLASS(bch2_dev_bucket_tryget_noerror, ca)(trans->c, alloc_k.k->p);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   914  	if (!ca)
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   915  		return 0;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   916  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   917  	struct bkey_s_c bp_k;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   918  	int ret = 0;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   919  	for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   920  				bucket_pos_to_bp_start(ca, alloc_k.k->p),
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   921  				bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   922  		if (bp_k.k->type != KEY_TYPE_backpointer)
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   923  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   924  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   925  		struct bkey_s_c_backpointer bp = bkey_s_c_to_backpointer(bp_k);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   926  
a7fe654c5abb83 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08   927  		if (c->sb.version_upgrade_complete < bcachefs_metadata_version_backpointer_bucket_gen &&
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   928  		    (bp.v->bucket_gen != a->gen ||
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   929  		     bp.v->pad)) {
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   930  			ret = bch2_backpointer_del(trans, bp_k.k->p);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   931  			if (ret)
63ede0993684b0 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-30   932  				return ret;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   933  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   934  			need_commit = true;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   935  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   936  		}
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   937  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   938  		if (bp.v->bucket_gen != a->gen)
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   939  			continue;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   940  
962322475bb5ce fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   941  		int alloc_counter = data_type_to_alloc_counter(bp.v->data_type);
962322475bb5ce fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   942  		if (alloc_counter < 0)
962322475bb5ce fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   943  			continue;
962322475bb5ce fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   944  
962322475bb5ce fs/bcachefs/backpointers.c Kent Overstreet 2025-03-19   945  		sectors[alloc_counter] += bp.v->bucket_len;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   946  	};
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   947  	if (ret)
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   948  		return ret;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   949  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   950  	if (need_commit) {
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   951  		ret = bch2_trans_commit(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   952  		if (ret)
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14   953  			return ret;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   954  	}
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   955  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   956  	if (sectors[ALLOC_dirty]  > a->dirty_sectors ||
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   957  	    sectors[ALLOC_cached] > a->cached_sectors ||
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   958  	    sectors[ALLOC_stripe] > a->stripe_sectors) {
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   959  		if (*nr_iters) {
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   960  			CLASS(printbuf, buf)();
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   961  			bch2_log_msg_start(c, &buf);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   962  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   963  			prt_printf(&buf, "backpointer sectors > bucket sectors, but found no bad backpointers\n"
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   964  				   "bucket %llu:%llu data type %s, counters\n",
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   965  				   alloc_k.k->p.inode,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   966  				   alloc_k.k->p.offset,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   967  				   __bch2_data_types[a->data_type]);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   968  			if (sectors[ALLOC_dirty]  > a->dirty_sectors)
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   969  				prt_printf(&buf, "dirty: %u > %u\n",
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   970  					   sectors[ALLOC_dirty], a->dirty_sectors);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   971  			if (sectors[ALLOC_cached] > a->cached_sectors)
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   972  				prt_printf(&buf, "cached: %u > %u\n",
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   973  					   sectors[ALLOC_cached], a->cached_sectors);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   974  			if (sectors[ALLOC_stripe] > a->stripe_sectors)
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   975  				prt_printf(&buf, "stripe: %u > %u\n",
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   976  					   sectors[ALLOC_stripe], a->stripe_sectors);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   977  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   978  			for_each_btree_key_max_norestart(trans, iter, BTREE_ID_backpointers,
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   979  						bucket_pos_to_bp_start(ca, alloc_k.k->p),
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   980  						bucket_pos_to_bp_end(ca, alloc_k.k->p), 0, bp_k, ret) {
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   981  				bch2_bkey_val_to_text(&buf, c, bp_k);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   982  				prt_newline(&buf);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   983  			}
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   984  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   985  			bch2_print_str(c, KERN_ERR, buf.buf);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04  @986  			__WARN();
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   987  			return ret;
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   988  		}
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   989  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   990  		*nr_iters += 1;
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   991  
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   992  		return check_bucket_backpointers_to_extents(trans, ca, alloc_k.k->p, last_flushed) ?:
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   993  			bch_err_throw(c, transaction_restart_nested);
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   994  	}
0041d16a65d18c fs/bcachefs/backpointers.c Kent Overstreet 2025-07-04   995  
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   996  	if (sectors[ALLOC_dirty]  != a->dirty_sectors ||
15800f3d4b0134 fs/bcachefs/backpointers.c Kent Overstreet 2025-02-07   997  	    sectors[ALLOC_cached] != a->cached_sectors ||
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15   998  	    sectors[ALLOC_stripe] != a->stripe_sectors) {
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08   999  		/*
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1000  		 * Post 1.14 upgrade, we assume that backpointers are mostly
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1001  		 * correct and a sector count mismatch is probably due to a
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1002  		 * write buffer race
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1003  		 *
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1004  		 * Pre upgrade, we expect all the buckets to be wrong, a write
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1005  		 * buffer flush is pointless:
1e01d6da387213 fs/bcachefs/backpointers.c Kent Overstreet 2025-08-08  1006  		 */
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1007  		if (c->sb.version_upgrade_complete >= bcachefs_metadata_version_backpointer_bucket_gen) {
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1008  			ret = bch2_backpointers_maybe_flush(trans, alloc_k, last_flushed);
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1009  			if (ret)
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1010  				return ret;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1011  		}
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1012  
13ffcbae86dadb fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1013  		bool empty = (sectors[ALLOC_dirty] +
13ffcbae86dadb fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1014  			      sectors[ALLOC_stripe] +
13ffcbae86dadb fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1015  			      sectors[ALLOC_cached]) == 0;
13ffcbae86dadb fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1016  
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1017  		ret = bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_mismatch,
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1018  					     alloc_k.k->p.offset) ?:
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1019  			(empty
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1020  			 ? bch2_bucket_bitmap_set(ca, &ca->bucket_backpointer_empty,
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1021  						  alloc_k.k->p.offset)
15f969326ee296 fs/bcachefs/backpointers.c Kent Overstreet 2025-05-17  1022  			 : 0);
39cea302f13a0a fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1023  
39cea302f13a0a fs/bcachefs/backpointers.c Kent Overstreet 2025-05-09  1024  		*had_mismatch = true;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1025  	}
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1026  
bd269ddf4937f9 fs/bcachefs/backpointers.c Kent Overstreet 2025-07-14  1027  	return 0;
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1028  }
c738866e47ef2e fs/bcachefs/backpointers.c Kent Overstreet 2024-11-15  1029  

:::::: The code at line 986 was first introduced by commit
:::::: 0041d16a65d18c05ab7b77abd6a343cf3f3be21e bcachefs: Fix infinite loop in backpointers fsck on upgrade

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
