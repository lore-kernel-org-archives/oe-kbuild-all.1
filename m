Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AFD1E4AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727451454; cv=none; b=SM52UGuLdVKI9a7OiJqdwcKUpcUmpwHpy2BhK5mqvd4L0JdMx3Gfx9j7UP2wqYcLc62DpFbIAQgh19qwDvNOsqGIPmILFPrwe+kJYFgjYSENTp86Ny5aSiRTgYPeLS/T4Ci4f46i4XHa/SMa1d836vr1qT9n8VQ4XqgQgcL56Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727451454; c=relaxed/simple;
	bh=CF4c+e9sp5mBSfZyy3TAKdztM8TedbeQDU2iy94WUF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q29cd/Zl5gGSG1yrPNTFjJMme6IgIiu3Gp2z+oaXcMH1eNu0Aip1/aybJguCvuCjdXOsD/UOSj6RrTqRzjynrRQWMSqqt3qnImnjZX4kkXXJVFL0dY7IY0XomTyQs4cVw+pIKe6u7vq+8O5xgTaZ8bybbnOJHlTlEssl7xXwBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jLEjh8at; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jLEjh8at"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727451453; x=1758987453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CF4c+e9sp5mBSfZyy3TAKdztM8TedbeQDU2iy94WUF0=;
  b=jLEjh8atIl7G6eA7Zm0TXE2wyCaj5LG+hrSl506RDVWgKSJf7hhtyLH4
   Fq4ItoYvT78H8EL5O0BD77F0aaTgO7qKGdE3hq1X9Jbc2W3LGretmNly7
   NMfNNhD9dcMbiTK6imrshdZ3ou6OdTiJHO5DqK8s+KIp+8V/r0n1wArwY
   qvlqJSz3PqG1WqFJocImuWn4Ej+EWqVKzQnq7Y6WUV+1ljx4Mr4TGvsU5
   cuNqGXWe2l7IqC6QGmtK8ggZg4+wfrYh0cO7n61Y1RyqeJxLRlGgi3Oph
   kKLh/Ar13BLqXa97ERHMWu0WGjUgcKHNd1jvJhLwfzMRIqEJ0DvHtFUFH
   A==;
X-CSE-ConnectionGUID: 1/O/FyvSRe+clDfDVFUUwQ==
X-CSE-MsgGUID: FALBEVo3QFWe4xe4D2xKIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="37737439"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="37737439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 08:37:32 -0700
X-CSE-ConnectionGUID: Nqb9ZyuwQyOJHoQyzdEuiA==
X-CSE-MsgGUID: 52GCkGOeQRmjTAt3CmPOIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72230374"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2024 08:37:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suD26-000MJ7-0m;
	Fri, 27 Sep 2024 15:37:26 +0000
Date: Fri, 27 Sep 2024 23:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1598/2444]
 drivers/vfio/platform/vfio_platform.c:29:9: error: implicit declaration of
 function 'platform_get_mem_or_io'
Message-ID: <202409272348.MorJkFiJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 6c95419e5c4fa83ef61c2c0cbf752d39df4b9f3f [1598/2444] vfio-platform: Add COMPILE_TEST to VFIO_PLATFORM
config: x86_64-buildonly-randconfig-002-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272348.MorJkFiJ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409272348.MorJkFiJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272348.MorJkFiJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/platform/vfio_platform.c:9:
   In file included from include/linux/vfio.h:12:
   In file included from include/linux/iommu.h:16:
   include/linux/ioasid.h:210:9: error: must use 'enum' tag to refer to type 'ioasid_set_type'
     210 |                                                   ioasid_set_type type)
         |                                                   ^
         |                                                   enum 
>> drivers/vfio/platform/vfio_platform.c:29:9: error: implicit declaration of function 'platform_get_mem_or_io' [-Werror,-Wimplicit-function-declaration]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^
   drivers/vfio/platform/vfio_platform.c:29:9: note: did you mean 'platform_get_resource'?
   include/linux/platform_device.h:52:25: note: 'platform_get_resource' declared here
      52 | extern struct resource *platform_get_resource(struct platform_device *,
         |                         ^
>> drivers/vfio/platform/vfio_platform.c:29:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct resource *' [-Wint-conversion]
      29 |         return platform_get_mem_or_io(dev, num);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCI_MSI_ARCH_FALLBACKS
   Depends on [n]: PCI [=n]
   Selected by [y]:
   - X86 [=y]


vim +/platform_get_mem_or_io +29 drivers/vfio/platform/vfio_platform.c

9df85aaa43297c Antonios Motakis 2015-03-16  23  
9df85aaa43297c Antonios Motakis 2015-03-16  24  static struct resource *get_platform_resource(struct vfio_platform_device *vdev,
9df85aaa43297c Antonios Motakis 2015-03-16  25  					      int num)
9df85aaa43297c Antonios Motakis 2015-03-16  26  {
9df85aaa43297c Antonios Motakis 2015-03-16  27  	struct platform_device *dev = (struct platform_device *) vdev->opaque;
9df85aaa43297c Antonios Motakis 2015-03-16  28  
f0953dcfbb5080 Andy Shevchenko  2020-12-09 @29  	return platform_get_mem_or_io(dev, num);
9df85aaa43297c Antonios Motakis 2015-03-16  30  }
9df85aaa43297c Antonios Motakis 2015-03-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: f0953dcfbb508070e806a0c53aae09cdd3cde744 vfio: platform: Switch to use platform_get_mem_or_io()

:::::: TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
