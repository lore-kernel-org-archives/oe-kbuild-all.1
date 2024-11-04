Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63F14E2FD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 05:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730699387; cv=none; b=jLmwCDzavAg0nHT2PTllc1mfKSPWMkWeAn+OISARBCbZ6Rt292gQTbvuqhIzZZmMgbc+sELGD73z3Lrz8BK+sW1rGx30xHzBCNZdmfSJ0UZrJDGYVVtIuQWC6bI98rW6wAHPvXS/kjgDIc39M+jLkIQVttvjIrZdCHyGiohYoD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730699387; c=relaxed/simple;
	bh=4liKc0bj3gcndm4/2U/sjO4gQ+8GX5hdQxASPpxA1BU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b6gE7HX52fDF7sT8W2d0WJZ2P4/edE9T+KuD2StOUlq4IUUGQYv+R6lXQiEDsSRBVVuguhcxgMMCnFzwDv9fivgbdWevKSDYE8Z5HzdBeWJVVWHzC19/FTLULZ9ZrZEG5CHARmmcXQeqXzI9QE/liH+Dto7cnqNQNMTZIP8Epkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsY2bXY9; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsY2bXY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730699386; x=1762235386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4liKc0bj3gcndm4/2U/sjO4gQ+8GX5hdQxASPpxA1BU=;
  b=TsY2bXY9VdkOk1AYa5Ep0/BAO2aHJF+/qIJvVMBO01gPYpgd04LoKS6R
   DUznOwsDBfGJYgzW086CvL5Oqj1t8huIWJ8GeHG/08lg5Vi8Wmakk0cjv
   YCnRTbyO2hZGrtbxR7JU/KUcNTiihnE27VF1pQ29wqX0O28w+J+c5wm+Z
   Aj5mBnKC2nKgzOf7xUYMUkAogNcU7yLngyDHeoqnKkCXepsTPGNnSveE+
   25Gzbh6Xj64VgAcYkmf7HlSyx1pFO6zf1JOSisjVS92g/3omCa1xU56Ce
   kIFJ9YXLqDl3SYVULkli0XkTSetXDuE2xS5mS2JSXmyqy/bQEC1O1nxIR
   A==;
X-CSE-ConnectionGUID: TipJwZvqQS+Iv2x5BlsnzQ==
X-CSE-MsgGUID: fbmtOppySVShJYPqfTR6wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="40964056"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="40964056"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2024 21:49:45 -0800
X-CSE-ConnectionGUID: 7nvYnLh+RVWqFwRTRMp1PQ==
X-CSE-MsgGUID: Rs7Xp1AsQ1iUa50tCf5prw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; 
   d="scan'208";a="83679398"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 03 Nov 2024 21:49:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7py9-000kVh-2G;
	Mon, 04 Nov 2024 05:49:41 +0000
Date: Mon, 4 Nov 2024 13:49:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:dir-deleg 32/42] include/linux/filelock.h:507:16: error:
 'delegated_inode' undeclared
Message-ID: <202411041339.MsZOpkOO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git dir-deleg
head:   2e48bdf939b25989db6f1d5b16e3814a39dd4c82
commit: b6232347709692f6d08fa8f15ace5ceb06a803e9 [32/42] SQUASH: fix up delegated_inode handling
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241104/202411041339.MsZOpkOO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041339.MsZOpkOO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411041339.MsZOpkOO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/open.c:35:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
>> include/linux/filelock.h:508:1: warning: control reaches end of non-void function [-Wreturn-type]
     508 | }
         | ^
--
   In file included from fs/file_table.c:16:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from fs/nfs/nfs4_fs.h:26,
                    from fs/nfs/nfs4proc.c:59:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_create_session':
   fs/nfs/nfs4proc.c:9512:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
    9512 |         unsigned *ptr;
         |                   ^~~
--
   In file included from fs/nfsd/netns.h:13,
                    from fs/nfsd/nfsd.h:43,
                    from fs/nfsd/export.c:21:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfsd/export.c: In function 'exp_rootfh':
   fs/nfsd/export.c:1039:34: warning: variable 'inode' set but not used [-Wunused-but-set-variable]
    1039 |         struct inode            *inode;
         |                                  ^~~~~
--
   In file included from fs/nfs/flexfilelayout/../nfs4_fs.h:26,
                    from fs/nfs/flexfilelayout/../internal.h:6,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:22:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/flexfilelayout/flexfilelayout.c: In function 'ff_layout_io_track_ds_error':
   fs/nfs/flexfilelayout/flexfilelayout.c:1238:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
    1238 |         int err;
         |             ^~~
--
   In file included from fs/nfs/flexfilelayout/../nfs4_fs.h:26,
                    from fs/nfs/flexfilelayout/../internal.h:6,
                    from fs/nfs/flexfilelayout/flexfilelayoutdev.c:15:
   include/linux/filelock.h: In function 'deleg_inode':
>> include/linux/filelock.h:507:16: error: 'delegated_inode' undeclared (first use in this function)
     507 |         return delegated_inode->di_inode;
         |                ^~~~~~~~~~~~~~~
   include/linux/filelock.h:507:16: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/flexfilelayout/flexfilelayoutdev.c: In function 'nfs4_ff_alloc_deviceid_node':
   fs/nfs/flexfilelayout/flexfilelayoutdev.c:55:16: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      55 |         int i, ret = -ENOMEM;
         |                ^~~


vim +/delegated_inode +507 include/linux/filelock.h

   504	
   505	static inline struct inode *deleg_inode(struct delegated_inode *di)
   506	{
 > 507		return delegated_inode->di_inode;
 > 508	}
   509	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
