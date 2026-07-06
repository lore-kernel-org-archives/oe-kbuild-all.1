Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9433AEF55
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 05:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316215; cv=none; b=FDahXq5Al1bWPW+2cfT2MV1ZgytcKLWijFjQh9pLd5pm1qtNKijl4upj67yO1JgWRb/tjBvh2JkWV0554MA/crcp9b7wUNxCce//bW3FL0vazICscJ+fjweJ8gDdM8PULR+quEH6FI1MXDZMXESkdvBbYKB8Xyy5CegGE3BZCM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316215; c=relaxed/simple;
	bh=Nwr6p2btoMVc9PxTtEMeytZkSAEiea3p3QQgiv/1LH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WzhN36V/KyZm5J/ocCkXhBPh2twm8ZvjmrnuVlnRd49W1NIrJC7D5Qw2OSVrKMc0z7cwet32Rw2GIZUuYcWTardnaQuLMmu36SooavpGEMnvcWkkGDRR/21uk2fNHC1RuhLA9EeLeTdPQQCYNDdYIXModGVEd1xYciM6WfFJveo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVRH0YbN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVRH0YbN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783316213; x=1814852213;
  h=date:from:to:cc:subject:message-id;
  bh=Nwr6p2btoMVc9PxTtEMeytZkSAEiea3p3QQgiv/1LH4=;
  b=jVRH0YbN4hI7eYqzx7XUA4y+TEyS8kR8il9x8vS5yUOsqLnaOar74uIA
   5l3XLqKy0CUvsz6rDJ+9p98o8AsVNsqku1LcuFlRdO/eRZyrtmV0CpY9M
   c1z75SWv3uUVZ48Y12n2Pq/N/97y5HVb+oJCns3c+eJWwDkiwA772fk8A
   UC0YdOPp8zBOVdc+12IBdsrKU5rOKvCmpS2X7bc0Uyl6Te1zhTNGuQJiJ
   7KrM1AKKuJ55YCVVK+A39Ryl/cJ78WgEcBLynjboIPj0z6BoJiexrYp5R
   O8A20HzOf5R6zJpWktbMKtkephuOTxLfLJBtEg0UWdueaqOZ10W5/gYgT
   g==;
X-CSE-ConnectionGUID: vlN5WLfOSHiZBSKhJCDo/g==
X-CSE-MsgGUID: Q5sn7eUESsa01gdz/vNVUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="84129966"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="84129966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:36:52 -0700
X-CSE-ConnectionGUID: ht06xyQYRNyGsxL1Rxo+ig==
X-CSE-MsgGUID: WMwASMqmRkWAzwzKB1fLtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="247222911"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jul 2026 22:36:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgc0c-00000000E6b-1Mcf;
	Mon, 06 Jul 2026 05:36:46 +0000
Date: Mon, 06 Jul 2026 13:36:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 169/215]
 drivers/block/fitblk.c:185:27: sparse: sparse: incorrect type in initializer
 (incompatible argument 2 (different base types))
Message-ID: <202607061343.MU2bcds4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: fded98d6b2974396d028a155643d0d49018fb1d4 [169/215] block: add uImage.FIT subimage block driver
config: parisc-randconfig-r123-20260706 (https://download.01.org/0day-ci/archive/20260706/202607061343.MU2bcds4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061343.MU2bcds4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061343.MU2bcds4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/block/fitblk.c: note: in included file:
   include/uapi/linux/fitblk.h:10:33: sparse: sparse: no newline at end of file
>> drivers/block/fitblk.c:185:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *ioctl )( ... ) @@     got int ( * )( ... ) @@
   drivers/block/fitblk.c:185:27: sparse:     expected int ( *ioctl )( ... )
   drivers/block/fitblk.c:185:27: sparse:     got int ( * )( ... )
>> drivers/block/fitblk.c:186:27: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different base types)) @@     expected int ( *open )( ... ) @@     got int ( * )( ... ) @@
   drivers/block/fitblk.c:186:27: sparse:     expected int ( *open )( ... )
   drivers/block/fitblk.c:186:27: sparse:     got int ( * )( ... )

vim +185 drivers/block/fitblk.c

   182	
   183	static const struct block_device_operations fitblk_fops = {
   184		.owner		= THIS_MODULE,
 > 185		.ioctl		= fitblk_ioctl,
 > 186		.open		= fitblk_open,
   187		.release	= fitblk_release,
   188		.submit_bio	= fitblk_submit_bio,
   189	};
   190	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
