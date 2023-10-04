Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9C231A92
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 23:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gq0LulT2"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696463306; x=1727999306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nZqM5T5+4SQkVEZXQSu8q1Gwikf81gV4VVbVef3shws=;
  b=Gq0LulT2Rb/lv4BOh9+axXVHNjrOsjWrQKzntDOPfJ2o2/V5x5sZDhV1
   GWFzqI3sPCF3hCLSnY0KjUwl7C8fYeWCVqRcH9ho14syu2VfAoca9B+yP
   GdIMKNhhSigS7cmo0NS/e7jxoXPgcmrRPPl9a79x7wKk7s8yzYQQsV8oz
   RmcW8kxKPQIAKg2FaWSC1QB8Nedxu6uG8prVQVZlYzswa6ggIrynD9Kvj
   fixX7sJPr/6xka2NmU3BtQ7xxHbU8UEekPOFOknaqfY0wuz0Vcy1mPscJ
   3P3icywh70SGX2SS+JXbZRwWNjO8Qk28rzipGSjZZMqdmQiKGHD2ViP8R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414312007"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="414312007"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 16:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="998710850"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="998710850"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2023 16:48:23 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoBbI-000Klo-2k;
	Wed, 04 Oct 2023 23:48:20 +0000
Date: Thu, 5 Oct 2023 07:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 20/21] scsi_debug.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202310050754.FfiTWvVm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux xfs-atomic-write-v1
head:   6e46c5eac75533f8ca2e7446bddedc9560a032fc
commit: f1dbf32f10c097c2a0be71ca6c30d8884aaa64d8 [20/21] scsi: scsi_debug: Atomic write support
config: arm-randconfig-002-20231004 (https://download.01.org/0day-ci/archive/20231005/202310050754.FfiTWvVm-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050754.FfiTWvVm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050754.FfiTWvVm-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/xfs/xfs_iomap.o: in function `xfs_direct_write_iomap_begin':
   xfs_iomap.c:(.text+0x1aae): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: xfs_iomap.c:(.text+0x1ac2): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: xfs_iomap.c:(.text+0x1b46): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: block/fops.o: in function `blkdev_atomic_write_valid':
   fops.c:(.text+0x24): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: fops.c:(.text+0x8a): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `ll_front_merge_fn':
   blk-merge.c:(.text+0xd5c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: blk-merge.c:(.text+0xd74): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `ll_merge_requests_fn':
   blk-merge.c:(.text+0x11a2): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o:blk-merge.c:(.text+0x11bc): more undefined references to `__aeabi_ldivmod' follow
   arm-linux-gnueabi-ld: drivers/scsi/scsi_debug.o: in function `resp_atomic_write':
>> scsi_debug.c:(.text+0xb0f2): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
