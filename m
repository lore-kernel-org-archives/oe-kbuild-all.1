Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0AE605AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706530420; cv=none; b=ca6/MMYTpKfeos0NGflqwzk5RJIZP3w3T0jipdxHOpCj9p55ksZUUbYgiTXrmEyOMEZJP7InvRvBcfNMBU87Qy0nIk0JvKQh4asLfGsXWEHkVMPRvBXI+5UNT/HTC3dpZ8luk1VHwWff/9HSzX6SlItCY+yzklxGJn77kp7CO4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706530420; c=relaxed/simple;
	bh=Mitid9OHOsMycrKigo/VpTW59xDfmWOlVW7Sqi2FJq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZPJKvF7JYB/SjNR9MDzQcR03NaQlnEaDjN075+4dymW/ZC/GA0I48Kc3HsSQfoGzdShWiAj55ajkv4tBsbf6cMMrzHckmskmt6lBZEj8sySAEK2T0V0BohKy1e5cQnnDbfburwWWFCXuEuEu9GIfILW3e5kzyKoRDJTeinXBKYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMTvIZvs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMTvIZvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706530418; x=1738066418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mitid9OHOsMycrKigo/VpTW59xDfmWOlVW7Sqi2FJq4=;
  b=UMTvIZvsiedX5Um12oyw6fNW7+j/BTmERhdqw/ir/6pnPRRwD9JjdhUo
   sdORXss3zw2yNULdiCLTlVtwVsaVB0Gsam25DQidPNMJwP89HfJsOuJX+
   /LoQK9J1eftomNiwP+sriO57NGftKU2nF/92BQ5tUk6l4unghZ9opWDtD
   EQnPCYyke0udhnSQZSc12Gt4gc83BEtVEISqautBvITT3oRi7K7jEPJhd
   VLcTSL5Sg4uJb/xfa2URSZwxu/Cxpq5tpS2i+36sGHa9Ewb30us1uUPCR
   4huMp/ObeVD9y+KmIwIe2UgE708D59pii1G311kBYZ1WyKV3lmAw8sCR1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10318332"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="10318332"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 04:13:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="3351761"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Jan 2024 04:13:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUQW4-0004HQ-0k;
	Mon, 29 Jan 2024 12:13:32 +0000
Date: Mon, 29 Jan 2024 20:12:47 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [davidhildenbrand:fork_rmap_batching_mm_unstable 104/141] make[4]:
 *** No rule to make target 'kernel/elfcorehdr.o', needed by
 'kernel/built-in.a'.
Message-ID: <202401292018.RTtZWk0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baoquan,

First bad commit (maybe != root cause):

tree:   https://github.com/davidhildenbrand/linux fork_rmap_batching_mm_unstable
head:   b652ec55c236cca5d0247cf66864971cc2ffea2d
commit: 21b8f7d4d9d70fec7ff6bbd973e485fa1226b156 [104/141] crash: remove dependency of FA_DUMP on CRASH_DUMP
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401292018.RTtZWk0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401292018.RTtZWk0P-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdomain.c:1052: warning: Function parameter or struct member 'out_type' not described in 'irq_domain_translate_onecell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or struct member 'd' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or struct member 'fwspec' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or struct member 'out_hwirq' not described in 'irq_domain_translate_twocell'
   kernel/irq/irqdomain.c:1073: warning: Function parameter or struct member 'out_type' not described in 'irq_domain_translate_twocell'
   net/8021q/vlan.c: In function 'register_vlan_device':
   net/8021q/vlan.c:247:46: warning: '%i' directive output may be truncated writing between 1 and 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                              ^~
   net/8021q/vlan.c:247:42: note: directive argument in the range [0, 4094]
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                                          ^~~~~~~
   net/8021q/vlan.c:247:17: note: 'snprintf' output between 3 and 21 bytes into a destination of size 16
     247 |                 snprintf(name, IFNAMSIZ, "%s.%i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/8021q/vlan.c:235:46: warning: '%.4i' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                              ^~~~
   net/8021q/vlan.c:235:42: note: directive argument in the range [0, 4094]
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                                          ^~~~~~~~~
   net/8021q/vlan.c:235:17: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     235 |                 snprintf(name, IFNAMSIZ, "%s.%.4i", real_dev->name, vlan_id);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/9p/trans_fd.c:133: warning: Excess struct member 'req' description in 'p9_conn'
   arch/x86/kernel/apic/apic.c:2170: warning: Function parameter or struct member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ'
   arch/x86/kernel/apic/apic.c:2170: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ() instead
   kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
     120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
     121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
     122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
     123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   kernel/time/hrtimer.c: In function '__run_hrtimer':
   kernel/time/hrtimer.c:1651:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
    1651 |         bool expires_in_hardirq;
         |              ^~~~~~~~~~~~~~~~~~
   kernel/time/timekeeping.c:2423: warning: Function parameter or struct member 'txc' not described in 'do_adjtimex'
   kernel/time/timekeeping.c:2491: warning: Function parameter or struct member 'phase_ts' not described in 'hardpps'
   kernel/time/timekeeping.c:2491: warning: Function parameter or struct member 'raw_ts' not described in 'hardpps'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'priv' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'heap_devt' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'list' not described in 'dma_heap'
   drivers/dma-buf/dma-heap.c:44: warning: Function parameter or struct member 'heap_cdev' not described in 'dma_heap'
   drivers/base/power/runtime.c:363: warning: Excess function parameter 'dev' description in '__rpm_callback'
   fs/proc/proc_net.c:161: warning: Function parameter or struct member 'state_size' not described in 'proc_create_net_data_write'
   In file included from include/asm-generic/bug.h:22,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/spinlock.h:60,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from drivers/scsi/scsi_devinfo.c:3:
   drivers/scsi/scsi_devinfo.c: In function 'scsi_dev_info_list_add_str':
   include/linux/kern_levels.h:5:25: warning: '%s' directive argument is null [-Wformat-overflow=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   drivers/scsi/scsi_devinfo.c:554:25: note: in expansion of macro 'printk'
     554 |                         printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
         |                         ^~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   drivers/scsi/scsi_devinfo.c:554:32: note: in expansion of macro 'KERN_ERR'
     554 |                         printk(KERN_ERR "%s: bad dev info string '%s' '%s'"
         |                                ^~~~~~~~
   kernel/time/tick-oneshot.c:24: warning: Function parameter or struct member 'expires' not described in 'tick_program_event'
   kernel/time/tick-oneshot.c:24: warning: Function parameter or struct member 'force' not described in 'tick_program_event'
   kernel/time/tick-oneshot.c:64: warning: Function parameter or struct member 'newdev' not described in 'tick_setup_oneshot'
   kernel/time/tick-oneshot.c:64: warning: Function parameter or struct member 'handler' not described in 'tick_setup_oneshot'
   kernel/time/tick-oneshot.c:64: warning: Function parameter or struct member 'next_event' not described in 'tick_setup_oneshot'
   kernel/time/tick-oneshot.c:74: warning: Function parameter or struct member 'handler' not described in 'tick_switch_to_oneshot'
   kernel/time/tick-broadcast.c:1026: warning: Function parameter or struct member 'bc' not described in 'tick_broadcast_setup_oneshot'
   kernel/time/tick-broadcast.c:1026: warning: Function parameter or struct member 'from_periodic' not described in 'tick_broadcast_setup_oneshot'
   drivers/firewire/init_ohci1394_dma.c:178: warning: Function parameter or struct member 'ohci' not described in 'init_ohci1394_wait_for_busresets'
   drivers/firewire/init_ohci1394_dma.c:196: warning: Function parameter or struct member 'ohci' not described in 'init_ohci1394_enable_physical_dma'
   drivers/firewire/init_ohci1394_dma.c:207: warning: Function parameter or struct member 'ohci' not described in 'init_ohci1394_reset_and_init_dma'
   drivers/firewire/init_ohci1394_dma.c:236: warning: Function parameter or struct member 'num' not described in 'init_ohci1394_controller'
   drivers/firewire/init_ohci1394_dma.c:236: warning: Function parameter or struct member 'slot' not described in 'init_ohci1394_controller'
   drivers/firewire/init_ohci1394_dma.c:236: warning: Function parameter or struct member 'func' not described in 'init_ohci1394_controller'
   drivers/firewire/init_ohci1394_dma.c:289: warning: Function parameter or struct member 'opt' not described in 'setup_ohci1394_dma'
>> make[4]: *** No rule to make target 'kernel/elfcorehdr.o', needed by 'kernel/built-in.a'.
   kernel/time/tick-sched.c:650: warning: Function parameter or struct member 'now' not described in 'tick_nohz_update_jiffies'
   kernel/time/tick-sched.c:1285: warning: Function parameter or struct member 'cpu' not described in 'tick_nohz_get_idle_calls_cpu'
   drivers/base/module.c: In function 'module_add_driver':
   drivers/base/module.c:36:13: warning: variable 'no_warn' set but not used [-Wunused-but-set-variable]
      36 |         int no_warn;
         |             ^~~~~~~
   arch/x86/kernel/cpu/sgx/main.c:740: warning: Function parameter or struct member 'low' not described in 'sgx_calc_section_metric'
   arch/x86/kernel/cpu/sgx/main.c:740: warning: Function parameter or struct member 'high' not described in 'sgx_calc_section_metric'
   arch/x86/kernel/cpu/sgx/main.c:740: warning: expecting prototype for A section metric is concatenated in a way that @low bits 12(). Prototype was for sgx_calc_section_metric() instead
   In file included from drivers/net/usb/asix.h:28,
                    from drivers/net/usb/ax88172a.c:15:
   drivers/net/usb/ax88172a.c: In function 'ax88172a_reset':
   include/linux/phy.h:300:20: warning: '%s' directive output may be truncated writing up to 60 bytes into a region of size 20 [-Wformat-truncation=]
     300 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/usb/ax88172a.c:311:38: note: in expansion of macro 'PHY_ID_FMT'
     311 |         snprintf(priv->phy_name, 20, PHY_ID_FMT,
         |                                      ^~~~~~~~~~
   include/linux/phy.h:300:21: note: format string is defined here
     300 | #define PHY_ID_FMT "%s:%02x"
         |                     ^~
   include/linux/phy.h:300:20: note: directive argument in the range [0, 65535]
     300 | #define PHY_ID_FMT "%s:%02x"
         |                    ^~~~~~~~~
   drivers/net/usb/ax88172a.c:311:38: note: in expansion of macro 'PHY_ID_FMT'
     311 |         snprintf(priv->phy_name, 20, PHY_ID_FMT,
         |                                      ^~~~~~~~~~
   drivers/net/usb/ax88172a.c:311:9: note: 'snprintf' output between 4 and 66 bytes into a destination of size 20
     311 |         snprintf(priv->phy_name, 20, PHY_ID_FMT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     312 |                  priv->mdio->id, priv->phy_addr);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/usb.c: In function 'usb_alloc_dev':
   drivers/usb/core/usb.c:706:37: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                     ^~
   drivers/usb/core/usb.c:706:33: note: using the range [-2147483648, 2147483647] for directive argument
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                 ^~~~~~~
   drivers/usb/core/usb.c:705:25: note: 'snprintf' output between 3 and 28 bytes into a destination of size 16
     705 |                         snprintf(dev->devpath, sizeof dev->devpath,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     706 |                                 "%s.%d", parent->devpath, port1);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/core/hcd.c: In function 'rh_string':
   drivers/usb/core/hcd.c:443:48: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 35 and 99 [-Wformat-truncation=]
     443 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
         |                                                ^~
     444 |                         init_utsname()->release, hcd->driver->description);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~ 
   drivers/usb/core/hcd.c:443:17: note: 'snprintf' output 3 or more bytes (assuming 131) into a destination of size 100
     443 |                 snprintf (buf, sizeof buf, "%s %s %s", init_utsname()->sysname,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     444 |                         init_utsname()->release, hcd->driver->description);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/audit.c: In function 'audit_log_vformat':
   kernel/audit.c:1979:9: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1979 |         len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args);
         |         ^~~
   kernel/audit.c:1988:17: warning: function 'audit_log_vformat' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1988 |                 len = vsnprintf(skb_tail_pointer(skb), avail, fmt, args2);
         |                 ^~~
   drivers/input/keyboard/atkbd.c: In function 'atkbd_set_device_attrs':
   drivers/input/keyboard/atkbd.c:1193:21: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
    1193 |                  "%s/input0", atkbd->ps2dev.serio->phys);
         |                     ^~~~~~~
   drivers/input/keyboard/atkbd.c:1192:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
    1192 |         snprintf(atkbd->phys, sizeof(atkbd->phys),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1193 |                  "%s/input0", atkbd->ps2dev.serio->phys);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/psmouse-base.c: In function 'psmouse_connect':
   drivers/input/mouse/psmouse-base.c:1603:59: warning: '/input0' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
    1603 |         snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", serio->phys);
         |                                                           ^~~~~~~
   drivers/input/mouse/psmouse-base.c:1603:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
    1603 |         snprintf(psmouse->phys, sizeof(psmouse->phys), "%s/input0", serio->phys);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/input/mouse/alps.c: In function 'alps_register_bare_ps2_mouse':
   drivers/input/mouse/alps.c:1419:56: warning: '%s' directive output may be truncated writing 6 bytes into a region of size between 0 and 31 [-Wformat-truncation=]
    1419 |         snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
         |                                                        ^~
   drivers/input/mouse/alps.c:1419:9: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
    1419 |         snprintf(priv->phys3, sizeof(priv->phys3), "%s/%s",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1420 |                  psmouse->ps2dev.serio->phys,
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1421 |                  (priv->dev2 ? "input2" : "input1"));
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kprobes.c:145: warning: Function parameter or struct member 'c' not described in '__get_insn_slot'
   drivers/input/mouse/elantech.c: In function 'elantech_setup_ps2':
   drivers/input/mouse/elantech.c:2090:65: warning: '/input1' directive output may be truncated writing 7 bytes into a region of size between 1 and 32 [-Wformat-truncation=]
    2090 |                 snprintf(etd->tp_phys, sizeof(etd->tp_phys), "%s/input1",
         |                                                                 ^~~~~~~
   drivers/input/mouse/elantech.c:2090:17: note: 'snprintf' output between 8 and 39 bytes into a destination of size 32
    2090 |                 snprintf(etd->tp_phys, sizeof(etd->tp_phys), "%s/input1",
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2091 |                         psmouse->ps2dev.serio->phys);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/relay.c: In function 'relay_create_buf_file':

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
