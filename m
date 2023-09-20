Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D15B11711
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695199626; x=1726735626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XjTbLlvqV3eBrIre9/zk7HU8HtO19tjP9ClTh2919oQ=;
  b=a/A2JxV9wiTITqHvdb+94MlALJO98yOnpLLE6mnpxKlqqkOvrgtw47Ug
   j2el+WJdTmFOz3E/b/XNP6UIrhEmo1SV90ORc98f2ZA78nOedNu1ecko2
   vtJL3gVr8VNfuLLe6NSW36sVEnNscS/GzmbGdbk9Gkbgfa4NYRAFx4w2Q
   sqc6gezyh/81cERd1zvNBm2mrreJOeVFbH3oWquEJH+h/poAAUNZB2hhM
   d5GMOGNEDimKXnAk+8OnXPxf3r8Qh2iJYpxbI81hJ5UrSmfxXQZK48knc
   T2NeHyoB+O0GW7Zdm8rvyIQBs3RA0HrK8ugyXC/8EoiIpf4AkSEy00ylG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380071196"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380071196"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 01:47:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="870285455"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="870285455"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 01:47:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qisrM-0008Xx-1Z;
	Wed, 20 Sep 2023 08:47:00 +0000
Date: Wed, 20 Sep 2023 16:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 891/1363]
 include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above
 array bounds of 'struct spi_nor_flash_parameter * const[2]'
Message-ID: <202309201656.ORxgHWeW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: e500b96b4c8a5c61ab86c2a5bb1750abf2d59bf0 [891/1363] mtd: spi-nor: Add stacked memories support in spi-nor
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309201656.ORxgHWeW-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201656.ORxgHWeW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201656.ORxgHWeW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/core.c:23:
   In function 'spi_nor_get_params',
       inlined from 'spi_nor_read' at drivers/mtd/spi-nor/core.c:1765:12:
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds=]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h: In function 'spi_nor_read':
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   In function 'spi_nor_get_params',
       inlined from 'spi_nor_write' at drivers/mtd/spi-nor/core.c:1835:12:
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds=]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h: In function 'spi_nor_write':
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   In function 'spi_nor_get_params',
       inlined from 'spi_nor_erase' at drivers/mtd/spi-nor/core.c:1552:13:
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds=]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h: In function 'spi_nor_erase':
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   In function 'spi_nor_get_params',
       inlined from 'spi_nor_erase' at drivers/mtd/spi-nor/core.c:1508:13:
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds=]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h: In function 'spi_nor_erase':
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
https://github.com/intel/lkp-tests/wiki
