Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E9722F07
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 11:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ek36fZi3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702465264; x=1734001264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fR6gOoiLEPye9D879pSigrir2VZ4ZJkPPTeJUtf8IvQ=;
  b=ek36fZi30uvsicHi/dQ7Ezl3UAptKT77QNiNbDQYCar8KVuqg8GuHtDU
   uUiG5bBIpCbgaeSvDfq4XDvKG+ggE0mXJ+LctxzSaK9GgfMPb5fwZKKYc
   SvcsA37OG4GSYFcgX81WXHudZH1NojkvfTK9n9F+rgJG45VnulgCRUZiV
   af0TJI8hvUegWv7y0OBlBu0jgKsj4+XJ6Hrg9laSiJ+fkW9wi/KCmL8li
   yIdJMGJyFi88PK2xbDln0nwzGpMhh+SyGFzxC419QChpsq52qKFf+8Gfp
   gZwVaA7NznO2m+EarC1IJ9GgfXrjANiib/R9oDSS9vkQw6DxFR27dPKA9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="2120219"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="2120219"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 03:01:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="773908452"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="773908452"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 03:01:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDMz5-000KR5-2C;
	Wed, 13 Dec 2023 11:00:59 +0000
Date: Wed, 13 Dec 2023 19:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 1/2] media: i2c: imx415: Convert to new CCI register
 access helpers
Message-ID: <202312131805.7f30q4qX-lkp@intel.com>
References: <20231212072637.67642-2-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212072637.67642-2-alexander.stein@ew.tq-group.com>

Hi Alexander,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master linus/master v6.7-rc5 next-20231213]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Stein/media-i2c-imx415-Convert-to-new-CCI-register-access-helpers/20231212-152857
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20231212072637.67642-2-alexander.stein%40ew.tq-group.com
patch subject: [PATCH v2 1/2] media: i2c: imx415: Convert to new CCI register access helpers
config: riscv-randconfig-r063-20231213 (https://download.01.org/0day-ci/archive/20231213/202312131805.7f30q4qX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231213/202312131805.7f30q4qX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312131805.7f30q4qX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx415.c:119:16: error: implicit declaration of function 'CCI_REG16_LE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   .regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
                                ^
   drivers/media/i2c/imx415.c:41:30: note: expanded from macro 'IMX415_BCWAIT_TIME'
   #define IMX415_BCWAIT_TIME        CCI_REG16_LE(0x3008)
                                     ^
   drivers/media/i2c/imx415.c:119:16: error: initializer element is not a compile-time constant
                   .regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
                                ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:41:30: note: expanded from macro 'IMX415_BCWAIT_TIME'
   #define IMX415_BCWAIT_TIME        CCI_REG16_LE(0x3008)
                                     ^~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/imx415.c:195:4: error: implicit declaration of function 'CCI_REG24_LE' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           { IMX415_VMAX, 0x08CA },
             ^
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^
   drivers/media/i2c/imx415.c:195:4: note: did you mean 'CCI_REG16_LE'?
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^
   drivers/media/i2c/imx415.c:119:16: note: 'CCI_REG16_LE' declared here
                   .regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
                                ^
   drivers/media/i2c/imx415.c:41:30: note: expanded from macro 'IMX415_BCWAIT_TIME'
   #define IMX415_BCWAIT_TIME        CCI_REG16_LE(0x3008)
                                     ^
   drivers/media/i2c/imx415.c:195:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:211:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx415.c:227:4: error: initializer element is not a compile-time constant
           { IMX415_VMAX, 0x08CA },
             ^~~~~~~~~~~
   drivers/media/i2c/imx415.c:53:24: note: expanded from macro 'IMX415_VMAX'
   #define IMX415_VMAX               CCI_REG24_LE(0x3024)
                                     ^~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/CCI_REG16_LE +119 drivers/media/i2c/imx415.c

14cd15e7a1e2a3 Gerald Loacker  2023-01-30  113  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  114  /* INCK Settings - includes all lane rate and INCK dependent registers */
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  115  static const struct imx415_clk_params imx415_clk_params[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  116  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  117  		.lane_rate = 594000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  118  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30 @119  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  120  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  121  		.regs[2] = { IMX415_SYS_MODE, 0x7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  122  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  123  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  124  		.regs[5] = { IMX415_INCKSEL3, 0x084 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  125  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  126  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  127  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  128  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  129  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  130  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  131  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  132  		.lane_rate = 720000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  133  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  134  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  135  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  136  		.regs[2] = { IMX415_SYS_MODE, 0x9 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  137  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  138  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  139  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  140  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  141  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  142  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  143  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  144  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  145  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  146  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  147  		.lane_rate = 891000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  148  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  149  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  150  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  151  		.regs[2] = { IMX415_SYS_MODE, 0x5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  152  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  153  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  154  		.regs[5] = { IMX415_INCKSEL3, 0x0C6 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  155  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  156  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  157  		.regs[8] = { IMX415_INCKSEL6, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  158  		.regs[9] = { IMX415_INCKSEL7, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  159  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  160  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  161  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  162  		.lane_rate = 1440000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  163  		.inck = 24000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  164  		.regs[0] = { IMX415_BCWAIT_TIME, 0x054 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  165  		.regs[1] = { IMX415_CPWAIT_TIME, 0x03B },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  166  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  167  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  168  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  169  		.regs[5] = { IMX415_INCKSEL3, 0x0B4 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  170  		.regs[6] = { IMX415_INCKSEL4, 0x0FC },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  171  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  172  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  173  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  174  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x0600 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  175  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  176  	{
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  177  		.lane_rate = 1485000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  178  		.inck = 27000000,
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  179  		.regs[0] = { IMX415_BCWAIT_TIME, 0x05D },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  180  		.regs[1] = { IMX415_CPWAIT_TIME, 0x042 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  181  		.regs[2] = { IMX415_SYS_MODE, 0x8 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  182  		.regs[3] = { IMX415_INCKSEL1, 0x00 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  183  		.regs[4] = { IMX415_INCKSEL2, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  184  		.regs[5] = { IMX415_INCKSEL3, 0x0A5 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  185  		.regs[6] = { IMX415_INCKSEL4, 0x0E7 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  186  		.regs[7] = { IMX415_INCKSEL5, 0x23 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  187  		.regs[8] = { IMX415_INCKSEL6, 0x1 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  188  		.regs[9] = { IMX415_INCKSEL7, 0x0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  189  		.regs[10] = { IMX415_TXCLKESC_FREQ, 0x06C0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  190  	},
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  191  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  192  
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  193  /* all-pixel 2-lane 720 Mbps 15.74 Hz mode */
35ddc643747aae Alexander Stein 2023-12-12  194  static const struct cci_reg_sequence imx415_mode_2_720[] = {
14cd15e7a1e2a3 Gerald Loacker  2023-01-30 @195  	{ IMX415_VMAX, 0x08CA },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  196  	{ IMX415_HMAX, 0x07F0 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  197  	{ IMX415_LANEMODE, IMX415_LANEMODE_2 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  198  	{ IMX415_TCLKPOST, 0x006F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  199  	{ IMX415_TCLKPREPARE, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  200  	{ IMX415_TCLKTRAIL, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  201  	{ IMX415_TCLKZERO, 0x00BF },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  202  	{ IMX415_THSPREPARE, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  203  	{ IMX415_THSZERO, 0x0057 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  204  	{ IMX415_THSTRAIL, 0x002F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  205  	{ IMX415_THSEXIT, 0x004F },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  206  	{ IMX415_TLPX, 0x0027 },
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  207  };
14cd15e7a1e2a3 Gerald Loacker  2023-01-30  208  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
