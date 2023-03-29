Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD87B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 11:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680088327; x=1711624327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSvaX2KpSVD29gQPXOyOxPNrt9chhFLB+IS15O0sZ3o=;
  b=iQMcsivJ8GAVdBMq3rWTEKABIuMBrunegd9qKtIDF+brjtfk+o2p3Wr4
   kPV3OPpAbOTN3LdO6cM2hn6UCoRQvdTXSqOgGVloF01Oo9aSPpx3CW8yL
   jS386pWfrlLdlji3WaaiPeglL2Jo9Ru+6EqOXJ+s3PB0MGE31cl+p58Z1
   9RTLhWi2M1tgWu0aYIgyfyiVEW9fLqVu74bgoHeGikgBTAj9LxSvU5AJh
   wmjnil6tqJcHVunXGENaPYHNFlruCc5oED8Uc/HQUe4TBvBHY2yXN/vEk
   160Dj9/Na/gdEjYa/0maRLktYVouO79rESqJUUVdfoVZDczZstjMa8t4H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="338348430"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="338348430"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 04:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="661560051"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="661560051"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 29 Mar 2023 04:11:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phTiV-000JTA-0K;
	Wed, 29 Mar 2023 11:11:47 +0000
Date: Wed, 29 Mar 2023 19:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/platform/x86/socwatch/sw_mem.c:141:18: sparse: sparse: cast
 to restricted gfp_t
Message-ID: <202303291911.BccsrOBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Faycal,

First bad commit (maybe != root cause):

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_10
head:   c55df4a2b60fc7c6c4d00fd9f9fb447087833513
commit: e65547c5a9bb37e907edecece4da7cb12dadea96 platform/x86: Use $(srctree) instead of $(src) to adapt to kbuild regression
date:   2 years, 6 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230329/202303291911.BccsrOBw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/mchinth/linux/commit/e65547c5a9bb37e907edecece4da7cb12dadea96
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth sep_socwatch_linux_5_10
        git checkout e65547c5a9bb37e907edecece4da7cb12dadea96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/sepdk/pax/ drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303291911.BccsrOBw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/socwatch/sw_mem.c:141:18: sparse: sparse: cast to restricted gfp_t
   drivers/platform/x86/socwatch/sw_mem.c:305:38: sparse: sparse: cast to restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:99:68: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:85:33: sparse: sparse: symbol 'sw_copy_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:116:5: sparse: sparse: symbol 'sw_init_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:138:5: sparse: sparse: symbol 'sw_init_ops_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:186:57: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:214:57: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_collector.c:211:24: sparse: sparse: symbol 'sw_alloc_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:323:6: sparse: sparse: symbol 'sw_free_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:329:6: sparse: sparse: symbol 'sw_free_ops_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:335:5: sparse: sparse: symbol 'sw_reset_driver_interface_info_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:453:6: sparse: sparse: symbol 'sw_free_collector_msg_i' was not declared. Should it be static?
>> drivers/platform/x86/socwatch/sw_collector.c:459:6: sparse: sparse: symbol 'sw_handle_per_cpu_msg_i' was not declared. Should it be static?
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_collector.c:516:51: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_internal.c:176:50: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_hardware_io.c:149:55: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_tracepoint_handlers.c:237:44: sparse:     got restricted gfp_t
--
>> drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got char *[assigned] out_arg @@
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_driver.c:1309:52: sparse:     got char *[assigned] out_arg
>> drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *buffer @@     got char *remote_buffer @@
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:     expected void [noderef] __user *buffer
   drivers/platform/x86/socwatch/sw_driver.c:1053:58: sparse:     got char *remote_buffer
>> drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got char *remote_cfg @@
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:     expected void const [noderef] __user *from
   drivers/platform/x86/socwatch/sw_driver.c:1070:39: sparse:     got char *remote_cfg
--
>> drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void *dest @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:344:22: sparse:     got void *dest
>> drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:     expected void [noderef] __user *to
   drivers/platform/x86/socwatch/sw_output_buffer.c:352:43: sparse:     got void *
>> drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:378:46: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:562:46: sparse:     got restricted gfp_t
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int flags @@     got restricted gfp_t @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:     expected unsigned int flags
   drivers/platform/x86/socwatch/sw_output_buffer.c:575:67: sparse:     got restricted gfp_t
>> drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *dest @@     got void [noderef] __user *buffer @@
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:     expected void *dest
   drivers/platform/x86/socwatch/sw_output_buffer.c:774:48: sparse:     got void [noderef] __user *buffer

vim +141 drivers/platform/x86/socwatch/sw_mem.c

d605aabab41663 Jon Moeller    2018-11-13  132  
d605aabab41663 Jon Moeller    2018-11-13  133  /*
d605aabab41663 Jon Moeller    2018-11-13  134   * Allocate free pages.
d605aabab41663 Jon Moeller    2018-11-13  135   * TODO: add memory tracker?
d605aabab41663 Jon Moeller    2018-11-13  136   */
688e338c753b33 Faycal Benmlih 2019-04-23  137  unsigned long sw_allocate_pages(
688e338c753b33 Faycal Benmlih 2019-04-23  138  	unsigned int flags, unsigned int alloc_size_in_bytes)
d605aabab41663 Jon Moeller    2018-11-13  139  {
688e338c753b33 Faycal Benmlih 2019-04-23  140  	return __get_free_pages(
688e338c753b33 Faycal Benmlih 2019-04-23 @141  		(gfp_t)flags, get_order(alloc_size_in_bytes));
d605aabab41663 Jon Moeller    2018-11-13  142  }
d605aabab41663 Jon Moeller    2018-11-13  143  /*
d605aabab41663 Jon Moeller    2018-11-13  144   * Free up previously allocated pages.
d605aabab41663 Jon Moeller    2018-11-13  145   * TODO: add memory tracker?
d605aabab41663 Jon Moeller    2018-11-13  146   */
688e338c753b33 Faycal Benmlih 2019-04-23  147  void sw_release_pages(
688e338c753b33 Faycal Benmlih 2019-04-23  148  	unsigned long addr, unsigned int alloc_size_in_bytes)
d605aabab41663 Jon Moeller    2018-11-13  149  {
d605aabab41663 Jon Moeller    2018-11-13  150  	free_pages(addr, get_order(alloc_size_in_bytes));
d605aabab41663 Jon Moeller    2018-11-13  151  }
d605aabab41663 Jon Moeller    2018-11-13  152  

:::::: The code at line 141 was first introduced by commit
:::::: 688e338c753b33c023de3b774f7347effbf537a4 Platform/x86: Update SoCWatch driver code to 2.10

:::::: TO: Faycal Benmlih <faycal.benmlih@intel.com>
:::::: CC: Faycal Benmlih <faycal.benmlih@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
