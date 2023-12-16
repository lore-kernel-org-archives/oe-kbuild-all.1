Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F6014F9A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 11:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGjIdGYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702727931; x=1734263931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iekE+Qh5UPpwYqslSNYyPAjqxunAvYOwFXR5JAqgvsI=;
  b=GGjIdGYqEuwm8zf7iA8onoO4Uol//r/xcxHSu6U26dpo3uo176xvk55p
   8P8WNbaGQGsLKvkJD1z+gwfUO5iTgPqbYwhpdlU6GfNjVhQfUdrZY6+z7
   hLAnnG9B+sCTpdKUZlTr5T5j1QdkPnxd0NPmw8OKi38CsFev+xdbHkzT9
   VNtb6qYgbWnwtUGnpOcdl+ozgLQ3i2Y5WCWhULrck6BZymL2lKYkOX0P4
   iAWJHkMuB/4AWe48aeZ4MIDdgG+nVWv4Hcu4c4LoKSKOwNr7ACco9cnvd
   mn5NngLs1UVwYRP1A9JYQxHLrt4VnBQBDD/7yA0EMUVOYRiQiWjtOJ/NM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="380365265"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="380365265"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 03:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="948253904"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="948253904"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 16 Dec 2023 03:58:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rETJR-0001XM-2O;
	Sat, 16 Dec 2023 11:58:33 +0000
Date: Sat, 16 Dec 2023 19:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:rmap-intent-cleanups 406/417]
 xfs_extfree_item.c:undefined reference to `xfs_rtextent_free_defer_type'
Message-ID: <202312161901.NgFoXa9P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git rmap-intent-cleanups
head:   411607390a8a5b6192ee48c8d3d2bde3783ceb3c
commit: 867b4ce1c59ec3738e2c01e127ac5733c2f4408a [406/417] xfs: support logging EFIs for realtime extents
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231216/202312161901.NgFoXa9P-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231216/202312161901.NgFoXa9P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312161901.NgFoXa9P-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L147':
>> xfs_extfree_item.c:(.text+0xf94): undefined reference to `xfs_rtextent_free_defer_type'
>> loongarch64-linux-ld: xfs_extfree_item.c:(.text+0xf98): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L153':
   xfs_extfree_item.c:(.text+0x1098): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: xfs_extfree_item.c:(.text+0x10a0): undefined reference to `xfs_rtextent_free_defer_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
