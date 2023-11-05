Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC03E17FA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 05:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzGojXjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699160548; x=1730696548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FsMbhxjdpUte39ZFXar+Z9ktto9oj/FP/JeeP5Y1MNo=;
  b=WzGojXjsAwIFYDlSP3+I0Su2TubsmNWJSFjv76NCPMcKAyaploNh+izK
   JHLZX+6XtjVKcQ/pRjpeOC/isCOqn2EhE64P4ef0pVkwTU25oyJK4YHzN
   uOOCYi/wQRQSt237jYLmX/T3xwVhMUBjoRKfuiiCI3ZNMHHAVrrcdjmcc
   mzCE2asjF4bz+RlKVDMD2UMFyOs4P4N6XThO25m2qFtrjOMVCf5etWtQ1
   yWQSqVzNqpI/gI8Oaw4UgYjSsfuUTGVZcFYp+8iqgjZvHgqotLCSlr+9C
   6A43k60HoeHa6mVLXkQwrw1s3pWADgoD45NYSJ8g3a6bMlsQCG699ChMo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="368460335"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="368460335"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2023 22:02:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10884"; a="885586613"
X-IronPort-AV: E=Sophos;i="6.03,278,1694761200"; 
   d="scan'208";a="885586613"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 04 Nov 2023 22:02:26 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzVHE-000530-0v;
	Sun, 05 Nov 2023 05:02:24 +0000
Date: Sun, 5 Nov 2023 13:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm:sa1100 29/36] arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19:
 error: initialization of 'int (*)(const struct device *, struct
 kobj_uevent_env *)' from incompatible pointer type 'int (*)(struct device *,
 struct kobj_uevent_env *)'
Message-ID: <202311051219.tXCXxpNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.armlinux.org.uk/~rmk/linux-arm.git sa1100
head:   08b1731daff3c03a1845f5edabf356876858ee5a
commit: 7061a74a938c818c6b23e79fe19b5696d25919f6 [29/36] ARM: sa1100/h3xxx: sleeve support
config: arm-jornada720_defconfig (https://download.01.org/0day-ci/archive/20231105/202311051219.tXCXxpNW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311051219.tXCXxpNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311051219.tXCXxpNW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19: error: initialization of 'int (*)(const struct device *, struct kobj_uevent_env *)' from incompatible pointer type 'int (*)(struct device *, struct kobj_uevent_env *)' [-Werror=incompatible-pointer-types]
      69 |         .uevent = ipaq_option_sleeve_uevent,
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-sa1100/ipaq-sleeve-bus.c:69:19: note: (near initialization for 'ipaq_option_sleeve_bus.uevent')
   cc1: some warnings being treated as errors


vim +69 arch/arm/mach-sa1100/ipaq-sleeve-bus.c

    64	
    65	struct bus_type ipaq_option_sleeve_bus = {
    66		.name = "ipaq-sleeve",
    67		.dev_groups = ipaq_option_sleeve_dev_groups,
    68		.match = ipaq_option_sleeve_match,
  > 69		.uevent = ipaq_option_sleeve_uevent,
    70	};
    71	EXPORT_SYMBOL_GPL(ipaq_option_sleeve_bus);
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
