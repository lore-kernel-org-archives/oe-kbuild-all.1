Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A6D111A7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXk+gxi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700315021; x=1731851021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkGHP7LsyjwfgPjr64v0354pMQ654q57fjd1Wt8qASw=;
  b=bXk+gxi/5V1mnBXBy+7EoOts68XvaBfEmCn8dgdQtSzJSIWaQaHglrHg
   j9g9im4c1Mn8sEX7ZX+SRyymmfNBAQbkq/28ME+dH/vU8vhy85as6/LLS
   TWoZCt4LIRUaROtNoB1Aot3Zgr5ZjmDmu5ljqkNUMc0jndGjGV3OZu+eB
   lp1dFsnBhkb9/uWYLdl+Dg0xzue+tc7tROISkWfpEuBOUe/8Z/fulxIlC
   yiqracKAt8IqoexFylAh/j3xtCRRmccx0sv7uJINchU8JNohkNA5W5FOo
   WPSKYMjPltztKaNxUiMA+/XtHpYzIomVS8/DiUrlH7rv3CALUMGdA0oDY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371604271"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="371604271"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 05:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="759414038"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="759414038"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Nov 2023 05:43:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4Lbk-0003x5-1n;
	Sat, 18 Nov 2023 13:43:36 +0000
Date: Sat, 18 Nov 2023 21:42:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: drivers/misc/pci_endpoint_test.c:38:41: warning: '%d' directive
 output may be truncated writing between 1 and 10 bytes into a region of size
 2
Message-ID: <202311182130.6duKTiLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   791c8ab095f71327899023223940dd52257a4173
commit: 2c156ac71c6b2518f3d589190f2a8872a8764faf misc: Add host side PCI driver for PCI test function device
date:   7 years ago
config: x86_64-buildonly-randconfig-001-20231012 (https://download.01.org/0day-ci/archive/20231118/202311182130.6duKTiLv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311182130.6duKTiLv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182130.6duKTiLv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/pci_endpoint_test.c: In function 'pci_endpoint_test_probe':
>> drivers/misc/pci_endpoint_test.c:38:41: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
      38 | #define DRV_MODULE_NAME                 "pci-endpoint-test"
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/misc/pci_endpoint_test.c:463:38: note: in expansion of macro 'DRV_MODULE_NAME'
     463 |         snprintf(name, sizeof(name), DRV_MODULE_NAME ".%d", id);
         |                                      ^~~~~~~~~~~~~~~
   drivers/misc/pci_endpoint_test.c:503:57: note: format string is defined here
     503 |         if (sscanf(misc_device->name, DRV_MODULE_NAME ".%d", &id) != 1)
         |                                                         ^~
   drivers/misc/pci_endpoint_test.c:38:41: note: directive argument in the range [0, 2147483647]
      38 | #define DRV_MODULE_NAME                 "pci-endpoint-test"
         |                                         ^~~~~~~~~~~~~~~~~~~
   drivers/misc/pci_endpoint_test.c:463:38: note: in expansion of macro 'DRV_MODULE_NAME'
     463 |         snprintf(name, sizeof(name), DRV_MODULE_NAME ".%d", id);
         |                                      ^~~~~~~~~~~~~~~
   drivers/misc/pci_endpoint_test.c:463:9: note: 'snprintf' output between 20 and 29 bytes into a destination of size 20
     463 |         snprintf(name, sizeof(name), DRV_MODULE_NAME ".%d", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +38 drivers/misc/pci_endpoint_test.c

    37	
  > 38	#define DRV_MODULE_NAME			"pci-endpoint-test"
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
