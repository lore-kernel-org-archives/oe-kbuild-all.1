Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25276A935
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 21:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681336475; x=1712872475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BVj2HU6KYdWEQvhgQRo2bWy4DWxRki3SfSQhcxOg9GA=;
  b=YlGTHpMdVgSCZFWhiVomjIdgxsdF+igZap35jNsHa4cAwncRLsC0J5P0
   /uWFwwrksvnrAZ+Fz3ZnYF2lSIW/Re8O+kI4a/YlutjTv8PLpOhWVDjXJ
   7h46k5xIG4Wki2aoUmyY/I0VfzqfwlumyQxfLjigwrzPD1bWQgW21SBLu
   +nSgeoSCAEt6IRawwYCWVQveuKiApbF7EcgHjCJ/ZTzC1yrCTjCDdRIHX
   qoVzhy9/x17iIrBqdi9b5tGoIcjN7+B1aqZoENTp+9+7OEFwA13IsoTpA
   y/zSDw7AvlHDFig+R1msFrebqXAfHmOxjxcnuAwLgLcQToj9/W2lXkdRo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="341522883"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="341522883"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 14:54:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="863477653"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="863477653"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2023 14:54:24 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmiQ3-000Y4X-2f;
	Wed, 12 Apr 2023 21:54:23 +0000
Date: Thu, 13 Apr 2023 05:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Harini Katakam <harini.katakam@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 209/1065]
 include/linux/bits.h:36:18: warning: right shift count is negative
Message-ID: <202304130535.YIBPsBLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   e5753363b5e03fc0a3055d5476c6cca93e9ea28b
commit: b8dc3b1039ae479b6fe43682bbe923d43ba4d578 [209/1065] ptp: Add Xilinx PTP timer driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130535.YIBPsBLM-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/b8dc3b1039ae479b6fe43682bbe923d43ba4d578
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v6.1_LTS
        git checkout b8dc3b1039ae479b6fe43682bbe923d43ba4d578
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/irqchip/ drivers/media/i2c/ drivers/media/mc/ drivers/net/ethernet/xilinx/ drivers/ptp/ drivers/spi/ drivers/staging/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130535.YIBPsBLM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/ptp/ptp_xilinx.c:8:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_tod_read':
>> include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:60:41: note: in expansion of macro 'GENMASK'
      60 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:114:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     114 |         ts->tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:6:
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_adjtime':
   include/vdso/bits.h:7:40: warning: left shift count >= width of type [-Wshift-count-overflow]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                        ^~
   drivers/ptp/ptp_xilinx.c:62:41: note: in expansion of macro 'BIT'
      62 | #define XPTPTIMER_TOD_OFFSET_NEG        BIT(47)
         |                                         ^~~
   drivers/ptp/ptp_xilinx.c:251:24: note: in expansion of macro 'XPTPTIMER_TOD_OFFSET_NEG'
     251 |                 sign = XPTPTIMER_TOD_OFFSET_NEG;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/ptp/ptp_xilinx.c: In function 'xlnx_ptp_timer_probe':
>> include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:60:41: note: in expansion of macro 'GENMASK'
      60 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:388:50: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     388 |         ts.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/bits.h:36:18: warning: right shift count is negative [-Wshift-count-negative]
      36 |          (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
         |                  ^~
   include/linux/bits.h:38:38: note: in expansion of macro '__GENMASK'
      38 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^~~~~~~~~
   drivers/ptp/ptp_xilinx.c:60:41: note: in expansion of macro 'GENMASK'
      60 | #define XPTPTIMER_MAX_SEC_MASK          GENMASK(XPTPTIMER_MAX_SEC_SIZE - 1, 0)
         |                                         ^~~~~~~
   drivers/ptp/ptp_xilinx.c:394:51: note: in expansion of macro 'XPTPTIMER_MAX_SEC_MASK'
     394 |         tsp.tv_sec = (((u64)sech << 32) | secl) & XPTPTIMER_MAX_SEC_MASK;
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~


vim +36 include/linux/bits.h

295bcca84916cb Rikard Falkeborn 2020-04-06  33  
295bcca84916cb Rikard Falkeborn 2020-04-06  34  #define __GENMASK(h, l) \
95b980d62d52c4 Masahiro Yamada  2019-07-16  35  	(((~UL(0)) - (UL(1) << (l)) + 1) & \
95b980d62d52c4 Masahiro Yamada  2019-07-16 @36  	 (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
295bcca84916cb Rikard Falkeborn 2020-04-06  37  #define GENMASK(h, l) \
295bcca84916cb Rikard Falkeborn 2020-04-06  38  	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
8bd9cb51daac89 Will Deacon      2018-06-19  39  

:::::: The code at line 36 was first introduced by commit
:::::: 95b980d62d52c4c1768ee719e8db3efe27ef52b2 linux/bits.h: make BIT(), GENMASK(), and friends available in assembly

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
