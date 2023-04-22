Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C3B393
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 01:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682128533; x=1713664533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f+lgA9XjN+teB/ra0NbLrkfA9pwCUCZbZeeDto0MG8Q=;
  b=BS5ibkEOy1F+6vuRQdX9QsOVxCJ2FQQ+jGVvNiiVVEXk1GwtVhOlLwPL
   drO97CMn5aXBjs6JhQIFszks4HEvMe9WUXXd2FFfDlu9Ln9TS+7WKDzLX
   I+i2Lk4BUJ1nnFi4FFy+hbaOBjEIMpXJgUZ9GxsYO6jjVYw8Obinq02I4
   26CvZ4kneZQCrNpy0YxkIbZ9KFvtK0yyQsyePTK+5sFqwNlX1lVYLFBOT
   Zjwlc+cn2485jyN7WqGMC+xRpo41GF2EAaf0WyauSDuU3MisekIsyhZ8F
   y3QgakIgMZro5lelbM4lDr2h1RZzhrw/e/PaV2DoauG44LAPjKXErkBJY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="344868094"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="344868094"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 18:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="803928621"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="803928621"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Apr 2023 18:55:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq2TK-000h02-1S;
	Sat, 22 Apr 2023 01:55:30 +0000
Date: Sat, 22 Apr 2023 09:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 943/1117] include/linux/mtd/spi-nor.h:429:27:
 warning: array subscript 2 is above array bounds of 'struct
 spi_nor_flash_parameter * const[2]'
Message-ID: <202304220923.sh7Zt2zC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 0d4f3cd4205e0e41ba21a00507fb6afb7d3d2ca4 [943/1117] mtd: spi-nor: Add stacked memories support in spi-nor
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230422/202304220923.sh7Zt2zC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Xilinx/linux-xlnx/commit/0d4f3cd4205e0e41ba21a00507fb6afb7d3d2ca4
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 0d4f3cd4205e0e41ba21a00507fb6afb7d3d2ca4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mtd/spi-nor/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220923.sh7Zt2zC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mtd/spi-nor/core.c:23:
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_read.part.0':
>> include/linux/mtd/spi-nor.h:429:27: warning: array subscript 2 is above array bounds of 'struct spi_nor_flash_parameter * const[2]' [-Warray-bounds]
     429 |         return nor->params[idx];
         |                ~~~~~~~~~~~^~~~~
   include/linux/mtd/spi-nor.h:406:41: note: while referencing 'params'
     406 |         struct spi_nor_flash_parameter *params[SNOR_FLASH_CNT_MAX];
         |                                         ^~~~~~
   drivers/mtd/spi-nor/core.c: In function 'spi_nor_write':
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
