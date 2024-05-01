Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2303F12E7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714574979; cv=none; b=P9CUswn0cI0LYY+H2epLKzBC3uadVgyi3aaQFtmsaE40k9H9YHCSjuNTnMFhmU9h89CI+9WyTROVcQHys2X5AVWJNKObR6NXIqTzg5ftcWeVGfZoH9GdaFsDRK4JL+i/ieXJi89c8vjy4SmLwzN97C0kDZPXHoUwlkF6ZrL5KTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714574979; c=relaxed/simple;
	bh=QopRDMSVjfdwit7Y97Lla+qFJRrFSSycA7ACLadiqqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksqzib0wT9mfx0Eh59Vyx32nWzlLCxDw2UX7zpGL1rmN/HOpsFPlgis5hnuozsl8lFDeGLiyXldgEH6zGE0aybppJemsX8dpadLOGVRwIWUN7P7WaKWLqp48CsOg3Np9Aaj7uyYfz831DcEyoxGZb0p1gw4IeeITlnk8fC0hAqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JsePpg14; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JsePpg14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714574978; x=1746110978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QopRDMSVjfdwit7Y97Lla+qFJRrFSSycA7ACLadiqqM=;
  b=JsePpg14ChcwBWk8x7C+Kn8bC2hjMiIf41/VgbG7ZesIk7ozJ8U0C8oN
   Om3NWqalwSvB90OqWxJ1QpbIRpdzH8B+CqQZpx3p1a1Y8Dog94xKbLCrU
   Xwf+csZkq+ux8pUGG6UfeprNZtyDTuxRCmCYX+AsgNjp0Q+wPClUGYwUS
   LqPb7BZ0Lspiegd1VGI13bTRJj9DR6F6lKep4f8brNPtFBpW+5wp1DIyt
   FoHF/tua5pZ+gfXxo/tk/IJVghov4wnSwRfCcI6+JpnpilBOZHVMoiseC
   FcsRHyrva9+GDeCAJdF/v6kyuNozBgGCa0ECKwTuy56ejw/ENv9719ST7
   w==;
X-CSE-ConnectionGUID: 3ogpW9ZTThe1SZi288SwVg==
X-CSE-MsgGUID: HxLNnhAVStOaHOj9jAJZMw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="10478389"
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="10478389"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 07:49:27 -0700
X-CSE-ConnectionGUID: t7evgUJFQnCfJYWfwqlPOQ==
X-CSE-MsgGUID: vTBaG4aKTbqZ86cCVsYJrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,245,1708416000"; 
   d="scan'208";a="31511008"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 May 2024 07:49:26 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2BGt-0009eU-2u;
	Wed, 01 May 2024 14:49:23 +0000
Date: Wed, 1 May 2024 22:48:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ira Weiny <ira.weiny@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>
Subject: [weiny2:cxl-cper-testing 3/5] include/linux/cxl-event.h:155:19:
 warning: 'cxl_cper_register_work' used but never defined
Message-ID: <202405012230.6kXItWen-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git cxl-cper-testing
head:   9561664438db543f4d61ee0dde4fa9722239fb13
commit: 0ed9b6f0a655309877bda7c0c56150d14ce0287f [3/5] cxl/pci: Process CPER events
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240501/202405012230.6kXItWen-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405012230.6kXItWen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405012230.6kXItWen-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/cxlmem.h:9,
                    from drivers/cxl/pci.c:14:
   include/linux/cxl-event.h:156:1: error: expected identifier or '(' before '{' token
     156 | {
         | ^
   include/linux/cxl-event.h:161:1: error: expected identifier or '(' before '{' token
     161 | {
         | ^
>> include/linux/cxl-event.h:155:19: warning: 'cxl_cper_register_work' used but never defined
     155 | static inline int cxl_cper_register_work(struct work_struct *work);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/cxl-event.h:160:19: warning: 'cxl_cper_unregister_work' used but never defined
     160 | static inline int cxl_cper_unregister_work(struct work_struct *work);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/cxl_cper_register_work +155 include/linux/cxl-event.h

f64693ceeed628d Ira Weiny 2023-07-13  149  
f64693ceeed628d Ira Weiny 2023-07-13  150  #ifdef CONFIG_ACPI_APEI_GHES
f64693ceeed628d Ira Weiny 2023-07-13  151  int cxl_cper_register_work(struct work_struct *work);
f64693ceeed628d Ira Weiny 2023-07-13  152  int cxl_cper_unregister_work(struct work_struct *work);
f64693ceeed628d Ira Weiny 2023-07-13  153  int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd);
f64693ceeed628d Ira Weiny 2023-07-13  154  #else
f64693ceeed628d Ira Weiny 2023-07-13 @155  static inline int cxl_cper_register_work(struct work_struct *work);
f64693ceeed628d Ira Weiny 2023-07-13  156  {
f64693ceeed628d Ira Weiny 2023-07-13  157  	return 0;
f64693ceeed628d Ira Weiny 2023-07-13  158  }
f64693ceeed628d Ira Weiny 2023-07-13  159  
f64693ceeed628d Ira Weiny 2023-07-13 @160  static inline int cxl_cper_unregister_work(struct work_struct *work);
f64693ceeed628d Ira Weiny 2023-07-13  161  {
f64693ceeed628d Ira Weiny 2023-07-13  162  	return 0;
f64693ceeed628d Ira Weiny 2023-07-13  163  }
f64693ceeed628d Ira Weiny 2023-07-13  164  static inline int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
f64693ceeed628d Ira Weiny 2023-07-13  165  {
f64693ceeed628d Ira Weiny 2023-07-13  166  	return 0;
f64693ceeed628d Ira Weiny 2023-07-13  167  }
f64693ceeed628d Ira Weiny 2023-07-13  168  #endif
f64693ceeed628d Ira Weiny 2023-07-13  169  

:::::: The code at line 155 was first introduced by commit
:::::: f64693ceeed628d8036c8ac75f655bb3292d5bcf acpi/ghes: Process CXL Component Events

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Ira Weiny <ira.weiny@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
