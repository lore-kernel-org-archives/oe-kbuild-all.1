Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D13B2A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StdiJcfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702558953; x=1734094953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHP0KkpI23e1IFMR4y6znhsClWdTZpIjUZDq83nb/KM=;
  b=StdiJcfqg/uHNMc6XB8UNgSYuypjbudOk3FEIe4+z53E5ePC1Qb7+qKa
   eF4cTESFLXPYa2w5gLIaos3DeUTA4eA+L1euOMs6Q0jioPS181q7To4Tk
   ViTXrmvdjy3VcmoXKjyFH67nRAovic3HQJ2/Ta8qZFAVA0g6WGkDITiKm
   T4e6aJY4mcrkz2SZ0+X1vphU4a4Yt/fay7bg/eL0uxzSx+iGvpv7pJ/Vs
   G0Vg5DtbxyJzWaK04IZzhTd/ufNlzzmsiOLHuMdJyrM/vnMzUYc2Zj7bt
   5UT+IzPud3GtTXtflyq9Ny2xsRwYyq2iYc1KXb2VVfWsnr9IscNnFWy5h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="2275502"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="2275502"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 05:02:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="865008570"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="865008570"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Dec 2023 05:02:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDlMC-000M5w-1r;
	Thu, 14 Dec 2023 13:02:28 +0000
Date: Thu, 14 Dec 2023 21:02:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [weiny2:cxl-cper-2023-12-13 8/9] include/linux/cxl-event.h:150:1:
 warning: no return statement in function returning non-void
Message-ID: <202312142024.rUckz0qc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-2023-12-13
head:   effd1d38713375ee60e89f1bef31eea1ba668304
commit: 3394ce85e912b328886077c5a439c65284767bb8 [8/9] firmware/efi: Process CXL Component Events
config: i386-buildonly-randconfig-002-20231214 (https://download.01.org/0day-ci/archive/20231214/202312142024.rUckz0qc-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312142024.rUckz0qc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142024.rUckz0qc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/cxlmem.h:9,
                    from drivers/cxl/core/pmem.c:6:
   include/linux/cxl-event.h: In function 'cxl_cper_register_notifier':
>> include/linux/cxl-event.h:150:1: warning: no return statement in function returning non-void [-Wreturn-type]
     150 | static inline int cxl_cper_register_notifier(cxl_cper_notifier notifier) { }
         | ^~~~~~
   include/linux/cxl-event.h: In function 'cxl_cper_unregister_notifier':
   include/linux/cxl-event.h:151:1: warning: no return statement in function returning non-void [-Wreturn-type]
     151 | static inline int cxl_cper_unregister_notifier(cxl_cper_notifier notifier) { }
         | ^~~~~~


vim +150 include/linux/cxl-event.h

   142	
   143	typedef void (*cxl_cper_notifier)(enum cxl_event_type type,
   144					  struct cxl_cper_event_rec *rec);
   145	
   146	#ifdef CONFIG_UEFI_CPER
   147	int cxl_cper_register_notifier(cxl_cper_notifier notifier);
   148	int cxl_cper_unregister_notifier(cxl_cper_notifier notifier);
   149	#else
 > 150	static inline int cxl_cper_register_notifier(cxl_cper_notifier notifier) { }
   151	static inline int cxl_cper_unregister_notifier(cxl_cper_notifier notifier) { }
   152	#endif
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
