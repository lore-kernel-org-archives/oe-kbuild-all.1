Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968420DD74
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 17:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733333069; cv=none; b=SUOr32tz4zsPgmk4TxhjtDQ8NvcqxaJu1RAMAeYoxRy/tBAiz6QUAhE4Dra6wrTV6jHTiQ8NF5k0ZqrB8hHFG9r3T+gVuP9qnqiEWzQQSzDXkKVNeXA1N1VN8c72iUIANbg7+D09dICZtGVf7o7n+gfxFMdPPFs8+faE9PbjfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733333069; c=relaxed/simple;
	bh=DM5Mpfmbl0zAJXNaj4j/Mr5tQLsnlvWzZbNrr3/Arss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bVvv6iM8GhGXPSZemVFa6VPnc0x9h9w4Gka+dWYebxUG0gZ2O4+AHfDd2a6CMXhtCfO417YjrhnxGO2ybnbLgfoe+qq0Do6Iol+nzs856eIQsZo2C4y+iVsBaaeadm1u+KbonVlJLDlx4CmCTMWQ40O8ERG0oY+atVB6y0tEBBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jK27TizP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jK27TizP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733333068; x=1764869068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DM5Mpfmbl0zAJXNaj4j/Mr5tQLsnlvWzZbNrr3/Arss=;
  b=jK27TizP/pv2hSk4bqMU/rwj2k+J+iW0Ei9A48vFB+ku2ZxgNfFputM0
   zci0YiYX0JMq3wZjiHT1uD9KeEowS6WH6RIvgkGvgTLEXZMQsZ1p1QxK0
   tyBnh1omcmDkiznyXPb7KQJA2YURoR8kNWT4RH0vlWXE3iuKsv9XK2W07
   DLhupq+HX9wCkKeuhwkJ4GtElldBfMf17mupPdErCQcDufz9qQgr+2ud1
   ekHTefnUt0bEPQA1YsrddKVbDC7mVOAGnJFYLFDA39JgILR2Ti7f6mt7K
   P4Rx/KNLqZjs9CgnCquZ8F4tG/prlBy/qp0P0CR0kFYP6eKLllOBeuKVr
   g==;
X-CSE-ConnectionGUID: K77VWfuGRty34MBqE9W7fw==
X-CSE-MsgGUID: FylEUVWFQDu+uyaYavphVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33673310"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="33673310"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 09:24:26 -0800
X-CSE-ConnectionGUID: RJ7p9pkXRDaniNeTUjNKYw==
X-CSE-MsgGUID: xdlzgjRHTPqjzM2JP6ddaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93718154"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Dec 2024 09:24:23 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIt6o-0003L9-0D;
	Wed, 04 Dec 2024 17:24:19 +0000
Date: Thu, 5 Dec 2024 01:23:26 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/vfio/platform/vfio_platform.c:29:16: error: implicit declaration of
 function 'platform_get_mem_or_io'; did you mean 'platform_get_device_id'?
Message-ID: <202412050149.E4Gol5P8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: f0953dcfbb508070e806a0c53aae09cdd3cde744 [1/1] vfio: platform: Switch to use platform_get_mem_or_io()
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241205/202412050149.E4Gol5P8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412050149.E4Gol5P8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412050149.E4Gol5P8-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/iommu.h:16,
                    from include/linux/vfio.h:12,
                    from drivers/vfio/platform/vfio_platform.c:9:
   include/linux/ioasid.h:210:51: error: unknown type name 'ioasid_set_type'
     210 |                                                   ioasid_set_type type)
         |                                                   ^~~~~~~~~~~~~~~
   drivers/vfio/platform/vfio_platform.c: In function 'get_platform_resource':
>> drivers/vfio/platform/vfio_platform.c:29:16: error: implicit declaration of function 'platform_get_mem_or_io'; did you mean 'platform_get_device_id'? [-Werror=implicit-function-declaration]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                platform_get_device_id
>> drivers/vfio/platform/vfio_platform.c:29:16: warning: returning 'int' from a function with return type 'struct resource *' makes pointer from integer without a cast [-Wint-conversion]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +29 drivers/vfio/platform/vfio_platform.c

   > 9	#include <linux/vfio.h>
    10	#include <linux/platform_device.h>
    11	
    12	#include "vfio_platform_private.h"
    13	
    14	#define DRIVER_VERSION  "0.10"
    15	#define DRIVER_AUTHOR   "Antonios Motakis <a.motakis@virtualopensystems.com>"
    16	#define DRIVER_DESC     "VFIO for platform devices - User Level meta-driver"
    17	
    18	static bool reset_required = true;
    19	module_param(reset_required, bool, 0444);
    20	MODULE_PARM_DESC(reset_required, "override reset requirement (default: 1)");
    21	
    22	/* probing devices from the linux platform bus */
    23	
    24	static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
    25						      int num)
    26	{
    27		struct platform_device *dev = (struct platform_device *) vdev->opaque;
    28	
  > 29		return platform_get_mem_or_io(dev, num);
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
