Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537971B800
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Feb 2024 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707251907; cv=none; b=hVChs7ZE11O0gFc1jAnem5aNDk1+pxDsP2KcLFIfDlL20Noe9i4XCKoV+craxRovlBoifKVpVuc+gnowgGl5yIAH2DmJUZPGzE7JUuXJzGYZQEqNSNhuAS+oRnfdly0yUPnPg20/wbe5rDxMbkQfQDeuHl4u16NPdXw+7OyNo1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707251907; c=relaxed/simple;
	bh=T3H4E2Smd2V1MhcCgSLOCgnbQnHkGQFy0h5p3wPMk0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIVu17ukNL75JJFxpQhZaDkNRHUnGYYqvN9OdE9naBx7VcY+ZDRt5hpJCcR7lwR7psiSlIqMk41T4QFdtTG2rLg0EJSLxdZRSeRiv5TqlEq3A+TCXqJ75dN/C2IQJBBZeKGMGOjQ23CaHmhuJd8yJZxPOlygepPZiLsTo4IXX8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nanxCxpe; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nanxCxpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707251904; x=1738787904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T3H4E2Smd2V1MhcCgSLOCgnbQnHkGQFy0h5p3wPMk0M=;
  b=nanxCxpekLjXBLxHCTKfYuEZ8tiZmwuBTCKVGveX0mYACB95QoDt/eXB
   vHo+ZVeMEMtMwzfnxnH0QHHm2AlnpTzlnEfXBr/kinoe9TG7YV34+IYU3
   dFqrXbCJTAsszK4k5r/vmZkBNO840l7Qx/yZJLBPIl8IZ7ltXjtfNu7vv
   Zk9ORMEPGroKJtviJqBE83eJVz2CG1iEJwYGMVCeAY2gylQwPwRssRmFt
   bXMCvtLJa0P1xfgKwl6R61OS+c4I7yeJlJwbqICKbEZn9AU1E4GysBCNv
   6ExH4wVnfe9zL68IjbObtoQ77b9leBwMLB20/eb5H1IvCS1b8yNc0wk7C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="724843"
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="724843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 12:38:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,248,1701158400"; 
   d="scan'208";a="5738219"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Feb 2024 12:38:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXSCv-0001m4-0W;
	Tue, 06 Feb 2024 20:38:17 +0000
Date: Wed, 7 Feb 2024 04:37:56 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Tian Wei <tianwei@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21355/21616]
 drivers/gpio/gpio-phytium-platform.c:30:36: warning:
 'phytium_gpio_acpi_match' defined but not used
Message-ID: <202402070439.VbTTHaS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a28772f4b29bdda924e9a5d2e3ff1ff1b23fd14
commit: 00711bad7e372a30c4975ba43811ffa666aff0e1 [21355/21616] gpio: add phytium gpio driver
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240207/202402070439.VbTTHaS6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240207/202402070439.VbTTHaS6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402070439.VbTTHaS6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-phytium-platform.c:30:36: warning: 'phytium_gpio_acpi_match' defined but not used [-Wunused-const-variable=]
      30 | static const struct acpi_device_id phytium_gpio_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_gpio_acpi_match +30 drivers/gpio/gpio-phytium-platform.c

    29	
  > 30	static const struct acpi_device_id phytium_gpio_acpi_match[] = {
    31		{ "PHYT0001", 0 },
    32		{ }
    33	};
    34	MODULE_DEVICE_TABLE(acpi, phytium_gpio_acpi_match);
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
