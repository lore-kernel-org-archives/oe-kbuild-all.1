Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5B32E648
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 22:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjEHkbYM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699309536; x=1730845536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+4d5drTIDaPguILI2PkdxVhWFA/kQkPvxSWrmCmdX10=;
  b=HjEHkbYMtRw6KeL5pmdgjhC+qmVBUfC4EYrhGIAXcyOorY1NYedaWUsh
   W7e/S5yQmnscn5K2hA/iu9uwEgv/KcZoP/a9d3o8v/Wgz1TWCA6TWz54q
   kTd87AXRNDTG2mDnwmv15AmE7lolDNt/it5QP37e6WcPPMm5v2zOL8C/G
   3ZHtWTqVzhWdRmy3qtC8LX/rCjFvQUEfSecUmM4HQokDORAzu9k+HXnnS
   0aNhE4wj9Cx0W5vf5LJZ+nXBXxN5zqgIotljjLeAfTmMKnJi+6omX8qt/
   HbhllgEhSFHB+d4o2UsnMq9sdUfRD62Z3QCet1fT6f+0KafhuOmrTiquh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="475618836"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="475618836"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712341281"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="712341281"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 14:25:33 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r082F-0006lc-0B;
	Mon, 06 Nov 2023 22:25:31 +0000
Date: Tue, 7 Nov 2023 06:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/udc/omap_udc.c:110:19: warning: 'driver_desc'
 defined but not used
Message-ID: <202311070616.6TJr86vx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 250c1a694ff304e5d69e74ab32755eddcc2b8f65 ARM: pxa: convert to multiplatform
date:   1 year, 6 months ago
config: arm-randconfig-r035-20230201 (https://download.01.org/0day-ci/archive/20231107/202311070616.6TJr86vx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070616.6TJr86vx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070616.6TJr86vx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/udc/omap_udc.c: In function 'omap_udc_pio_irq':
   drivers/usb/gadget/udc/omap_udc.c:1915:37: warning: variable 'stat' set but not used [-Wunused-but-set-variable]
    1915 |                                 int stat;
         |                                     ^~~~
   At top level:
>> drivers/usb/gadget/udc/omap_udc.c:110:19: warning: 'driver_desc' defined but not used [-Wunused-const-variable=]
     110 | static const char driver_desc[] = DRIVER_DESC;
         |                   ^~~~~~~~~~~


vim +/driver_desc +110 drivers/usb/gadget/udc/omap_udc.c

^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  107  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  108  
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  109  static const char driver_name[] = "omap_udc";
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16 @110  static const char driver_desc[] = DRIVER_DESC;
^1da177e4c3f41 drivers/usb/gadget/omap_udc.c Linus Torvalds 2005-04-16  111  

:::::: The code at line 110 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
