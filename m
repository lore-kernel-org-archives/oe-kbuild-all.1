Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944A22FDE8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 06:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773737; cv=none; b=i8raYg2o7RH8MGqiROartYGIa8dKXl+DOIWCAGwbhGGkCHGMM7ttntUKJ3hQvVvt49wvuIcafH7L7gxaBujaBIPwUw+JFKjriLDiWnX+Iw5isWEkfQbM32zHYCWhuDDKwHZN2kBLSipDf6OVSJh1vRCsGGtkXTALdW9W1HcuL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773737; c=relaxed/simple;
	bh=yqagAz1ayDwSFURgtHTr2To8u+6r1jUQW9KPy2iSGug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oP9z9fp7PxLlpjuB2Gyb2bdZzF8V7sdAsqAy/mi7ZPnoUk6mnTuqkikTDd0P7FKE0h2uNdxEevaIDZ/3JK35VrVYzy2GyVL2WCXP+8I6qjrtF6FI0q9w+xPK+uWcgxMblwhxZQfSo50L3cScQWYVfQCLUOgcVckgmanmbSzAwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZRck7+T; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZRck7+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746773736; x=1778309736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yqagAz1ayDwSFURgtHTr2To8u+6r1jUQW9KPy2iSGug=;
  b=DZRck7+TLw46MzTKcV9DZ14THVXa/LkGLgGT8h51WFMyfXcvmfom0PoV
   O3jgtIaPK5PwFFmnt3bPZ/8Ml2dBv8BNCYnfV+8+PcxWe4nEamwRdNrau
   Olllb0HnG2gJbJ/LPlT1eJFTmW/4RfLGymDSmErLC1/57T3FZ/8bE0+s0
   WX/slyUolD06muPeIKw5eUAa/8squ9GQ+JnFPt6AIMQLcW5SdPqyx1Ooz
   yghPVdc3W2vTRjcuGxnpoNroLGmR2iVGmYhSPoTUP9eJ60BD2htQHuqRB
   c7ubFzrdtrN9jGuYcx1Coa/2ejcWVU/Ez6PKfWOTXEda4bMxR40kTAJJO
   g==;
X-CSE-ConnectionGUID: WrL6W6PDS5K+BDfLuBr6uA==
X-CSE-MsgGUID: KqCaqU3jSsaVft03KCzW0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59216631"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="59216631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:55:36 -0700
X-CSE-ConnectionGUID: sYBhk6VhSIidp3EvnNcp7w==
X-CSE-MsgGUID: FGOXyaqiQlmOHGOU1JLcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136453137"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 May 2025 23:55:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDHds-000BjL-0d;
	Fri, 09 May 2025 06:55:32 +0000
Date: Fri, 9 May 2025 14:55:20 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] drivers/vdpa/ifcvf/ifcvf_main.c:553:13:
 error: incompatible function pointer types initializing 'void (*)(struct
 vdpa_mgmt_dev *, struct vdpa_device *, int)' with an expression of type
 'void (struct vdpa_mgmt_dev *, struct vdpa_device *)'
Message-ID: <202505091413.d35ALLmI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: e4b7b11288fc91b44fd73cd10b954c515eeb26ca [0/1] bytedance: vdpa: Add deletion timeout support
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250509/202505091413.d35ALLmI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505091413.d35ALLmI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091413.d35ALLmI-lkp@intel.com/

Note: the bytedance/5.15-velinux HEAD de277dab626c9ece4c9cf99ec9c56f23b298a042 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/vdpa/ifcvf/ifcvf_main.c:553:13: error: incompatible function pointer types initializing 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' with an expression of type 'void (struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Wincompatible-function-pointer-types]
     553 |         .dev_del = ifcvf_vdpa_dev_del
         |                    ^~~~~~~~~~~~~~~~~~
   drivers/vdpa/ifcvf/ifcvf_main.c:600:39: warning: shift count >= width of type [-Wshift-count-overflow]
     600 |         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                              ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:76:54: note: expanded from macro 'DMA_BIT_MASK'
      76 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.
--
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:2650:13: error: incompatible function pointer types initializing 'void (*)(struct vdpa_mgmt_dev *, struct vdpa_device *, int)' with an expression of type 'void (struct vdpa_mgmt_dev *, struct vdpa_device *)' [-Wincompatible-function-pointer-types]
    2650 |         .dev_del = mlx5_vdpa_dev_del,
         |                    ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +553 drivers/vdpa/ifcvf/ifcvf_main.c

6b5df347c6482f Zhu Lingshan 2021-08-12  550  
6b5df347c6482f Zhu Lingshan 2021-08-12  551  static const struct vdpa_mgmtdev_ops ifcvf_vdpa_mgmt_dev_ops = {
6b5df347c6482f Zhu Lingshan 2021-08-12  552  	.dev_add = ifcvf_vdpa_dev_add,
6b5df347c6482f Zhu Lingshan 2021-08-12 @553  	.dev_del = ifcvf_vdpa_dev_del
6b5df347c6482f Zhu Lingshan 2021-08-12  554  };
6b5df347c6482f Zhu Lingshan 2021-08-12  555  

:::::: The code at line 553 was first introduced by commit
:::::: 6b5df347c6482f57b0d8f0569b86fb8fcd90d168 vDPA/ifcvf: implement management netlink framework for ifcvf

:::::: TO: Zhu Lingshan <lingshan.zhu@intel.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
