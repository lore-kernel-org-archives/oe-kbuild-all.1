Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C9EAD30
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 22:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680129979; x=1711665979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m0KgOGM74LI9PGag5/9HcCRYmZrCKP6bQxRCK6KsQ9E=;
  b=LhgPom1ShQ4bJzng1Y7z6/Dk0NiBS+o7giL8Q+iy5BxvH1rifxbyY/Sj
   4zGF4GlKK0z7FRYx1uCNVNnH7KYODzSZ/2FCRODLtJY7MMehWYuaQFRh4
   0Y5CQgViGUQR1IGYfM1NINrBRx/TctiRTgnjHEDK2fhRyGZTVVgGGxSI8
   Rl6sQwj92zcZBMt7EXA7WTrWeDDosDXWyDRY0D4YKizx96t5xisn4HXOk
   OZWOLx6laArpu+SXCcizCHvVKsWTPbkwDIFcxt+3EA1T+KcrWmVNljqCW
   gQO9b8uwvxzMlB6fd+iP+KPww8qzSJflevm8X5Lyz/k12kdlE5ZY29Oum
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="339739218"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="339739218"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 15:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="748940496"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="748940496"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Mar 2023 15:46:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pheYY-000K1I-30;
	Wed, 29 Mar 2023 22:46:14 +0000
Date: Thu, 30 Mar 2023 06:45:28 +0800
From: kernel test robot <lkp@intel.com>
To: Manisha Chinthapally <manisha.chinthapally@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socperf/socperfdrv.c:203:13: sparse: sparse:
 function 'SOCPERF_Read_Data3' with external linkage has definition
Message-ID: <202303300618.TqsrlEUd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Manisha,

First bad commit (maybe != root cause):

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: c859e634bf058e7963fccc4c1219c1365e925ad4 platform/x86: Update SEP driver for 5.9 pull
date:   2 years, 6 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230330/202303300618.TqsrlEUd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/c859e634bf058e7963fccc4c1219c1365e925ad4
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout c859e634bf058e7963fccc4c1219c1365e925ad4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300618.TqsrlEUd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socperf/socperfdrv.c:203:13: sparse: sparse: function 'SOCPERF_Read_Data3' with external linkage has definition
   drivers/platform/x86/socperf/socperfdrv.c:885:1: sparse: sparse: function 'SOCPERF_Switch_Group3' with external linkage has definition
>> drivers/platform/x86/socperf/socperfdrv.c:101:22: sparse: sparse: symbol 'socperf_drv_version' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:102:5: sparse: sparse: symbol 'read_unc_ctr_info' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:103:10: sparse: sparse: symbol 'dispatch_uncore' was not declared. Should it be static?
   drivers/platform/x86/socperf/socperfdrv.c:104:12: sparse: sparse: symbol 'socperf_drv_cfg' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:105:14: sparse: sparse: symbol 'socperf_global_ec' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:106:14: sparse: sparse: symbol 'socperf_abnormal_terminate' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:107:11: sparse: sparse: symbol 'socperf_control' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:111:8: sparse: sparse: symbol 'socperf_pcb_size' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:984:28: sparse: sparse: Using plain integer as NULL pointer
>> drivers/platform/x86/socperf/socperfdrv.c:1070:6: sparse: sparse: symbol 'lwpmudrv_Stop_Mem' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:1155:15: sparse: sparse: symbol 'socperf_Service_IOCTL' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:1274:6: sparse: sparse: symbol 'socperf_Device_Control' was not declared. Should it be static?
>> drivers/platform/x86/socperf/socperfdrv.c:1358:5: sparse: sparse: symbol 'SOCPERF_Abnormal_Terminate' was not declared. Should it be static?

vim +/SOCPERF_Read_Data3 +203 drivers/platform/x86/socperf/socperfdrv.c

f57492d07625dd Manisha Chinthapally 2019-05-01   99  
f57492d07625dd Manisha Chinthapally 2019-05-01  100  /* Global variables of the driver */
f57492d07625dd Manisha Chinthapally 2019-05-01 @101  SOCPERF_VERSION_NODE socperf_drv_version;
f57492d07625dd Manisha Chinthapally 2019-05-01 @102  U64 *read_unc_ctr_info;
f57492d07625dd Manisha Chinthapally 2019-05-01 @103  DISPATCH dispatch_uncore;
f57492d07625dd Manisha Chinthapally 2019-05-01  104  DRV_CONFIG socperf_drv_cfg;
f57492d07625dd Manisha Chinthapally 2019-05-01 @105  EVENT_CONFIG socperf_global_ec;
f57492d07625dd Manisha Chinthapally 2019-05-01 @106  volatile S32 socperf_abnormal_terminate;
f57492d07625dd Manisha Chinthapally 2019-05-01 @107  LWPMU_DEV socperf_control;
f57492d07625dd Manisha Chinthapally 2019-05-01  108  
f57492d07625dd Manisha Chinthapally 2019-05-01  109  LWPMU_DEVICE device_uncore;
f57492d07625dd Manisha Chinthapally 2019-05-01  110  CPU_STATE socperf_pcb;
f57492d07625dd Manisha Chinthapally 2019-05-01 @111  size_t socperf_pcb_size;
f57492d07625dd Manisha Chinthapally 2019-05-01  112  
f57492d07625dd Manisha Chinthapally 2019-05-01  113  #if defined(DRV_USE_UNLOCKED_IOCTL)
f57492d07625dd Manisha Chinthapally 2019-05-01  114  static struct mutex ioctl_lock;
f57492d07625dd Manisha Chinthapally 2019-05-01  115  #endif
f57492d07625dd Manisha Chinthapally 2019-05-01  116  
f57492d07625dd Manisha Chinthapally 2019-05-01  117  #define PMU_DEVICES 1 // pmu control
f57492d07625dd Manisha Chinthapally 2019-05-01  118  
f57492d07625dd Manisha Chinthapally 2019-05-01  119  static dev_t lwpmu_DevNum; /* the major and minor parts for SOCPERF base */
f57492d07625dd Manisha Chinthapally 2019-05-01  120  
f57492d07625dd Manisha Chinthapally 2019-05-01  121  static struct class *pmu_class;
f57492d07625dd Manisha Chinthapally 2019-05-01  122  
f57492d07625dd Manisha Chinthapally 2019-05-01  123  #define DRV_DEVICE_DELIMITER "!"
f57492d07625dd Manisha Chinthapally 2019-05-01  124  
f57492d07625dd Manisha Chinthapally 2019-05-01  125  #if !defined(DRV_USE_UNLOCKED_IOCTL)
f57492d07625dd Manisha Chinthapally 2019-05-01  126  #define MUTEX_INIT(lock)
f57492d07625dd Manisha Chinthapally 2019-05-01  127  #define MUTEX_LOCK(lock)
f57492d07625dd Manisha Chinthapally 2019-05-01  128  #define MUTEX_UNLOCK(lock)
f57492d07625dd Manisha Chinthapally 2019-05-01  129  #else
f57492d07625dd Manisha Chinthapally 2019-05-01  130  #define MUTEX_INIT(lock) mutex_init(&(lock))
f57492d07625dd Manisha Chinthapally 2019-05-01  131  #define MUTEX_LOCK(lock) mutex_lock(&(lock))
f57492d07625dd Manisha Chinthapally 2019-05-01  132  #define MUTEX_UNLOCK(lock) mutex_unlock(&(lock))
f57492d07625dd Manisha Chinthapally 2019-05-01  133  #endif
f57492d07625dd Manisha Chinthapally 2019-05-01  134  
f57492d07625dd Manisha Chinthapally 2019-05-01  135  /* ------------------------------------------------------------------------- */
f57492d07625dd Manisha Chinthapally 2019-05-01  136  /*!
f57492d07625dd Manisha Chinthapally 2019-05-01  137   * @fn  static OS_STATUS lwpmudrv_Initialize_State(void)
f57492d07625dd Manisha Chinthapally 2019-05-01  138   *
f57492d07625dd Manisha Chinthapally 2019-05-01  139   * @param none
f57492d07625dd Manisha Chinthapally 2019-05-01  140   *
f57492d07625dd Manisha Chinthapally 2019-05-01  141   * @return OS_STATUS
f57492d07625dd Manisha Chinthapally 2019-05-01  142   *
f57492d07625dd Manisha Chinthapally 2019-05-01  143   * @brief  Allocates the memory needed at load time.  Initializes all the
f57492d07625dd Manisha Chinthapally 2019-05-01  144   * @brief  necessary state variables with the default values.
f57492d07625dd Manisha Chinthapally 2019-05-01  145   *
f57492d07625dd Manisha Chinthapally 2019-05-01  146   * <I>Special Notes</I>
f57492d07625dd Manisha Chinthapally 2019-05-01  147   */
f57492d07625dd Manisha Chinthapally 2019-05-01  148  static OS_STATUS lwpmudrv_Initialize_State(VOID)
f57492d07625dd Manisha Chinthapally 2019-05-01  149  {
f57492d07625dd Manisha Chinthapally 2019-05-01  150  	S32 i, max_cpu_id = 0;
f57492d07625dd Manisha Chinthapally 2019-05-01  151  
f57492d07625dd Manisha Chinthapally 2019-05-01  152  	for_each_possible_cpu(i) {
f57492d07625dd Manisha Chinthapally 2019-05-01  153  		if (cpu_present(i)) {
f57492d07625dd Manisha Chinthapally 2019-05-01  154  			if (i > max_cpu_id) {
f57492d07625dd Manisha Chinthapally 2019-05-01  155  				max_cpu_id = i;
f57492d07625dd Manisha Chinthapally 2019-05-01  156  			}
f57492d07625dd Manisha Chinthapally 2019-05-01  157  		}
f57492d07625dd Manisha Chinthapally 2019-05-01  158  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  159  	max_cpu_id++;
f57492d07625dd Manisha Chinthapally 2019-05-01  160  
f57492d07625dd Manisha Chinthapally 2019-05-01  161  	/*
f57492d07625dd Manisha Chinthapally 2019-05-01  162  	 *  Machine Initializations
f57492d07625dd Manisha Chinthapally 2019-05-01  163  	 *  Abstract this information away into a separate entry point
f57492d07625dd Manisha Chinthapally 2019-05-01  164  	 *
f57492d07625dd Manisha Chinthapally 2019-05-01  165  	 *  Question:  Should we allow for the use of Hot-cpu
f57492d07625dd Manisha Chinthapally 2019-05-01  166  	 *    add/subtract functionality while the driver is executing?
f57492d07625dd Manisha Chinthapally 2019-05-01  167  	 */
f57492d07625dd Manisha Chinthapally 2019-05-01  168  	if (max_cpu_id > num_present_cpus()) {
f57492d07625dd Manisha Chinthapally 2019-05-01  169  		GLOBAL_STATE_num_cpus(socperf_driver_state) = max_cpu_id;
f57492d07625dd Manisha Chinthapally 2019-05-01  170  	} else {
f57492d07625dd Manisha Chinthapally 2019-05-01  171  		GLOBAL_STATE_num_cpus(socperf_driver_state) =
f57492d07625dd Manisha Chinthapally 2019-05-01  172  			num_present_cpus();
f57492d07625dd Manisha Chinthapally 2019-05-01  173  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  174  	GLOBAL_STATE_active_cpus(socperf_driver_state) = num_online_cpus();
f57492d07625dd Manisha Chinthapally 2019-05-01  175  	GLOBAL_STATE_cpu_count(socperf_driver_state) = 0;
f57492d07625dd Manisha Chinthapally 2019-05-01  176  	GLOBAL_STATE_dpc_count(socperf_driver_state) = 0;
f57492d07625dd Manisha Chinthapally 2019-05-01  177  	GLOBAL_STATE_num_em_groups(socperf_driver_state) = 0;
f57492d07625dd Manisha Chinthapally 2019-05-01  178  	GLOBAL_STATE_current_phase(socperf_driver_state) =
f57492d07625dd Manisha Chinthapally 2019-05-01  179  		DRV_STATE_UNINITIALIZED;
f57492d07625dd Manisha Chinthapally 2019-05-01  180  
f57492d07625dd Manisha Chinthapally 2019-05-01  181  	SOCPERF_PRINT_DEBUG(
f57492d07625dd Manisha Chinthapally 2019-05-01  182  		"%s: num_cpus=%d, active_cpus=%d\n",
f57492d07625dd Manisha Chinthapally 2019-05-01  183  		__func__,
f57492d07625dd Manisha Chinthapally 2019-05-01  184  		GLOBAL_STATE_num_cpus(socperf_driver_state),
f57492d07625dd Manisha Chinthapally 2019-05-01  185  		GLOBAL_STATE_active_cpus(socperf_driver_state));
f57492d07625dd Manisha Chinthapally 2019-05-01  186  
f57492d07625dd Manisha Chinthapally 2019-05-01  187  	return OS_SUCCESS;
f57492d07625dd Manisha Chinthapally 2019-05-01  188  }
f57492d07625dd Manisha Chinthapally 2019-05-01  189  
f57492d07625dd Manisha Chinthapally 2019-05-01  190  /* ------------------------------------------------------------------------- */
f57492d07625dd Manisha Chinthapally 2019-05-01  191  /*!
f57492d07625dd Manisha Chinthapally 2019-05-01  192   * @fn       VOID SOCPERF_Read_Data
f57492d07625dd Manisha Chinthapally 2019-05-01  193   *
f57492d07625dd Manisha Chinthapally 2019-05-01  194   * @brief    Reads counter data
f57492d07625dd Manisha Chinthapally 2019-05-01  195   *
f57492d07625dd Manisha Chinthapally 2019-05-01  196   * @param    param   data_buffer - buffer for reading counter data.
f57492d07625dd Manisha Chinthapally 2019-05-01  197   *
f57492d07625dd Manisha Chinthapally 2019-05-01  198   * @return  None
f57492d07625dd Manisha Chinthapally 2019-05-01  199   *
f57492d07625dd Manisha Chinthapally 2019-05-01  200   * <I>Special Notes:</I>
f57492d07625dd Manisha Chinthapally 2019-05-01  201   *              <NONE>
f57492d07625dd Manisha Chinthapally 2019-05-01  202   */
f57492d07625dd Manisha Chinthapally 2019-05-01 @203  extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
f57492d07625dd Manisha Chinthapally 2019-05-01  204  {
f57492d07625dd Manisha Chinthapally 2019-05-01  205  	if (dispatch_uncore && dispatch_uncore->read_current_data) {
f57492d07625dd Manisha Chinthapally 2019-05-01  206  		dispatch_uncore->read_current_data(data_buffer);
f57492d07625dd Manisha Chinthapally 2019-05-01  207  	}
f57492d07625dd Manisha Chinthapally 2019-05-01  208  	SOCPERF_PRINT_DEBUG("%s called\n", __func__);
f57492d07625dd Manisha Chinthapally 2019-05-01  209  }
f57492d07625dd Manisha Chinthapally 2019-05-01  210  EXPORT_SYMBOL(SOCPERF_Read_Data3);
f57492d07625dd Manisha Chinthapally 2019-05-01  211  

:::::: The code at line 203 was first introduced by commit
:::::: f57492d07625dddac7920eccdb5be08c55ee16fa platform/x86: SOCPERF3 support for sep & socwatch

:::::: TO: Manisha Chinthapally <manisha.chinthapally@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
