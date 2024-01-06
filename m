Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36A101E3
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 21:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OV1G62P7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704578145; x=1736114145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V7iWoyDCSM18SXBin5UkBhyYetnBL+oRdPSBOiP7Ulo=;
  b=OV1G62P7dTkxT0+9EKpIezPY4X5VhsOr2XjMyIfkPGW355W/bEvu0ZR3
   2lwIUCg49ky5kyZNFwrU4lbd4isy9MvWdFPRpUm38gv8EoeGwtRk36tBR
   i8Uf1C5JeP+CTFoHKYcUrcICI9rpRflcg4tA+ZkDZ2D4ShYbvqckxYEE7
   /n0KQEBjCb70Yt3bVjXnAuC4lPHJ9ZuYfsIP89swgiOb91rmF6JzZS7sd
   GcLc1Ux4ym2zOwThFwtGRh1780CXfbWdXe6Y50+JsOwT7tUf6Ot8Kzm/5
   RHP8z8jPqVRIRKzTgFtELHbU0M1BWAZj0uX1b14b/Pq+vk8WQetrwOzu1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="388137176"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="388137176"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 13:55:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="1112392951"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="1112392951"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jan 2024 13:55:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMEdh-000332-0n;
	Sat, 06 Jan 2024 21:55:33 +0000
Date: Sun, 7 Jan 2024 05:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 97/223] fs/xfs/scrub/common.c:257:2:
 error: implicit declaration of function 'trace_xchk_qcheck_error'; did you
 mean 'trace_xchk_fblock_error'?
Message-ID: <202401070540.U2yoAn8Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   45b903e0e402a62723d43483a33cac8f3d9a4073
commit: a13409e8c652b4fce3d5741a68a85d4427a8d569 [97/223] xfs: implement live quotacheck inode scan
config: x86_64-buildonly-randconfig-001-20240106 (https://download.01.org/0day-ci/archive/20240107/202401070540.U2yoAn8Z-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070540.U2yoAn8Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070540.U2yoAn8Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/common.c: In function 'xchk_qcheck_set_corrupt':
>> fs/xfs/scrub/common.c:257:2: error: implicit declaration of function 'trace_xchk_qcheck_error'; did you mean 'trace_xchk_fblock_error'? [-Werror=implicit-function-declaration]
     257 |  trace_xchk_qcheck_error(sc, dqtype, id, __return_address);
         |  ^~~~~~~~~~~~~~~~~~~~~~~
         |  trace_xchk_fblock_error
   cc1: some warnings being treated as errors


vim +257 fs/xfs/scrub/common.c

   248	
   249	/* Record a corrupt quota counter. */
   250	void
   251	xchk_qcheck_set_corrupt(
   252		struct xfs_scrub	*sc,
   253		unsigned int		dqtype,
   254		xfs_dqid_t		id)
   255	{
   256		sc->sm->sm_flags |= XFS_SCRUB_OFLAG_CORRUPT;
 > 257		trace_xchk_qcheck_error(sc, dqtype, id, __return_address);
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
