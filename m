Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76301B943
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706277203; cv=none; b=Xh0vDrUUf4VntP8OPuuOs7ljUQv9gxl5s0Z/SNwFJ84SLfxR24svgnSdeFJX4mJcxa4/PrxHV/GjekLALpU2NPXs+DwFBzqi04aStbl7W+c9QLPO2d9LGWwqmKE+hEvkcl5GsUPWYkrBod5QzuJlmQQvjyY3U00Pp75eFHqJKDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706277203; c=relaxed/simple;
	bh=zSa55X2Xfbws/uicjx2zpth2VaVwoEh73VfU0iv86NA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EyYILocuG85mUfaiLQWwaCf5npZAEyVRUrY/o7vxsYm0S2h83AZh2cowRCnOsuiAkPCG+mhBvr70xYpcERgevU4YAt6c0lrjrkU3ne0fxcdzVoozWMWY2fFyaPPiXvZ8a1BmdYqP3mpvZ5OQehAQTv7sirMw3OHexcZGgB1ChnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQyAdS7d; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQyAdS7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706277201; x=1737813201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zSa55X2Xfbws/uicjx2zpth2VaVwoEh73VfU0iv86NA=;
  b=TQyAdS7dl9AEurF9X0vZVUuoHHUonxSrIJmRJEcugo5zZWUPAkmqpG6t
   sZecN078fcwCPuiyXjCqWlpEwMaBh2wQ7nOGN0zV2T0dmy9Mdb3zt/z3O
   jr5FMD0s8xqRK4tP4LynkGB90katXYE2MVBkbTXHK8VhuOxcQ9RZtpynr
   WTvKF8NJp8Vj8A3bxaz4ICgXWHkIXzn5cNdnZSDzZLL0fA/U12Lrutfoe
   Rbecico+N+2t4CSDhopSu+nLkpEnVh02zq0pMYPqe4mRFYlNmOZ01c/jb
   EBnOfdMEDoZyg7t5eIbPX0wj9TXo6ZhAfADV+zB9rup9ai2sWe86IUKmt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="406206623"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="406206623"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 05:53:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="29113197"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2024 05:53:19 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTMdw-00014K-34;
	Fri, 26 Jan 2024 13:53:16 +0000
Date: Fri, 26 Jan 2024 21:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 432/512] ld.lld: error: undefined
 symbol: xfs_rtrmapbt_mem_ops
Message-ID: <202401262124.eZCOMHjb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   e9a152561dfd80561830f5da06d5a6d281883956
commit: 5af8f3c38651eaf87992cca4eb2ddc2b19e6acf6 [432/512] xfs: create a shadow rmap btree during realtime rmap repair
config: i386-buildonly-randconfig-006-20240126 (https://download.01.org/0day-ci/archive/20240126/202401262124.eZCOMHjb-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401262124.eZCOMHjb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401262124.eZCOMHjb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rtrmapbt_mem_ops
   >>> referenced by xfs_rmap.c
   >>>               fs/xfs/libxfs/xfs_rmap.o:(xfs_rmap_get_rec) in archive vmlinux.a
   >>> referenced by xfs_rmap.c
   >>>               fs/xfs/libxfs/xfs_rmap.o:(xfs_rmap_query_range_helper) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
