Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2548347DF95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 19:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524969; cv=none; b=TTVg30laQo9Xt7cunoPVB0PYC8Vf7Uc+Uym0rGAu2Nq3YU3nfxNOzvXE17h/aXeRl6P7zzvBrQeyYK8uzV2SVi5zR5bvXVPATvdlHea8yODO6J93eev4W8GTqzDTf36NgOFwc0a53eJ/oX5L/dBS/a0YJn1MY5oYt7lg6VtlUGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524969; c=relaxed/simple;
	bh=1Kf8f595Ztuedaisw687rnwT5++i+69IrYjL0TYgrs4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GVSxa3zmXwPbhrosORhgnTPnq3CbF9HmvPH0mlAoBYGKQtLu/3wt3TeHd9s6Bv2g2zQ/nTi83X5yJ007Ua9lzeM4r83540yALY/phWKeWQLQQXgoxZxd7yBlEKVmq+6xWMAP5wjxW0wjSXTy61Xk7JTzHMJfvAuh/kUmg5qTFVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkKodWaN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkKodWaN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785524967; x=1817060967;
  h=date:from:to:cc:subject:message-id;
  bh=1Kf8f595Ztuedaisw687rnwT5++i+69IrYjL0TYgrs4=;
  b=UkKodWaN6GAi+sNnV+rvjZbKpGgVpwLsJYvzvGAq2xAXetpGjbgtWmJS
   EeqDczeZrs65RV2c7uiTUHVoHrVevtBN0PFwK6hwdqNpdRt4+5cHeKRjt
   sPT3E217YI2h1UW/2QkLqpOHm17i172tRuF6dTmmkecu97V1BKTssWTgr
   sTO3HLt2LOkdgnFhXAFTVCfdcgOLeGqOPlWjZiP3UAwZXnarEM7uNdKbu
   68EkUcp9k00zJWpHAr1RnOtmlJuYXb5k+NZb3H/DfVeJj7TRch7OBVXXK
   lCXLJ8X14Y6Nf6atNI1Fk3DwUJkD6f4bAg7MyqZH8G/of876n7uV9K6/r
   g==;
X-CSE-ConnectionGUID: gNEYN72TTkyxBk2xcwaH/w==
X-CSE-MsgGUID: nDgCTb9IQrWwknKlpffP2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="86015921"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="86015921"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 12:09:26 -0700
X-CSE-ConnectionGUID: VZ3Lxvi1Tlutx16xCNo8Yg==
X-CSE-MsgGUID: JibKRJKtR7WJKF39dOJxsw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2026 12:09:24 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpsbi-0000000023R-2V30;
	Fri, 31 Jul 2026 19:09:22 +0000
Date: Sat, 01 Aug 2026 03:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 125/700]
 drivers/pinctrl/mstar/pinctrl-msc313.h:206:27: warning: 'sr_drivestrengths'
 defined but not used
Message-ID: <202608010307.dYYjlEhH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: dd374521066b62abbaf8f5d5538675111fc82ab4 [125/700] pinctrl: split chipdata out
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260801/202608010307.dYYjlEhH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608010307.dYYjlEhH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010307.dYYjlEhH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/mstar/pinctrl-msc313.c:27:
>> drivers/pinctrl/mstar/pinctrl-msc313.h:206:27: warning: 'sr_drivestrengths' defined but not used [-Wunused-const-variable=]
     206 | static const unsigned int sr_drivestrengths[] = {4, 8};
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:198:27: warning: 'i2c_drivestrengths' defined but not used [-Wunused-const-variable=]
     198 | static const unsigned int i2c_drivestrengths[] = {4, 8};
         |                           ^~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:188:27: warning: 'spi0_drivestrengths' defined but not used [-Wunused-const-variable=]
     188 | static const unsigned int spi0_drivestrengths[] = {4, 8, 12, 16};
         |                           ^~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:174:27: warning: 'sd_drivestrengths' defined but not used [-Wunused-const-variable=]
     174 | static const unsigned int sd_drivestrengths[] = {4, 8};
         |                           ^~~~~~~~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:170:18: warning: 'sdio_values' defined but not used [-Wunused-const-variable=]
     170 | static const u16 sdio_values[] = {
         |                  ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:167:27: warning: 'sdio_groups' defined but not used [-Wunused-const-variable=]
     167 | static const char * const sdio_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:162:27: warning: 'usb1_groups' defined but not used [-Wunused-const-variable=]
     162 | static const char * const usb1_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:159:27: warning: 'usb_groups' defined but not used [-Wunused-const-variable=]
     159 | static const char * const usb_groups[] = {
         |                           ^~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:154:18: warning: 'eth_values' defined but not used [-Wunused-const-variable=]
     154 | static const u16 eth_values[] = {
         |                  ^~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:151:27: warning: 'eth_groups' defined but not used [-Wunused-const-variable=]
     151 | static const char * const eth_groups[] = {
         |                           ^~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:145:18: warning: 'spi1_values' defined but not used [-Wunused-const-variable=]
     145 | static const u16 spi1_values[] = {
         |                  ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:142:27: warning: 'spi1_groups' defined but not used [-Wunused-const-variable=]
     142 | static const char * const spi1_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:138:18: warning: 'spi0_values' defined but not used [-Wunused-const-variable=]
     138 | static const u16 spi0_values[] = {
         |                  ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:134:27: warning: 'spi0_groups' defined but not used [-Wunused-const-variable=]
     134 | static const char * const spi0_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:130:27: warning: 'jtag_groups' defined but not used [-Wunused-const-variable=]
     130 | static const char * const jtag_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:126:18: warning: 'pwm7_values' defined but not used [-Wunused-const-variable=]
     126 | static const u16 pwm7_values[] = {
         |                  ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:123:27: warning: 'pwm7_groups' defined but not used [-Wunused-const-variable=]
     123 | static const char * const pwm7_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:119:18: warning: 'pwm6_values' defined but not used [-Wunused-const-variable=]
     119 | static const u16 pwm6_values[] = {
         |                  ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:116:27: warning: 'pwm6_groups' defined but not used [-Wunused-const-variable=]
     116 | static const char * const pwm6_groups[] = {
         |                           ^~~~~~~~~~~
>> drivers/pinctrl/mstar/pinctrl-msc313.h:112:18: warning: 'pwm5_values' defined but not used [-Wunused-const-variable=]
     112 | static const u16 pwm5_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:109:27: warning: 'pwm5_groups' defined but not used [-Wunused-const-variable=]
     109 | static const char * const pwm5_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:105:18: warning: 'pwm4_values' defined but not used [-Wunused-const-variable=]
     105 | static const u16 pwm4_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:102:27: warning: 'pwm4_groups' defined but not used [-Wunused-const-variable=]
     102 | static const char * const pwm4_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:98:18: warning: 'pwm3_values' defined but not used [-Wunused-const-variable=]
      98 | static const u16 pwm3_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:95:27: warning: 'pwm3_groups' defined but not used [-Wunused-const-variable=]
      95 | static const char * const pwm3_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:91:18: warning: 'pwm2_values' defined but not used [-Wunused-const-variable=]
      91 | static const u16 pwm2_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:88:27: warning: 'pwm2_groups' defined but not used [-Wunused-const-variable=]
      88 | static const char * const pwm2_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:84:18: warning: 'pwm1_values' defined but not used [-Wunused-const-variable=]
      84 | static const u16 pwm1_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:81:27: warning: 'pwm1_groups' defined but not used [-Wunused-const-variable=]
      81 | static const char * const pwm1_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:77:18: warning: 'pwm0_values' defined but not used [-Wunused-const-variable=]
      77 | static const u16 pwm0_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:74:27: warning: 'pwm0_groups' defined but not used [-Wunused-const-variable=]
      74 | static const char * const pwm0_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:69:18: warning: 'uart1_values' defined but not used [-Wunused-const-variable=]
      69 | static const u16 uart1_values[] = {
         |                  ^~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:65:27: warning: 'uart1_groups' defined but not used [-Wunused-const-variable=]
      65 | static const char * const uart1_groups[] = {
         |                           ^~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:61:27: warning: 'uart0_groups' defined but not used [-Wunused-const-variable=]
      61 | static const char * const uart0_groups[] = {
         |                           ^~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:56:18: warning: 'fuart_values' defined but not used [-Wunused-const-variable=]
      56 | static const u16 fuart_values[] = {
         |                  ^~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:52:27: warning: 'fuart_groups' defined but not used [-Wunused-const-variable=]
      52 | static const char * const fuart_groups[] = {
         |                           ^~~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:48:18: warning: 'i2c1_values' defined but not used [-Wunused-const-variable=]
      48 | static const u16 i2c1_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:45:27: warning: 'i2c1_groups' defined but not used [-Wunused-const-variable=]
      45 | static const char * const i2c1_groups[] = {
         |                           ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:41:18: warning: 'i2c0_values' defined but not used [-Wunused-const-variable=]
      41 | static const u16 i2c0_values[] = {
         |                  ^~~~~~~~~~~
   drivers/pinctrl/mstar/pinctrl-msc313.h:38:27: warning: 'i2c0_groups' defined but not used [-Wunused-const-variable=]
      38 | static const char * const i2c0_groups[] = {
         |                           ^~~~~~~~~~~


vim +/sr_drivestrengths +206 drivers/pinctrl/mstar/pinctrl-msc313.h

     8	
     9	#define COMMON_FUNCTIONS \
    10		COMMON_FIXED_FUNCTION(USB, usb), \
    11		COMMON_FUNCTION(FUART, fuart), \
    12		COMMON_FUNCTION_NULLVALUES(UART0, uart0), \
    13		COMMON_FUNCTION(UART1, uart1), \
    14		COMMON_FUNCTION(PWM0, pwm0), \
    15		COMMON_FUNCTION(PWM1, pwm1), \
    16		COMMON_FUNCTION(PWM2, pwm2), \
    17		COMMON_FUNCTION(PWM3, pwm3), \
    18		COMMON_FUNCTION(PWM4, pwm4), \
    19		COMMON_FUNCTION(PWM5, pwm5), \
    20		COMMON_FUNCTION(PWM6, pwm6), \
    21		COMMON_FUNCTION(PWM7, pwm7), \
    22		COMMON_FUNCTION(SDIO, sdio), \
    23		COMMON_FUNCTION(I2C0, i2c0), \
    24		COMMON_FUNCTION(I2C1, i2c1), \
    25		COMMON_FUNCTION(SPI0, spi0), \
    26		COMMON_FUNCTION(SPI1, spi1), \
    27		COMMON_FUNCTION_NULLVALUES(JTAG, jtag), \
    28		COMMON_FUNCTION(ETH, eth)
    29	
    30	/*
    31	 * Common groups and register values that are used
    32	 * for all chips so far.
    33	 *
    34	 * This maps functions to the groups that can handle
    35	 * a function and the register bits that need to be
    36	 * set to enable that function.
    37	 */
  > 38	static const char * const i2c0_groups[] = {
    39		GROUPNAME_I2C0_MODE1,
    40	};
  > 41	static const u16 i2c0_values[] = {
    42		BIT(0),
    43	};
    44	
  > 45	static const char * const i2c1_groups[] = {
    46		GROUPNAME_I2C1_MODE1,
    47	};
  > 48	static const u16 i2c1_values[] = {
    49		BIT(4)
    50	};
    51	
  > 52	static const char * const fuart_groups[] = {
    53		GROUPNAME_FUART_MODE1,
    54		GROUPNAME_FUART_MODE1_NOCTS,
    55	};
  > 56	static const u16 fuart_values[] = {
    57		BIT(0),
    58		BIT(0),
    59	};
    60	
  > 61	static const char * const uart0_groups[] = {
    62		GROUPNAME_FUART_RX_TX,
    63	};
    64	
  > 65	static const char * const uart1_groups[] = {
    66		GROUPNAME_UART1_MODE2,
    67		GROUPNAME_UART1_MODE2_RXONLY,
    68	};
  > 69	static const u16 uart1_values[] = {
    70		BIT(9),
    71		BIT(9),
    72	};
    73	
  > 74	static const char * const pwm0_groups[] = {
    75		GROUPNAME_PWM0_MODE3,
    76	};
  > 77	static const u16 pwm0_values[] = {
    78		BIT(1) | BIT(0),
    79	};
    80	
  > 81	static const char * const pwm1_groups[] = {
    82		GROUPNAME_PWM1_MODE3,
    83	};
  > 84	static const u16 pwm1_values[] = {
    85		BIT(3) | BIT(2),
    86	};
    87	
  > 88	static const char * const pwm2_groups[] = {
    89		GROUPNAME_PWM2_MODE2,
    90	};
  > 91	static const u16 pwm2_values[] = {
    92		BIT(5),
    93	};
    94	
  > 95	static const char * const pwm3_groups[] = {
    96		GROUPNAME_PWM3_MODE2,
    97	};
  > 98	static const u16 pwm3_values[] = {
    99		BIT(7),
   100	};
   101	
 > 102	static const char * const pwm4_groups[] = {
   103		GROUPNAME_PWM4_MODE2,
   104	};
 > 105	static const u16 pwm4_values[] = {
   106		BIT(9),
   107	};
   108	
 > 109	static const char * const pwm5_groups[] = {
   110		GROUPNAME_PWM5_MODE2,
   111	};
 > 112	static const u16 pwm5_values[] = {
   113		BIT(11),
   114	};
   115	
 > 116	static const char * const pwm6_groups[] = {
   117		GROUPNAME_PWM6_MODE2,
   118	};
 > 119	static const u16 pwm6_values[] = {
   120		BIT(13),
   121	};
   122	
 > 123	static const char * const pwm7_groups[] = {
   124		GROUPNAME_PWM7_MODE2,
   125	};
 > 126	static const u16 pwm7_values[] = {
   127		BIT(15),
   128	};
   129	
 > 130	static const char * const jtag_groups[] = {
   131		GROUPNAME_JTAG_MODE1,
   132	};
   133	
 > 134	static const char * const spi0_groups[] = {
   135		GROUPNAME_SPI0_MODE1,
   136		GROUPNAME_SPI0_MODE1,
   137	};
 > 138	static const u16 spi0_values[] = {
   139		BIT(0),
   140		BIT(1) | BIT(0),
   141	};
 > 142	static const char * const spi1_groups[] = {
   143		GROUPNAME_SPI1_MODE3,
   144	};
 > 145	static const u16 spi1_values[] = {
   146		BIT(5) | BIT(4),
   147	};
   148	
   149	
   150	/* eth */
 > 151	static const char * const eth_groups[] = {
   152		GROUPNAME_ETH_MODE1,
   153	};
 > 154	static const u16 eth_values[] = {
   155		BIT(2),
   156	};
   157	
   158	/* usb */
 > 159	static const char * const usb_groups[] = {
   160		GROUPNAME_USB,
   161	};
 > 162	static const char * const usb1_groups[] = {
   163		GROUPNAME_USB1,
   164	};
   165	
   166	/* sdio */
 > 167	static const char * const sdio_groups[] = {
   168		GROUPNAME_SDIO_MODE1,
   169	};
 > 170	static const u16 sdio_values[] = {
   171		BIT(8),
   172	};
   173	
 > 174	static const unsigned int sd_drivestrengths[] = {4, 8};
   175	
   176	#define SD_PIN(_PIN, _PULLUPBIT, _DRIVEBIT) MSTAR_PINCTRL_PIN(_PIN, REG_SDIO_PULLDRIVE, \
   177			_PULLUPBIT, ALWAYS_PULLUP, -1, REG_SDIO_PULLDRIVE, _DRIVEBIT, 1, sd_drivestrengths)
   178	
   179	/* clk has a fixed pull down */
   180	#define SD_PINS(_chipname) SD_PIN(PIN_##_chipname##_SD_CMD, 8, 0), \
   181				   SD_PIN(PIN_##_chipname##_SD_D0, 9, 1), \
   182				   SD_PIN(PIN_##_chipname##_SD_D1, 10, 2), \
   183				   SD_PIN(PIN_##_chipname##_SD_D2, 11, 3), \
   184				   SD_PIN(PIN_##_chipname##_SD_D3, 12, 4), \
   185				   MSTAR_PINCTRL_PIN(PIN_##_chipname##_SD_CLK, -1, -1, \
   186					ALWAYS_PULLDOWN, -1, REG_SDIO_PULLDRIVE, 5, 1, sd_drivestrengths)
   187	
 > 188	static const unsigned int spi0_drivestrengths[] = {4, 8, 12, 16};
   189	
   190	#define SPI0_PIN(_pin, _offset) MSTAR_PINCTRL_PIN(_pin, -1, -1, -1, -1,\
   191			REG_SPI_DRIVE, _offset, 2, spi0_drivestrengths)
   192	
   193	#define SPI0_PINS(_chipname) SPI0_PIN(PIN_##_chipname##_SPI0_CZ, 0), \
   194				     SPI0_PIN(PIN_##_chipname##_SPI0_CK, 2), \
   195				     SPI0_PIN(PIN_##_chipname##_SPI0_DI, 4), \
   196				     SPI0_PIN(PIN_##_chipname##_SPI0_DO, 6)
   197	
 > 198	static const unsigned int i2c_drivestrengths[] = {4, 8};
   199	
   200	#define I2C1_PIN(_pin, _offset) MSTAR_PINCTRL_PIN(_pin, REG_I2C1_PULL_EN, _offset, \
   201			REG_I2C1_PULL_DIR, _offset, REG_I2C1_DRIVE, _offset, 1, i2c_drivestrengths)
   202	
   203	#define I2C1_PINS(_chipname) I2C1_PIN(PIN_##_chipname##_I2C1_SCL, 0), \
   204				     I2C1_PIN(PIN_##_chipname##_I2C1_SDA, 1)
   205	
 > 206	static const unsigned int sr_drivestrengths[] = {4, 8};
   207	#define SR_PIN_0(_pin, _offset) MSTAR_PINCTRL_PIN(_pin, REG_SR_PULL_EN0, _offset, \
   208			REG_SR_PULL_DIR0, _offset, REG_SR_DRIVE0, _offset, 1, sr_drivestrengths)
   209	#define SR_PIN_1(_pin, _offset) MSTAR_PINCTRL_PIN(_pin, REG_SR_PULL_EN1, _offset, \
   210			REG_SR_PULL_DIR1, _offset, REG_SR_DRIVE1, _offset, 1, sr_drivestrengths)
   211	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
