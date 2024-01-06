Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CE1F51E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BwkW3rZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704576293; x=1736112293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IYox++9NPxL9ZZQ0SaHmzRmKVlaZ8r8CyO0y8u2ghD0=;
  b=BwkW3rZnT45IF40FPrUzLMrYru81KmS/ohoYazY+DqBteRWUxLThA/ZJ
   jJVcDqDQpoHD2qKkiONEIUDxOOq2GE+MLCBiTlDhon336cQ2Xo0NVuUt7
   2KlwoGpcCtm9rcYHqaxKJ1AWQcNAb6GsPvpSGhjpnkeckF6iCQSDDcBxx
   S0SGGWOgRrENddSFy3lx2oxxsdDQGdmS6+vka7uGt/T33r/DA1zw3HKRp
   HtxcxN8YmHrruw6nzVzUQEFX+dyAcD+IVs65RENkPKozPHHogbC6enOTr
   5ubGx7z8UcMoZWLAgbgPJWW/hgEwrKVy0ivZVuGIhgrS1q3TZShEkGwfy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="19188516"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="19188516"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 13:23:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="924511284"
X-IronPort-AV: E=Sophos;i="6.04,337,1695711600"; 
   d="scan'208";a="924511284"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2024 13:23:25 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rME8Z-00031y-04;
	Sat, 06 Jan 2024 21:23:23 +0000
Date: Sun, 7 Jan 2024 05:22:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/misc/dw-xdata-pcie.c:20:41: warning: 'snprintf' output may
 be truncated before the last format character
Message-ID: <202401070541.9jGvpTOU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95c8a35f1c017327eab3b6a2ff5c04255737c856
commit: e8a30eef6ef6da4998fcdaaffaaf8d29777c5d7d misc: Add Synopsys DesignWare xData IP driver
date:   2 years, 9 months ago
config: x86_64-randconfig-001-20240105 (https://download.01.org/0day-ci/archive/20240107/202401070541.9jGvpTOU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401070541.9jGvpTOU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401070541.9jGvpTOU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/dw-xdata-pcie.c: In function 'dw_xdata_pcie_probe':
>> drivers/misc/dw-xdata-pcie.c:20:41: warning: 'snprintf' output may be truncated before the last format character [-Wformat-truncation=]
      20 | #define DW_XDATA_DRIVER_NAME            "dw-xdata-pcie"
         |                                         ^~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:342:38: note: in expansion of macro 'DW_XDATA_DRIVER_NAME'
     342 |         snprintf(name, sizeof(name), DW_XDATA_DRIVER_NAME ".%d", id);
         |                                      ^~~~~~~~~~~~~~~~~~~~
   drivers/misc/dw-xdata-pcie.c:390:64: note: format string is defined here
     390 |         if (sscanf(dw->misc_dev.name, DW_XDATA_DRIVER_NAME ".%d", &id) != 1)
         |                                                                ^
   drivers/misc/dw-xdata-pcie.c:342:9: note: 'snprintf' output between 16 and 25 bytes into a destination of size 24
     342 |         snprintf(name, sizeof(name), DW_XDATA_DRIVER_NAME ".%d", id);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/snprintf +20 drivers/misc/dw-xdata-pcie.c

    19	
  > 20	#define DW_XDATA_DRIVER_NAME		"dw-xdata-pcie"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
