Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3959442B3A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 08:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833837; cv=none; b=CJJIxoXgOnEsTuK+KJWYLN2wU7JPLuYxvtpxsyuffZ3xFjGdC/2kq+WvMupW4Wd2qddTUjeSh+YVhAGOtIM3QsTmADjrfOmaLPYEghHLOscjUofZ4xStNdijxw+0uODoky54uF2RwmXjPSYk13m67bm3EkJXLLCGkaaUq6pFRLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833837; c=relaxed/simple;
	bh=vO+rxG8KcyHY1/bmjS5c5zMQ+mdRrgyZMUml/9x9ZFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0jY3CCBkd5xJXAmd6dCRxaA1oaeatxY9R3EsgPkAksClGOgcHIL/1GEH8tohx3BsUFj7xSJPKiRrFP0eaG5PJTCATWGL3ZCneVPf/7N1on8DIh4CEBX7/vBCnbxTD1kZae9dTiBxhc152ACtXGB/j99ZWAL3nCrLC9wQwtTHV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TpwBuxVV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TpwBuxVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785833835; x=1817369835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vO+rxG8KcyHY1/bmjS5c5zMQ+mdRrgyZMUml/9x9ZFg=;
  b=TpwBuxVVlNMe/PYKmAVcxeaycsSM7I/mnkdU1vhQZNyOcreFGLX92hbM
   dvz61GmBu+mBLuDALqwM3Yq9Sa374p7yANTx8rwVv3EUiC20SdlbIOO08
   1CIJ9ZqQ6frVavx3GhFc1mnBwn8QlDhu0KMEwkVNcn5jLGeM1QAIDtuHS
   U+HDohbKKEKgsZ0waf0PLdgj+tMBoDKJN2KVrc5wtI7wLJUOHHzZDzL++
   7KX0C4AjgJ/cq0Kw0rDOXAuvnFvnYCowS/xpk53Ey5sPbh+WcSX8VQ6t1
   MpEdtZKMcphU0fO/U6ffZwtNkt1V3GFE1MjhF5RfP9tvnYA4Pq8v+U+iA
   w==;
X-CSE-ConnectionGUID: 3H9nTh9+S2G9Nt2tvHuj8A==
X-CSE-MsgGUID: Gw1gBIImSTSTE9ZZtXlqaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86499244"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86499244"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:57:14 -0700
X-CSE-ConnectionGUID: hk9UlDrCS0e99XZEZcfWNA==
X-CSE-MsgGUID: 09351mO6SVeuK70/rHzf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="258779220"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Aug 2026 01:56:36 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAwr-000000009U1-2F9E;
	Tue, 04 Aug 2026 08:56:33 +0000
Date: Tue, 4 Aug 2026 16:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Yu <jeyu@issi.com>,
	"marek.vasut@gmail.com" <marek.vasut@gmail.com>,
	"tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"computersforpeace@gmail.com" <computersforpeace@gmail.com>,
	"bbrezillon@kernel.org" <bbrezillon@kernel.org>,
	"richard@nod.at" <richard@nod.at>,
	open list <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR
   devices. Additionally added several structs to support ISSI octal flash
  functionality. (Octal SPI 2026 revised)
Message-ID: <202608041622.usbEnS4x-lkp@intel.com>
References: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <LV8PR19MB85976C665A59A0DEBAF4F285B6EF2@LV8PR19MB8597.namprd19.prod.outlook.com>

Hi Jeffrey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on linus/master v7.2-rc6 next-20260803]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Yu/Add-JEDEC-ID-table-entries-for-additional-ISSI-SPI-NOR-devices-Additionally-added-several-structs-to-support-ISSI-octal-/20260804-122036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/LV8PR19MB85976C665A59A0DEBAF4F285B6EF2%40LV8PR19MB8597.namprd19.prod.outlook.com
patch subject: [PATCH] Add JEDEC ID table entries for additional ISSI SPI-NOR   devices. Additionally added several structs to support ISSI octal flash  functionality. (Octal SPI 2026 revised)
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041622.usbEnS4x-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041622.usbEnS4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041622.usbEnS4x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/issi.c: In function 'spi_nor_issi_phy_enable':
   drivers/mtd/spi-nor/issi.c:22:26: error: 'SPINOR_IS_EXSPI' undeclared (first use in this function); did you mean 'SPINOR_OP_EX4B'?
      22 |                 buf[0] = SPINOR_IS_EXSPI;
         |                          ^~~~~~~~~~~~~~~
         |                          SPINOR_OP_EX4B
   drivers/mtd/spi-nor/issi.c:22:26: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/issi.c:7:
   drivers/mtd/spi-nor/issi.c:25:59: error: 'SPINOR_OP_IS_WR_ANY_REG' undeclared (first use in this function)
      25 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:219:24: note: in definition of macro 'SPI_MEM_OP'
     219 |                 .cmd = __cmd,                                   \
         |                        ^~~~~
   drivers/mtd/spi-nor/issi.c:25:44: note: in expansion of macro 'SPI_MEM_OP_CMD'
      25 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                            ^~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:26:52: error: 'SPINOR_REG_IS_CFR0V' undeclared (first use in this function)
      26 |                                 SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
         |                                                    ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:26:33: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      26 |                                 SPI_MEM_OP_ADDR(4, SPINOR_REG_IS_CFR0V, 1),
         |                                 ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:36:56: error: 'SPI_CONTROLLER_SDR_PHY' undeclared (first use in this function); did you mean 'SPI_CONTROLLER_NO_RX'?
      36 |                 nor->spimem->spi->controller->flags |= SPI_CONTROLLER_SDR_PHY;
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                        SPI_CONTROLLER_NO_RX
   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/issi.c:7:
   drivers/mtd/spi-nor/issi.c: In function 'spi_nor_issi_octal_dtr_enable':
   drivers/mtd/spi-nor/issi.c:73:59: error: 'SPINOR_OP_IS_WR_ANY_REG' undeclared (first use in this function)
      73 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:219:24: note: in definition of macro 'SPI_MEM_OP'
     219 |                 .cmd = __cmd,                                   \
         |                        ^~~~~
   drivers/mtd/spi-nor/issi.c:73:44: note: in expansion of macro 'SPI_MEM_OP_CMD'
      73 |                                 SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_IS_WR_ANY_REG, 1),
         |                                            ^~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:74:60: error: 'SPINOR_REG_IS_CFR1V' undeclared (first use in this function)
      74 |                                         SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
         |                                                            ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:74:41: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      74 |                                         SPI_MEM_OP_ADDR(3, SPINOR_REG_IS_CFR1V, 1),
         |                                         ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:92:32: error: 'SPINOR_IS_OCT_DTR' undeclared (first use in this function)
      92 |                         *buf = SPINOR_IS_OCT_DTR;
         |                                ^~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:94:32: error: 'SPINOR_IS_EXSPI' undeclared (first use in this function); did you mean 'SPINOR_OP_EX4B'?
      94 |                         *buf = SPINOR_IS_EXSPI;
         |                                ^~~~~~~~~~~~~~~
         |                                SPINOR_OP_EX4B
   In file included from include/linux/mtd/spi-nor.h:11,
                    from drivers/mtd/spi-nor/issi.c:7:
   drivers/mtd/spi-nor/issi.c:99:57: error: 'SPINOR_REG_IS_CFR0V' undeclared (first use in this function)
      99 |                                                         SPINOR_REG_IS_CFR0V, 1),
         |                                                         ^~~~~~~~~~~~~~~~~~~
   include/linux/spi/spi-mem.h:220:25: note: in definition of macro 'SPI_MEM_OP'
     220 |                 .addr = __addr,                                 \
         |                         ^~~~~~
   drivers/mtd/spi-nor/issi.c:98:41: note: in expansion of macro 'SPI_MEM_OP_ADDR'
      98 |                                         SPI_MEM_OP_ADDR(enable ? 3 : 4,
         |                                         ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:110:35: error: 'SNOR_F_HAS_STACKED' undeclared (first use in this function); did you mean 'SNOR_F_HAS_LOCK'?
     110 |                 if ((nor->flags & SNOR_F_HAS_STACKED) && nor->spimem->spi->cs_index_mask == 1)
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   SNOR_F_HAS_LOCK
   drivers/mtd/spi-nor/issi.c: In function 'is25wx256_default_init':
   drivers/mtd/spi-nor/issi.c:151:58: error: implicit declaration of function 'spi_nor_get_params' [-Werror=implicit-function-declaration]
     151 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/issi.c:151:58: warning: initialization of 'struct spi_nor_flash_parameter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/mtd/spi-nor/issi.c:155:23: error: 'struct spi_nor_flash_parameter' has no member named 'phy_enable'
     155 |                 params->phy_enable = spi_nor_issi_phy_enable;
         |                       ^~
   drivers/mtd/spi-nor/issi.c: In function 'is25wx256_post_sfdp_fixup':
   drivers/mtd/spi-nor/issi.c:160:58: warning: initialization of 'struct spi_nor_flash_parameter *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     160 |                 struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
         |                                                          ^~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/issi.c:165:72: error: 'SPINOR_OP_IS_DTR_RD' undeclared (first use in this function); did you mean 'SPINOR_OP_RDSR2'?
     165 |                                                                 0, 20, SPINOR_OP_IS_DTR_RD,
         |                                                                        ^~~~~~~~~~~~~~~~~~~
         |                                                                        SPINOR_OP_RDSR2
   drivers/mtd/spi-nor/issi.c: At top level:
   drivers/mtd/spi-nor/issi.c:314:30: error: 'USE_FSR' undeclared here (not in a function)
     314 |                 .mfr_flags = USE_FSR,
         |                              ^~~~~~~
   cc1: some warnings being treated as errors


vim +151 drivers/mtd/spi-nor/issi.c

   148	
   149	static void is25wx256_default_init(struct spi_nor *nor)
   150	{
 > 151			struct spi_nor_flash_parameter *params = spi_nor_get_params(nor, 0);
   152	
   153			params->set_octal_dtr = spi_nor_issi_octal_dtr_enable;
   154			params->set_4byte_addr_mode = is25wx256_set_4byte_addr_mode;
   155			params->phy_enable = spi_nor_issi_phy_enable;
   156	}
   157	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
