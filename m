Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513FD813
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681592876; x=1713128876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6N/NauGz7J3a8qd/4olLvjJ2ICzOzpLxebebXMPtqI=;
  b=kA1l7UsEgGOfq9/u/BycsLRRQ+TZBfBYswXoRBgAvaDPRlXHjp8A0xzM
   23hXBizkfrHX22OHSwpWwNqal+u7Mmie+iOi5sfZfK2xF9mBKNwLM6dlh
   7WLQWIH9o+qIaL3oPKPxvZfpb/YQDMhQOoIPOlMyscd00DAJni0ORVYjS
   n9/ttfgNndWPiCjrSarBka/R9lO4T9pRdRg2SI5EEnchNXFWtbxAurX3Y
   Z+taRcCYh3szqNGq1YaFV6QE0S5g8/7/PJ2oUgXeC1TEJdjrn9DRPPNwP
   p0JY8J9AM2GUwIfzId2TThJ8kUgJZS+grlHvkpzzKaCrH1UwOtzDRW3j7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="347409813"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="347409813"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2023 14:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="692831468"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; 
   d="scan'208";a="692831468"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 Apr 2023 14:07:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnn7h-000bLh-1V;
	Sat, 15 Apr 2023 21:07:53 +0000
Date: Sun, 16 Apr 2023 05:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 4877/9838] drivers/pwm/pwm-adp5585.c:213:25:
 error: 'adp5585_of_match' undeclared here (not in a function); did you mean
 'adp5585_pwm_of_match'?
Message-ID: <202304160515.bEA1zbSg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: b2a8faf2b13f5346016ac80c42173ac714536584 [4877/9838] Merge branch 'pwm/next' into next
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230416/202304160515.bEA1zbSg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Freescale/linux-fslc/commit/b2a8faf2b13f5346016ac80c42173ac714536584
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout b2a8faf2b13f5346016ac80c42173ac714536584
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/pwm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304160515.bEA1zbSg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pwm/pwm-adp5585.c:12:
>> drivers/pwm/pwm-adp5585.c:213:25: error: 'adp5585_of_match' undeclared here (not in a function); did you mean 'adp5585_pwm_of_match'?
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         |                         ^~~~~~~~~~~~~~~~
   include/linux/module.h:243:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:243:21: error: '__mod_of__adp5585_of_match_device_table' aliased to undefined symbol 'adp5585_of_match'
     243 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/pwm/pwm-adp5585.c:213:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
     213 | MODULE_DEVICE_TABLE(of, adp5585_of_match);
         | ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RPMSG_VIRTIO
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - HAVE_IMX_RPMSG [=y] && IMX_MBOX [=m]
   WARNING: unmet direct dependencies detected for UIO
   Depends on [n]: MMU [=n]
   Selected by [m]:
   - FEC_UIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]


vim +213 drivers/pwm/pwm-adp5585.c

92c8b45586c149 Clark Wang 2022-03-16  208  
92c8b45586c149 Clark Wang 2022-03-16  209  static const struct of_device_id adp5585_pwm_of_match[] = {
92c8b45586c149 Clark Wang 2022-03-16  210  	{.compatible = "adp5585-pwm", },
92c8b45586c149 Clark Wang 2022-03-16  211  	{ /* sentinel */ }
92c8b45586c149 Clark Wang 2022-03-16  212  };
92c8b45586c149 Clark Wang 2022-03-16 @213  MODULE_DEVICE_TABLE(of, adp5585_of_match);
92c8b45586c149 Clark Wang 2022-03-16  214  

:::::: The code at line 213 was first introduced by commit
:::::: 92c8b45586c149160a8a29356d97cdd721d9717a MLK-25922-1 pwm: adp5585: add adp5585 PWM support

:::::: TO: Clark Wang <xiaoning.wang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
