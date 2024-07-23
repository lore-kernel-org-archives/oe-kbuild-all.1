Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC49DDDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721723544; cv=none; b=QzLnkg6RbtbHlVqblO1/c7xWg6MTHVZc/3X8WEBhASd9YSRdsSB5d7JygIBRyCy4nuAp2f2BC5rBVSJ66ksVHVW0bIm4AJYWizGYxDsYooALIdMovQx0QiQ0JJCaAfK6g8q3J7q7eklWOqlJOKgcdginRF6Vhhoq4o0a4QIn8QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721723544; c=relaxed/simple;
	bh=0iVRy9gmFWRqvL1ngEDj4YXpKssD1sSbg+ivD5Yl+7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ye9f8SwSGBpBqp217PbXBs3Id/mFPkOIHepSGF17+rpruprqB2WMXdo1LDGnubex5zHsxCW8DL2e4FNwp1rE1IMyfCf3wPQEAo9wavJAt0yJfD9WmfDF5OYf6maXLUFduiMvXmeUWx62GSFYzFWFAD0iWKaNt9nm31ZXWAa6Oz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvrNU9/J; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvrNU9/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721723543; x=1753259543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0iVRy9gmFWRqvL1ngEDj4YXpKssD1sSbg+ivD5Yl+7Q=;
  b=AvrNU9/JVT7pYdpCAG+H0SMeMETYLtJWZ3ePVufpqzC9rzwLCCc6aIJ3
   UIT/W7Mob2YDa9pmI1rVm1hwN4T0Veg8soGpRBdLhKCoExMa9AS7w54dp
   5NResj2PXCF5Q+BuwPWy6uOEigUKZy1FHpCYhu/CA12tWhmBxnGw4zok9
   U3ZhKooQmJV5b+zibE6WQpNEB5I5xBL6cBxc67hkJw+GBeSpGWNKsGPJ+
   vHlB0ssJJviMBgQ9IRkoqG+Hxke+CRiVHFpo/OOJbfo0bW0OvXHZfHO3S
   1gxX+FVHiyYd1al+rnoxX21NG1FjC9QrlKf6wMP1/Wa6dJZQlCwBki89l
   A==;
X-CSE-ConnectionGUID: 8vMbnu5FTxai9Q2SACol7Q==
X-CSE-MsgGUID: g/VbSj9NQ4q7g/1TLMaz0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="23135842"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="23135842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 01:32:23 -0700
X-CSE-ConnectionGUID: EuMubi+7TBetNMrsqEqGKw==
X-CSE-MsgGUID: 7HGtfzNjRRasMqSwu84r5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="57279444"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2024 01:32:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWAwV-000ln2-39;
	Tue, 23 Jul 2024 08:32:19 +0000
Date: Tue, 23 Jul 2024 16:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 200/326] fs/xfs/scrub/metapath.c:153:4:
 error: implicit declaration of function 'xfs_rtginode_path'; did you mean
 'insert_inode_hash'?
Message-ID: <202407231650.coSzSpZd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   34a8467cd7c47cc944cc6fa11ea4b46671c935d1
commit: d82c6606ab271e45425bae839921ca8963cd8300 [200/326] xfs: scrub the metadir path of rt rmap btree files
config: i386-buildonly-randconfig-002-20240723 (https://download.01.org/0day-ci/archive/20240723/202407231650.coSzSpZd-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231650.coSzSpZd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231650.coSzSpZd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/xfs/scrub/metapath.c: In function 'xchk_setup_metapath_rtginode':
>> fs/xfs/scrub/metapath.c:153:4: error: implicit declaration of function 'xfs_rtginode_path'; did you mean 'insert_inode_hash'? [-Werror=implicit-function-declaration]
       xfs_rtginode_path(rtg->rtg_rgno, type), ip);
       ^~~~~~~~~~~~~~~~~
       insert_inode_hash
>> fs/xfs/scrub/metapath.c:153:4: warning: passing argument 3 of 'xchk_setup_metapath_scan' makes pointer from integer without a cast [-Wint-conversion]
       xfs_rtginode_path(rtg->rtg_rgno, type), ip);
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/scrub/metapath.c:88:15: note: expected 'const char *' but argument is of type 'int'
     const char  *path,
     ~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +153 fs/xfs/scrub/metapath.c

   131	
   132	/* Scan a rtgroup inode under the /rtgroups directory. */
   133	static int
   134	xchk_setup_metapath_rtginode(
   135		struct xfs_scrub	*sc,
   136		enum xfs_rtg_inodes	type)
   137	{
   138		struct xfs_rtgroup	*rtg;
   139		struct xfs_inode	*ip;
   140		int			error;
   141	
   142		rtg = xfs_rtgroup_get(sc->mp, sc->sm->sm_agno);
   143		if (!rtg)
   144			return -ENOENT;
   145	
   146		ip = rtg->rtg_inodes[type];
   147		if (!ip) {
   148			error = -ENOENT;
   149			goto out_put_rtg;
   150		}
   151	
   152		error = xchk_setup_metapath_scan(sc, sc->mp->m_rtdirip,
 > 153				xfs_rtginode_path(rtg->rtg_rgno, type), ip);
   154	
   155	out_put_rtg:
   156		xfs_rtgroup_put(rtg);
   157		return error;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
