Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9549472625
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 02:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754100765; cv=none; b=jx3L4UBJubGnSAFs2SWQ2oiHtcym5J7Cp+YnorI2wA+IXO3wKx+7Opywn88DiIeRexieJByG5+GUsuyhbcwpOvVriEXjQDGHdk2Z5R5xP7j6mkHwJNJjg6pMsNhcz6YdC94FBOZWDaKyCOwKKiTvMwR+TaYm8up7IyeAGToH5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754100765; c=relaxed/simple;
	bh=kfcUS1bADZV7GR67LuUiKyVuzrrk3+wPU/NNluJGAso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZqmhHl90RhNNRbKKcP74B3lhUN1QLt4wvqMxBfXeKZP/aZd3W6WGI3zv9aO3XuNAC3iXufxjLH19fMwHqgaQUGRkc8uzpKaTsOEbgEiYkhAYnAqXNkulYBBk525Uzgg6+eaYGaM56gGlrZSlWxreMvpaTT7w4+RLrdsTvHP66k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b71t0ZRG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b71t0ZRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754100764; x=1785636764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kfcUS1bADZV7GR67LuUiKyVuzrrk3+wPU/NNluJGAso=;
  b=b71t0ZRGBwAgLVrFo+7vWiC1TMUO9stHyzZfQv91/XwEJCdgQTtc/FvD
   LiDvNXh/CsiGn3OxUvLzMpOqWY6yGS3gWCrEWytBNtFtrTQycWlMhuC5n
   KTBKZynHIgD2iwB+gJ56lnOe3uMGx5u4xn4u5OiGAAJ67hZoRc/by3djh
   ub6/YCMM/3dFKmZr1hvjupIw1xWnG53UJ1oGD7FnSFEXUnGbOV7Bmun9H
   Wl+shztk31uewpqLups5TJFSNL/Gra7Nfy3N/EXHaGGtW18wwqv53J6wv
   nk2I7jkUh2jaYW+BMBPs94x5wz4634bcgLa/rEYjZiyI1svmlgS/zI1fi
   w==;
X-CSE-ConnectionGUID: w7u/hp43R0OnI9KGgNXZ1Q==
X-CSE-MsgGUID: t4arZQocQoSgXQ0EX6D/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59071772"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59071772"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 19:12:43 -0700
X-CSE-ConnectionGUID: jVX+ChFfQ6+RvxDRJsuSvw==
X-CSE-MsgGUID: +Z0KqzUzS3efm0UfDbwV0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162989112"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 01 Aug 2025 19:12:43 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui1jj-0001Kp-1d;
	Sat, 02 Aug 2025 02:12:39 +0000
Date: Sat, 2 Aug 2025 04:11:51 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 249/249]
 fs/bcachefs/error.h:98:2: warning: '%s' directive argument is null
Message-ID: <202508020435.tVdpyEin-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   97445ac203207b80234a475e4b9f04e6ab7e769d
commit: 113b8a822762cce6c09f4cf8aedeeca7c24e9d60 [249/249] bcachefs: btree_check_root_boundaries()
config: nios2-randconfig-2003-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020435.tVdpyEin-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020435.tVdpyEin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020435.tVdpyEin-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/backpointers.h:9,
                    from fs/bcachefs/btree_gc.c:10:
   fs/bcachefs/btree_gc.c: In function 'btree_check_root_boundaries':
>> fs/bcachefs/error.h:98:2: warning: '%s' directive argument is null [-Wformat-overflow=]
      98 |  __bch2_fsck_err(type_is(c, struct bch_fs *) ? (struct bch_fs *) c : NULL,\
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      99 |    type_is(c, struct btree_trans *) ? (struct btree_trans *) c : NULL,\
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     100 |    _flags, BCH_FSCK_ERR_##_err_type, __VA_ARGS__)
         |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/bcachefs/error.h:107:13: note: in definition of macro 'fsck_err_wrap'
     107 |  int _ret = _do;       \
         |             ^~~
   fs/bcachefs/error.h:117:40: note: in expansion of macro 'bch2_fsck_err'
     117 | #define __fsck_err(...)  fsck_err_wrap(bch2_fsck_err(__VA_ARGS__))
         |                                        ^~~~~~~~~~~~~
   fs/bcachefs/error.h:130:20: note: in expansion of macro '__fsck_err'
     130 |  (unlikely(cond) ? __fsck_err(c, _flags, _err_type, __VA_ARGS__) : false);\
         |                    ^~~~~~~~~~
   fs/bcachefs/error.h:137:2: note: in expansion of macro '__fsck_err_on'
     137 |  __fsck_err_on(cond, c, FSCK_CAN_FIX, _err_type, __VA_ARGS__)
         |  ^~~~~~~~~~~~~
   fs/bcachefs/btree_gc.c:295:6: note: in expansion of macro 'mustfix_fsck_err_on'
     295 |  if (mustfix_fsck_err_on(!bpos_eq(b->data->min_key, POS_MIN),
         |      ^~~~~~~~~~~~~~~~~~~
   fs/bcachefs/btree_gc.c:297:43: note: format string is defined here
     297 |         "btree root with incorrect min_key%s", buf.buf)) {
         |                                           ^~


vim +98 fs/bcachefs/error.h

1c6fdbd8f2465d Kent Overstreet 2017-03-16   83  
2085325171f2f2 Kent Overstreet 2025-04-15   84  bool __bch2_count_fsck_err(struct bch_fs *, enum bch_sb_error_id, struct printbuf *);
7337f9f14e0e2d Kent Overstreet 2025-03-28   85  #define bch2_count_fsck_err(_c, _err, ...)				\
7337f9f14e0e2d Kent Overstreet 2025-03-28   86  	__bch2_count_fsck_err(_c, BCH_FSCK_ERR_##_err, __VA_ARGS__)
7337f9f14e0e2d Kent Overstreet 2025-03-28   87  
d31f155964aee6 Kent Overstreet 2025-04-22   88  int bch2_fsck_err_opt(struct bch_fs *,
d31f155964aee6 Kent Overstreet 2025-04-22   89  		      enum bch_fsck_flags,
d31f155964aee6 Kent Overstreet 2025-04-22   90  		      enum bch_sb_error_id);
d31f155964aee6 Kent Overstreet 2025-04-22   91  
a850bde6498b46 Kent Overstreet 2024-02-08   92  __printf(5, 6) __cold
a850bde6498b46 Kent Overstreet 2024-02-08   93  int __bch2_fsck_err(struct bch_fs *, struct btree_trans *,
b65db750e2bb92 Kent Overstreet 2023-10-24   94  		  enum bch_fsck_flags,
b65db750e2bb92 Kent Overstreet 2023-10-24   95  		  enum bch_sb_error_id,
b65db750e2bb92 Kent Overstreet 2023-10-24   96  		  const char *, ...);
a850bde6498b46 Kent Overstreet 2024-02-08   97  #define bch2_fsck_err(c, _flags, _err_type, ...)				\
a850bde6498b46 Kent Overstreet 2024-02-08  @98  	__bch2_fsck_err(type_is(c, struct bch_fs *) ? (struct bch_fs *) c : NULL,\
a850bde6498b46 Kent Overstreet 2024-02-08   99  			type_is(c, struct btree_trans *) ? (struct btree_trans *) c : NULL,\
a850bde6498b46 Kent Overstreet 2024-02-08  100  			_flags, BCH_FSCK_ERR_##_err_type, __VA_ARGS__)
a850bde6498b46 Kent Overstreet 2024-02-08  101  

:::::: The code at line 98 was first introduced by commit
:::::: a850bde6498b46d6e3143d8847f9aa9598491f9f bcachefs: fsck_err() may now take a btree_trans

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
