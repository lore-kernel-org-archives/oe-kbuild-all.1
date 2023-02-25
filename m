Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06533CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Feb 2023 21:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677361068; x=1708897068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=itYJzrDorGs37JcGhz9L7vFZAOqeQo+nBJiwf4IvmEo=;
  b=a+QSVbYRCRPS0kp+OT7cq2Om0SI+0gZDsQyUtI10ICDUVzDvDsVl1jLb
   2+8yMM1EcNOuDSdpzZ/ArBUR066rAOejQclVhz42mwk7ymWKinrjebqnu
   KRaxXe7uPFsAH8pTz8ce52vLeVE8y61p3cyZS0affjOx5LKk0SrixDBtc
   cvd9umsfmXr/VrSJ9d+elq3iKz3ghO8NjqsNijQ40hr+AUzHaI2C2EBIe
   ZB0PVe+bhn9uVChmTlnxyYgTRil8JyZS8QVVEy6Uld6r2yps5Vad3Rj0X
   T+kFt7zqdMCpXq2WflE96HyLkiPrT8yhPUQscybCOC2OwE6Pf8PogVrUo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="321904106"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="321904106"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 13:37:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="737180038"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="737180038"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Feb 2023 13:37:43 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW2Eg-0003QB-2T;
	Sat, 25 Feb 2023 21:37:42 +0000
Date: Sun, 26 Feb 2023 05:37:41 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:bus_cleanup 20/35]
 drivers/cpufreq/amd-pstate.c:1302:75: error: 'struct bus_type' has no member
 named 'dev_root'
Message-ID: <202302260511.Z7Q7OlDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git bus_cleanup
head:   f3175b4c21c5aad39a313d86a5e551b1530f2555
commit: bcf80f65776967f9227718e2d42687f1a185dc26 [20/35] driver core: bus: move dev_root out of struct bus_type
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230226/202302260511.Z7Q7OlDG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=bcf80f65776967f9227718e2d42687f1a185dc26
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core bus_cleanup
        git checkout bcf80f65776967f9227718e2d42687f1a185dc26
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260511.Z7Q7OlDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cpufreq/amd-pstate.c: In function 'amd_pstate_init':
>> drivers/cpufreq/amd-pstate.c:1302:75: error: 'struct bus_type' has no member named 'dev_root'
    1302 |         amd_pstate_kobj = kobject_create_and_add("amd_pstate", &cpu_subsys.dev_root->kobj);
         |                                                                           ^


vim +1302 drivers/cpufreq/amd-pstate.c

ffa5096a7c3386 Perry Yuan 2023-01-31  1253  
ec437d71db77a1 Huang Rui  2021-12-24  1254  static int __init amd_pstate_init(void)
ec437d71db77a1 Huang Rui  2021-12-24  1255  {
ec437d71db77a1 Huang Rui  2021-12-24  1256  	int ret;
ec437d71db77a1 Huang Rui  2021-12-24  1257  
ec437d71db77a1 Huang Rui  2021-12-24  1258  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
ec437d71db77a1 Huang Rui  2021-12-24  1259  		return -ENODEV;
202e683df37cdf Perry Yuan 2022-11-17  1260  	/*
202e683df37cdf Perry Yuan 2022-11-17  1261  	 * by default the pstate driver is disabled to load
202e683df37cdf Perry Yuan 2022-11-17  1262  	 * enable the amd_pstate passive mode driver explicitly
36c5014e546096 Wyes Karny 2023-01-31  1263  	 * with amd_pstate=passive or other modes in kernel command line
202e683df37cdf Perry Yuan 2022-11-17  1264  	 */
36c5014e546096 Wyes Karny 2023-01-31  1265  	if (cppc_state == AMD_PSTATE_DISABLE) {
36c5014e546096 Wyes Karny 2023-01-31  1266  		pr_debug("driver load is disabled, boot with specific mode to enable this\n");
202e683df37cdf Perry Yuan 2022-11-17  1267  		return -ENODEV;
202e683df37cdf Perry Yuan 2022-11-17  1268  	}
ec437d71db77a1 Huang Rui  2021-12-24  1269  
ec437d71db77a1 Huang Rui  2021-12-24  1270  	if (!acpi_cpc_valid()) {
a2a9d1850060e5 Perry Yuan 2022-08-15  1271  		pr_warn_once("the _CPC object is not present in SBIOS or ACPI disabled\n");
ec437d71db77a1 Huang Rui  2021-12-24  1272  		return -ENODEV;
ec437d71db77a1 Huang Rui  2021-12-24  1273  	}
ec437d71db77a1 Huang Rui  2021-12-24  1274  
ec437d71db77a1 Huang Rui  2021-12-24  1275  	/* don't keep reloading if cpufreq_driver exists */
ec437d71db77a1 Huang Rui  2021-12-24  1276  	if (cpufreq_get_current_driver())
ec437d71db77a1 Huang Rui  2021-12-24  1277  		return -EEXIST;
ec437d71db77a1 Huang Rui  2021-12-24  1278  
ec437d71db77a1 Huang Rui  2021-12-24  1279  	/* capability check */
e059c184da47e9 Huang Rui  2021-12-24  1280  	if (boot_cpu_has(X86_FEATURE_CPPC)) {
e059c184da47e9 Huang Rui  2021-12-24  1281  		pr_debug("AMD CPPC MSR based functionality is supported\n");
ffa5096a7c3386 Perry Yuan 2023-01-31  1282  		if (cppc_state == AMD_PSTATE_PASSIVE)
ffa5096a7c3386 Perry Yuan 2023-01-31  1283  			current_pstate_driver->adjust_perf = amd_pstate_adjust_perf;
202e683df37cdf Perry Yuan 2022-11-17  1284  	} else {
202e683df37cdf Perry Yuan 2022-11-17  1285  		pr_debug("AMD CPPC shared memory based functionality is supported\n");
e059c184da47e9 Huang Rui  2021-12-24  1286  		static_call_update(amd_pstate_enable, cppc_enable);
e059c184da47e9 Huang Rui  2021-12-24  1287  		static_call_update(amd_pstate_init_perf, cppc_init_perf);
e059c184da47e9 Huang Rui  2021-12-24  1288  		static_call_update(amd_pstate_update_perf, cppc_update_perf);
ec437d71db77a1 Huang Rui  2021-12-24  1289  	}
ec437d71db77a1 Huang Rui  2021-12-24  1290  
ec437d71db77a1 Huang Rui  2021-12-24  1291  	/* enable amd pstate feature */
ec437d71db77a1 Huang Rui  2021-12-24  1292  	ret = amd_pstate_enable(true);
ec437d71db77a1 Huang Rui  2021-12-24  1293  	if (ret) {
ffa5096a7c3386 Perry Yuan 2023-01-31  1294  		pr_err("failed to enable with return %d\n", ret);
ec437d71db77a1 Huang Rui  2021-12-24  1295  		return ret;
ec437d71db77a1 Huang Rui  2021-12-24  1296  	}
ec437d71db77a1 Huang Rui  2021-12-24  1297  
ffa5096a7c3386 Perry Yuan 2023-01-31  1298  	ret = cpufreq_register_driver(current_pstate_driver);
ec437d71db77a1 Huang Rui  2021-12-24  1299  	if (ret)
ffa5096a7c3386 Perry Yuan 2023-01-31  1300  		pr_err("failed to register with return %d\n", ret);
ec437d71db77a1 Huang Rui  2021-12-24  1301  
abd61c08ef349a Perry Yuan 2023-01-31 @1302  	amd_pstate_kobj = kobject_create_and_add("amd_pstate", &cpu_subsys.dev_root->kobj);
abd61c08ef349a Perry Yuan 2023-01-31  1303  	if (!amd_pstate_kobj) {
abd61c08ef349a Perry Yuan 2023-01-31  1304  		ret = -EINVAL;
abd61c08ef349a Perry Yuan 2023-01-31  1305  		pr_err("global sysfs registration failed.\n");
abd61c08ef349a Perry Yuan 2023-01-31  1306  		goto kobject_free;
abd61c08ef349a Perry Yuan 2023-01-31  1307  	}
abd61c08ef349a Perry Yuan 2023-01-31  1308  
abd61c08ef349a Perry Yuan 2023-01-31  1309  	ret = sysfs_create_group(amd_pstate_kobj, &amd_pstate_global_attr_group);
abd61c08ef349a Perry Yuan 2023-01-31  1310  	if (ret) {
abd61c08ef349a Perry Yuan 2023-01-31  1311  		pr_err("sysfs attribute export failed with error %d.\n", ret);
abd61c08ef349a Perry Yuan 2023-01-31  1312  		goto global_attr_free;
abd61c08ef349a Perry Yuan 2023-01-31  1313  	}
abd61c08ef349a Perry Yuan 2023-01-31  1314  
abd61c08ef349a Perry Yuan 2023-01-31  1315  	return ret;
abd61c08ef349a Perry Yuan 2023-01-31  1316  
abd61c08ef349a Perry Yuan 2023-01-31  1317  global_attr_free:
abd61c08ef349a Perry Yuan 2023-01-31  1318  	kobject_put(amd_pstate_kobj);
abd61c08ef349a Perry Yuan 2023-01-31  1319  kobject_free:
abd61c08ef349a Perry Yuan 2023-01-31  1320  	cpufreq_unregister_driver(current_pstate_driver);
ec437d71db77a1 Huang Rui  2021-12-24  1321  	return ret;
ec437d71db77a1 Huang Rui  2021-12-24  1322  }
456ca88d8a5258 Perry Yuan 2022-11-17  1323  device_initcall(amd_pstate_init);
ec437d71db77a1 Huang Rui  2021-12-24  1324  

:::::: The code at line 1302 was first introduced by commit
:::::: abd61c08ef349af08df0bf587d33f5bde5996a89 cpufreq: amd-pstate: add driver working mode switch support

:::::: TO: Perry Yuan <Perry.Yuan@amd.com>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
