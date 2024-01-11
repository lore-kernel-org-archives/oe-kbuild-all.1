Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D224FFBE5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrUC/Hry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704962975; x=1736498975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VycVXyvO8/Lo+k/1OO2MN7YMk0qC7Az9gz4xfWP4K4M=;
  b=LrUC/HrywzElCFgoio1cY6j9iTDNiPDXzjsXtw4WsphUL/AdqwdTelln
   TWGMsUAJTy5ziKY8lxFz9dUKi6r8N222YaxfieAg3jJNOuDc+paKneapJ
   CYsioCEfX3mK8bmVTVe/uZbNEXEZl8SsoAk2byKVvy4glCgSuj5/qMysi
   QNuOKeiXa1LEJgs+H3ZT+NfVGWggUfoZlaHS6y5Z8hFEDoNo7Lf/XWzw/
   GSW3D0FKqKeIbgisUB+N6S1/kAqItKBRyb2OGtO9uDt1kH/DQRc3O6s3y
   PPMke7rJUHcv0L9jgvkARPisNTi7lQ9i2fbTcZ8qy+0vgK5Rts8D8UAZJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="12140147"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="12140147"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 00:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="24255464"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2024 00:49:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNqkj-00081x-2F;
	Thu, 11 Jan 2024 08:49:29 +0000
Date: Thu, 11 Jan 2024 16:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 69/69] fs/xfs/xfs_mount.c:465: undefined
 reference to `xfs_zoned_reserved_extents'
Message-ID: <202401111608.kL9KAbSA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   9c0c8b66b29e2753063dbcb37c2644764fa87716
commit: 6cbaa154b781048e31781d9982968f2949ee7059 [69/69] xfs: preserve zoned gc reservations across remounts
config: i386-randconfig-002-20240111 (https://download.01.org/0day-ci/archive/20240111/202401111608.kL9KAbSA-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111608.kL9KAbSA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111608.kL9KAbSA-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_ioctl.o: in function `xfs_ioctl_fs_counts':
   fs/xfs/xfs_ioctl.c:2102: undefined reference to `xfs_zoned_reserved_extents'
   ld: fs/xfs/xfs_mount.o: in function `xfs_default_resblks':
>> fs/xfs/xfs_mount.c:465: undefined reference to `xfs_zoned_reserved_extents'


vim +465 fs/xfs/xfs_mount.c

   456	
   457	uint64_t
   458	xfs_default_resblks(
   459		struct xfs_mount	*mp,
   460		unsigned int		idx)
   461	{
   462		uint64_t resblks;
   463	
   464		if (idx == FREE_RTEXTENTS)
 > 465			return xfs_zoned_reserved_extents(mp);
   466	
   467		/*
   468		 * We default to 5% or 8192 fsbs of space reserved, whichever is
   469		 * smaller.  This is intended to cover concurrent allocation
   470		 * transactions when we initially hit enospc. These each require a 4
   471		 * block reservation. Hence by default we cover roughly 2000 concurrent
   472		 * allocation reservations.
   473		 */
   474		resblks = mp->m_sb.sb_dblocks;
   475		do_div(resblks, 20);
   476		resblks = min_t(uint64_t, resblks, 8192);
   477		return resblks;
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
