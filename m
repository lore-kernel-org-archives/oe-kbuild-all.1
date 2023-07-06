Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3578946F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688669144; x=1720205144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3wOeUZs6JXKyWVNdi7+CcHIAObG75WGMUOy+RpNjDSU=;
  b=SEXy86pNnmhc5SFlvbsoP5hPHt3zHaluyMkWwQ0wviZtT1GjOz47ibYN
   erEc4wBz3jeY7ldEmvLEKXHItkfTOxMf94DK0SUwVS0VgLX19ZJnZoVho
   NbkAcESYpUNynmlO2IR+hVCjjnoDA0SeV3aDqlswyPG5k2h6iAgIKuUpU
   WrZNVObLiv8HilkS+N/ffNZ7AMTJ1rAyena4MBBJZE5S1T1Rws0AyaXyi
   YQJZDFOAQsfCiq21NO2anep/NF0Ilpv0WdTuUAGihJhBCBF2L0pvCDpPp
   qgXTkic1Q2G/Kstn0/aNJtT2E2yft1FUdoYfCQMaZJO34ljea1czQSZeu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="344021165"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="344021165"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 11:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="719668691"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="719668691"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Jul 2023 11:45:40 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHTz2-0001Va-11;
	Thu, 06 Jul 2023 18:45:40 +0000
Date: Fri, 7 Jul 2023 02:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>
Subject: memdev.c:undefined reference to `firmware_upload_unregister'
Message-ID: <202307070209.tLMRS8xd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c17414a273b81fe4e34e11d69fc30cc8b1431614
commit: 9521875bbe0055805557fff0b08fd9a29d02b7bc cxl: add a firmware update mechanism using the sysfs firmware loader
date:   11 days ago
config: xtensa-randconfig-r035-20230706 (https://download.01.org/0day-ci/archive/20230707/202307070209.tLMRS8xd-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070209.tLMRS8xd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070209.tLMRS8xd-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `cxl_memdev_shutdown':
>> memdev.c:(.text+0xb10): undefined reference to `firmware_upload_unregister'
   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `devm_cxl_remove_fw_upload':
   memdev.c:(.text+0xb32): undefined reference to `firmware_upload_unregister'
   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `clear_exclusive_cxl_commands':
>> memdev.c:(.text+0x2334): undefined reference to `firmware_upload_register'
   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `cxl_memdev_setup_fw_upload':
   memdev.c:(.text+0x23d6): undefined reference to `firmware_upload_register'
   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `clear_exclusive_cxl_commands':
   memdev.c:(.text+0x2344): undefined reference to `firmware_upload_unregister'
   xtensa-linux-ld: drivers/cxl/core/memdev.o: in function `cxl_memdev_setup_fw_upload':
   memdev.c:(.text+0x24ab): undefined reference to `firmware_upload_unregister'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
