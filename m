Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FF318C32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 13:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qu1zz8R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702991323; x=1734527323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vfvYibJkH5C0Jos/RtZpvPRul8pQwdAWSoEPjgAVCbM=;
  b=Qu1zz8R5LuJWOjSeXWk6OapJ0jjJASp4TLBPL30SiUPytYGEB+5Yp30L
   jQLZqkM6wg3BSSxuPZijwO/S5eCrVW8rOl5YKGAbRpRoXSifM7oQCEZIK
   iSBYCB8WA8Cqg+Mn2hWl+eBiO791BYUPN/iWYozI52mc+Mz/pgkd0sj1D
   KfAuUQV22zHnaxQumhXgAktMToTXeCYymkQCwuyMeU5aHo4s6kGRTpGPA
   NR3tUqDi91q0g26ahw0zeCSvbqI4WoWBOwUfwnN27PbZnH9DgKn+sf5va
   ubY0LIXv8YuQw5Ni6bNxP3Zt8S7wY+mDhkMggkbvJUpaqH+1qmBKjAYHX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="9102730"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9102730"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 05:08:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779477737"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="779477737"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Dec 2023 05:08:41 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFZpv-0005Lp-0b;
	Tue, 19 Dec 2023 13:08:39 +0000
Date: Tue, 19 Dec 2023 21:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 63/63] fs/xfs/xfs_zone_alloc.c:1024:1: warning:
 no previous prototype for function 'xfs_pick_open_zone_for_gc'
Message-ID: <202312192138.Zgeok2hH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   7de9cbf1b22c57cd561e83659fef081f21412e69
commit: 7de9cbf1b22c57cd561e83659fef081f21412e69 [63/63] xfs: respect the open limit when allocating gc zones
config: i386-buildonly-randconfig-002-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192138.Zgeok2hH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192138.Zgeok2hH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192138.Zgeok2hH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_zone_alloc.c:1024:1: warning: no previous prototype for function 'xfs_pick_open_zone_for_gc' [-Wmissing-prototypes]
   xfs_pick_open_zone_for_gc(
   ^
   fs/xfs/xfs_zone_alloc.c:1023:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct xfs_rtgroup *
   ^
   static 
   1 warning generated.


vim +/xfs_pick_open_zone_for_gc +1024 fs/xfs/xfs_zone_alloc.c

  1022	
  1023	struct xfs_rtgroup *
> 1024	xfs_pick_open_zone_for_gc(
  1025		struct xfs_mount	*mp)
  1026	{
  1027		struct xfs_rtgroup	*rtg, *found = NULL;
  1028	
  1029		list_for_each_entry(rtg, &mp->m_open_zones, rtg_entry) {
  1030			if (!found)
  1031				found = rtg;
  1032			else if (rtg->rtg_write_pointer < found->rtg_write_pointer)
  1033				found = rtg;
  1034		}
  1035	
  1036		return found;
  1037	}
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
