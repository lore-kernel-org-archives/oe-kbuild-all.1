Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614F81DE89A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 05:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760074435; cv=none; b=iywNB6xr/OQvgWt3K5FdCh63rLYLYl2sBgb1+GUnrCXqWd9ayNtM+/QJ46gL9R+jR48H2bRaYyfNqzCM27+DXPLTYzWJLo30PLR0uoj7Mdmfif83H6QxGa2L0BUTcN72RzPAbULkhTgd0/8v2c1Hp5XOtA2qxy2k1PQhCmxslfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760074435; c=relaxed/simple;
	bh=cT9lYuM8yJUbhxkGXjX93XPIU/6KMP1vxEmcix1hnkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=owS9+RHNtNwpRVoH8GHHIe691P69XUM/P+8u5B1uIjEaGs4ebsZvD2FYLpHopyBpygcK/TS55MnQJypYyRox5GqEnaDY6/e0+Wm9GXqMseebAP7ZkKat9AlM1MXvEM3J7EoW0ZhByQXw0FezCaywxbdkejzYDmcPEUdP77C9WJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RSjSNcro; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RSjSNcro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760074433; x=1791610433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cT9lYuM8yJUbhxkGXjX93XPIU/6KMP1vxEmcix1hnkw=;
  b=RSjSNcroJYGKNmG4gcuGjXvCz4TG6Cca4QREgDkYaWzBLTTASktZHnac
   7tJsbuW63hZHrrMXzzkMoRnG06p2qovzzyuCBKPZSln44qgkaoE64P7iX
   TkapjKN1uPAkGCKvHhvhoSIZn6GEqpTnhR+HxF+YXOi9arKtR6D2gxmbr
   eSjfNpfPVZrtQ+xfhYCMMD1Tyhn5JJxpG1r/ltqIZ+h9lOnqRezJKUN+v
   KxXcoeHI1s3ZX/eGbA/sWx/roZPiGa1f7zJ5IS60bO1Lqb/Pw/bOhAzbK
   3dzzTDq5++eumzptDoB7gofYwTv2eHTsWHrqSAkfxfW1wR6/3vK2tnZ4+
   Q==;
X-CSE-ConnectionGUID: pZpIjAbISH20PxgubU8fAg==
X-CSE-MsgGUID: ygYyKFxvSeWcv/tIPLg0uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62211201"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62211201"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:33:53 -0700
X-CSE-ConnectionGUID: jG3NG7ouQ42urNQUSGhiaA==
X-CSE-MsgGUID: BmTaV16CQkaqPieEQDogrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="186015012"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2025 22:33:51 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v75lF-0002IR-00;
	Fri, 10 Oct 2025 05:33:49 +0000
Date: Fri, 10 Oct 2025 13:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-for-bisect 476/480]
 fs/bcachefs/debug/tests.c:496:2: error: 'ret' undeclared; did you mean
 'net'?
Message-ID: <202510101325.cnK3YS1w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-for-bisect
head:   6bcd9c8bec658f1aaf1eeabb8e8ed1e27a0a2c77
commit: 516eb84dbac3946a5ca17259962cf82f4ef2c05a [476/480] bcachefs: try()
config: arm-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101325.cnK3YS1w-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101325.cnK3YS1w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101325.cnK3YS1w-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bcachefs/debug/tests.c: In function 'test_snapshots':
>> fs/bcachefs/debug/tests.c:496:2: error: 'ret' undeclared (first use in this function); did you mean 'net'?
     ret = test_snapshot_filter(c, snapids[0], snapids[1]);
     ^~~
     net
   fs/bcachefs/debug/tests.c:496:2: note: each undeclared identifier is reported only once for each function it appears in
   fs/bcachefs/debug/tests.c: In function 'rand_delete':
   fs/bcachefs/debug/tests.c:634:7: error: 'ret' undeclared (first use in this function); did you mean 'net'?
      if (ret)
          ^~~
          net
   fs/bcachefs/debug/tests.c: In function 'test_snapshots':
   fs/bcachefs/debug/tests.c:499:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +496 fs/bcachefs/debug/tests.c

7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  475  
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  476  static int test_snapshots(struct bch_fs *c, u64 nr)
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  477  {
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  478  	struct bkey_i_cookie cookie;
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  479  	bkey_cookie_init(&cookie.k_i);
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  480  	cookie.k.p.snapshot = U32_MAX;
25a162fa6dee0b fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  481  
516eb84dbac394 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  482  	try(bch2_btree_insert(c, BTREE_ID_xattrs, &cookie.k_i, NULL, 0, 0));
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  483  
25a162fa6dee0b fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  484  	u32 snapids[2];
25a162fa6dee0b fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  485  	u32 snapid_subvols[2] = { 1, 1 };
25a162fa6dee0b fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  486  
516eb84dbac394 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  487  	try(bch2_trans_commit_do(c, NULL, NULL, 0,
6bd68ec266ad71 fs/bcachefs/tests.c       Kent Overstreet 2023-09-12  488  		bch2_snapshot_node_create(trans, U32_MAX,
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  489  					  snapids,
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  490  					  snapid_subvols,
516eb84dbac394 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  491  					  2)));
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  492  
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  493  	if (snapids[0] > snapids[1])
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  494  		swap(snapids[0], snapids[1]);
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  495  
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29 @496  	ret = test_snapshot_filter(c, snapids[0], snapids[1]);
1bb3c2a9747c40 fs/bcachefs/tests.c       Kent Overstreet 2023-06-20  497  	bch_err_msg(c, ret, "from test_snapshot_filter");
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  498  	return ret;
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  499  }
7f6ff935f74e8b fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  500  

:::::: The code at line 496 was first introduced by commit
:::::: 7f6ff935f74e8bb3257314f7e31182b6ad96198a bcachefs: New snapshot unit test

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
