Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629DF22EED
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 21:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKCBznHj"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696454405; x=1727990405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4e/BJxJYmF5JeJyI1TatjAuF8Go5gO6RtQpBAa1C/n0=;
  b=YKCBznHjEugjvDFhl7YTWig762unBeqvlVo5Y82mNcd1Ji5nK9EOT+Tb
   +OQMHUHXrJJxE4P6NFEoU/5l1h+bzc39l3kiHg+2i/YOfgNhJ2bygzxk/
   kDGB+xgFnYeGJyzmWLaMW/G5c9YJC3Z9lwfndMfXo5pd9jGiSNIZgbC0a
   PgoIRbW3PMzGY0U1IffNdhScP1S4PNulPGY3aIGvIR/UMIQqcyowFXHIe
   1zSl/BUTBXAq2cpy2uQ00SOOHeDeMZK/PQqXo6mU4AUAcPaNB1/9xrb+w
   mDAepf716KbiVxSLsf1k8V1p6lMlLO4PY1ooxVdw5jZfRHPIjPA+sJ2qr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386133746"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="386133746"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 14:20:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821848341"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; 
   d="scan'208";a="821848341"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2023 14:20:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo9Hk-000Kci-1Z;
	Wed, 04 Oct 2023 21:20:00 +0000
Date: Thu, 5 Oct 2023 05:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [riteshharjani:xfs-atomic-write-v1 17/21] xfs_iomap.c:undefined
 reference to `__aeabi_ldivmod'
Message-ID: <202310050546.FqH1cXXo-lkp@intel.com>
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
commit: 14994f266e5f4265a0d7d60a91adc2e92ee66be6 [17/21] fs: xfs: iomap atomic write support
config: arm-randconfig-002-20231004 (https://download.01.org/0day-ci/archive/20231005/202310050546.FqH1cXXo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231005/202310050546.FqH1cXXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310050546.FqH1cXXo-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/xfs/xfs_iomap.o: in function `xfs_direct_write_iomap_begin':
>> xfs_iomap.c:(.text+0x1aae): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: xfs_iomap.c:(.text+0x1ac2): undefined reference to `__aeabi_ldivmod'
>> arm-linux-gnueabi-ld: xfs_iomap.c:(.text+0x1b46): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: block/fops.o: in function `blkdev_atomic_write_valid':
   fops.c:(.text+0x24): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: fops.c:(.text+0x8a): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `ll_front_merge_fn':
   blk-merge.c:(.text+0xd5c): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: blk-merge.c:(.text+0xd74): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o: in function `ll_merge_requests_fn':
   blk-merge.c:(.text+0x11a2): undefined reference to `__aeabi_ldivmod'
   arm-linux-gnueabi-ld: block/blk-merge.o:blk-merge.c:(.text+0x11bc): more undefined references to `__aeabi_ldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
