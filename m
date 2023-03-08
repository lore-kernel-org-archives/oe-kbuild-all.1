Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E838BF3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 20:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678306199; x=1709842199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t2s6Wbm61qCwgXe0mUELDpZbHQir6VuDxh5WylOLmXw=;
  b=SMXLLYu3nL6PAAjLI+ar6B5Xnc6f2rNXbIayjXd+hSymSRwQ4LpXHtWm
   yuxFzndXmr8mAOmmbYx278Y/KHPuXuib0SeHGwcnaCUwoXwyI1jfZajkA
   LDyqyV7rroVF1jUNLOZrQueHzqszFSwcS94pWovWbNyRdrrQ/fkJXouL5
   /1YNKlYfk9c81oiIf4o6WSWzaHYc082jpOAZrwG3AVxS2TCwn8v9SL/oY
   xV2RWq4PRuyIitgVJkVEKSdZwqCRohMDBl3MiZwo6pa+mLLxDznqLgVB9
   8SrhHdesH6Dki+rYAy8f7Gzv3V2XhhmwUjFEpFk7wNjwwy1zJX3Mi2Dzw
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333733736"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="333733736"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 12:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="709565715"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="709565715"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2023 12:09:57 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa06m-0002O1-2u;
	Wed, 08 Mar 2023 20:09:56 +0000
Date: Thu, 9 Mar 2023 04:09:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 178/198]
 drivers/thermal/intel_powerclamp.c:782:38: error: implicit declaration of
 function 'topology_max_die_per_package'
Message-ID: <202303090428.or768K4U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   8766782326e9b6fe5a4dacf3083e7f9ed034179b
commit: 5422e48e41e42b53367cfcba883d8a679eb7aaab [178/198] thermal: intel: powerclamp: Fix cur_state for multi package system
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230309/202303090428.or768K4U-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=5422e48e41e42b53367cfcba883d8a679eb7aaab
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.19
        git checkout 5422e48e41e42b53367cfcba883d8a679eb7aaab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090428.or768K4U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/intel_powerclamp.c:782:38: error: implicit declaration of function 'topology_max_die_per_package' [-Werror,-Wimplicit-function-declaration]
           if (topology_max_packages() == 1 && topology_max_die_per_package() == 1)
                                               ^
   1 error generated.


vim +/topology_max_die_per_package +782 drivers/thermal/intel_powerclamp.c

   749	
   750	static int __init powerclamp_init(void)
   751	{
   752		int retval;
   753		int bitmap_size;
   754	
   755		bitmap_size = BITS_TO_LONGS(num_possible_cpus()) * sizeof(long);
   756		cpu_clamping_mask = kzalloc(bitmap_size, GFP_KERNEL);
   757		if (!cpu_clamping_mask)
   758			return -ENOMEM;
   759	
   760		/* probe cpu features and ids here */
   761		retval = powerclamp_probe();
   762		if (retval)
   763			goto exit_free;
   764	
   765		/* set default limit, maybe adjusted during runtime based on feedback */
   766		window_size = 2;
   767		retval = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
   768						   "thermal/intel_powerclamp:online",
   769						   powerclamp_cpu_online,
   770						   powerclamp_cpu_predown);
   771		if (retval < 0)
   772			goto exit_free;
   773	
   774		hp_state = retval;
   775	
   776		worker_data = alloc_percpu(struct powerclamp_worker_data);
   777		if (!worker_data) {
   778			retval = -ENOMEM;
   779			goto exit_unregister;
   780		}
   781	
 > 782		if (topology_max_packages() == 1 && topology_max_die_per_package() == 1)
   783			poll_pkg_cstate_enable = true;
   784	
   785		cooling_dev = thermal_cooling_device_register("intel_powerclamp", NULL,
   786							&powerclamp_cooling_ops);
   787		if (IS_ERR(cooling_dev)) {
   788			retval = -ENODEV;
   789			goto exit_free_thread;
   790		}
   791	
   792		if (!duration)
   793			duration = jiffies_to_msecs(DEFAULT_DURATION_JIFFIES);
   794	
   795		powerclamp_create_debug_files();
   796	
   797		return 0;
   798	
   799	exit_free_thread:
   800		free_percpu(worker_data);
   801	exit_unregister:
   802		cpuhp_remove_state_nocalls(hp_state);
   803	exit_free:
   804		kfree(cpu_clamping_mask);
   805		return retval;
   806	}
   807	module_init(powerclamp_init);
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
