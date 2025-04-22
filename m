Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517F82F37
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Apr 2025 14:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331338; cv=none; b=CJj/GUfO9BFYilIx8/MDIifrTcVLpiLathpaiJdZExKJ2JB+2Xx35eDQVbu0vPo2ORq3DbAd5fIlDHXNkOX6TbuvfH1f88hlbKRbXXkuBWqcQlC8sXDUQZ8D8SVkx6Xte5FvPJBiua68pQLlJlKVLRXgOwbYK/uQPbBd1U9lzKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331338; c=relaxed/simple;
	bh=Ile//RdHC018P9QzBHirMUByxfj5qfAizZd5mI8TWAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W3oVk0953Gm0sdKCRLbdtH6YI/a/IcgCjaYbua7Kk+GW/Z+3J1tXj1Eb1JaunUYP+viq+SBrKDmexZNXuzZTzWo8+1o7Uv7Z4GCci02ovgPvB1hTWzQB1oZCUG2wpB+l+odN3tzJ7ahaon+14bbwRlk2bu5xrbTk+qi2Z4czKmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejgTJ6qS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejgTJ6qS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745331336; x=1776867336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ile//RdHC018P9QzBHirMUByxfj5qfAizZd5mI8TWAA=;
  b=ejgTJ6qSy6UW7jHGqjyU/omeQMje2YjRRhPWAZAdylwunUTQKLBFq5fR
   6eFWyEVSjUzWTnsU15w5jqlC1WTV3NmsX/K/4retSOL+wkr4blL2h5h9Q
   ImvEGSSWeqRwiNpBqHVlGlP7S0ywY+4D7j3IrI/rSzIPROw2W+WmdwoMo
   mzYXRvZNkkLyHCipLszDYbFVz7g9Uwe7h+B80vI9pTK9e5tIl/hh1dJGO
   UBG7EE54//8mltE3ZeLh5Wa1focu74+FmHTaHJ9uwRJRJpq05UgasV2/i
   IdjocXJBwSDzcUBpprrlIj40D2uQfH1C5wrSbmMKqOJKTseKxyIGX92Ru
   A==;
X-CSE-ConnectionGUID: cMtbZeW1TKaBTHduT1zvWA==
X-CSE-MsgGUID: TAEpripHQumXvdqnBvuDTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50554317"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="50554317"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 07:15:35 -0700
X-CSE-ConnectionGUID: rcvR9w/BTZW4Nyq2+9J+sg==
X-CSE-MsgGUID: AszfdquFSnC6qV+zWg3/BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; 
   d="scan'208";a="136815188"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Apr 2025 07:15:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7EPM-00014B-1h;
	Tue, 22 Apr 2025 14:15:32 +0000
Date: Tue, 22 Apr 2025 22:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 112/112]
 fs/bcachefs/io_read.c:576:13: warning: unused variable 'orig_error'
Message-ID: <202504222217.Ytw8XutK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   645f0f168a2c68dabce5ff31f6d2d164640b5b88
commit: 645f0f168a2c68dabce5ff31f6d2d164640b5b88 [112/112] bcachefs: Emit a single log message on data read error
config: i386-buildonly-randconfig-004-20250422 (https://download.01.org/0day-ci/archive/20250422/202504222217.Ytw8XutK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504222217.Ytw8XutK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504222217.Ytw8XutK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/io_read.c: In function 'bch2_rbio_retry':
>> fs/bcachefs/io_read.c:576:13: warning: unused variable 'orig_error' [-Wunused-variable]
     576 |         int orig_error = rbio->ret;
         |             ^~~~~~~~~~


vim +/orig_error +576 fs/bcachefs/io_read.c

1809b8cba756d32 Kent Overstreet 2023-09-10  563  
1809b8cba756d32 Kent Overstreet 2023-09-10  564  static void bch2_rbio_retry(struct work_struct *work)
1809b8cba756d32 Kent Overstreet 2023-09-10  565  {
1809b8cba756d32 Kent Overstreet 2023-09-10  566  	struct bch_read_bio *rbio =
1809b8cba756d32 Kent Overstreet 2023-09-10  567  		container_of(work, struct bch_read_bio, work);
1809b8cba756d32 Kent Overstreet 2023-09-10  568  	struct bch_fs *c	= rbio->c;
1809b8cba756d32 Kent Overstreet 2023-09-10  569  	struct bvec_iter iter	= rbio->bvec_iter;
1809b8cba756d32 Kent Overstreet 2023-09-10  570  	unsigned flags		= rbio->flags;
1809b8cba756d32 Kent Overstreet 2023-09-10  571  	subvol_inum inum = {
1809b8cba756d32 Kent Overstreet 2023-09-10  572  		.subvol = rbio->subvol,
1809b8cba756d32 Kent Overstreet 2023-09-10  573  		.inum	= rbio->read_pos.inode,
1809b8cba756d32 Kent Overstreet 2023-09-10  574  	};
1809b8cba756d32 Kent Overstreet 2023-09-10  575  	struct bch_io_failures failed = { .nr = 0 };
7dfd42a07acfeaa Kent Overstreet 2025-04-09 @576  	int orig_error = rbio->ret;
7dfd42a07acfeaa Kent Overstreet 2025-04-09  577  
35de2abc2227468 Kent Overstreet 2025-03-10  578  	struct btree_trans *trans = bch2_trans_get(c);
1809b8cba756d32 Kent Overstreet 2023-09-10  579  
431bf1aaf68a65d Kent Overstreet 2025-03-10  580  	struct bkey_buf sk;
431bf1aaf68a65d Kent Overstreet 2025-03-10  581  	bch2_bkey_buf_init(&sk);
431bf1aaf68a65d Kent Overstreet 2025-03-10  582  	bkey_init(&sk.k->k);
431bf1aaf68a65d Kent Overstreet 2025-03-10  583  
157ea5834133c02 Kent Overstreet 2025-02-03  584  	trace_io_read_retry(&rbio->bio);
157ea5834133c02 Kent Overstreet 2025-02-03  585  	this_cpu_add(c->counters[BCH_COUNTER_io_read_retry],
157ea5834133c02 Kent Overstreet 2025-02-03  586  		     bvec_iter_sectors(rbio->bvec_iter));
1809b8cba756d32 Kent Overstreet 2023-09-10  587  
431bf1aaf68a65d Kent Overstreet 2025-03-10  588  	get_rbio_extent(trans, rbio, &sk);
431bf1aaf68a65d Kent Overstreet 2025-03-10  589  
431bf1aaf68a65d Kent Overstreet 2025-03-10  590  	if (!bkey_deleted(&sk.k->k) &&
431bf1aaf68a65d Kent Overstreet 2025-03-10  591  	    bch2_err_matches(rbio->ret, BCH_ERR_data_read_retry_avoid))
be31e412ac01f49 Kent Overstreet 2025-03-08  592  		bch2_mark_io_failure(&failed, &rbio->pick,
be31e412ac01f49 Kent Overstreet 2025-03-08  593  				     rbio->ret == -BCH_ERR_data_read_retry_csum_err);
1809b8cba756d32 Kent Overstreet 2023-09-10  594  
943f0cfb1559ac6 Kent Overstreet 2025-03-07  595  	if (!rbio->split) {
1809b8cba756d32 Kent Overstreet 2023-09-10  596  		rbio->bio.bi_status	= 0;
943f0cfb1559ac6 Kent Overstreet 2025-03-07  597  		rbio->ret		= 0;
943f0cfb1559ac6 Kent Overstreet 2025-03-07  598  	}
1809b8cba756d32 Kent Overstreet 2023-09-10  599  
ccba9029b01cdcc Kent Overstreet 2025-03-08  600  	unsigned subvol		= rbio->subvol;
ccba9029b01cdcc Kent Overstreet 2025-03-08  601  	struct bpos read_pos	= rbio->read_pos;
ccba9029b01cdcc Kent Overstreet 2025-03-08  602  
1809b8cba756d32 Kent Overstreet 2023-09-10  603  	rbio = bch2_rbio_free(rbio);
1809b8cba756d32 Kent Overstreet 2023-09-10  604  
9157b3ddfb151d9 Kent Overstreet 2025-01-17  605  	flags |= BCH_READ_in_retry;
9157b3ddfb151d9 Kent Overstreet 2025-01-17  606  	flags &= ~BCH_READ_may_promote;
9157b3ddfb151d9 Kent Overstreet 2025-01-17  607  	flags &= ~BCH_READ_last_fragment;
9157b3ddfb151d9 Kent Overstreet 2025-01-17  608  	flags |= BCH_READ_must_clone;
1809b8cba756d32 Kent Overstreet 2023-09-10  609  
3fb8bacb14b6fb7 Kent Overstreet 2025-03-12  610  	int ret = rbio->data_update
35de2abc2227468 Kent Overstreet 2025-03-10  611  		? bch2_read_retry_nodecode(trans, rbio, iter, &failed, flags)
431bf1aaf68a65d Kent Overstreet 2025-03-10  612  		: __bch2_read(trans, rbio, iter, inum, &failed, &sk, flags);
de73677ff8e677b Kent Overstreet 2025-03-08  613  
de73677ff8e677b Kent Overstreet 2025-03-08  614  	if (ret) {
de73677ff8e677b Kent Overstreet 2025-03-08  615  		rbio->ret = ret;
de73677ff8e677b Kent Overstreet 2025-03-08  616  		rbio->bio.bi_status = BLK_STS_IOERR;
645f0f168a2c68d Kent Overstreet 2025-04-22  617  	}
645f0f168a2c68d Kent Overstreet 2025-04-22  618  
645f0f168a2c68d Kent Overstreet 2025-04-22  619  	if (failed.nr || ret) {
ccba9029b01cdcc Kent Overstreet 2025-03-08  620  		struct printbuf buf = PRINTBUF;
645f0f168a2c68d Kent Overstreet 2025-04-22  621  		bch2_log_msg_start(c, &buf);
ccba9029b01cdcc Kent Overstreet 2025-03-08  622  
35de2abc2227468 Kent Overstreet 2025-03-10  623  		lockrestart_do(trans,
ccba9029b01cdcc Kent Overstreet 2025-03-08  624  			bch2_inum_offset_err_msg_trans(trans, &buf,
ccba9029b01cdcc Kent Overstreet 2025-03-08  625  					(subvol_inum) { subvol, read_pos.inode },
ccba9029b01cdcc Kent Overstreet 2025-03-08  626  					read_pos.offset << 9));
3fb8bacb14b6fb7 Kent Overstreet 2025-03-12  627  		if (rbio->data_update)
ccba9029b01cdcc Kent Overstreet 2025-03-08  628  			prt_str(&buf, "(internal move) ");
645f0f168a2c68d Kent Overstreet 2025-04-22  629  
645f0f168a2c68d Kent Overstreet 2025-04-22  630  		prt_str(&buf, "data read error, ");
645f0f168a2c68d Kent Overstreet 2025-04-22  631  		if (!ret)
ccba9029b01cdcc Kent Overstreet 2025-03-08  632  			prt_str(&buf, "successful retry");
645f0f168a2c68d Kent Overstreet 2025-04-22  633  		else
645f0f168a2c68d Kent Overstreet 2025-04-22  634  			prt_str(&buf, bch2_err_str(ret));
645f0f168a2c68d Kent Overstreet 2025-04-22  635  		prt_newline(&buf);
ccba9029b01cdcc Kent Overstreet 2025-03-08  636  
645f0f168a2c68d Kent Overstreet 2025-04-22  637  		if (!bkey_deleted(&sk.k->k)) {
645f0f168a2c68d Kent Overstreet 2025-04-22  638  			bch2_bkey_val_to_text(&buf, c, bkey_i_to_s_c(sk.k));
645f0f168a2c68d Kent Overstreet 2025-04-22  639  			prt_newline(&buf);
645f0f168a2c68d Kent Overstreet 2025-04-22  640  		}
645f0f168a2c68d Kent Overstreet 2025-04-22  641  
645f0f168a2c68d Kent Overstreet 2025-04-22  642  		bch2_io_failures_to_text(&buf, c, &failed);
645f0f168a2c68d Kent Overstreet 2025-04-22  643  
645f0f168a2c68d Kent Overstreet 2025-04-22  644  		bch2_print_str_ratelimited(c, KERN_ERR, buf.buf);
ccba9029b01cdcc Kent Overstreet 2025-03-08  645  		printbuf_exit(&buf);
de73677ff8e677b Kent Overstreet 2025-03-08  646  	}
de73677ff8e677b Kent Overstreet 2025-03-08  647  
de73677ff8e677b Kent Overstreet 2025-03-08  648  	bch2_rbio_done(rbio);
431bf1aaf68a65d Kent Overstreet 2025-03-10  649  	bch2_bkey_buf_exit(&sk, c);
35de2abc2227468 Kent Overstreet 2025-03-10  650  	bch2_trans_put(trans);
1809b8cba756d32 Kent Overstreet 2023-09-10  651  }
1809b8cba756d32 Kent Overstreet 2023-09-10  652  

:::::: The code at line 576 was first introduced by commit
:::::: 7dfd42a07acfeaac4e36620927ea227b1e8da3e9 bcachefs: Don't print data read retry success on non-errors

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
