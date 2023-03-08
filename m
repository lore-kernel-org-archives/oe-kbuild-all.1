Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F679CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Mar 2023 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678290771; x=1709826771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyfQkMJR0JQekuqWtPHEMripwY8LIAK89LlqSvaTLyM=;
  b=YcubyEnf6fNhRAVKN8n/Z6XH8HI4kSVjwKGavM+xWP1IJYx0GHnSM8ol
   e8d6COZNWfGB4RmZvkkhUbk437zVRJr86qlnAmeK4bvEGSgEnimTrn8or
   5UM4x4npRhC/WADwJWVxXe+rFKdMgDUAvJrZ0CYMrTq92WIDOHo3dU6r5
   V0WQW+xbFv7NLUK2Ey6hSP/OF9qvt60skZRedmk0tF9iULu3yUkLZW02Y
   osp/Mfa9CyDJrmGiZrq9sUfC8RB156C2+hgtN2mTlgU/uPAVlRexrToA2
   9Sb9nljUUcuVrY+kOfw4cDrAB/1pFd6/lI8Ax/miGuQUaDAH7slIOZHLl
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="336207664"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="336207664"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 07:52:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="766029012"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="766029012"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Mar 2023 07:52:49 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZw5w-0002Eh-2n;
	Wed, 08 Mar 2023 15:52:48 +0000
Date: Wed, 8 Mar 2023 23:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.14 134/146]
 drivers/thermal/intel_powerclamp.c:782:38: error: implicit declaration of
 function 'topology_max_die_per_package'; did you mean
 'topology_max_packages'?
Message-ID: <202303082317.TylAQuf5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.14
head:   ec5cc00d36670922ecb7e0b14c1909e2b0d7b3b1
commit: bdfde1a14a124ee09558214f1b2b855072c749e4 [134/146] thermal: intel: powerclamp: Fix cur_state for multi package system
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230308/202303082317.TylAQuf5-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=bdfde1a14a124ee09558214f1b2b855072c749e4
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-4.14
        git checkout bdfde1a14a124ee09558214f1b2b855072c749e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash LDFLAGS=-z max-page-size=0x200000  drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303082317.TylAQuf5-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/thermal/intel_powerclamp.c: In function 'powerclamp_init':
>> drivers/thermal/intel_powerclamp.c:782:38: error: implicit declaration of function 'topology_max_die_per_package'; did you mean 'topology_max_packages'? [-Werror=implicit-function-declaration]
     if (topology_max_packages() == 1 && topology_max_die_per_package() == 1)
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         topology_max_packages
   cc1: some warnings being treated as errors


vim +782 drivers/thermal/intel_powerclamp.c

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
