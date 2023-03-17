Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8EE377
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 01:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679017432; x=1710553432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xgb+a0rwTD3inuNxFx9eQL4OANTkslQlWbXNbnZWmAA=;
  b=ir/lk2PewWiOKAgptVnu+DjM8IgyI8gmMqPtyhuOPvGOMMahq5MtsJe0
   4FHr58jb3AqEXFfKTC94ISahgswoueUnmeWtNBsLZyeANZMnbmkGAcIQ3
   7lOOpxjWWXQq6ejzJMABqhPEXDlhtqjTdPaepI4pC8+NC/npxxGXw8okb
   QkE5nYukKPGYfErvcg5EQQGdY49MXv9fFRvzZzoy/FMNQ23YHYWjk+DLq
   +w14s0QRJz0MsXAnf1yld28Mm++T2SQb/pD5DNfKhdSSPQjPos/ey2N1d
   4iqYZMsbwHCretZRTAqAe9Ng2dPvlCfEY51ppelbNd5IlrsQXANJrlvHz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338173018"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="338173018"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 18:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925979098"
X-IronPort-AV: E=Sophos;i="5.98,267,1673942400"; 
   d="scan'208";a="925979098"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 18:43:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcz8I-0008xe-15;
	Fri, 17 Mar 2023 01:43:50 +0000
Date: Fri, 17 Mar 2023 09:43:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/cpu-test 3/3] drivers/thermal/cpuidle_cooling.c:201:15:
 error: implicit declaration of function 'get_cpu_device'; did you mean
 'get_device'?
Message-ID: <202303170930.g8akm3wP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/cpu-test
head:   ae7627e0dd2bed9915a4c4033ba36c5fc48c2c0e
commit: ae7627e0dd2bed9915a4c4033ba36c5fc48c2c0e [3/3] of: Drop cpu.h include from of_device.h
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20230317/202303170930.g8akm3wP-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=ae7627e0dd2bed9915a4c4033ba36c5fc48c2c0e
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/cpu-test
        git checkout ae7627e0dd2bed9915a4c4033ba36c5fc48c2c0e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170930.g8akm3wP-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/thermal/cpuidle_cooling.c: In function '__cpuidle_cooling_register':
>> drivers/thermal/cpuidle_cooling.c:201:15: error: implicit declaration of function 'get_cpu_device'; did you mean 'get_device'? [-Werror=implicit-function-declaration]
     201 |         dev = get_cpu_device(cpumask_first(drv->cpumask));
         |               ^~~~~~~~~~~~~~
         |               get_device
>> drivers/thermal/cpuidle_cooling.c:201:13: warning: assignment to 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     201 |         dev = get_cpu_device(cpumask_first(drv->cpumask));
         |             ^
   cc1: some warnings being treated as errors


vim +201 drivers/thermal/cpuidle_cooling.c

a4c428e523490b Daniel Lezcano 2019-12-19  156  
a4c428e523490b Daniel Lezcano 2019-12-19  157  /**
dfd0bda3703cda Daniel Lezcano 2020-04-29  158   * __cpuidle_cooling_register: register the cooling device
a4c428e523490b Daniel Lezcano 2019-12-19  159   * @drv: a cpuidle driver structure pointer
dfd0bda3703cda Daniel Lezcano 2020-04-29  160   * @np: a device node structure pointer used for the thermal binding
a4c428e523490b Daniel Lezcano 2019-12-19  161   *
dfd0bda3703cda Daniel Lezcano 2020-04-29  162   * This function is in charge of allocating the cpuidle cooling device
dfd0bda3703cda Daniel Lezcano 2020-04-29  163   * structure, the idle injection, initialize them and register the
dfd0bda3703cda Daniel Lezcano 2020-04-29  164   * cooling device to the thermal framework.
a4c428e523490b Daniel Lezcano 2019-12-19  165   *
dfd0bda3703cda Daniel Lezcano 2020-04-29  166   * Return: zero on success, a negative value returned by one of the
dfd0bda3703cda Daniel Lezcano 2020-04-29  167   * underlying subsystem in case of error
a4c428e523490b Daniel Lezcano 2019-12-19  168   */
dfd0bda3703cda Daniel Lezcano 2020-04-29  169  static int __cpuidle_cooling_register(struct device_node *np,
a4c428e523490b Daniel Lezcano 2019-12-19  170  				      struct cpuidle_driver *drv)
a4c428e523490b Daniel Lezcano 2019-12-19  171  {
a4c428e523490b Daniel Lezcano 2019-12-19  172  	struct idle_inject_device *ii_dev;
a4c428e523490b Daniel Lezcano 2019-12-19  173  	struct cpuidle_cooling_device *idle_cdev;
a4c428e523490b Daniel Lezcano 2019-12-19  174  	struct thermal_cooling_device *cdev;
6fd1b186d900ac Daniel Lezcano 2021-03-14  175  	struct device *dev;
dfd0bda3703cda Daniel Lezcano 2020-04-29  176  	unsigned int idle_duration_us = TICK_USEC;
dfd0bda3703cda Daniel Lezcano 2020-04-29  177  	unsigned int latency_us = UINT_MAX;
6fd1b186d900ac Daniel Lezcano 2021-03-14  178  	char *name;
6fd1b186d900ac Daniel Lezcano 2021-03-14  179  	int ret;
a4c428e523490b Daniel Lezcano 2019-12-19  180  
a4c428e523490b Daniel Lezcano 2019-12-19  181  	idle_cdev = kzalloc(sizeof(*idle_cdev), GFP_KERNEL);
a4c428e523490b Daniel Lezcano 2019-12-19  182  	if (!idle_cdev) {
a4c428e523490b Daniel Lezcano 2019-12-19  183  		ret = -ENOMEM;
a4c428e523490b Daniel Lezcano 2019-12-19  184  		goto out;
a4c428e523490b Daniel Lezcano 2019-12-19  185  	}
a4c428e523490b Daniel Lezcano 2019-12-19  186  
a4c428e523490b Daniel Lezcano 2019-12-19  187  	ii_dev = idle_inject_register(drv->cpumask);
a4c428e523490b Daniel Lezcano 2019-12-19  188  	if (!ii_dev) {
a4c428e523490b Daniel Lezcano 2019-12-19  189  		ret = -EINVAL;
6fd1b186d900ac Daniel Lezcano 2021-03-14  190  		goto out_kfree;
a4c428e523490b Daniel Lezcano 2019-12-19  191  	}
a4c428e523490b Daniel Lezcano 2019-12-19  192  
dfd0bda3703cda Daniel Lezcano 2020-04-29  193  	of_property_read_u32(np, "duration-us", &idle_duration_us);
dfd0bda3703cda Daniel Lezcano 2020-04-29  194  	of_property_read_u32(np, "exit-latency-us", &latency_us);
dfd0bda3703cda Daniel Lezcano 2020-04-29  195  
dfd0bda3703cda Daniel Lezcano 2020-04-29  196  	idle_inject_set_duration(ii_dev, TICK_USEC, idle_duration_us);
dfd0bda3703cda Daniel Lezcano 2020-04-29  197  	idle_inject_set_latency(ii_dev, latency_us);
a4c428e523490b Daniel Lezcano 2019-12-19  198  
a4c428e523490b Daniel Lezcano 2019-12-19  199  	idle_cdev->ii_dev = ii_dev;
a4c428e523490b Daniel Lezcano 2019-12-19  200  
6fd1b186d900ac Daniel Lezcano 2021-03-14 @201  	dev = get_cpu_device(cpumask_first(drv->cpumask));
a4c428e523490b Daniel Lezcano 2019-12-19  202  
6fd1b186d900ac Daniel Lezcano 2021-03-14  203  	name = kasprintf(GFP_KERNEL, "idle-%s", dev_name(dev));
6fd1b186d900ac Daniel Lezcano 2021-03-14  204  	if (!name) {
6fd1b186d900ac Daniel Lezcano 2021-03-14  205  		ret = -ENOMEM;
6fd1b186d900ac Daniel Lezcano 2021-03-14  206  		goto out_unregister;
6fd1b186d900ac Daniel Lezcano 2021-03-14  207  	}
6fd1b186d900ac Daniel Lezcano 2021-03-14  208  
6fd1b186d900ac Daniel Lezcano 2021-03-14  209  	cdev = thermal_of_cooling_device_register(np, name, idle_cdev,
a4c428e523490b Daniel Lezcano 2019-12-19  210  						  &cpuidle_cooling_ops);
a4c428e523490b Daniel Lezcano 2019-12-19  211  	if (IS_ERR(cdev)) {
a4c428e523490b Daniel Lezcano 2019-12-19  212  		ret = PTR_ERR(cdev);
6cc7b38c0ca318 Daniel Lezcano 2021-03-19  213  		goto out_kfree_name;
a4c428e523490b Daniel Lezcano 2019-12-19  214  	}
a4c428e523490b Daniel Lezcano 2019-12-19  215  
dfd0bda3703cda Daniel Lezcano 2020-04-29  216  	pr_debug("%s: Idle injection set with idle duration=%u, latency=%u\n",
6fd1b186d900ac Daniel Lezcano 2021-03-14  217  		 name, idle_duration_us, latency_us);
dfd0bda3703cda Daniel Lezcano 2020-04-29  218  
6cc7b38c0ca318 Daniel Lezcano 2021-03-19  219  	kfree(name);
6cc7b38c0ca318 Daniel Lezcano 2021-03-19  220  
a4c428e523490b Daniel Lezcano 2019-12-19  221  	return 0;
a4c428e523490b Daniel Lezcano 2019-12-19  222  
6cc7b38c0ca318 Daniel Lezcano 2021-03-19  223  out_kfree_name:
6cc7b38c0ca318 Daniel Lezcano 2021-03-19  224  	kfree(name);
a4c428e523490b Daniel Lezcano 2019-12-19  225  out_unregister:
a4c428e523490b Daniel Lezcano 2019-12-19  226  	idle_inject_unregister(ii_dev);
a4c428e523490b Daniel Lezcano 2019-12-19  227  out_kfree:
a4c428e523490b Daniel Lezcano 2019-12-19  228  	kfree(idle_cdev);
a4c428e523490b Daniel Lezcano 2019-12-19  229  out:
a4c428e523490b Daniel Lezcano 2019-12-19  230  	return ret;
a4c428e523490b Daniel Lezcano 2019-12-19  231  }
a4c428e523490b Daniel Lezcano 2019-12-19  232  

:::::: The code at line 201 was first introduced by commit
:::::: 6fd1b186d900acf4cef9d3c23ec2839022a46345 thermal/drivers/cpuidle_cooling: Use device name instead of auto-numbering

:::::: TO: Daniel Lezcano <daniel.lezcano@linaro.org>
:::::: CC: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
