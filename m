Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879683527E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 21:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ahr3iW8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702762023; x=1734298023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d75RKY2+gUaVAb0Ewqpk8uGZEU+M6Dtmfn6Pe91LgFs=;
  b=Ahr3iW8lonHsMo0kkJfHV71GxrBJ1CMMfm1fHAOg8T7kRU5vzpnnCiMd
   6nWkBQSCFQu1k9B63M9j8KY8PN8P0DwqrSBaMPSWDeIPVfqYZreys1iqh
   SBlEHa+qhzeVbGg8mWjeGRExhMvjboarNUrwhzm0pWOvyAdmZprnEEl7C
   8oVRnA1Z2x78cLg4NULOmpC4Hhpks3Cv7oqQUYSkXoIVLuE3I0k0gWr2k
   Fj2ToJXgBYArrpih/nFTa1I9X12d2bE613L6ewpvuJ0rz3P05pN4QIvcx
   KHR+CdmQneebJasMR8wdNNqgPWT1iiLgjT4V8ixhlOINz9ePWW4k2JqRn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="461846425"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="461846425"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 13:27:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751323957"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="751323957"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 13:27:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEcBV-0002EX-2U;
	Sat, 16 Dec 2023 21:26:57 +0000
Date: Sun, 17 Dec 2023 05:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 474/534] xfs_refcount_item.c:undefined
 reference to `xfs_rtrefcount_update_defer_type'
Message-ID: <202312170532.qGdEC4qV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   9b53da520c1def16c6d9730337bb2c3abb2073c8
commit: f7717f0b75f2dd8c4213e883ae669f5a85633a85 [474/534] xfs: add a realtime flag to the refcount update log redo items
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231217/202312170532.qGdEC4qV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170532.qGdEC4qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170532.qGdEC4qV-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L147':
   xfs_extfree_item.c:(.text+0xf94): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: xfs_extfree_item.c:(.text+0xf98): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L153':
   xfs_extfree_item.c:(.text+0x1098): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: xfs_extfree_item.c:(.text+0x10a0): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_refcount_item.o: in function `.L85':
>> xfs_refcount_item.c:(.text+0x774): undefined reference to `xfs_rtrefcount_update_defer_type'
>> loongarch64-linux-ld: xfs_refcount_item.c:(.text+0x778): undefined reference to `xfs_rtrefcount_update_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_refcount_item.o: in function `xfs_refcount_defer_add':
   xfs_refcount_item.c:(.text+0xb04): undefined reference to `xfs_rtrefcount_update_defer_type'
   loongarch64-linux-ld: xfs_refcount_item.c:(.text+0xb08): undefined reference to `xfs_rtrefcount_update_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_rmap_item.o: in function `.L103':
   xfs_rmap_item.c:(.text+0x888): undefined reference to `xfs_rtrmap_update_defer_type'
   loongarch64-linux-ld: xfs_rmap_item.c:(.text+0x88c): undefined reference to `xfs_rtrmap_update_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_rmap_item.o: in function `xfs_rmap_defer_add':
   xfs_rmap_item.c:(.text+0xcdc): undefined reference to `xfs_rtrmap_update_defer_type'
   loongarch64-linux-ld: xfs_rmap_item.c:(.text+0xce0): undefined reference to `xfs_rtrmap_update_defer_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
