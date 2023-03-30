Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74461857
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Mar 2023 04:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680150990; x=1711686990;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZtwK7qWAYoRCqM76V5Zfj8ip6pugma6jy4HPO/So/Ok=;
  b=KJq9YG5gqMUoJpC5vdzgCFlZ0qbqt64HfRzK6Sa1u6qCED/dmy3b5wx6
   +LrJYjc69yEclbeL9kPk3XD7XRTJDHH4PrgNnmvwmhXGp88w3wwEBWZh5
   adrS9+LkdcBpeCzuEc3xCjYTI9kV9mlbV/DBT92KBxXFhn4Xcb6F1bHYt
   pJ2fMrEdMTYU2noaKDJZPZg+weq0LaA8MT3k+WpLhvghEc3FfoUuR/XaC
   Vs8xoNKlxk1CoFB+bObRg53rVXjDh+nzdKg9+2TlPBb6o1W/y7PV6N+sz
   pQuzmZisHns/3sNzLmnI+D+Bpy+RG95v+b54ayk3g+AijQgDcLQFjpA4d
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="368844411"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="368844411"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 21:36:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="714848919"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="714848919"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Mar 2023 21:36:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phk1U-000KLJ-1T;
	Thu, 30 Mar 2023 04:36:28 +0000
Date: Thu, 30 Mar 2023 12:36:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	nick johnstone <nicholas.johnstone@intel.com>
Subject: [mchinth:socwatch_linux_6_1 1/2]
 drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202303301216.C6bNri2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux socwatch_linux_6_1
head:   2665e52fe74141620270448539c874045b34b66c
commit: e53c6a5da146aaa7a4af084798caceb96eed2c28 [1/2] Merge branch 'master' into socwatch_linux_6_1
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230330/202303301216.C6bNri2v-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/e53c6a5da146aaa7a4af084798caceb96eed2c28
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_1
        git checkout e53c6a5da146aaa7a4af084798caceb96eed2c28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303301216.C6bNri2v-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/x86/socperf/socperfdrv.c:214:13: sparse: sparse: function 'SOCPERF_Read_Data3' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1182:13: sparse: sparse: function 'lwpmudrv_Stop_Mem' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1400:1: sparse: sparse: function 'socperf_Service_IOCTL' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1525:1: sparse: sparse: function 'socperf_Device_Control' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1614:12: sparse: sparse: function 'SOCPERF_Abnormal_Terminate' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:110:22: sparse: sparse: symbol 'socperf_drv_version' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:111:21: sparse: sparse: symbol 'read_unc_ctr_info' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:112:22: sparse: sparse: symbol 'dispatch_uncore' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:114:22: sparse: sparse: symbol 'socperf_global_ec' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:115:22: sparse: sparse: symbol 'socperf_abnormal_terminate' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:116:22: sparse: sparse: symbol 'socperf_control' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:120:27: sparse: sparse: symbol 'socperf_pcb_size' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] *__ptr @@
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     got unsigned int [usertype] *__ptr
>> drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *__ptr_pu @@     got unsigned int [usertype] *__ptr @@
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     expected void [noderef] __user *__ptr_pu
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     got unsigned int [usertype] *__ptr
>> drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got unsigned int [usertype] *__ptr @@
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:252:18: sparse:     got unsigned int [usertype] *__ptr
   drivers/platform/x86/socperf/socperfdrv.c:334:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:334:37: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:334:37: sparse:     got void *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:413:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:413:62: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:413:62: sparse:     got void *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:565:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:565:63: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:565:63: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:647:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:647:39: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:647:39: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:750:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:750:64: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:750:64: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:1050:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:1050:43: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1050:43: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/socperfdrv.c:1073:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1073:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1073:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1096:28: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/x86/socperf/socperfdrv.c:1107:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1107:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1107:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1142:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:1142:45: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1142:45: sparse:     got unsigned long long [usertype] *
   drivers/platform/x86/socperf/socperfdrv.c:1161:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1161:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1161:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1182:13: sparse: sparse: symbol 'lwpmudrv_Stop_Mem' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1293:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:1293:54: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1293:54: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:1317:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1317:30: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1317:30: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1355:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   drivers/platform/x86/socperf/socperfdrv.c:1355:26: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1355:26: sparse:     got char *buf
   drivers/platform/x86/socperf/socperfdrv.c:1375:76: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/platform/x86/socperf/socperfdrv.c:1375:76: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1375:76: sparse:     got char const *
   drivers/platform/x86/socperf/socperfdrv.c:1400:1: sparse: sparse: symbol 'socperf_Service_IOCTL' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1547:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct IOCTL_ARGS_NODE_S [usertype] *[usertype] @@
   drivers/platform/x86/socperf/socperfdrv.c:1547:55: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1547:55: sparse:     got struct IOCTL_ARGS_NODE_S [usertype] *[usertype]
   drivers/platform/x86/socperf/socperfdrv.c:1525:1: sparse: sparse: symbol 'socperf_Device_Control' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1614:12: sparse: sparse: symbol 'SOCPERF_Abnormal_Terminate' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1649:20: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   drivers/platform/x86/socperf/socperfdrv.c:1649:20: sparse:     expected int ( *read )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1649:20: sparse:     got int ( * )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1650:20: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/platform/x86/socperf/socperfdrv.c:1650:20: sparse:     expected int ( *write )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1650:20: sparse:     got int ( * )( ... )

vim +252 drivers/platform/x86/socperf/socperfdrv.c

f57492d07625dd Manisha Chinthapally 2019-05-01  223  
f57492d07625dd Manisha Chinthapally 2019-05-01  224  /*********************************************************************
f57492d07625dd Manisha Chinthapally 2019-05-01  225   *  Internal Driver functions
f57492d07625dd Manisha Chinthapally 2019-05-01  226   *     Should be called only from the lwpmudrv_DeviceControl routine
f57492d07625dd Manisha Chinthapally 2019-05-01  227   *********************************************************************/
f57492d07625dd Manisha Chinthapally 2019-05-01  228  
f57492d07625dd Manisha Chinthapally 2019-05-01  229  /* ------------------------------------------------------------------------- */
f57492d07625dd Manisha Chinthapally 2019-05-01  230  /*!
f57492d07625dd Manisha Chinthapally 2019-05-01  231   * @fn  static OS_STATUS lwpmudrv_Version(IOCTL_ARGS arg)
f57492d07625dd Manisha Chinthapally 2019-05-01  232   *
f57492d07625dd Manisha Chinthapally 2019-05-01  233   * @param arg - pointer to the IOCTL_ARGS structure
f57492d07625dd Manisha Chinthapally 2019-05-01  234   *
f57492d07625dd Manisha Chinthapally 2019-05-01  235   * @return OS_STATUS
f57492d07625dd Manisha Chinthapally 2019-05-01  236   *
f57492d07625dd Manisha Chinthapally 2019-05-01  237   * @brief  Local function that handles the LWPMU_IOCTL_VERSION call.
f57492d07625dd Manisha Chinthapally 2019-05-01  238   * @brief  Returns the version number of the kernel mode sampling.
f57492d07625dd Manisha Chinthapally 2019-05-01  239   *
f57492d07625dd Manisha Chinthapally 2019-05-01  240   * <I>Special Notes</I>
f57492d07625dd Manisha Chinthapally 2019-05-01  241   */
f57492d07625dd Manisha Chinthapally 2019-05-01  242  static OS_STATUS lwpmudrv_Version(IOCTL_ARGS arg)
f57492d07625dd Manisha Chinthapally 2019-05-01  243  {
f57492d07625dd Manisha Chinthapally 2019-05-01  244  	OS_STATUS status;
f57492d07625dd Manisha Chinthapally 2019-05-01  245  
f57492d07625dd Manisha Chinthapally 2019-05-01  246  	// Check if enough space is provided for collecting the data
f57492d07625dd Manisha Chinthapally 2019-05-01  247  	if ((arg->len_drv_to_usr != sizeof(U32)) ||
f57492d07625dd Manisha Chinthapally 2019-05-01  248  	    (arg->buf_drv_to_usr == NULL)) {
f57492d07625dd Manisha Chinthapally 2019-05-01  249  		return OS_FAULT;
f57492d07625dd Manisha Chinthapally 2019-05-01  250  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  251  
f57492d07625dd Manisha Chinthapally 2019-05-01 @252  	status = put_user(
f57492d07625dd Manisha Chinthapally 2019-05-01  253  		SOCPERF_VERSION_NODE_socperf_version(&socperf_drv_version),
4cbfca15a26272 Manisha Chinthapally 2022-02-02  254  		(U32 *)arg->buf_drv_to_usr);
f57492d07625dd Manisha Chinthapally 2019-05-01  255  
f57492d07625dd Manisha Chinthapally 2019-05-01  256  	return status;
f57492d07625dd Manisha Chinthapally 2019-05-01  257  }
f57492d07625dd Manisha Chinthapally 2019-05-01  258  

:::::: The code at line 252 was first introduced by commit
:::::: f57492d07625dddac7920eccdb5be08c55ee16fa platform/x86: SOCPERF3 support for sep & socwatch

:::::: TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
