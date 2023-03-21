Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73479440
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679401416; x=1710937416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rIZtjHaw5hRigleGcBnLjv0NGQu3n0Rfjoi9eQIWZr4=;
  b=SCozeZ1Qjbzzvo7KDZZ2y2rN3aw4W8uMhdHgedoFPJDA0mvSkdPhco/r
   MT6jC5Pha5HLE1pBrB0eZ5+8/3KUtcuUtkZC1j/Zq++yXCzkn+qTOMHhg
   9q5/x4V7keKTnsKDRYgmwvibsgN9P0nFzlYPF1Gq+EyyCKfKf+fVZETDm
   JfNdTqWo+q5+k3HJOCFw+/YZKKrpHeEeWcLbohE9BcqrM8ZMIWe0/W9Ie
   fTaq19pHjloGCqZdaI4aqjoadBxWuxeYvK89zdTPbC0lGEXxwXUt/wt6U
   DNp4hM9NlBp6U88C5h0N4sscR/aUkGjl99gykac005phYHoOgNGuFgrvx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="318578498"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="318578498"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 05:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674818953"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="674818953"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Mar 2023 05:23:27 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peb1S-000BtW-2y;
	Tue, 21 Mar 2023 12:23:26 +0000
Date: Tue, 21 Mar 2023 20:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socperf/socperfdrv.c:1307:6: warning: no
 previous prototype for 'socperf_Device_Control_Compat'
Message-ID: <202303212026.A2pEDRu5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

FYI, the error/warning still remains.

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: e65547c5a9bb37e907edecece4da7cb12dadea96 platform/x86: Use $(srctree) instead of $(src) to adapt to kbuild regression
date:   2 years, 6 months ago
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230321/202303212026.A2pEDRu5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/mchinth/linux/commit/e65547c5a9bb37e907edecece4da7cb12dadea96
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout e65547c5a9bb37e907edecece4da7cb12dadea96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303212026.A2pEDRu5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/socperf/socperfdrv.c:203:13: warning: no previous prototype for 'SOCPERF_Read_Data3' [-Wmissing-prototypes]
     203 | extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
         |             ^~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:885:1: warning: no previous prototype for 'SOCPERF_Switch_Group3' [-Wmissing-prototypes]
     885 | SOCPERF_Switch_Group3(VOID)
         | ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1070:6: warning: no previous prototype for 'lwpmudrv_Stop_Mem' [-Wmissing-prototypes]
    1070 | VOID lwpmudrv_Stop_Mem(VOID)
         |      ^~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1155:15: warning: no previous prototype for 'socperf_Service_IOCTL' [-Wmissing-prototypes]
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1274:6: warning: no previous prototype for 'socperf_Device_Control' [-Wmissing-prototypes]
    1274 | long socperf_Device_Control(IOCTL_USE_INODE struct file *filp,
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/socperf/socperfdrv.c:80:
   drivers/platform/x86/socperf/socperfdrv.c: In function 'socperf_Device_Control':
   drivers/platform/x86/socperf/inc/control.h:85:25: error: expected expression before 'struct'
      85 | #define IOCTL_USE_INODE struct inode *inode,
         |                         ^~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1299:40: note: in expansion of macro 'IOCTL_USE_INODE'
    1299 |         status = socperf_Service_IOCTL(IOCTL_USE_INODE filp, _IOC_NR(cmd),
         |                                        ^~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1299:18: error: too few arguments to function 'socperf_Service_IOCTL'
    1299 |         status = socperf_Service_IOCTL(IOCTL_USE_INODE filp, _IOC_NR(cmd),
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1155:15: note: declared here
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c: At top level:
>> drivers/platform/x86/socperf/socperfdrv.c:1307:6: warning: no previous prototype for 'socperf_Device_Control_Compat' [-Wmissing-prototypes]
    1307 | long socperf_Device_Control_Compat(struct file *filp, unsigned int cmd,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c: In function 'socperf_Device_Control_Compat':
   drivers/platform/x86/socperf/socperfdrv.c:1336:40: error: passing argument 1 of 'socperf_Service_IOCTL' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1336 |         status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
         |                                        ^~~~
         |                                        |
         |                                        struct file *
   In file included from drivers/platform/x86/socperf/socperfdrv.c:80:
   drivers/platform/x86/socperf/inc/control.h:85:39: note: expected 'struct inode *' but argument is of type 'struct file *'
      85 | #define IOCTL_USE_INODE struct inode *inode,
         |                         ~~~~~~~~~~~~~~^~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1155:37: note: in expansion of macro 'IOCTL_USE_INODE'
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |                                     ^~~~~~~~~~~~~~~
   In file included from include/asm-generic/ioctl.h:5,
                    from ./arch/x86/include/generated/uapi/asm/ioctl.h:1,
                    from include/uapi/linux/ioctl.h:5,
                    from include/uapi/linux/apm_bios.h:133,
                    from include/linux/apm_bios.h:9,
                    from arch/x86/include/uapi/asm/bootparam.h:44,
                    from arch/x86/include/asm/mem_encrypt.h:17,
                    from include/linux/mem_encrypt.h:17,
                    from arch/x86/include/asm/processor-flags.h:6,
                    from arch/x86/include/asm/processor.h:5,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:65,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:73,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/platform/x86/socperf/socperfdrv.c:55:
   include/uapi/asm-generic/ioctl.h:96:57: warning: passing argument 2 of 'socperf_Service_IOCTL' makes pointer from integer without a cast [-Wint-conversion]
      96 | #define _IOC_NR(nr)             (((nr) >> _IOC_NRSHIFT) & _IOC_NRMASK)
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~
         |                                                         |
         |                                                         unsigned int
   drivers/platform/x86/socperf/socperfdrv.c:1336:46: note: in expansion of macro '_IOC_NR'
    1336 |         status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
         |                                              ^~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1155:66: note: expected 'struct file *' but argument is of type 'unsigned int'
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |                                                     ~~~~~~~~~~~~~^~~~
   drivers/platform/x86/socperf/socperfdrv.c:1336:60: error: incompatible type for argument 3 of 'socperf_Service_IOCTL'
    1336 |         status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
         |                                                            ^~~~~~~~~~
         |                                                            |
         |                                                            IOCTL_ARGS_NODE {aka struct IOCTL_ARGS_NODE_S}
   drivers/platform/x86/socperf/socperfdrv.c:1156:57: note: expected 'unsigned int' but argument is of type 'IOCTL_ARGS_NODE' {aka 'struct IOCTL_ARGS_NODE_S'}
    1156 |                                            unsigned int cmd,
         |                                            ~~~~~~~~~~~~~^~~
   drivers/platform/x86/socperf/socperfdrv.c:1336:18: error: too few arguments to function 'socperf_Service_IOCTL'
    1336 |         status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
         |                  ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1155:15: note: declared here
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |               ^~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c: At top level:
   drivers/platform/x86/socperf/socperfdrv.c:1358:5: warning: no previous prototype for 'SOCPERF_Abnormal_Terminate' [-Wmissing-prototypes]
    1358 | int SOCPERF_Abnormal_Terminate(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/platform/x86/socperf/socperfdrv.c:80:
   drivers/platform/x86/socperf/inc/control.h:83:19: error: 'struct file_operations' has no member named 'ioctl'
      83 | #define IOCTL_OP .ioctl
         |                   ^~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1389:9: note: in expansion of macro 'IOCTL_OP'
    1389 |         IOCTL_OP = socperf_Device_Control,
         |         ^~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1389:20: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    1389 |         IOCTL_OP = socperf_Device_Control,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socperf/socperfdrv.c:1389:20: note: (near initialization for 'socperf_Fops')
   drivers/platform/x86/socperf/socperfdrv.c:1389:20: error: initialization of 'loff_t (*)(struct file *, loff_t,  int)' {aka 'long long int (*)(struct file *, long long int,  int)'} from incompatible pointer type 'long int (*)(struct inode *, struct file *, unsigned int,  long unsigned int)' [-Werror=incompatible-pointer-types]
   drivers/platform/x86/socperf/socperfdrv.c:1389:20: note: (near initialization for 'socperf_Fops.llseek')
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/platform/x86/socperf/socperfdrv.c:55:
   include/linux/stddef.h:8:14: warning: initialized field overwritten [-Woverride-init]
       8 | #define NULL ((void *)0)
         |              ^
   drivers/platform/x86/socperf/socperfdrv.c:1397:19: note: in expansion of macro 'NULL'
    1397 |         .llseek = NULL,
         |                   ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'socperf_Fops.llseek')
       8 | #define NULL ((void *)0)
         |              ^
   drivers/platform/x86/socperf/socperfdrv.c:1397:19: note: in expansion of macro 'NULL'
    1397 |         .llseek = NULL,
         |                   ^~~~
   cc1: some warnings being treated as errors


vim +/socperf_Device_Control_Compat +1307 drivers/platform/x86/socperf/socperfdrv.c

f57492d07625dd Manisha Chinthapally 2019-05-01  1305  
f57492d07625dd Manisha Chinthapally 2019-05-01  1306  #if defined(CONFIG_COMPAT) && defined(DRV_EM64T)
f57492d07625dd Manisha Chinthapally 2019-05-01 @1307  long socperf_Device_Control_Compat(struct file *filp, unsigned int cmd,
f57492d07625dd Manisha Chinthapally 2019-05-01  1308  					  unsigned long arg)
f57492d07625dd Manisha Chinthapally 2019-05-01  1309  {
f57492d07625dd Manisha Chinthapally 2019-05-01  1310  	int status = OS_SUCCESS;
f57492d07625dd Manisha Chinthapally 2019-05-01  1311  	IOCTL_COMPAT_ARGS_NODE local_args_compat;
f57492d07625dd Manisha Chinthapally 2019-05-01  1312  	IOCTL_ARGS_NODE local_args;
f57492d07625dd Manisha Chinthapally 2019-05-01  1313  
f57492d07625dd Manisha Chinthapally 2019-05-01  1314  	memset(&local_args_compat, 0, sizeof(IOCTL_COMPAT_ARGS_NODE));
f57492d07625dd Manisha Chinthapally 2019-05-01  1315  	SOCPERF_PRINT_DEBUG("Compat: type: %d, subcommand: %d\n",
f57492d07625dd Manisha Chinthapally 2019-05-01  1316  			    _IOC_TYPE(cmd), _IOC_NR(cmd));
f57492d07625dd Manisha Chinthapally 2019-05-01  1317  
f57492d07625dd Manisha Chinthapally 2019-05-01  1318  	if (_IOC_TYPE(cmd) != LWPMU_IOC_MAGIC) {
f57492d07625dd Manisha Chinthapally 2019-05-01  1319  		SOCPERF_PRINT_ERROR("Unknown IOCTL magic:%d\n", _IOC_TYPE(cmd));
f57492d07625dd Manisha Chinthapally 2019-05-01  1320  		return OS_ILLEGAL_IOCTL;
f57492d07625dd Manisha Chinthapally 2019-05-01  1321  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  1322  
f57492d07625dd Manisha Chinthapally 2019-05-01  1323  	MUTEX_LOCK(ioctl_lock);
f57492d07625dd Manisha Chinthapally 2019-05-01  1324  	if (arg) {
f57492d07625dd Manisha Chinthapally 2019-05-01  1325  		status = copy_from_user(&local_args_compat,
f57492d07625dd Manisha Chinthapally 2019-05-01  1326  					(void __user *)arg,
f57492d07625dd Manisha Chinthapally 2019-05-01  1327  					sizeof(IOCTL_COMPAT_ARGS_NODE));
f57492d07625dd Manisha Chinthapally 2019-05-01  1328  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  1329  	local_args.len_drv_to_usr = local_args_compat.len_drv_to_usr;
f57492d07625dd Manisha Chinthapally 2019-05-01  1330  	local_args.len_usr_to_drv = local_args_compat.len_usr_to_drv;
f57492d07625dd Manisha Chinthapally 2019-05-01  1331  	local_args.buf_drv_to_usr =
f57492d07625dd Manisha Chinthapally 2019-05-01  1332  		(char *)compat_ptr(local_args_compat.buf_drv_to_usr);
f57492d07625dd Manisha Chinthapally 2019-05-01  1333  	local_args.buf_usr_to_drv =
f57492d07625dd Manisha Chinthapally 2019-05-01  1334  		(char *)compat_ptr(local_args_compat.buf_usr_to_drv);
f57492d07625dd Manisha Chinthapally 2019-05-01  1335  
f57492d07625dd Manisha Chinthapally 2019-05-01  1336  	status = socperf_Service_IOCTL(filp, _IOC_NR(cmd), local_args);
f57492d07625dd Manisha Chinthapally 2019-05-01  1337  	MUTEX_UNLOCK(ioctl_lock);
f57492d07625dd Manisha Chinthapally 2019-05-01  1338  
f57492d07625dd Manisha Chinthapally 2019-05-01  1339  	return status;
f57492d07625dd Manisha Chinthapally 2019-05-01  1340  }
f57492d07625dd Manisha Chinthapally 2019-05-01  1341  #endif
f57492d07625dd Manisha Chinthapally 2019-05-01  1342  

:::::: The code at line 1307 was first introduced by commit
:::::: f57492d07625dddac7920eccdb5be08c55ee16fa platform/x86: SOCPERF3 support for sep & socwatch

:::::: TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
