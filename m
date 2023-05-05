Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC199538B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 May 2023 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683277152; x=1714813152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rw8qI7R39VwjS6PEzkzTig7P6Y1Cpdly08HDLKIE7sE=;
  b=MXmQXXi8w0Ed1EEgFdVsy4Xt0kBbVFmtxl4xdjRkeSAaxRO3R/39ab+x
   42DPv8g/GVNLFgdG/bPP+/+APUNy50b47ZLumbmuTE86SWnhQ71wi8geR
   Z9rCrZlbHt5TwMP1Mo6kkUx/jLX/xBmHh7LHlzMvG+/nrMhjMddAv2gSH
   Lo9D+TAw+x+grX2fdwK4u6qJM+3ZhvTzpz0BIXb135TRA+Gzd/+BXwIdL
   wXnzaf9h3Ih52aL5Gvq4lIMGHJz/QC6cw1X017NKpdoAydTTcG3KXVRri
   L67XOKcBBepXyKGw2icKxt0Z5LyyO03AHJl37/SuQuZT+HklReaVh2Uq4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="347987599"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="347987599"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 01:59:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="821584228"
X-IronPort-AV: E=Sophos;i="5.99,251,1677571200"; 
   d="scan'208";a="821584228"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 May 2023 01:59:10 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1purHR-0000RV-1o;
	Fri, 05 May 2023 08:59:09 +0000
Date: Fri, 5 May 2023 16:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: Faycal Benmlih <faycal.benmlih@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mchinth:socwatch_linux_6_3 25/91]
 drivers/platform/x86/socperf/socperfdrv.c:203:13: warning: no previous
 prototype for 'SOCPERF_Read_Data3'
Message-ID: <202305051625.HHLkAZKQ-lkp@intel.com>
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

tree:   https://github.com/mchinth/linux socwatch_linux_6_3
head:   db51827dc3d8fd27fd6312b14811fa2e0c4abe87
commit: e65547c5a9bb37e907edecece4da7cb12dadea96 [25/91] platform/x86: Use $(srctree) instead of $(src) to adapt to kbuild regression
config: i386-buildonly-randconfig-r006-20230501 (https://download.01.org/0day-ci/archive/20230505/202305051625.HHLkAZKQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/mchinth/linux/commit/e65547c5a9bb37e907edecece4da7cb12dadea96
        git remote add mchinth https://github.com/mchinth/linux
        git fetch --no-tags mchinth socwatch_linux_6_3
        git checkout e65547c5a9bb37e907edecece4da7cb12dadea96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/socperf/ drivers/platform/x86/socwatch/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305051625.HHLkAZKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/socperf/socperfdrv.c:203:13: warning: no previous prototype for 'SOCPERF_Read_Data3' [-Wmissing-prototypes]
     203 | extern VOID SOCPERF_Read_Data3(PVOID data_buffer)
         |             ^~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socperf/socperfdrv.c:885:1: warning: no previous prototype for 'SOCPERF_Switch_Group3' [-Wmissing-prototypes]
     885 | SOCPERF_Switch_Group3(VOID)
         | ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socperf/socperfdrv.c:1070:6: warning: no previous prototype for 'lwpmudrv_Stop_Mem' [-Wmissing-prototypes]
    1070 | VOID lwpmudrv_Stop_Mem(VOID)
         |      ^~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socperf/socperfdrv.c:1155:15: warning: no previous prototype for 'socperf_Service_IOCTL' [-Wmissing-prototypes]
    1155 | IOCTL_OP_TYPE socperf_Service_IOCTL(IOCTL_USE_INODE struct file *filp,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socperf/socperfdrv.c:1274:6: warning: no previous prototype for 'socperf_Device_Control' [-Wmissing-prototypes]
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
>> drivers/platform/x86/socperf/socperfdrv.c:1358:5: warning: no previous prototype for 'SOCPERF_Abnormal_Terminate' [-Wmissing-prototypes]
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
--
   drivers/platform/x86/socwatch/sw_driver.c: In function 'sw_collection_stop_i':
>> drivers/platform/x86/socwatch/sw_driver.c:548:101: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     548 |                         "Warning: some trace_notifier probe functions could NOT be unregistered!\n");
         |                                                                                                     ^
   drivers/platform/x86/socwatch/sw_driver.c: In function 'sw_collection_poll_i':
   drivers/platform/x86/socwatch/sw_driver.c:617:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     617 |                 pw_pr_debug("DEBUG: EMPTY POLL LIST\n");
         |                                                        ^
   drivers/platform/x86/socwatch/sw_driver.c: In function 'sw_load_driver_i':
>> drivers/platform/x86/socwatch/sw_driver.c:1497:62: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1497 |                         pw_pr_debug("OK, resetting worked\n");
         |                                                              ^
   drivers/platform/x86/socwatch/sw_driver.c: In function 'sw_unload_driver_i':
   drivers/platform/x86/socwatch/sw_driver.c:1514:62: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
    1514 |                         pw_pr_debug("OK, resetting worked\n");
         |                                                              ^
--
   drivers/platform/x86/socwatch/sw_output_buffer.c: In function 'enqueue_data':
>> drivers/platform/x86/socwatch/sw_output_buffer.c:288:49: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     288 |                 pw_pr_debug("DEBUG: wrapped!\n");
         |                                                 ^
   drivers/platform/x86/socwatch/sw_output_buffer.c: In function 'consume_buffer':
   drivers/platform/x86/socwatch/sw_output_buffer.c:301:14: warning: variable 'wrapped' set but not used [-Wunused-but-set-variable]
     301 |         bool wrapped = false;
         |              ^~~~~~~
   drivers/platform/x86/socwatch/sw_output_buffer.c:299:32: warning: variable 'write_index' set but not used [-Wunused-but-set-variable]
     299 |         size_t read_index = 0, write_index = 0, dst_index = 0;
         |                                ^~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_output_buffer.c: At top level:
>> drivers/platform/x86/socwatch/sw_output_buffer.c:398:6: warning: no previous prototype for 'reset_output_buffers' [-Wmissing-prototypes]
     398 | void reset_output_buffers(void)
         |      ^~~~~~~~~~~~~~~~~~~~
--
>> drivers/platform/x86/socwatch/sw_collector.c:68:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
      68 | const static struct sw_hw_ops *s_hw_ops;
         | ^~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:86:1: warning: no previous prototype for 'sw_copy_driver_interface_info_i' [-Wmissing-prototypes]
      86 | sw_copy_driver_interface_info_i(const struct sw_driver_interface_info *info)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:116:5: warning: no previous prototype for 'sw_init_driver_interface_info_i' [-Wmissing-prototypes]
     116 | int sw_init_driver_interface_info_i(struct sw_driver_interface_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:138:5: warning: no previous prototype for 'sw_init_ops_i' [-Wmissing-prototypes]
     138 | int sw_init_ops_i(const struct sw_hw_ops **ops,
         |     ^~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:157:8: warning: no previous prototype for 'sw_get_payload_size_i' [-Wmissing-prototypes]
     157 | size_t sw_get_payload_size_i(const struct sw_driver_interface_info *info)
         |        ^~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:175:1: warning: no previous prototype for 'sw_alloc_collector_msg_i' [-Wmissing-prototypes]
     175 | sw_alloc_collector_msg_i(const struct sw_driver_interface_info *info,
         | ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:211:26: warning: no previous prototype for 'sw_alloc_ops_i' [-Wmissing-prototypes]
     211 | const struct sw_hw_ops **sw_alloc_ops_i(pw_u16_t num_io_descriptors)
         |                          ^~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:323:6: warning: no previous prototype for 'sw_free_driver_interface_info_i' [-Wmissing-prototypes]
     323 | void sw_free_driver_interface_info_i(struct sw_driver_interface_info *info)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:329:6: warning: no previous prototype for 'sw_free_ops_i' [-Wmissing-prototypes]
     329 | void sw_free_ops_i(const struct sw_hw_ops **ops)
         |      ^~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:335:5: warning: no previous prototype for 'sw_reset_driver_interface_info_i' [-Wmissing-prototypes]
     335 | int sw_reset_driver_interface_info_i(struct sw_driver_interface_info *info)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:453:6: warning: no previous prototype for 'sw_free_collector_msg_i' [-Wmissing-prototypes]
     453 | void sw_free_collector_msg_i(sw_driver_msg_t *msg)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/platform/x86/socwatch/sw_collector.c:459:6: warning: no previous prototype for 'sw_handle_per_cpu_msg_i' [-Wmissing-prototypes]
     459 | void sw_handle_per_cpu_msg_i(void *info, enum sw_wakeup_action action)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_collector.c: In function 'sw_handle_per_cpu_msg_i':
>> drivers/platform/x86/socwatch/sw_collector.c:506:76: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     506 |                         pw_pr_warn("WARNING: could NOT produce message!\n");
         |                                                                            ^
--
   drivers/platform/x86/socwatch/sw_telem.c: In function 'setup_punit_mbox':
   drivers/platform/x86/socwatch/sw_telem.c:239:39: error: implicit declaration of function 'ioremap_nocache'; did you mean 'ioremap_cache'? [-Werror=implicit-function-declaration]
     239 |         s_punitInterfaceAddr = (u64 *)ioremap_nocache(
         |                                       ^~~~~~~~~~~~~~~
         |                                       ioremap_cache
   drivers/platform/x86/socwatch/sw_telem.c: In function 'punit_start_telem':
>> drivers/platform/x86/socwatch/sw_telem.c:471:88: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     471 |                 pw_pr_warn("Could not execute P-unit IPC command to read telem info\n");
         |                                                                                        ^
   drivers/platform/x86/socwatch/sw_telem.c:493:98: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     493 |                 pw_pr_warn("Could not execute P-unit IPC command to read telem ctrl structure\n");
         |                                                                                                  ^
   drivers/platform/x86/socwatch/sw_telem.c:499:99: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     499 |                 pw_pr_warn("Could not execute P-unit IPC command to write telem ctrl structure\n");
         |                                                                                                   ^
   drivers/platform/x86/socwatch/sw_telem.c:511:98: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     511 |                         pw_pr_warn("Could not execute P-unit IPC command to write telem event\n");
         |                                                                                                  ^
   drivers/platform/x86/socwatch/sw_telem.c:523:99: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     523 |                 pw_pr_warn("Could not execute P-unit IPC command to write telem ctrl structure\n");
         |                                                                                                   ^
   drivers/platform/x86/socwatch/sw_telem.c: In function 'punit_stop_telem':
   drivers/platform/x86/socwatch/sw_telem.c:535:98: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     535 |                 pw_pr_warn("Could not execute P-unit IPC command to read telem ctrl structure\n");
         |                                                                                                  ^
   drivers/platform/x86/socwatch/sw_telem.c:542:99: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     542 |                 pw_pr_warn("Could not execute P-unit IPC command to write telem ctrl structure\n");
         |                                                                                                   ^
   drivers/platform/x86/socwatch/sw_telem.c: In function 'pmc_start_telem':
   drivers/platform/x86/socwatch/sw_telem.c:557:89: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     557 |                 pw_pr_warn("Could not execute PMC IPC command to read telemetry info\n");
         |                                                                                         ^
   drivers/platform/x86/socwatch/sw_telem.c:576:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     576 |                 pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                             ^
   drivers/platform/x86/socwatch/sw_telem.c:583:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     583 |                 pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                             ^
   drivers/platform/x86/socwatch/sw_telem.c:599:101: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     599 |                         pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                                     ^
   drivers/platform/x86/socwatch/sw_telem.c:611:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     611 |                 pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                             ^
   drivers/platform/x86/socwatch/sw_telem.c: In function 'pmc_stop_telem':
   drivers/platform/x86/socwatch/sw_telem.c:624:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     624 |                 pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                             ^
   drivers/platform/x86/socwatch/sw_telem.c:631:93: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     631 |                 pw_pr_warn("Could not execute PMC IPC command to read telem control info\n");
         |                                                                                             ^
   drivers/platform/x86/socwatch/sw_telem.c: At top level:
>> drivers/platform/x86/socwatch/sw_telem.c:671:5: warning: no previous prototype for 'read_telem' [-Wmissing-prototypes]
     671 | int read_telem(u64 *dst, enum telemetry_unit unit, bool should_retry)
         |     ^~~~~~~~~~
   drivers/platform/x86/socwatch/sw_telem.c: In function 'sw_read_telem_info':
>> drivers/platform/x86/socwatch/sw_telem.c:823:68: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     823 |                 pw_pr_debug("DEBUG: unit %d NOT refreshed\n", unit);
         |                                                                    ^
   cc1: some warnings being treated as errors
--
   drivers/platform/x86/socwatch/sw_ops_provider.c: In function 'sw_ipc_mmio_descriptor_init_func_i':
   drivers/platform/x86/socwatch/sw_ops_provider.c:329:42: error: implicit declaration of function 'ioremap_nocache'; did you mean 'ioremap_cache'? [-Werror=implicit-function-declaration]
     329 |                 (pw_u64_t)(unsigned long)ioremap_nocache(
         |                                          ^~~~~~~~~~~~~~~
         |                                          ioremap_cache
   drivers/platform/x86/socwatch/sw_ops_provider.c:345:46: warning: assignment to 'volatile void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     345 |                 s_gbe_semaphore.hw_semaphore =
         |                                              ^
   drivers/platform/x86/socwatch/sw_ops_provider.c:349:46: warning: assignment to 'volatile void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     349 |                 s_gbe_semaphore.fw_semaphore =
         |                                              ^
   drivers/platform/x86/socwatch/sw_ops_provider.c: In function 'sw_socperf_available_i':
>> drivers/platform/x86/socwatch/sw_ops_provider.c:817:63: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     817 |                 pw_pr_debug("INFO: SoCPerf support is OFF!\n");
         |                                                               ^
   drivers/platform/x86/socwatch/sw_ops_provider.c: In function 'sw_write_pci_info_i':
   drivers/platform/x86/socwatch/sw_ops_provider.c:987:55: warning: suggest braces around empty body in an 'else' statement [-Wempty-body]
     987 |                         bus, device, function, offset);
         |                                                       ^
   cc1: some warnings being treated as errors
--
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c: In function 'sw_timestamp':
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:710:25: error: storage size of 'ts' isn't known
     710 |         struct timespec ts;
         |                         ^~
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:712:9: error: implicit declaration of function 'getnstimeofday' [-Werror=implicit-function-declaration]
     712 |         getnstimeofday(&ts);
         |         ^~~~~~~~~~~~~~
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:710:25: warning: unused variable 'ts' [-Wunused-variable]
     710 |         struct timespec ts;
         |                         ^~
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c: In function 'sw_handle_timer_wakeup_i':
>> drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:841:68: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     841 |                 pw_pr_warn("WARNING: could NOT produce message!\n");
         |                                                                    ^
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c: In function 'sw_handle_sched_wakeup_i':
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:891:68: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     891 |                 pw_pr_warn("WARNING: could NOT produce message!\n");
         |                                                                    ^
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c: In function 'sw_handle_apic_timer_wakeup_i':
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:913:68: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     913 |                 pw_pr_warn("WARNING: could NOT produce message!\n");
         |                                                                    ^
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c: In function 'sw_timestamp':
   drivers/platform/x86/socwatch/sw_trace_notifier_provider.c:714:1: warning: control reaches end of non-void function [-Wreturn-type]
     714 | }
         | ^
   cc1: some warnings being treated as errors


vim +/SOCPERF_Read_Data3 +203 drivers/platform/x86/socperf/socperfdrv.c

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
