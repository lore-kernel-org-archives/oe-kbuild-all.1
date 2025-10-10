Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D08C0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 03:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760067955; cv=none; b=rbLZm88oKRjwId+CrnUjJ/bAE4zDVwZI9q1IZCXEnwo7GbRGN/nM3U/+MRvEr31TaogrWCl8zL5wP6V5znXFgpCkReNECF7t08a449w3SnUJWSMAZS/jD8E5AmNmhyZTGu0dFejmtDHN21FDYxzbwSp8sa9/p+Jumv1vl5w3HDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760067955; c=relaxed/simple;
	bh=SMEw060J+0BzSyIpqqgShmjketAVpc/tB5YOk57SYuc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aYfbuWFtjKmCxu4mw5cF8V9/wYFWOaf1VwqcjRQMdAleJ3frOpx4DARp9m+9aCV/gU/jntStTum0r8ye3V6AI0lycxiARVs+6Jv1V11XLJP6FABMykWuKGJu1A8KEeh8+FU4tsZW/Z3uSVjm0dgQ7FSLwUXekJq7R0A+kjcWpzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kSrI6oGh; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kSrI6oGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760067953; x=1791603953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SMEw060J+0BzSyIpqqgShmjketAVpc/tB5YOk57SYuc=;
  b=kSrI6oGhiRTXi1cWJaetyoLmTrQaoT2mcnM2IxLa4+A9umLP1a3Wplnr
   lpTo1ukkfBG9Ix4W4b3e747a6JoKVxEZ2HnOyn2nmhZSwj6yuDuhWOiNs
   1PI+knSQWwtVZKUWsj4Q8KCPW/P4wCDqC6wRhdOqi5oxnOz2vult7v9YI
   nRFoirl5aJAfPY19FGza9fKGgsX5i59UTKzv3SSYqDtqdX5pTuFkymbb1
   CrxFMZ0AF9b8ZyFqDlzZ4hgvZ9El9O9QkxVAMBBLo7u6ktiv8fllCuW+5
   LgjNAnMuaGY7WU9p6dYrLEawsAWm66mca8Jn3PA7gDjRXZcy7IpBc2P3y
   w==;
X-CSE-ConnectionGUID: IyyvmJHCSUGP4M+m4FmmVA==
X-CSE-MsgGUID: 4OV3EbyYQL2MvtxngC/FYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64908588"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="64908588"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 20:45:53 -0700
X-CSE-ConnectionGUID: BnAymf0MQ1i0S6imVVSMTA==
X-CSE-MsgGUID: dnHtZIXoRfO+C+6b+DWMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="179989206"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2025 20:45:52 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v744j-00023j-02;
	Fri, 10 Oct 2025 03:45:49 +0000
Date: Fri, 10 Oct 2025 11:44:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-for-bisect 476/480]
 fs/bcachefs/debug/tests.c:499:1: warning: control reaches end of non-void
 function
Message-ID: <202510101130.GktZMHEP-lkp@intel.com>
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
config: arm-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101130.GktZMHEP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101130.GktZMHEP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101130.GktZMHEP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/debug/tests.c: In function 'test_snapshots':
   fs/bcachefs/debug/tests.c:496:2: error: 'ret' undeclared (first use in this function); did you mean 'net'?
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
>> fs/bcachefs/debug/tests.c:499:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +499 fs/bcachefs/debug/tests.c

7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  475  
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  476  static int test_snapshots(struct bch_fs *c, u64 nr)
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  477  {
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  478  	struct bkey_i_cookie cookie;
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  479  	bkey_cookie_init(&cookie.k_i);
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  480  	cookie.k.p.snapshot = U32_MAX;
25a162fa6dee0bc fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  481  
516eb84dbac3946 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  482  	try(bch2_btree_insert(c, BTREE_ID_xattrs, &cookie.k_i, NULL, 0, 0));
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  483  
25a162fa6dee0bc fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  484  	u32 snapids[2];
25a162fa6dee0bc fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  485  	u32 snapid_subvols[2] = { 1, 1 };
25a162fa6dee0bc fs/bcachefs/tests.c       Kent Overstreet 2025-07-14  486  
516eb84dbac3946 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  487  	try(bch2_trans_commit_do(c, NULL, NULL, 0,
6bd68ec266ad718 fs/bcachefs/tests.c       Kent Overstreet 2023-09-12  488  		bch2_snapshot_node_create(trans, U32_MAX,
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  489  					  snapids,
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  490  					  snapid_subvols,
516eb84dbac3946 fs/bcachefs/debug/tests.c Kent Overstreet 2025-10-05  491  					  2)));
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  492  
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  493  	if (snapids[0] > snapids[1])
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  494  		swap(snapids[0], snapids[1]);
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  495  
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  496  	ret = test_snapshot_filter(c, snapids[0], snapids[1]);
1bb3c2a9747c404 fs/bcachefs/tests.c       Kent Overstreet 2023-06-20  497  	bch_err_msg(c, ret, "from test_snapshot_filter");
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  498  	return ret;
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29 @499  }
7f6ff935f74e8bb fs/bcachefs/tests.c       Kent Overstreet 2021-12-29  500  

:::::: The code at line 499 was first introduced by commit
:::::: 7f6ff935f74e8bb3257314f7e31182b6ad96198a bcachefs: New snapshot unit test

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
