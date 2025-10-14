Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17152727E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Oct 2025 03:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760412293; cv=none; b=g1ng88hkL8KEr0E+hxka2BKcBBb+i+FeohH/jP9xav35Rlay30MT1Kf94ozCSinfwuOXq+NzzSMPKWujpKsQYMtjZgFr1YodVbbO+WFT0UFO91hBGSL979XhTjQIOhJg6Z/wHGhkEiQt6DNOnhWIbGnMmM7g6v+khpmu7LvuNaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760412293; c=relaxed/simple;
	bh=IkBM2jYIL5fmfo/6hJR16lkqGoA+y7TPj7DigMsp4i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I+ESXw9dPKpCxijmiA8B2XSNC8y7ysZjJX8WIOw5waK9nxNTMSTKak1WArMlP1cJN4en0V/Jjz+947w+l3W6MVwnzXaf95oijYPBG3BJKDUGQ6UL+Vynl6D7iB0bKn0vixlXNRqBkShZVklwE1lJPFmXN9qwSRgnsUnz0EnKFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HKr4IQ/9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HKr4IQ/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760412291; x=1791948291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IkBM2jYIL5fmfo/6hJR16lkqGoA+y7TPj7DigMsp4i4=;
  b=HKr4IQ/9P9V4AKUZMVRawfbvsVa37W/1O1EoX4lC46QhqxHXk/d8Hk+h
   ChMYhAebIIFC7OgVCDpN07zdbawuElPbJ8iQgxiqlqsGW5Hbu1zyrTG+l
   OdVPtEjyUei7biF6Xs+slQGn8r2qWRqMe0KTp6euMdGp6rN5T60SOrrX8
   ZiTAD9SIq9lmKiWJzY9iNisJ1bq5xK/4vFUMrP/VLlH3zd+at/xNtQFXM
   pT0xBZS8OMaDRkDFbgcnOHCvomJnndqmRN6ovOeiv4pdc3Yhty+pDVeMz
   zPdU//WKXXUtnQJ/aGwcK5/XhaDan6u58Pv05MyPNUwokP7LagqoKTm2C
   A==;
X-CSE-ConnectionGUID: 05nNYv3QQhqCKpeQlEgT1A==
X-CSE-MsgGUID: 9geokTQJTTC10ivAtRxAYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61602555"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="61602555"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 20:24:50 -0700
X-CSE-ConnectionGUID: mavK1gm1Rkuy7Fja4jugDg==
X-CSE-MsgGUID: 9O83Vf4TSdWvs0bG7dvSIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181449793"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 13 Oct 2025 20:24:49 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8VeV-0002IQ-0V;
	Tue, 14 Oct 2025 03:24:46 +0000
Date: Tue, 14 Oct 2025 11:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 579/582]
 fs/bcachefs/data/rebalance.c:1089:1: warning: the frame size of 1304 bytes
 is larger than 1280 bytes
Message-ID: <202510141113.XoHRBI9Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   e5cb92e408633c712092ae208bebca9c6f169412
commit: 60c09e502357e5c18737e48ab7d9e61f32651187 [579/582] bcachefs: rebalance_work_(hipri|pending) btrees
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20251014/202510141113.XoHRBI9Z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141113.XoHRBI9Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141113.XoHRBI9Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/data/rebalance.c: In function 'do_rebalance_scan':
>> fs/bcachefs/data/rebalance.c:1089:1: warning: the frame size of 1304 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1089 | }
         | ^
   fs/bcachefs/data/rebalance.c: In function 'bch2_check_rebalance_work':
   fs/bcachefs/data/rebalance.c:1507:1: warning: the frame size of 1384 bytes is larger than 1280 bytes [-Wframe-larger-than=]
    1507 | }
         | ^


vim +1089 fs/bcachefs/data/rebalance.c

de24b682fcd784 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-27  1018  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1019  noinline_for_stack
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1020  static int do_rebalance_scan(struct moving_context *ctxt,
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1021  			     struct per_snapshot_io_opts *snapshot_io_opts,
60c09e502357e5 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1022  			     struct bpos cookie_pos, u64 cookie, u64 *sectors_scanned)
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1023  {
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1024  	struct btree_trans *trans = ctxt->trans;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1025  	struct bch_fs *c = trans->c;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1026  	struct bch_fs_rebalance *r = &c->rebalance;
60c09e502357e5 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1027  	u64 inum = cookie_pos.offset;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1028  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1029  	bch2_move_stats_init(&r->scan_stats, "rebalance_scan");
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1030  	ctxt->stats = &r->scan_stats;
de24b682fcd784 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-27  1031  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1032  	r->state = BCH_REBALANCE_scanning;
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1033  
60c09e502357e5 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1034  	if (inum) {
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1035  		r->scan_start	= BBPOS_MIN;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1036  		r->scan_end	= BBPOS_MAX;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1037  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1038  		for (enum btree_id btree = 0; btree < btree_id_nr_alive(c); btree++) {
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1039  			if (btree != BTREE_ID_extents &&
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1040  			    btree != BTREE_ID_reflink)
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1041  				continue;
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1042  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1043  			try(do_rebalance_scan_btree(ctxt, snapshot_io_opts, btree, 0,
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1044  						    POS_MIN, SPOS_MAX));
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1045  		}
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1046  	} else if (inum >= BCACHEFS_ROOT_INO) {
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1047  		r->scan_start	= BBPOS(BTREE_ID_extents, POS(inum, 0));
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1048  		r->scan_end	= BBPOS(BTREE_ID_extents, POS(inum, U64_MAX));
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1049  
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1050  		try(do_rebalance_scan_btree(ctxt, snapshot_io_opts, BTREE_ID_extents, 0,
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1051  					    r->scan_start.pos, r->scan_end.pos));
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1052  	} else {
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1053  		unsigned dev = inum - 1;
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1054  		r->scan_start	= BBPOS(BTREE_ID_backpointers, POS(dev, 0));
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1055  		r->scan_end	= BBPOS(BTREE_ID_backpointers, POS(dev, U64_MAX));
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1056  
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1057  		struct bkey_buf last_flushed __cleanup(bch2_bkey_buf_exit);
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1058  		bch2_bkey_buf_init(&last_flushed);
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1059  
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1060  		bch2_btree_write_buffer_flush_sync(trans);
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1061  
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1062  		try(for_each_btree_key_max_commit(trans, iter, BTREE_ID_backpointers,
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1063  						  POS(dev, 0), POS(dev, U64_MAX),
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1064  						  BTREE_ITER_prefetch, k,
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1065  						  NULL, NULL, BCH_TRANS_COMMIT_no_enospc, ({
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1066  			ctxt->stats->pos = BBPOS(iter.btree_id, iter.pos);
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1067  
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1068  			if (k.k->type != KEY_TYPE_backpointer)
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1069  				continue;
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1070  
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1071  			do_rebalance_scan_bp(trans, bkey_s_c_to_backpointer(k), &last_flushed);
d8f1a4a0142e6a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1072  		})));
6ba28b3f6ca899 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-08  1073  	}
9565d32e31193a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-07  1074  
9565d32e31193a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-07  1075  	try(commit_do(trans, NULL, NULL, BCH_TRANS_COMMIT_no_enospc,
60c09e502357e5 fs/bcachefs/data/rebalance.c Kent Overstreet 2025-08-23  1076  			bch2_clear_rebalance_needs_scan(trans, cookie_pos, cookie)));
de24b682fcd784 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-27  1077  
eced1488bc6467 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1078  	*sectors_scanned += atomic64_read(&r->scan_stats.sectors_seen);
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1079  	/*
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1080  	 * Ensure that the rebalance_work entries we created are seen by the
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1081  	 * next iteration of do_rebalance(), so we don't end up stuck in
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1082  	 * rebalance_wait():
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1083  	 */
eced1488bc6467 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1084  	*sectors_scanned += 1;
e23c23e4580d1c fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1085  	bch2_move_stats_exit(&r->scan_stats, c);
eced1488bc6467 fs/bcachefs/rebalance.c      Kent Overstreet 2025-08-20  1086  
84b9f17195b2d4 fs/bcachefs/rebalance.c      Kent Overstreet 2025-05-15  1087  	bch2_btree_write_buffer_flush_sync(trans);
9565d32e31193a fs/bcachefs/data/rebalance.c Kent Overstreet 2025-10-07  1088  	return 0;
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16 @1089  }
1c6fdbd8f2465d fs/bcachefs/rebalance.c      Kent Overstreet 2017-03-16  1090  

:::::: The code at line 1089 was first introduced by commit
:::::: 1c6fdbd8f2465ddfb73a01ec620cbf3d14044e1a bcachefs: Initial commit

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
