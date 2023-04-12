Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8871D364
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 06:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681281555; x=1712817555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CaG1O91lC6gOilry2Qk/sBUe576rtuZxgdCecv0ObQ=;
  b=TCnMFERQdP/Vr1DsCT01/EpMPRQRgLB+vrZSlmNxsX0LDCRbxCAXKozw
   Agb6vAkoQ3RuI9LGZLTPbKdEit3vnHLcTv54vPqFLKyuRkAJKmImirgH0
   LvBsDPAJLXH5KC14P/DgqsA1/R3V/fAUZaPx86/k4hhFtv7cl78xZSlvP
   1K6NKRkInywQ35rTb9kLi5TJmwXYlIy+XWBPsZPQG+6aDVCC5cFgeydfB
   Rj21qiCIj6OzWd4dVcAX98aPK8E7F4qNWGGqWT7kOj1NEhefANrWIs5ES
   45eSN4cOVoRLEpmqKc8foD85Tt2MHgvf5RFJqBTkyHEq6EcPYMwZ+tCfy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="406645541"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="406645541"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 23:38:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018629310"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="1018629310"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 23:38:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmU89-000XOF-2N;
	Wed, 12 Apr 2023 06:38:57 +0000
Date: Wed, 12 Apr 2023 14:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:cpufreq/sparc 1/1]
 drivers/cpufreq/sparc-us2e-cpufreq.c:332:47: error: incompatible type for
 argument 1 of 'cpufreq_register_driver'
Message-ID: <202304121417.bjhUyczX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git cpufreq/sparc
head:   44cca366ee6353f0a720edc73cfeefecfb908cab
commit: 44cca366ee6353f0a720edc73cfeefecfb908cab [1/1] cpufreq: sparc: Don't allocate cpufreq_driver dynamically
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304121417.bjhUyczX-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git/commit/?id=44cca366ee6353f0a720edc73cfeefecfb908cab
        git remote add vireshk https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git
        git fetch --no-tags vireshk cpufreq/sparc
        git checkout 44cca366ee6353f0a720edc73cfeefecfb908cab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121417.bjhUyczX-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/sparc-us2e-cpufreq.c: In function 'us2e_freq_init':
>> drivers/cpufreq/sparc-us2e-cpufreq.c:332:47: error: incompatible type for argument 1 of 'cpufreq_register_driver'
     332 |                 ret = cpufreq_register_driver(cpufreq_us2e_driver);
         |                                               ^~~~~~~~~~~~~~~~~~~
         |                                               |
         |                                               struct cpufreq_driver
   In file included from drivers/cpufreq/sparc-us2e-cpufreq.c:14:
   include/linux/cpufreq.h:451:52: note: expected 'struct cpufreq_driver *' but argument is of type 'struct cpufreq_driver'
     451 | int cpufreq_register_driver(struct cpufreq_driver *driver_data);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/cpufreq/sparc-us2e-cpufreq.c: In function 'us2e_freq_exit':
>> drivers/cpufreq/sparc-us2e-cpufreq.c:344:35: error: incompatible type for argument 1 of 'cpufreq_unregister_driver'
     344 |         cpufreq_unregister_driver(cpufreq_us2e_driver);
         |                                   ^~~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct cpufreq_driver
   include/linux/cpufreq.h:452:55: note: expected 'struct cpufreq_driver *' but argument is of type 'struct cpufreq_driver'
     452 | void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
--
   drivers/cpufreq/sparc-us3-cpufreq.c: In function 'us3_freq_init':
>> drivers/cpufreq/sparc-us3-cpufreq.c:180:47: error: incompatible type for argument 1 of 'cpufreq_register_driver'
     180 |                 ret = cpufreq_register_driver(cpufreq_us3_driver);
         |                                               ^~~~~~~~~~~~~~~~~~
         |                                               |
         |                                               struct cpufreq_driver
   In file included from drivers/cpufreq/sparc-us3-cpufreq.c:14:
   include/linux/cpufreq.h:451:52: note: expected 'struct cpufreq_driver *' but argument is of type 'struct cpufreq_driver'
     451 | int cpufreq_register_driver(struct cpufreq_driver *driver_data);
         |                             ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   drivers/cpufreq/sparc-us3-cpufreq.c: In function 'us3_freq_exit':
>> drivers/cpufreq/sparc-us3-cpufreq.c:192:35: error: incompatible type for argument 1 of 'cpufreq_unregister_driver'
     192 |         cpufreq_unregister_driver(cpufreq_us3_driver);
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct cpufreq_driver
   include/linux/cpufreq.h:452:55: note: expected 'struct cpufreq_driver *' but argument is of type 'struct cpufreq_driver'
     452 | void cpufreq_unregister_driver(struct cpufreq_driver *driver_data);
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~


vim +/cpufreq_register_driver +332 drivers/cpufreq/sparc-us2e-cpufreq.c

   313	
   314	static int __init us2e_freq_init(void)
   315	{
   316		unsigned long manuf, impl, ver;
   317		int ret;
   318	
   319		if (tlb_type != spitfire)
   320			return -ENODEV;
   321	
   322		__asm__("rdpr %%ver, %0" : "=r" (ver));
   323		manuf = ((ver >> 48) & 0xffff);
   324		impl  = ((ver >> 32) & 0xffff);
   325	
   326		if (manuf == 0x17 && impl == 0x13) {
   327			us2e_freq_table = kzalloc(NR_CPUS * sizeof(*us2e_freq_table),
   328						  GFP_KERNEL);
   329			if (!us2e_freq_table)
   330				return -ENOMEM;
   331	
 > 332			ret = cpufreq_register_driver(cpufreq_us2e_driver);
   333			if (ret)
   334				kfree(us2e_freq_table);
   335	
   336			return ret;
   337		}
   338	
   339		return -ENODEV;
   340	}
   341	
   342	static void __exit us2e_freq_exit(void)
   343	{
 > 344		cpufreq_unregister_driver(cpufreq_us2e_driver);
   345		kfree(us2e_freq_table);
   346	}
   347	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
