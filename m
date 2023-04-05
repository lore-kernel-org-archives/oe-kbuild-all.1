Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098FCA45
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 09:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680685990; x=1712221990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KE2K4U53xrNdiV/P43pg27iBATszMvM4YqazgMAa77k=;
  b=kHoSuDDWqQHbQjV/mGoDe2C0BQBfdAzShdWkaOtRuorGqmj7Kzsdpicv
   I9VBMjwwjp0G/998HMfI65MWqe3bYBzL67cPWPCyPw2M6uMPAGwJYMaOz
   3NwEm9gSBm5V0F6JzrYTe2XP4/WOJVRTDtvS4r+3GAKaxs3P6flIIqVfE
   rytISyqOSmITJMX2KYhs8RGqHemjS9gMurxMHaPCdZIBpVvwWWkUK3qGy
   0n6rKfguHJ8DxG1uGF0K22d2wEOqq/y9CpyqAg71U+QPilt3oghrC9srU
   vNV/2SH4l5AOfgYMBFHXxF4/riJ8DgYHaxUPXS3/DKg/LTlNiuvkS79eN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428692547"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="428692547"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 02:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="680211771"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="680211771"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Apr 2023 02:13:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjzCV-000QRC-0B;
	Wed, 05 Apr 2023 09:13:07 +0000
Date: Wed, 5 Apr 2023 17:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: oe-kbuild-all@lists.linux.dev, Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [ambarus:s25hx02gt-v3 31/31] drivers/mtd/spi-nor/spansion.c:584:28:
 error: 'struct spi_nor_flash_parameter' has no member named 'num_of_dice'
Message-ID: <202304051724.CFcjtPuX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day s25hx02gt-v3
head:   17262634676fc89ea1fff217ed2cdebc15fc2f11
commit: 17262634676fc89ea1fff217ed2cdebc15fc2f11 [31/31] mtd: spi-nor: spansion: Add support for Infineon
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230405/202304051724.CFcjtPuX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ambarus/linux-0day/commit/17262634676fc89ea1fff217ed2cdebc15fc2f11
        git remote add ambarus https://github.com/ambarus/linux-0day
        git fetch --no-tags ambarus s25hx02gt-v3
        git checkout 17262634676fc89ea1fff217ed2cdebc15fc2f11
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/mtd/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051724.CFcjtPuX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/spi-nor/spansion.c: In function 's25hx_t_post_sfdp_fixup':
>> drivers/mtd/spi-nor/spansion.c:584:28: error: 'struct spi_nor_flash_parameter' has no member named 'num_of_dice'
     584 |                 nor->params->num_of_dice = 2;
         |                            ^~


vim +584 drivers/mtd/spi-nor/spansion.c

   558	
   559	static int s25hx_t_post_sfdp_fixup(struct spi_nor *nor)
   560	{
   561		struct spi_nor_erase_type *erase_type =
   562						nor->params->erase_map.erase_type;
   563		unsigned int i;
   564	
   565		/*
   566		 * In some parts, 3byte erase opcodes are advertised by 4BAIT.
   567		 * Convert them to 4byte erase opcodes.
   568		 */
   569		for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
   570			switch (erase_type[i].opcode) {
   571			case SPINOR_OP_SE:
   572				erase_type[i].opcode = SPINOR_OP_SE_4B;
   573				break;
   574			case SPINOR_OP_BE_4K:
   575				erase_type[i].opcode = SPINOR_OP_BE_4K_4B;
   576				break;
   577			default:
   578				break;
   579			}
   580		}
   581	
   582		/* The 2 Gb parts duplicate info and advertise 4 dice instead of 2. */
   583		if (nor->params->size == SZ_256M)
 > 584			nor->params->num_of_dice = 2;
   585	
   586		return cypress_nor_get_page_size(nor);
   587	}
   588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
