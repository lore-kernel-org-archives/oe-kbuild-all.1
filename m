Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49B5DF49
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693947937; x=1725483937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HhJwlP81T/p1TDTyQOXWooL4Dg1vjQ3J63KNs5ZsFE8=;
  b=iNgquBNfgMMQPKq1/i+8F+ItlGlivPxO2rND5RcELre8Yi9FLroum3E7
   r8N38ob0hrO5A2jzq8Y025k1ih761H7dU5VO1XLxQm0ddAT60b3VZvo9B
   aKnONm25yh4JX2U9gKkmm34u6cJoJq2Xtif9oHkLJr0Lm3QidSIsIBMMa
   rghVQ70r4cONckvUZj89GpoAFsszGy3/655wdCotvxD5zDCZ0LdGcK88L
   noo5Lr22gxVdS0+bIlk6ZaQCxWF0kbp3JIA/YBv4AHrVJ9DbXARna/I9t
   DMy3zGkNE7DjEUot6b8k1wegypH/RUuk6g6qZuIuB3iJ58RNUXVKTbfl5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="376819169"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="376819169"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 14:05:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="770471775"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="770471775"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Sep 2023 14:05:34 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qddEq-00024t-00;
	Tue, 05 Sep 2023 21:05:32 +0000
Date: Wed, 6 Sep 2023 05:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 943/1123] include/linux/mtd/spi-nor.h:429:20:
 warning: array subscript 2 is above array bounds of 'struct
 spi_nor_flash_parameter * const[2]'
Message-ID: <202309060544.DJiRTmWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 0d4f3cd4205e0e41ba21a00507fb6afb7d3d2ca4 [943/1123] mtd: spi-nor: Add stacked memories support in spi-nor
config: x86_64-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060544.DJiRTmWr-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060544.DJiRTmWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060544.DJiRTmWr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/core.c:23:
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_write':
>> include/linux/mtd/spi-nor.h:429:20: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |  return nor->params[idx];
         |         ~~~~~~~~~~~^~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read':
>> include/linux/mtd/spi-nor.h:429:20: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |  return nor->params[idx];
         |         ~~~~~~~~~~~^~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_erase':
>> include/linux/mtd/spi-nor.h:429:20: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |  return nor->params[idx];
         |         ~~~~~~~~~~~^~~~~
>> include/linux/mtd/spi-nor.h:429:20: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |  return nor->params[idx];
         |         ~~~~~~~~~~~^~~~~


vim +429 include/linux/mtd/spi-nor.h

   426	
   427	static inline struct spi_nor_flash_parameter *spi_nor_get_params(const struct spi_nor *nor, u8 idx)
   428	{
 > 429		return nor->params[idx];
   430	}
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
