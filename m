Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8192771F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 23:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679699799; x=1711235799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZXcqcV27ZuFED+ZoSG4HP524pIfsMwNujG4JYvOQIk=;
  b=cjyTmbNf43Gu572w+O9jKxvmjHYFa8amwGdis6TyUfUNQjIraB0k1h2M
   6yR0yCElesRDsp6qUaMmMpcb5J9ko9hwFzgobBIEhNokTi39iex+jtnKu
   wQM8Tvg2rKChB+70KqPiVfMZiD7BQEH1pghJeERA7A3Hslm0+r40FOENL
   XVAB4x+6K2CZhQLeFAcZz87LLcwA9SM9hm8h/9W7DSsa4pQulKASc/q3G
   RzHpq6rGASg9AHHZ5G+/2USBBUWUdi5eamy3w+bBo6jAFrixVtyH8+fiv
   cEmByKYnktBk9E6Y1TEeYw1/2nYtH96Wq0JYWBgd20OvtRezFTzluPmER
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="323790754"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="323790754"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 16:16:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="806848592"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; 
   d="scan'208";a="806848592"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Mar 2023 16:16:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfqeD-000FkJ-0Z;
	Fri, 24 Mar 2023 23:16:37 +0000
Date: Sat, 25 Mar 2023 07:15:58 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:sep_socwatch_linux_5_16 1/1]
 drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202303250704.yGDKoq7J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_16
head:   4cbfca15a262729ae8557758b49226fe4769f582
commit: 4cbfca15a262729ae8557758b49226fe4769f582 [1/1] Platform/x86 Updated SEP/SOCPERF drivers to latest version
config: i386-randconfig-s003 (https://download.01.org/0day-ci/archive/20230325/202303250704.yGDKoq7J-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/4cbfca15a262729ae8557758b49226fe4769f582
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_16
        git checkout 4cbfca15a262729ae8557758b49226fe4769f582
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/ drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250704.yGDKoq7J-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/x86/socperf/socperfdrv.c:208:13: sparse: sparse: function 'SOCPERF_Read_Data3' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1175:13: sparse: sparse: function 'lwpmudrv_Stop_Mem' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1392:22: sparse: sparse: function 'socperf_Service_IOCTL' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1516:13: sparse: sparse: function 'socperf_Device_Control' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:1602:12: sparse: sparse: function 'SOCPERF_Abnormal_Terminate' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:104:22: sparse: sparse: symbol 'socperf_drv_version' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:105:5: sparse: sparse: symbol 'read_unc_ctr_info' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:106:10: sparse: sparse: symbol 'dispatch_uncore' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:108:14: sparse: sparse: symbol 'socperf_global_ec' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:109:14: sparse: sparse: symbol 'socperf_abnormal_terminate' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:110:11: sparse: sparse: symbol 'socperf_control' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:114:8: sparse: sparse: symbol 'socperf_pcb_size' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __user *ptr @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse:     expected void const volatile [noderef] __user *ptr
   drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse:     got unsigned int [usertype] *
>> drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *__ptr_pu @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse:     expected void [noderef] __user *__ptr_pu
   drivers/platform/x86/socperf/socperfdrv.c:246:18: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/socperfdrv.c:328:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:328:37: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:328:37: sparse:     got void *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:407:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:407:62: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:407:62: sparse:     got void *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:559:63: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:559:63: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:559:63: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:641:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:641:39: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:641:39: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:742:64: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:742:64: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:742:64: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:1043:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned int [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:1043:43: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1043:43: sparse:     got unsigned int [usertype] *
   drivers/platform/x86/socperf/socperfdrv.c:1066:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1066:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1066:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1089:28: sparse: sparse: Using plain integer as NULL pointer
   drivers/platform/x86/socperf/socperfdrv.c:1100:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1100:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1100:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1135:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got unsigned long long [usertype] * @@
   drivers/platform/x86/socperf/socperfdrv.c:1135:45: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1135:45: sparse:     got unsigned long long [usertype] *
   drivers/platform/x86/socperf/socperfdrv.c:1154:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1154:29: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1154:29: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1175:13: sparse: sparse: symbol 'lwpmudrv_Stop_Mem' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1286:54: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *[usertype] buf_usr_to_drv @@
   drivers/platform/x86/socperf/socperfdrv.c:1286:54: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1286:54: sparse:     got char *[usertype] buf_usr_to_drv
   drivers/platform/x86/socperf/socperfdrv.c:1310:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[usertype] buf_drv_to_usr @@
   drivers/platform/x86/socperf/socperfdrv.c:1310:30: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1310:30: sparse:     got char *[usertype] buf_drv_to_usr
   drivers/platform/x86/socperf/socperfdrv.c:1348:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *buf @@
   drivers/platform/x86/socperf/socperfdrv.c:1348:26: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socperf/socperfdrv.c:1348:26: sparse:     got char *buf
   drivers/platform/x86/socperf/socperfdrv.c:1368:76: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char const * @@
   drivers/platform/x86/socperf/socperfdrv.c:1368:76: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1368:76: sparse:     got char const *
   drivers/platform/x86/socperf/socperfdrv.c:1392:22: sparse: sparse: symbol 'socperf_Service_IOCTL' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1537:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct IOCTL_ARGS_NODE_S [usertype] *[usertype] @@
   drivers/platform/x86/socperf/socperfdrv.c:1537:55: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socperf/socperfdrv.c:1537:55: sparse:     got struct IOCTL_ARGS_NODE_S [usertype] *[usertype]
   drivers/platform/x86/socperf/socperfdrv.c:1516:13: sparse: sparse: symbol 'socperf_Device_Control' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1602:12: sparse: sparse: symbol 'SOCPERF_Abnormal_Terminate' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:1637:17: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *read )( ... ) @@     got int ( * )( ... ) @@
   drivers/platform/x86/socperf/socperfdrv.c:1637:17: sparse:     expected int ( *read )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1637:17: sparse:     got int ( * )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1638:18: sparse: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces)) @@     expected int ( *write )( ... ) @@     got int ( * )( ... ) @@
   drivers/platform/x86/socperf/socperfdrv.c:1638:18: sparse:     expected int ( *write )( ... )
   drivers/platform/x86/socperf/socperfdrv.c:1638:18: sparse:     got int ( * )( ... )

vim +246 drivers/platform/x86/socperf/socperfdrv.c

f57492d07625dd Manisha Chinthapally 2019-05-01  217  
f57492d07625dd Manisha Chinthapally 2019-05-01  218  /*********************************************************************
f57492d07625dd Manisha Chinthapally 2019-05-01  219   *  Internal Driver functions
f57492d07625dd Manisha Chinthapally 2019-05-01  220   *     Should be called only from the lwpmudrv_DeviceControl routine
f57492d07625dd Manisha Chinthapally 2019-05-01  221   *********************************************************************/
f57492d07625dd Manisha Chinthapally 2019-05-01  222  
f57492d07625dd Manisha Chinthapally 2019-05-01  223  /* ------------------------------------------------------------------------- */
f57492d07625dd Manisha Chinthapally 2019-05-01  224  /*!
f57492d07625dd Manisha Chinthapally 2019-05-01  225   * @fn  static OS_STATUS lwpmudrv_Version(IOCTL_ARGS arg)
f57492d07625dd Manisha Chinthapally 2019-05-01  226   *
f57492d07625dd Manisha Chinthapally 2019-05-01  227   * @param arg - pointer to the IOCTL_ARGS structure
f57492d07625dd Manisha Chinthapally 2019-05-01  228   *
f57492d07625dd Manisha Chinthapally 2019-05-01  229   * @return OS_STATUS
f57492d07625dd Manisha Chinthapally 2019-05-01  230   *
f57492d07625dd Manisha Chinthapally 2019-05-01  231   * @brief  Local function that handles the LWPMU_IOCTL_VERSION call.
f57492d07625dd Manisha Chinthapally 2019-05-01  232   * @brief  Returns the version number of the kernel mode sampling.
f57492d07625dd Manisha Chinthapally 2019-05-01  233   *
f57492d07625dd Manisha Chinthapally 2019-05-01  234   * <I>Special Notes</I>
f57492d07625dd Manisha Chinthapally 2019-05-01  235   */
f57492d07625dd Manisha Chinthapally 2019-05-01  236  static OS_STATUS lwpmudrv_Version(IOCTL_ARGS arg)
f57492d07625dd Manisha Chinthapally 2019-05-01  237  {
f57492d07625dd Manisha Chinthapally 2019-05-01  238  	OS_STATUS status;
f57492d07625dd Manisha Chinthapally 2019-05-01  239  
f57492d07625dd Manisha Chinthapally 2019-05-01  240  	// Check if enough space is provided for collecting the data
f57492d07625dd Manisha Chinthapally 2019-05-01  241  	if ((arg->len_drv_to_usr != sizeof(U32)) ||
f57492d07625dd Manisha Chinthapally 2019-05-01  242  	    (arg->buf_drv_to_usr == NULL)) {
f57492d07625dd Manisha Chinthapally 2019-05-01  243  		return OS_FAULT;
f57492d07625dd Manisha Chinthapally 2019-05-01  244  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  245  
f57492d07625dd Manisha Chinthapally 2019-05-01 @246  	status = put_user(
f57492d07625dd Manisha Chinthapally 2019-05-01  247  		SOCPERF_VERSION_NODE_socperf_version(&socperf_drv_version),
4cbfca15a26272 Manisha Chinthapally 2022-02-02  248  		(U32 *)arg->buf_drv_to_usr);
f57492d07625dd Manisha Chinthapally 2019-05-01  249  
f57492d07625dd Manisha Chinthapally 2019-05-01  250  	return status;
f57492d07625dd Manisha Chinthapally 2019-05-01  251  }
f57492d07625dd Manisha Chinthapally 2019-05-01  252  

:::::: The code at line 246 was first introduced by commit
:::::: f57492d07625dddac7920eccdb5be08c55ee16fa platform/x86: SOCPERF3 support for sep & socwatch

:::::: TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
