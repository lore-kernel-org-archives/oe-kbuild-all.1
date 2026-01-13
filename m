Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4838B7A9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303380; cv=none; b=AH/LJ4f0NaSbb/zn7n5jRXoicumtLLgtRow/UKbAyH/3Rvev787b3iVxutZnFA74PHnk5DOmQJ/pbjKsMDo9WXmlZ6LpNmMTmKfxY2AwSnwkt5DcxW7tKGnxX8+ecWYMVYGdNeNoLwjUJVM+15/s2WE3gUD4UKm8/h/tF5Igy0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303380; c=relaxed/simple;
	bh=iEFvqyFz8qxKF9bSyH52Lo9fRZOqs+n2ZA74d2GeIBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ikSZN5bPHyu/7RjUTFeFQJXaYuCjC/FNEqcupLV3unVez/+Yx/P5zwUlS6s/9ijJXFQ1og1ruhrItoAQdxX5LwJt39IPH5BzGzSobluxroeJ0+yIQIEE8BGZLJkwL4u1ZTmBlc6AJyH88+gkd9EcuFdS4aJVbBjeAHFwG8vvQdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCqyGi21; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCqyGi21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768303379; x=1799839379;
  h=date:from:to:cc:subject:message-id;
  bh=iEFvqyFz8qxKF9bSyH52Lo9fRZOqs+n2ZA74d2GeIBk=;
  b=JCqyGi21TbcPdsoM03Ay9V/BNsodrWfBKB6f/7ZmWcprJAogB3riWRQd
   Zl5bvz+7sB2tUg2cVEvUjTVGqW8/fhF95f18WBsWnzU1+/mpmgYpV19Xn
   XXva8xoX4fUWgS64o3VD6jLuoLz2eoZf7yGb3BTh4kO6QR1E5cEtNSgKC
   +VVb2i59akDhEdCw5knzhmgqcG8CqmN4MB0Vn73oq+KWwbQ3S3eJReINN
   BRnOl7R8QwufWkDbM1bHbdsn1IJmaNiunS+9XpvyeZQu4WQbOnUkxKifd
   mllPVrirUvprqmpj2IoV9Bic1Bl8aB+JD47+tKy2thBbx2CyT9Z46Nq2Q
   Q==;
X-CSE-ConnectionGUID: s5/c+q0bRqqlReA6xfHqBA==
X-CSE-MsgGUID: fNpu32d/SZ+rYiqKqgT69Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="81038036"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="81038036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:22:58 -0800
X-CSE-ConnectionGUID: YC+z+pV7Rb2GkJAHq4Bzgw==
X-CSE-MsgGUID: zxRMNyScS/Kg4gdxHDXzDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="241874305"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2026 03:22:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfcUA-00000000EfM-2uxy;
	Tue, 13 Jan 2026 11:22:54 +0000
Date: Tue, 13 Jan 2026 19:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 fs/bcachefs/alloc_foreground.c:605: warning: Function parameter or struct
 member 'nowait' not described in 'bch2_bucket_alloc_trans'
Message-ID: <202601132040.vyMSZrkg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   da2f8a0455be357d97f38510b842e713fe3fc796
commit: a977f3e162924ef82536ad23448364f2b3e9f026 [0/1] bcachefs: BCH_WRITE_ALLOC_NOWAIT no longer applies to open bucket allocation
config: x86_64-randconfig-073-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132040.vyMSZrkg-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132040.vyMSZrkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132040.vyMSZrkg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/alloc_foreground.c:605: warning: Function parameter or struct member 'nowait' not described in 'bch2_bucket_alloc_trans'


vim +605 fs/bcachefs/alloc_foreground.c

40574946b8a517 Kent Overstreet 2024-05-04  586  
f25d8215f49941 Kent Overstreet 2022-01-09  587  /**
96dea3d599dbc3 Kent Overstreet 2023-09-12  588   * bch2_bucket_alloc_trans - allocate a single bucket from a specific device
96dea3d599dbc3 Kent Overstreet 2023-09-12  589   * @trans:	transaction object
96dea3d599dbc3 Kent Overstreet 2023-09-12  590   * @ca:		device to allocate from
96dea3d599dbc3 Kent Overstreet 2023-09-12  591   * @watermark:	how important is this allocation?
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  592   * @data_type:	BCH_DATA_journal, btree, user...
96dea3d599dbc3 Kent Overstreet 2023-09-12  593   * @cl:		if not NULL, closure to be used to wait if buckets not available
96dea3d599dbc3 Kent Overstreet 2023-09-12  594   * @usage:	for secondarily also returning the current device usage
f25d8215f49941 Kent Overstreet 2022-01-09  595   *
96dea3d599dbc3 Kent Overstreet 2023-09-12  596   * Returns:	an open_bucket on success, or an ERR_PTR() on failure.
3e3e02e6bce627 Kent Overstreet 2022-10-19  597   */
f25d8215f49941 Kent Overstreet 2022-01-09  598  static struct open_bucket *bch2_bucket_alloc_trans(struct btree_trans *trans,
f25d8215f49941 Kent Overstreet 2022-01-09  599  				      struct bch_dev *ca,
e53a961c6b1ced Kent Overstreet 2023-06-24  600  				      enum bch_watermark watermark,
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  601  				      enum bch_data_type data_type,
ed80c5699a23c4 Kent Overstreet 2022-10-21  602  				      struct closure *cl,
a977f3e162924e Kent Overstreet 2024-09-01  603  				      bool nowait,
ed80c5699a23c4 Kent Overstreet 2022-10-21  604  				      struct bch_dev_usage *usage)
f25d8215f49941 Kent Overstreet 2022-01-09 @605  {
f25d8215f49941 Kent Overstreet 2022-01-09  606  	struct bch_fs *c = trans->c;
f25d8215f49941 Kent Overstreet 2022-01-09  607  	struct open_bucket *ob = NULL;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  608  	bool freespace = READ_ONCE(ca->mi.freespace_initialized);
822835ffeae411 Kent Overstreet 2022-04-01  609  	u64 avail;
c6705091342c06 Kent Overstreet 2024-04-20  610  	struct bucket_alloc_state s = {
c6705091342c06 Kent Overstreet 2024-04-20  611  		.btree_bitmap = data_type == BCH_DATA_btree,
c6705091342c06 Kent Overstreet 2024-04-20  612  	};
a977f3e162924e Kent Overstreet 2024-09-01  613  	bool waiting = nowait;
f25d8215f49941 Kent Overstreet 2022-01-09  614  again:
ed80c5699a23c4 Kent Overstreet 2022-10-21  615  	bch2_dev_usage_read_fast(ca, usage);
e53a961c6b1ced Kent Overstreet 2023-06-24  616  	avail = dev_buckets_free(ca, *usage, watermark);
822835ffeae411 Kent Overstreet 2022-04-01  617  
ed80c5699a23c4 Kent Overstreet 2022-10-21  618  	if (usage->d[BCH_DATA_need_discard].buckets > avail)
64ee1431cc7d11 Kent Overstreet 2024-06-23  619  		bch2_dev_do_discards(ca);
822835ffeae411 Kent Overstreet 2022-04-01  620  
ed80c5699a23c4 Kent Overstreet 2022-10-21  621  	if (usage->d[BCH_DATA_need_gc_gens].buckets > avail)
103304021e54bf Kent Overstreet 2024-04-19  622  		bch2_gc_gens_async(c);
822835ffeae411 Kent Overstreet 2022-04-01  623  
ed80c5699a23c4 Kent Overstreet 2022-10-21  624  	if (should_invalidate_buckets(ca, *usage))
64ee1431cc7d11 Kent Overstreet 2024-06-23  625  		bch2_dev_do_invalidates(ca);
822835ffeae411 Kent Overstreet 2022-04-01  626  
f25d8215f49941 Kent Overstreet 2022-01-09  627  	if (!avail) {
822835ffeae411 Kent Overstreet 2022-04-01  628  		if (cl && !waiting) {
f25d8215f49941 Kent Overstreet 2022-01-09  629  			closure_wait(&c->freelist_wait, cl);
822835ffeae411 Kent Overstreet 2022-04-01  630  			waiting = true;
f25d8215f49941 Kent Overstreet 2022-01-09  631  			goto again;
f25d8215f49941 Kent Overstreet 2022-01-09  632  		}
f25d8215f49941 Kent Overstreet 2022-01-09  633  
f1ca1abfb0275d Kent Overstreet 2024-03-13  634  		track_event_change(&c->times[BCH_TIME_blocked_allocate], true);
f25d8215f49941 Kent Overstreet 2022-01-09  635  
615f867c14b2d7 Kent Overstreet 2022-07-17  636  		ob = ERR_PTR(-BCH_ERR_freelist_empty);
f25d8215f49941 Kent Overstreet 2022-01-09  637  		goto err;
f25d8215f49941 Kent Overstreet 2022-01-09  638  	}
f25d8215f49941 Kent Overstreet 2022-01-09  639  
822835ffeae411 Kent Overstreet 2022-04-01  640  	if (waiting)
822835ffeae411 Kent Overstreet 2022-04-01  641  		closure_wake_up(&c->freelist_wait);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  642  alloc:
f2b542ba42a8b3 Kent Overstreet 2022-12-11  643  	ob = likely(freespace)
e53a961c6b1ced Kent Overstreet 2023-06-24  644  		? bch2_bucket_alloc_freelist(trans, ca, watermark, &s, cl)
e53a961c6b1ced Kent Overstreet 2023-06-24  645  		: bch2_bucket_alloc_early(trans, ca, watermark, &s, cl);
ae10fe017bf546 Kent Overstreet 2022-11-04  646  
ae10fe017bf546 Kent Overstreet 2022-11-04  647  	if (s.skipped_need_journal_commit * 2 > avail)
f25d8215f49941 Kent Overstreet 2022-01-09  648  		bch2_journal_flush_async(&c->journal, NULL);
f2b542ba42a8b3 Kent Overstreet 2022-12-11  649  
c6705091342c06 Kent Overstreet 2024-04-20  650  	if (!ob && s.btree_bitmap != BTREE_BITMAP_ANY) {
c6705091342c06 Kent Overstreet 2024-04-20  651  		s.btree_bitmap = BTREE_BITMAP_ANY;
c6705091342c06 Kent Overstreet 2024-04-20  652  		goto alloc;
c6705091342c06 Kent Overstreet 2024-04-20  653  	}
c6705091342c06 Kent Overstreet 2024-04-20  654  
067d228bb0c405 Kent Overstreet 2023-07-07  655  	if (!ob && freespace && c->curr_recovery_pass <= BCH_RECOVERY_PASS_check_alloc_info) {
f2b542ba42a8b3 Kent Overstreet 2022-12-11  656  		freespace = false;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  657  		goto alloc;
f2b542ba42a8b3 Kent Overstreet 2022-12-11  658  	}
f25d8215f49941 Kent Overstreet 2022-01-09  659  err:
f25d8215f49941 Kent Overstreet 2022-01-09  660  	if (!ob)
615f867c14b2d7 Kent Overstreet 2022-07-17  661  		ob = ERR_PTR(-BCH_ERR_no_buckets_found);
f25d8215f49941 Kent Overstreet 2022-01-09  662  
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  663  	if (!IS_ERR(ob))
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  664  		ob->data_type = data_type;
e7f63c67fcb4a4 Kent Overstreet 2024-04-20  665  
674cfc26240b78 Kent Overstreet 2022-08-27  666  	if (!IS_ERR(ob))
40574946b8a517 Kent Overstreet 2024-05-04  667  		count_event(c, bucket_alloc);
adf16c6dfa279f Kent Overstreet 2022-10-17  668  	else if (!bch2_err_matches(PTR_ERR(ob), BCH_ERR_transaction_restart))
40574946b8a517 Kent Overstreet 2024-05-04  669  		count_event(c, bucket_alloc_fail);
40574946b8a517 Kent Overstreet 2024-05-04  670  
40574946b8a517 Kent Overstreet 2024-05-04  671  	if (!IS_ERR(ob)
40574946b8a517 Kent Overstreet 2024-05-04  672  	    ? trace_bucket_alloc_enabled()
40574946b8a517 Kent Overstreet 2024-05-04  673  	    : trace_bucket_alloc_fail_enabled())
40574946b8a517 Kent Overstreet 2024-05-04  674  		trace_bucket_alloc2(c, ca, watermark, data_type, cl, usage, &s, ob);
f25d8215f49941 Kent Overstreet 2022-01-09  675  
f25d8215f49941 Kent Overstreet 2022-01-09  676  	return ob;
f25d8215f49941 Kent Overstreet 2022-01-09  677  }
f25d8215f49941 Kent Overstreet 2022-01-09  678  

:::::: The code at line 605 was first introduced by commit
:::::: f25d8215f499418c17dfde0b3158a66e03c758dc bcachefs: Kill allocator threads & freelists

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
