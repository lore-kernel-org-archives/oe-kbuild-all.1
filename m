Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21658192D7E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 08:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301035; cv=none; b=kUTAi8sJE3aDT2u3kC+L2f8s5jm/EoOmKleL065AJulXuHw+DUhoVYRZXzPbKMAhtgH5gNTeyEyCmWClvVJ6NWiWqFWYgLoB+QmJPcl4vPxyjrbjsD7FgsXnkX92UnrHaFrF1XyZNE4us1dSaXOb2ZI722U0FHh5Pjq/m7YgGyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301035; c=relaxed/simple;
	bh=0j1iMAbTg4uy3Lr8NMqdTGV2Ipzt2yOR46jpF5fdxh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buz9V5pMe+meuoc3rmYz5xD+bXLNceLNqchOSoQ1Re6DQrS8C6nOv+g2dkuxebhmyDKtjFqOQ9MiVf2RP5BVGH44SmjVsCb88lmQ0NpOSeJKTbhmjG5V9WofC8UnHdE9DVU7HpfQiDrGr4jQXvNQWd1bD+Qqjk5z1oIj+mvoJiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=No2X3qBL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="No2X3qBL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733301032; x=1764837032;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0j1iMAbTg4uy3Lr8NMqdTGV2Ipzt2yOR46jpF5fdxh0=;
  b=No2X3qBLQaHo7BmfXohinWBX5NPM8GE+EPsOLwPJEdkHaAmw514tyi5F
   qYM79YWnTqLVZpOYRO9GK7UB4JDi8P/PlddpY0TWyLfS+eGHS1n7ahI4i
   21T1c5RyAmg1Qb/a5MZcJkSV+Mp2RjUzMIHPZU7uJKaPwCmZOCTFOqWhU
   QMxC/di3EbVSXR5akGi6fjFG3xr0CSK/lcMFycELNg1/GKRNarE3JiKy6
   uZGrw21e2L75s1RktVK1Ofgc9Q5+/JDX2Vz+8FVz0N44YPWbatsnVJcYD
   ypf0vEUrvX1OakqxRHQgyxJYAlaviGwAPS3siRpkya+tk4t+Sx6kCKNNb
   w==;
X-CSE-ConnectionGUID: Om0UnbX2T3SRD/Xzmkq67w==
X-CSE-MsgGUID: xIUa3McaQ1iq4gqtn9jF2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21135980"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="21135980"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:30:32 -0800
X-CSE-ConnectionGUID: aHH4g2RISVWqdUYigr605w==
X-CSE-MsgGUID: fviKtzg8Tzif+i7PzLpC7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="97760397"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 00:30:30 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIkm6-0002lX-1w;
	Wed, 04 Dec 2024 08:30:24 +0000
Date: Wed, 4 Dec 2024 16:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Levi Yun <yeoreum.yun@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Sudeep Holla <sudeep.holla@arm.com>
Subject: [linux-next:master 1570/1720] drivers/firmware/arm_ffa/bus.c:119:1:
 error: parameter '__UNIQUE_ID___addressable_ffa_bus_type387' is initialized
Message-ID: <202412041616.saBqc9dh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c245a7a79602ccbee780c004c1e4abcda66aec32
commit: cc5d45d2f1eb624c0ca77ea4fc57edc611e0ec34 [1570/1720] firmware: arm_ffa: Fix the race around setting ffa_dev->properties
config: arm64-randconfig-002-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041616.saBqc9dh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041616.saBqc9dh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041616.saBqc9dh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/firmware/arm_ffa/bus.c:8:
   include/linux/arm_ffa.h:173:1: warning: no previous prototype for 'ffa_device_register' [-Wmissing-prototypes]
     173 | ffa_device_register(const struct ffa_partition_info *part_info,
         | ^~~~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h: In function 'ffa_device_register':
   include/linux/arm_ffa.h:221:30: error: storage class specified for parameter 'ffa_bus_type'
     221 | extern const struct bus_type ffa_bus_type;
         |                              ^~~~~~~~~~~~
   include/linux/arm_ffa.h:227:1: warning: empty declaration
     227 | struct ffa_partition_info {
         | ^~~~~~
   include/linux/arm_ffa.h:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | {
         | ^
   include/linux/arm_ffa.h:260:1: warning: empty declaration
     260 | struct ffa_send_direct_data {
         | ^~~~~~
   include/linux/arm_ffa.h:268:1: warning: empty declaration
     268 | struct ffa_indirect_msg_hdr {
         | ^~~~~~
   include/linux/arm_ffa.h:277:1: warning: empty declaration
     277 | struct ffa_send_direct_data2 {
         | ^~~~~~
   include/linux/arm_ffa.h:281:1: warning: empty declaration
     281 | struct ffa_mem_region_addr_range {
         | ^~~~~~
   include/linux/arm_ffa.h:289:1: warning: empty declaration
     289 | struct ffa_composite_mem_region {
         | ^~~~~~
   include/linux/arm_ffa.h:303:1: warning: empty declaration
     303 | struct ffa_mem_region_attributes {
         | ^~~~~~
   include/linux/arm_ffa.h:329:1: warning: empty declaration
     329 | struct ffa_mem_region {
         | ^~~~~~
   include/linux/arm_ffa.h:407:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     407 | {
         | ^
   include/linux/arm_ffa.h:421:1: warning: empty declaration
     421 | struct ffa_mem_ops_args {
         | ^~~~~~
   include/linux/arm_ffa.h:431:1: warning: empty declaration
     431 | struct ffa_info_ops {
         | ^~~~~~
   include/linux/arm_ffa.h:437:1: warning: empty declaration
     437 | struct ffa_msg_ops {
         | ^~~~~~
   include/linux/arm_ffa.h:446:1: warning: empty declaration
     446 | struct ffa_mem_ops {
         | ^~~~~~
   include/linux/arm_ffa.h:452:1: warning: empty declaration
     452 | struct ffa_cpu_ops {
         | ^~~~~~
   include/linux/arm_ffa.h:456:16: error: storage class specified for parameter 'ffa_sched_recv_cb'
     456 | typedef void (*ffa_sched_recv_cb)(u16 vcpu, bool is_per_vcpu, void *cb_data);
         |                ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:457:16: error: storage class specified for parameter 'ffa_notifier_cb'
     457 | typedef void (*ffa_notifier_cb)(int notify_id, void *cb_data);
         |                ^~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:461:39: error: expected declaration specifiers or '...' before 'ffa_sched_recv_cb'
     461 |                                       ffa_sched_recv_cb cb, void *cb_data);
         |                                       ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:464:31: error: expected declaration specifiers or '...' before 'ffa_notifier_cb'
     464 |                               ffa_notifier_cb cb, void *cb_data, int notify_id);
         |                               ^~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:459:1: warning: empty declaration
     459 | struct ffa_notifier_ops {
         | ^~~~~~
   include/linux/arm_ffa.h:470:1: warning: empty declaration
     470 | struct ffa_ops {
         | ^~~~~~
   In file included from drivers/firmware/arm_ffa/common.h:10,
                    from drivers/firmware/arm_ffa/bus.c:16:
>> include/linux/arm-smccc.h:290:1: warning: empty declaration
     290 | enum arm_smccc_conduit {
         | ^~~~
>> include/linux/arm-smccc.h:316:13: error: section attribute not allowed for 'arm_smccc_version_init'
     316 | void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit);
         |             ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/arm-smccc.h:316:54: warning: 'cold' attribute ignored [-Wattributes]
     316 | void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit);
         |                                                      ^~~~~~~~~~~~~~~~~
   include/linux/arm-smccc.h:340:1: warning: empty declaration
     340 | struct arm_smccc_res {
         | ^~~~~~
   include/linux/arm-smccc.h:352:1: warning: empty declaration
     352 | struct arm_smccc_1_2_regs {
         | ^~~~~~
   include/linux/arm-smccc.h:408:1: warning: empty declaration
     408 | struct arm_smccc_quirk {
         | ^~~~~~
   drivers/firmware/arm_ffa/common.h:13:35: error: storage class specified for parameter 'ffa_value_t'
      13 | typedef struct arm_smccc_1_2_regs ffa_value_t;
         |                                   ^~~~~~~~~~~
   drivers/firmware/arm_ffa/common.h:15:47: error: expected ')' before '*' token
      15 | typedef void (ffa_fn)(ffa_value_t, ffa_value_t *);
         |                                               ^~
         |                                               )
   drivers/firmware/arm_ffa/common.h:17:6: error: redefinition of parameter 'ffa_device_is_valid'
      17 | bool ffa_device_is_valid(struct ffa_device *ffa_dev);
         |      ^~~~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:179:6: note: previous definition of 'ffa_device_is_valid' with type 'bool (*)(struct ffa_device *)' {aka '_Bool (*)(struct ffa_device *)'}
     179 | bool ffa_device_is_valid(struct ffa_device *ffa_dev);
         |      ^~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/common.h:21:31: error: unknown type name 'ffa_fn'
      21 | int __init ffa_transport_init(ffa_fn **invoke_ffa_fn);
         |                               ^~~~~~
   In file included from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/arm_ffa.h:10:
   drivers/firmware/arm_ffa/bus.c:20:19: error: storage class specified for parameter 'ffa_bus_id'
      20 | static DEFINE_IDA(ffa_bus_id);
         |                   ^~~~~~~~~~
   include/linux/idr.h:255:44: note: in definition of macro 'DEFINE_IDA'
     255 | #define DEFINE_IDA(name)        struct ida name = IDA_INIT(name)
         |                                            ^~~~
   include/linux/idr.h:255:40: error: parameter 'ffa_bus_id' is initialized
     255 | #define DEFINE_IDA(name)        struct ida name = IDA_INIT(name)
         |                                        ^~~
   drivers/firmware/arm_ffa/bus.c:20:8: note: in expansion of macro 'DEFINE_IDA'
      20 | static DEFINE_IDA(ffa_bus_id);
         |        ^~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:23:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      23 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:48:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      48 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:60:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      60 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:68:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      68 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:77:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      77 | {
         | ^
   include/linux/device.h:199:33: error: storage class specified for parameter 'dev_attr_modalias'
     199 |         struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
         |                                 ^~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:83:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      83 | static DEVICE_ATTR_RO(modalias);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:199:16: error: parameter 'dev_attr_modalias' is initialized
     199 |         struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
         |                ^~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:83:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      83 | static DEVICE_ATTR_RO(modalias);
         |        ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:83:23: error: 'modalias_show' undeclared (first use in this function)
      83 | static DEVICE_ATTR_RO(modalias);
         |                       ^~~~~~~~
   include/linux/sysfs.h:246:19: note: in definition of macro '__ATTR_RO'
     246 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/firmware/arm_ffa/bus.c:83:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      83 | static DEVICE_ATTR_RO(modalias);
         |        ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:83:23: note: each undeclared identifier is reported only once for each function it appears in
      83 | static DEVICE_ATTR_RO(modalias);
         |                       ^~~~~~~~
   include/linux/sysfs.h:246:19: note: in definition of macro '__ATTR_RO'
     246 |         .show   = _name##_show,                                         \
         |                   ^~~~~
   drivers/firmware/arm_ffa/bus.c:83:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      83 | static DEVICE_ATTR_RO(modalias);
         |        ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:87:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
      87 | {
         | ^
   include/linux/device.h:199:33: error: storage class specified for parameter 'dev_attr_partition_id'
     199 |         struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
         |                                 ^~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:92:8: note: in expansion of macro 'DEVICE_ATTR_RO'
      92 | static DEVICE_ATTR_RO(partition_id);
         |        ^~~~~~~~~~~~~~
   include/linux/device.h:199:16: error: parameter 'dev_attr_partition_id' is initialized
--
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   include/linux/sysfs.h:284:9: note: (near initialization for 'ffa_device_attributes_groups')
     284 |         &_name##_group,                                         \
         |         ^
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: warning: excess elements in scalar initializer
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/sysfs.h:285:9: note: in expansion of macro 'NULL'
     285 |         NULL,                                                   \
         |         ^~~~
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'ffa_device_attributes_groups')
       8 | #define NULL ((void *)0)
         |              ^
   include/linux/sysfs.h:285:9: note: in expansion of macro 'NULL'
     285 |         NULL,                                                   \
         |         ^~~~
   include/linux/sysfs.h:292:1: note: in expansion of macro '__ATTRIBUTE_GROUPS'
     292 | __ATTRIBUTE_GROUPS(_name)
         | ^~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:109:1: note: in expansion of macro 'ATTRIBUTE_GROUPS'
     109 | ATTRIBUTE_GROUPS(ffa_device_attributes);
         | ^~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:14: error: parameter 'ffa_bus_type' is initialized
     111 | const struct bus_type ffa_bus_type = {
         |              ^~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:23: error: redefinition of parameter 'ffa_bus_type'
     111 | const struct bus_type ffa_bus_type = {
         |                       ^~~~~~~~~~~~
   include/linux/arm_ffa.h:221:30: note: previous definition of 'ffa_bus_type' with type 'const struct bus_type'
     221 | extern const struct bus_type ffa_bus_type;
         |                              ^~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:113:27: error: 'ffa_device_match' undeclared (first use in this function); did you mean 'ffa_device_match_uuid'?
     113 |         .match          = ffa_device_match,
         |                           ^~~~~~~~~~~~~~~~
         |                           ffa_device_match_uuid
   drivers/firmware/arm_ffa/bus.c:114:27: error: 'ffa_device_probe' undeclared (first use in this function); did you mean 'ffa_device_id'?
     114 |         .probe          = ffa_device_probe,
         |                           ^~~~~~~~~~~~~~~~
         |                           ffa_device_id
   drivers/firmware/arm_ffa/bus.c:115:27: error: 'ffa_device_remove' undeclared (first use in this function); did you mean 'ffa_device_register'?
     115 |         .remove         = ffa_device_remove,
         |                           ^~~~~~~~~~~~~~~~~
         |                           ffa_device_register
   drivers/firmware/arm_ffa/bus.c:116:27: error: 'ffa_device_uevent' undeclared (first use in this function); did you mean 'ffa_device_register'?
     116 |         .uevent         = ffa_device_uevent,
         |                           ^~~~~~~~~~~~~~~~~
         |                           ffa_device_register
   In file included from include/linux/linkage.h:7,
                    from include/linux/printk.h:8,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/processor.h:33,
                    from include/linux/sched.h:13,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15:
   drivers/firmware/arm_ffa/bus.c:119:19: error: storage class specified for parameter 'ffa_bus_type'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:19: error: redefinition of parameter 'ffa_bus_type'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         |                   ^~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:111:23: note: previous definition of 'ffa_bus_type' with type 'const struct bus_type'
     111 | const struct bus_type ffa_bus_type = {
         |                       ^~~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_bus_type387'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:119:1: error: parameter '__UNIQUE_ID___addressable_ffa_bus_type387' is initialized
   drivers/firmware/arm_ffa/bus.c:119:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_bus_type387'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:119:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     119 | EXPORT_SYMBOL_GPL(ffa_bus_type);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:123:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     123 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:140:19: error: storage class specified for parameter 'ffa_driver_register'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:19: error: redefinition of parameter 'ffa_driver_register'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:176:5: note: previous definition of 'ffa_driver_register' with type 'int (*)(struct ffa_driver *, struct module *, const char *)'
     176 | int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
         |     ^~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_driver_register390'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:140:1: error: parameter '__UNIQUE_ID___addressable_ffa_driver_register390' is initialized
   drivers/firmware/arm_ffa/bus.c:140:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_driver_register390'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:140:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     140 | EXPORT_SYMBOL_GPL(ffa_driver_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:143:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     143 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:146:19: error: storage class specified for parameter 'ffa_driver_unregister'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:19: error: redefinition of parameter 'ffa_driver_unregister'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:178:6: note: previous definition of 'ffa_driver_unregister' with type 'void (*)(struct ffa_driver *)'
     178 | void ffa_driver_unregister(struct ffa_driver *driver);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_driver_unregister391'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:146:1: error: parameter '__UNIQUE_ID___addressable_ffa_driver_unregister391' is initialized
   drivers/firmware/arm_ffa/bus.c:146:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_driver_unregister391'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:146:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     146 | EXPORT_SYMBOL_GPL(ffa_driver_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:149:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     149 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:157:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     157 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:164:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     164 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:170:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     170 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:193:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     193 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:234:19: error: storage class specified for parameter 'ffa_device_register'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         |                   ^~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_device_register392'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:234:1: error: parameter '__UNIQUE_ID___addressable_ffa_device_register392' is initialized
   drivers/firmware/arm_ffa/bus.c:234:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_device_register392'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:234:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     234 | EXPORT_SYMBOL_GPL(ffa_device_register);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:237:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     237 | {
         | ^
   drivers/firmware/arm_ffa/bus.c:243:19: error: storage class specified for parameter 'ffa_device_unregister'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:19: error: redefinition of parameter 'ffa_device_unregister'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         |                   ^~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:56:28: note: in definition of macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/arm_ffa.h:175:6: note: previous definition of 'ffa_device_unregister' with type 'void (*)(struct ffa_device *)'
     175 | void ffa_device_unregister(struct ffa_device *ffa_dev);
         |      ^~~~~~~~~~~~~~~~~~~~~
>> include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_ffa_device_unregister393'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
>> drivers/firmware/arm_ffa/bus.c:243:1: error: parameter '__UNIQUE_ID___addressable_ffa_device_unregister393' is initialized
   drivers/firmware/arm_ffa/bus.c:243:1: warning: 'used' attribute ignored [-Wattributes]
>> include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_ffa_device_unregister393'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/compiler.h:229:9: note: in expansion of macro '___ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^~~~~~~~~~~~~~
   include/linux/export.h:57:9: note: in expansion of macro '__ADDRESSABLE'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^~~~~~~~~~~~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   include/linux/export.h:58:9: error: expected declaration specifiers before 'asm'
      58 |         asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
         |         ^~~
   include/linux/export.h:65:41: note: in expansion of macro '__EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^~~~~~~~~~~~~~~
   include/linux/export.h:69:41: note: in expansion of macro '_EXPORT_SYMBOL'
      69 | #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
         |                                         ^~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:243:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
     243 | EXPORT_SYMBOL_GPL(ffa_device_unregister);
         | ^~~~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:246:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     246 | {
         | ^
   In file included from include/linux/device/driver.h:21,
                    from include/linux/device.h:32:
>> include/linux/module.h:132:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     132 |         { return initfn; }                                      \
         |         ^
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/compiler_types.h:89:
   drivers/firmware/arm_ffa/bus.c:249:17: error: 'arm_ffa_bus_init' undeclared (first use in this function)
     249 | subsys_initcall(arm_ffa_bus_init);
         |                 ^~~~~~~~~~~~~~~~
   include/linux/compiler_attributes.h:92:65: note: in definition of macro '__copy'
      92 | # define __copy(symbol)                 __attribute__((__copy__(symbol)))
         |                                                                 ^~~~~~
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
>> include/linux/module.h:132:9: warning: 'alias' attribute ignored [-Wattributes]
     132 |         { return initfn; }                                      \
         |         ^
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/compiler.h:189:45: error: storage class specified for parameter '__UNIQUE_ID___addressable_init_module394'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/module.h:135:9: note: in expansion of macro '___ADDRESSABLE'
     135 |         ___ADDRESSABLE(init_module, __initdata);
         |         ^~~~~~~~~~~~~~
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/module.h:132:9: error: parameter '__UNIQUE_ID___addressable_init_module394' is initialized
     132 |         { return initfn; }                                      \
         |         ^
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/module.h:132:9: warning: 'used' attribute ignored [-Wattributes]
     132 |         { return initfn; }                                      \
         |         ^
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/compiler.h:189:45: error: section attribute not allowed for '__UNIQUE_ID___addressable_init_module394'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                             ^~~~~~~~~~~~
   include/linux/compiler_types.h:83:23: note: in definition of macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/compiler.h:189:29: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^~~~~~~
   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:189:37: note: in expansion of macro '__PASTE'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/compiler.h:227:9: note: in expansion of macro '__UNIQUE_ID'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |         ^~~~~~~~~~~
   include/linux/module.h:135:9: note: in expansion of macro '___ADDRESSABLE'
     135 |         ___ADDRESSABLE(init_module, __initdata);
         |         ^~~~~~~~~~~~~~
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   include/linux/module.h:135:48: error: expected declaration specifiers before ';' token
     135 |         ___ADDRESSABLE(init_module, __initdata);
         |                                                ^
   include/linux/module.h:117:41: note: in expansion of macro 'module_init'
     117 | #define subsys_initcall(fn)             module_init(fn)
         |                                         ^~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:1: note: in expansion of macro 'subsys_initcall'
     249 | subsys_initcall(arm_ffa_bus_init);
         | ^~~~~~~~~~~~~~~
   drivers/firmware/arm_ffa/bus.c:249:34: error: expected declaration specifiers before ';' token
     249 | subsys_initcall(arm_ffa_bus_init);
         |                                  ^
   drivers/firmware/arm_ffa/bus.c:252:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     252 | {
         | ^
   include/linux/module.h:140:9: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
     140 |         { return exitfn; }                                      \
         |         ^
   drivers/firmware/arm_ffa/bus.c:257:1: note: in expansion of macro 'module_exit'
     257 | module_exit(arm_ffa_bus_exit);
..


vim +/__UNIQUE_ID___addressable_ffa_bus_type387 +119 drivers/firmware/arm_ffa/bus.c

e781858488b918e Sudeep Holla        2021-05-21  110  
989e8661dc45bab Ricardo B. Marliere 2024-02-11  111  const struct bus_type ffa_bus_type = {
e781858488b918e Sudeep Holla        2021-05-21  112  	.name		= "arm_ffa",
e781858488b918e Sudeep Holla        2021-05-21  113  	.match		= ffa_device_match,
e781858488b918e Sudeep Holla        2021-05-21  114  	.probe		= ffa_device_probe,
244f5d597e1ea51 Sudeep Holla        2021-09-24  115  	.remove		= ffa_device_remove,
e781858488b918e Sudeep Holla        2021-05-21  116  	.uevent		= ffa_device_uevent,
e781858488b918e Sudeep Holla        2021-05-21  117  	.dev_groups	= ffa_device_attributes_groups,
e781858488b918e Sudeep Holla        2021-05-21  118  };
e781858488b918e Sudeep Holla        2021-05-21 @119  EXPORT_SYMBOL_GPL(ffa_bus_type);
e781858488b918e Sudeep Holla        2021-05-21  120  
e781858488b918e Sudeep Holla        2021-05-21  121  int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
e781858488b918e Sudeep Holla        2021-05-21  122  			const char *mod_name)
e781858488b918e Sudeep Holla        2021-05-21  123  {
e781858488b918e Sudeep Holla        2021-05-21  124  	int ret;
e781858488b918e Sudeep Holla        2021-05-21  125  
92743071464fca5 Uwe Kleine-König    2021-06-21  126  	if (!driver->probe)
92743071464fca5 Uwe Kleine-König    2021-06-21  127  		return -EINVAL;
92743071464fca5 Uwe Kleine-König    2021-06-21  128  
e781858488b918e Sudeep Holla        2021-05-21  129  	driver->driver.bus = &ffa_bus_type;
e781858488b918e Sudeep Holla        2021-05-21  130  	driver->driver.name = driver->name;
e781858488b918e Sudeep Holla        2021-05-21  131  	driver->driver.owner = owner;
e781858488b918e Sudeep Holla        2021-05-21  132  	driver->driver.mod_name = mod_name;
e781858488b918e Sudeep Holla        2021-05-21  133  
e781858488b918e Sudeep Holla        2021-05-21  134  	ret = driver_register(&driver->driver);
e781858488b918e Sudeep Holla        2021-05-21  135  	if (!ret)
e781858488b918e Sudeep Holla        2021-05-21  136  		pr_debug("registered new ffa driver %s\n", driver->name);
e781858488b918e Sudeep Holla        2021-05-21  137  
e781858488b918e Sudeep Holla        2021-05-21  138  	return ret;
e781858488b918e Sudeep Holla        2021-05-21  139  }
e781858488b918e Sudeep Holla        2021-05-21 @140  EXPORT_SYMBOL_GPL(ffa_driver_register);
e781858488b918e Sudeep Holla        2021-05-21  141  
e781858488b918e Sudeep Holla        2021-05-21  142  void ffa_driver_unregister(struct ffa_driver *driver)
e781858488b918e Sudeep Holla        2021-05-21  143  {
e781858488b918e Sudeep Holla        2021-05-21  144  	driver_unregister(&driver->driver);
e781858488b918e Sudeep Holla        2021-05-21  145  }
e781858488b918e Sudeep Holla        2021-05-21 @146  EXPORT_SYMBOL_GPL(ffa_driver_unregister);
e781858488b918e Sudeep Holla        2021-05-21  147  
e781858488b918e Sudeep Holla        2021-05-21  148  static void ffa_release_device(struct device *dev)
e781858488b918e Sudeep Holla        2021-05-21  149  {
e781858488b918e Sudeep Holla        2021-05-21  150  	struct ffa_device *ffa_dev = to_ffa_dev(dev);
e781858488b918e Sudeep Holla        2021-05-21  151  
19b8766459c41c6 Sudeep Holla        2023-04-20  152  	ida_free(&ffa_bus_id, ffa_dev->id);
e781858488b918e Sudeep Holla        2021-05-21  153  	kfree(ffa_dev);
e781858488b918e Sudeep Holla        2021-05-21  154  }
e781858488b918e Sudeep Holla        2021-05-21  155  
e781858488b918e Sudeep Holla        2021-05-21  156  static int __ffa_devices_unregister(struct device *dev, void *data)
e781858488b918e Sudeep Holla        2021-05-21  157  {
eb7b52e6db7c214 Sudeep Holla        2021-09-24  158  	device_unregister(dev);
e781858488b918e Sudeep Holla        2021-05-21  159  
e781858488b918e Sudeep Holla        2021-05-21  160  	return 0;
e781858488b918e Sudeep Holla        2021-05-21  161  }
e781858488b918e Sudeep Holla        2021-05-21  162  
e781858488b918e Sudeep Holla        2021-05-21  163  static void ffa_devices_unregister(void)
e781858488b918e Sudeep Holla        2021-05-21  164  {
e781858488b918e Sudeep Holla        2021-05-21  165  	bus_for_each_dev(&ffa_bus_type, NULL, NULL,
e781858488b918e Sudeep Holla        2021-05-21  166  			 __ffa_devices_unregister);
e781858488b918e Sudeep Holla        2021-05-21  167  }
e781858488b918e Sudeep Holla        2021-05-21  168  
e781858488b918e Sudeep Holla        2021-05-21  169  bool ffa_device_is_valid(struct ffa_device *ffa_dev)
e781858488b918e Sudeep Holla        2021-05-21  170  {
e781858488b918e Sudeep Holla        2021-05-21  171  	bool valid = false;
e781858488b918e Sudeep Holla        2021-05-21  172  	struct device *dev = NULL;
e781858488b918e Sudeep Holla        2021-05-21  173  	struct ffa_device *tmp_dev;
e781858488b918e Sudeep Holla        2021-05-21  174  
e781858488b918e Sudeep Holla        2021-05-21  175  	do {
e781858488b918e Sudeep Holla        2021-05-21  176  		dev = bus_find_next_device(&ffa_bus_type, dev);
e781858488b918e Sudeep Holla        2021-05-21  177  		tmp_dev = to_ffa_dev(dev);
e781858488b918e Sudeep Holla        2021-05-21  178  		if (tmp_dev == ffa_dev) {
e781858488b918e Sudeep Holla        2021-05-21  179  			valid = true;
e781858488b918e Sudeep Holla        2021-05-21  180  			break;
e781858488b918e Sudeep Holla        2021-05-21  181  		}
e781858488b918e Sudeep Holla        2021-05-21  182  		put_device(dev);
e781858488b918e Sudeep Holla        2021-05-21  183  	} while (dev);
e781858488b918e Sudeep Holla        2021-05-21  184  
e781858488b918e Sudeep Holla        2021-05-21  185  	put_device(dev);
e781858488b918e Sudeep Holla        2021-05-21  186  
e781858488b918e Sudeep Holla        2021-05-21  187  	return valid;
e781858488b918e Sudeep Holla        2021-05-21  188  }
e781858488b918e Sudeep Holla        2021-05-21  189  
cc5d45d2f1eb624 Levi Yun            2024-12-03  190  struct ffa_device *
cc5d45d2f1eb624 Levi Yun            2024-12-03  191  ffa_device_register(const struct ffa_partition_info *part_info,
7aa7a9798955701 Sudeep Holla        2022-09-07  192  		    const struct ffa_ops *ops)
e781858488b918e Sudeep Holla        2021-05-21  193  {
19b8766459c41c6 Sudeep Holla        2023-04-20  194  	int id, ret;
cc5d45d2f1eb624 Levi Yun            2024-12-03  195  	uuid_t uuid;
e781858488b918e Sudeep Holla        2021-05-21  196  	struct device *dev;
e781858488b918e Sudeep Holla        2021-05-21  197  	struct ffa_device *ffa_dev;
e781858488b918e Sudeep Holla        2021-05-21  198  
cc5d45d2f1eb624 Levi Yun            2024-12-03  199  	if (!part_info)
cc5d45d2f1eb624 Levi Yun            2024-12-03  200  		return NULL;
cc5d45d2f1eb624 Levi Yun            2024-12-03  201  
19b8766459c41c6 Sudeep Holla        2023-04-20  202  	id = ida_alloc_min(&ffa_bus_id, 1, GFP_KERNEL);
19b8766459c41c6 Sudeep Holla        2023-04-20  203  	if (id < 0)
19b8766459c41c6 Sudeep Holla        2023-04-20  204  		return NULL;
19b8766459c41c6 Sudeep Holla        2023-04-20  205  
e781858488b918e Sudeep Holla        2021-05-21  206  	ffa_dev = kzalloc(sizeof(*ffa_dev), GFP_KERNEL);
19b8766459c41c6 Sudeep Holla        2023-04-20  207  	if (!ffa_dev) {
19b8766459c41c6 Sudeep Holla        2023-04-20  208  		ida_free(&ffa_bus_id, id);
e781858488b918e Sudeep Holla        2021-05-21  209  		return NULL;
19b8766459c41c6 Sudeep Holla        2023-04-20  210  	}
e781858488b918e Sudeep Holla        2021-05-21  211  
e781858488b918e Sudeep Holla        2021-05-21  212  	dev = &ffa_dev->dev;
e781858488b918e Sudeep Holla        2021-05-21  213  	dev->bus = &ffa_bus_type;
e781858488b918e Sudeep Holla        2021-05-21  214  	dev->release = ffa_release_device;
19b8766459c41c6 Sudeep Holla        2023-04-20  215  	dev_set_name(&ffa_dev->dev, "arm-ffa-%d", id);
e781858488b918e Sudeep Holla        2021-05-21  216  
7d0bc6360f17ea3 Sudeep Holla        2023-10-03  217  	ffa_dev->id = id;
cc5d45d2f1eb624 Levi Yun            2024-12-03  218  	ffa_dev->vm_id = part_info->id;
cc5d45d2f1eb624 Levi Yun            2024-12-03  219  	ffa_dev->properties = part_info->properties;
d01387fc16421cb Sudeep Holla        2022-09-07  220  	ffa_dev->ops = ops;
cc5d45d2f1eb624 Levi Yun            2024-12-03  221  	import_uuid(&uuid, (u8 *)part_info->uuid);
cc5d45d2f1eb624 Levi Yun            2024-12-03  222  	uuid_copy(&ffa_dev->uuid, &uuid);
e781858488b918e Sudeep Holla        2021-05-21  223  
e781858488b918e Sudeep Holla        2021-05-21  224  	ret = device_register(&ffa_dev->dev);
e781858488b918e Sudeep Holla        2021-05-21  225  	if (ret) {
e781858488b918e Sudeep Holla        2021-05-21  226  		dev_err(dev, "unable to register device %s err=%d\n",
e781858488b918e Sudeep Holla        2021-05-21  227  			dev_name(dev), ret);
e781858488b918e Sudeep Holla        2021-05-21  228  		put_device(dev);
e781858488b918e Sudeep Holla        2021-05-21  229  		return NULL;
e781858488b918e Sudeep Holla        2021-05-21  230  	}
e781858488b918e Sudeep Holla        2021-05-21  231  
e781858488b918e Sudeep Holla        2021-05-21  232  	return ffa_dev;
e781858488b918e Sudeep Holla        2021-05-21  233  }
e781858488b918e Sudeep Holla        2021-05-21 @234  EXPORT_SYMBOL_GPL(ffa_device_register);
e781858488b918e Sudeep Holla        2021-05-21  235  
e781858488b918e Sudeep Holla        2021-05-21  236  void ffa_device_unregister(struct ffa_device *ffa_dev)
e781858488b918e Sudeep Holla        2021-05-21  237  {
e781858488b918e Sudeep Holla        2021-05-21  238  	if (!ffa_dev)
e781858488b918e Sudeep Holla        2021-05-21  239  		return;
e781858488b918e Sudeep Holla        2021-05-21  240  
e781858488b918e Sudeep Holla        2021-05-21  241  	device_unregister(&ffa_dev->dev);
e781858488b918e Sudeep Holla        2021-05-21  242  }
e781858488b918e Sudeep Holla        2021-05-21 @243  EXPORT_SYMBOL_GPL(ffa_device_unregister);
e781858488b918e Sudeep Holla        2021-05-21  244  
18c250bd7ed0fc6 Sudeep Holla        2024-05-15  245  static int __init arm_ffa_bus_init(void)
e781858488b918e Sudeep Holla        2021-05-21  246  {
e781858488b918e Sudeep Holla        2021-05-21  247  	return bus_register(&ffa_bus_type);
e781858488b918e Sudeep Holla        2021-05-21  248  }
18c250bd7ed0fc6 Sudeep Holla        2024-05-15  249  subsys_initcall(arm_ffa_bus_init);
e781858488b918e Sudeep Holla        2021-05-21  250  
18c250bd7ed0fc6 Sudeep Holla        2024-05-15  251  static void __exit arm_ffa_bus_exit(void)
e781858488b918e Sudeep Holla        2021-05-21  252  {
e781858488b918e Sudeep Holla        2021-05-21  253  	ffa_devices_unregister();
e781858488b918e Sudeep Holla        2021-05-21  254  	bus_unregister(&ffa_bus_type);
19b8766459c41c6 Sudeep Holla        2023-04-20  255  	ida_destroy(&ffa_bus_id);
e781858488b918e Sudeep Holla        2021-05-21  256  }
18c250bd7ed0fc6 Sudeep Holla        2024-05-15  257  module_exit(arm_ffa_bus_exit);
18c250bd7ed0fc6 Sudeep Holla        2024-05-15  258  
18c250bd7ed0fc6 Sudeep Holla        2024-05-15 @259  MODULE_ALIAS("ffa-core");
18c250bd7ed0fc6 Sudeep Holla        2024-05-15 @260  MODULE_AUTHOR("Sudeep Holla <sudeep.holla@arm.com>");
18c250bd7ed0fc6 Sudeep Holla        2024-05-15 @261  MODULE_DESCRIPTION("ARM FF-A bus");
18c250bd7ed0fc6 Sudeep Holla        2024-05-15 @262  MODULE_LICENSE("GPL");

:::::: The code at line 119 was first introduced by commit
:::::: e781858488b918e30a6ff28e9eab6058b787e3b3 firmware: arm_ffa: Add initial FFA bus support for device enumeration

:::::: TO: Sudeep Holla <sudeep.holla@arm.com>
:::::: CC: Sudeep Holla <sudeep.holla@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
