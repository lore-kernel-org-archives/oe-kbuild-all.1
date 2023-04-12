Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD9D6121
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 15:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681314796; x=1712850796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KaqhgbVio692/7Lw/ZRY90RuDTRlRbfszgmuUKCgioI=;
  b=gPg39gEaM1y6mEC3E8YbHNIrptLIUfVkHKkO8WdpQOBUER9VohaYSDCJ
   XuvFCxQ5Q21JE9kdZoZ3w9HXGxAdsF+1KBc15/EE0Ct32MVyZmjbi+OKi
   WZvYl8EwT6dzpswBeOB0C2DoF8VtTrsWox8oB5WyDtuyUEFTC/S3iIuMo
   T3Plp+BPJrkv7IYTZsaCUA4f+f8OZpp0VAuVmtJfymAQlN6qmtyo2hSQZ
   /AhkVAQg+QTvsUcbEqiU/M7TVF7g/H/GbThx77g3jtrRywswiVJePWSF+
   Tdfy0sqgQgoUzeChYv7V5DJCLyYaMwNiuBOBMLWZosrAtVUdjZc3JfCHH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="371789016"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="371789016"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 08:53:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="753578727"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="753578727"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 Apr 2023 08:53:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmcmX-000XoV-07;
	Wed, 12 Apr 2023 15:53:13 +0000
Date: Wed, 12 Apr 2023 23:52:14 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1 891/1065]
 include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above
 array bounds of 'struct spi_nor_flash_parameter * const[2]'
Message-ID: <202304122336.sgHDTqY5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1
head:   bbf25ceb15a43c9047e14ab46a1d25c8ae6b67b4
commit: cce0e6dc5b1a97f70e733ebaadf869cfaa59e8e0 [891/1065] mtd: spi-nor: Add stacked memories support in spi-nor
config: x86_64-randconfig-a013-20230410 (https://download.01.org/0day-ci/archive/20230412/202304122336.sgHDTqY5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/cce0e6dc5b1a97f70e733ebaadf869cfaa59e8e0
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1
        git checkout cce0e6dc5b1a97f70e733ebaadf869cfaa59e8e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304122336.sgHDTqY5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/core.c:23:
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_write':
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read':
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_erase':
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~


vim +429 include/linux/mtd/spi-nor.h

   426	
   427	static inline struct spi_nor_flash_parameter *spi_nor_get_params(const struct spi_nor *nor, u8 idx)
   428	{
 > 429		return nor->params[idx];
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
