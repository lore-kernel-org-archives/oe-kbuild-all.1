Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6614B5A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXBLBUaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704984079; x=1736520079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1NdemNLAVF2gaRlg+QVrjGZTtcyKMzPfU/mvUdJtZ8=;
  b=UXBLBUaGVvP5ZZZF5SM5ReWyEZQpJhzpymeM9n4McxbPxENTNmcBluuP
   cuAjzyBmiPIyiQYs8qMAgMlv1JVKRqvKg3lXf8vJPSyaLFkEfLRXyhyNR
   NX4+Q61jt+XSYCJ8wG+l8z/n0clDOMX+rmTIqYvmh2qXGM8QhbfvNnFBM
   c3N3Cr5fU9yT7fH6OdfbHmSWvzeL/c9h4UN2k46ZSd64jGkOh2X5Bw+eN
   RqPCBoieRyK+AOxTYXGRecxAJAwWzVidEATByFro5OGiNvVrsch3q0UEW
   4qL39MGs3Lya/aVuHuTJS5Lp5nxbY3TkCZ3TZ1Phx8uPXsDkGBnJ8Jn/8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="389305070"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="389305070"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 06:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="775628042"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="775628042"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 11 Jan 2024 06:41:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNwF8-0008Mu-37;
	Thu, 11 Jan 2024 14:41:14 +0000
Date: Thu, 11 Jan 2024 22:40:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 69/69] ld: fs/xfs/xfs_mount.c:465: undefined
 reference to `xfs_zoned_reserved_extents'
Message-ID: <202401112200.uHhYJyqX-lkp@intel.com>
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
config: x86_64-randconfig-071-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112200.uHhYJyqX-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112200.uHhYJyqX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112200.uHhYJyqX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_ioctl.o: in function `xfs_ioctl_fs_counts':
   fs/xfs/xfs_ioctl.c:2102: undefined reference to `xfs_zoned_reserved_extents'
   ld: fs/xfs/xfs_mount.o: in function `xfs_default_resblks':
   fs/xfs/xfs_mount.c:465: undefined reference to `xfs_zoned_reserved_extents'
>> ld: fs/xfs/xfs_mount.c:465: undefined reference to `xfs_zoned_reserved_extents'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
