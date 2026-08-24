Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4225B2F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 04:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787544479; cv=none; b=Rc8xiYU1AulBThdiIQBt7Ev935+bIcFvMJp3Pmopoadp2LKapeakXeabW6TeW5OIkNmRBfzF8SCU59VCW4i1Xg8zHsierBfsQhoGO8dhhzmKPIUJpZ6/3oGnU273WImnrsZfPRU/1JKooFGhdnxLDY9K+e5PuCXXIJWNmclUKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787544479; c=relaxed/simple;
	bh=gPLIv+Mrv+MPJVBq0pyDWa72EAgY/GrFxd3e1gUim0c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YXjadMQsTX/GtJWoi0+Mzgj25B35xq6dsFdJ9pYTfAl2VXRjBT8wD8BXu/xKU6pgsGhehQP8B7HbD761cMvj2YW9DJqIG601I/fC1SVmUGPViKUWRED0we+c7FEIIwGZP67gupAuXREkYPR57tLC0iB1GOAxZ6qV+dH3sHghXw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bQaQbMxO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQaQbMxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787544476; x=1819080476;
  h=date:from:to:cc:subject:message-id;
  bh=gPLIv+Mrv+MPJVBq0pyDWa72EAgY/GrFxd3e1gUim0c=;
  b=bQaQbMxOXv5EC73HlY0b5Q8t5wPDhknhFpRw89uZrL1wgEHMJ+WTCOs6
   Y66Gz2VvPZN/gqK63Rjt0HCGX6z64Wx2dkFwrVT/5Tx1Wo6Fb8PDzzBCs
   8xxQ7t5IXrh5y36WaZYSLG2z9LS56GqtI/hIyrwC8GTb/BAE8WX8IAo1m
   T6vEorLyzuptO1pF+XhB9yLaolP/t3B+37PS+h2WL59LzXu8/YJDRr7ZL
   5HsU/DSozbDnk97lsqp3SppzJUpVamLRu4CwTr8ElMNu/Kwpjq+N/pYbr
   NajDTz04PstlTthXRsSuriT6yMrc/1zoWAZF5i5lf199Nv+1zWeFdy52E
   A==;
X-CSE-ConnectionGUID: 9ZRcOq9zTmaijXAOybKOfg==
X-CSE-MsgGUID: D+1GwxufQFSaPXj95cjl/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="113522886"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="113522886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 21:07:53 -0700
X-CSE-ConnectionGUID: ga0tvwA/T0++rMRmrQUmTg==
X-CSE-MsgGUID: jSeOYjCvSeGs93V9lfozUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; 
   d="scan'208";a="266929127"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 23 Aug 2026 21:07:52 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyLyP-000000000Gb-1QgU;
	Mon, 24 Aug 2026 04:07:49 +0000
Date: Mon, 24 Aug 2026 06:07:35 +0200
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/270-thunderbolt 19/19]
 drivers/thunderbolt/apple.c:701:34: error: implicit declaration of function
 'typec_thunderbolt_switch_get_drvdata'; did you mean
 'typec_switch_get_drvdata'?
Message-ID: <202608240652.hgjduscw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/270-thunderbolt
head:   bcb818cd40b22610c3356572de22d51ecc248dbe
commit: bcb818cd40b22610c3356572de22d51ecc248dbe [19/19] thunderbolt: Add Apple Silicon support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608240652.hgjduscw-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240652.hgjduscw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240652.hgjduscw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/thunderbolt/apple.c:699:50: warning: 'struct typec_thunderbolt_switch_data' declared inside parameter list will not be visible outside of this definition or declaration
     699 |                                     const struct typec_thunderbolt_switch_data *data)
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c: In function 'apple_cio_tbt_switch_set':
>> drivers/thunderbolt/apple.c:701:34: error: implicit declaration of function 'typec_thunderbolt_switch_get_drvdata'; did you mean 'typec_switch_get_drvdata'? [-Wimplicit-function-declaration]
     701 |         struct apple_cio *acio = typec_thunderbolt_switch_get_drvdata(sw);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  typec_switch_get_drvdata
>> drivers/thunderbolt/apple.c:701:34: error: initialization of 'struct apple_cio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   In file included from include/linux/printk.h:620,
                    from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/powerpc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/thunderbolt/apple.c:55:
>> drivers/thunderbolt/apple.c:705:57: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     705 |         dev_dbg(acio->dev, "set cable state: %d\n", data->state);
         |                                                         ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:705:9: note: in expansion of macro 'dev_dbg'
     705 |         dev_dbg(acio->dev, "set cable state: %d\n", data->state);
         |         ^~~~~~~
   drivers/thunderbolt/apple.c:707:21: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     707 |         switch (data->state) {
         |                     ^~
>> drivers/thunderbolt/apple.c:708:14: error: 'TYPEC_THUNDERBOLT_SWITCH_OFF' undeclared (first use in this function)
     708 |         case TYPEC_THUNDERBOLT_SWITCH_OFF:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:708:14: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/thunderbolt/apple.c:711:14: error: 'TYPEC_THUNDERBOLT_SWITCH_TBT' undeclared (first use in this function)
     711 |         case TYPEC_THUNDERBOLT_SWITCH_TBT:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:714:25: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     714 |                 if (data->tbt.cable_mode & TBT_CABLE_ACTIVE_PASSIVE) {
         |                         ^~
   drivers/thunderbolt/apple.c:716:35: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     716 |                         if (!(data->tbt.cable_mode & TBT_CABLE_LINK_TRAINING))
         |                                   ^~
   In file included from <command-line>:
   drivers/thunderbolt/apple.c:720:37: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                                     ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:80:26: note: in expansion of macro '__bf_cast_unsigned'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_tbt.h:29:41: note: in expansion of macro 'FIELD_GET'
      29 | #define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
         |                                         ^~~~~~~~~
   drivers/thunderbolt/apple.c:720:21: note: in expansion of macro 'TBT_ADAPTER'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                     ^~~~~~~~~~~
   In file included from drivers/thunderbolt/apple.c:54:
   drivers/thunderbolt/apple.c:720:37: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                                     ^~
   include/linux/bitfield.h:98:34: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                  ^~~
   include/linux/usb/typec_tbt.h:29:41: note: in expansion of macro 'FIELD_GET'
      29 | #define TBT_ADAPTER(_vdo_)              FIELD_GET(BIT(16), _vdo_)
         |                                         ^~~~~~~~~
   drivers/thunderbolt/apple.c:720:21: note: in expansion of macro 'TBT_ADAPTER'
     720 |                 if (TBT_ADAPTER(data->tbt.device_mode))
         |                     ^~~~~~~~~~~
   drivers/thunderbolt/apple.c:722:41: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     722 |                 if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
         |                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:80:26: note: in expansion of macro '__bf_cast_unsigned'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   include/linux/usb/typec_tbt.h:39:41: note: in expansion of macro 'FIELD_GET'
      39 | #define TBT_CABLE_SPEED(_vdo_)          FIELD_GET(GENMASK(18, 16), _vdo_)
         |                                         ^~~~~~~~~
   drivers/thunderbolt/apple.c:722:21: note: in expansion of macro 'TBT_CABLE_SPEED'
     722 |                 if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
         |                     ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:722:41: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     722 |                 if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
         |                                         ^~
   include/linux/bitfield.h:98:34: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                  ^~~
   include/linux/usb/typec_tbt.h:39:41: note: in expansion of macro 'FIELD_GET'
      39 | #define TBT_CABLE_SPEED(_vdo_)          FIELD_GET(GENMASK(18, 16), _vdo_)
         |                                         ^~~~~~~~~
   drivers/thunderbolt/apple.c:722:21: note: in expansion of macro 'TBT_CABLE_SPEED'
     722 |                 if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
         |                     ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:724:25: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     724 |                 if (data->orientation == TYPEC_ORIENTATION_REVERSE)
         |                         ^~
   drivers/thunderbolt/apple.c:728:29: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     728 |                         data->tbt.cable_mode, data->tbt.device_mode,
         |                             ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:726:17: note: in expansion of macro 'dev_dbg'
     726 |                 dev_dbg(acio->dev,
         |                 ^~~~~~~
   drivers/thunderbolt/apple.c:728:51: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     728 |                         data->tbt.cable_mode, data->tbt.device_mode,
         |                                                   ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:726:17: note: in expansion of macro 'dev_dbg'
     726 |                 dev_dbg(acio->dev,
         |                 ^~~~~~~
   drivers/thunderbolt/apple.c:729:29: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     729 |                         data->tbt.enter_vdo, data->orientation,
         |                             ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:726:17: note: in expansion of macro 'dev_dbg'
     726 |                 dev_dbg(acio->dev,
         |                 ^~~~~~~
   drivers/thunderbolt/apple.c:729:50: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     729 |                         data->tbt.enter_vdo, data->orientation,
         |                                                  ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:726:17: note: in expansion of macro 'dev_dbg'
     726 |                 dev_dbg(acio->dev,
         |                 ^~~~~~~
>> drivers/thunderbolt/apple.c:732:14: error: 'TYPEC_THUNDERBOLT_SWITCH_USB4' undeclared (first use in this function)
     732 |         case TYPEC_THUNDERBOLT_SWITCH_USB4:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:734:57: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     734 |                 if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
         |                                                         ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:80:26: note: in expansion of macro '__bf_cast_unsigned'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:734:21: note: in expansion of macro 'FIELD_GET'
     734 |                 if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
         |                     ^~~~~~~~~
   drivers/thunderbolt/apple.c:734:57: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     734 |                 if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
         |                                                         ^~
   include/linux/bitfield.h:98:34: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                  ^~~
   drivers/thunderbolt/apple.c:734:21: note: in expansion of macro 'FIELD_GET'
     734 |                 if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
         |                     ^~~~~~~~~
   drivers/thunderbolt/apple.c:736:58: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     736 |                 if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
         |                                                          ^~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >               \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:63:43: note: in expansion of macro '__unsigned_scalar_typeof'
      63 | #define __bf_cast_unsigned(type, x)     ((__unsigned_scalar_typeof(type))(x))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:80:26: note: in expansion of macro '__bf_cast_unsigned'
      80 |                          __bf_cast_unsigned(reg, ~0ull),                \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:736:21: note: in expansion of macro 'FIELD_GET'
     736 |                 if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
         |                     ^~~~~~~~~
   drivers/thunderbolt/apple.c:736:58: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     736 |                 if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
         |                                                          ^~
   include/linux/bitfield.h:98:34: note: in definition of macro '__FIELD_GET'
      98 |                 (typeof(mask))(((reg) & (mask)) >> __bf_shf(mask));     \
         |                                  ^~~
   drivers/thunderbolt/apple.c:736:21: note: in expansion of macro 'FIELD_GET'
     736 |                 if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
         |                     ^~~~~~~~~
   drivers/thunderbolt/apple.c:738:25: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     738 |                 if (data->orientation == TYPEC_ORIENTATION_REVERSE)
         |                         ^~
   drivers/thunderbolt/apple.c:741:29: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     741 |                         data->usb4.eudo, data->orientation, acio->target_cable_info);
         |                             ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:740:17: note: in expansion of macro 'dev_dbg'
     740 |                 dev_dbg(acio->dev, "USB4 cable: eudo 0x%x, orientation %d -> cable info 0x%x\n",
         |                 ^~~~~~~
   drivers/thunderbolt/apple.c:741:46: error: invalid use of undefined type 'const struct typec_thunderbolt_switch_data'
     741 |                         data->usb4.eudo, data->orientation, acio->target_cable_info);
         |                                              ^~
   include/linux/dynamic_debug.h:231:29: note: in definition of macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:284:9: note: in expansion of macro '_dynamic_func_call'
     284 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:740:17: note: in expansion of macro 'dev_dbg'
     740 |                 dev_dbg(acio->dev, "USB4 cable: eudo 0x%x, orientation %d -> cable info 0x%x\n",
         |                 ^~~~~~~
   drivers/thunderbolt/apple.c: In function 'apple_cio_probe':
>> drivers/thunderbolt/apple.c:836:16: error: variable 'desc' has initializer but incomplete type
     836 |         struct typec_thunderbolt_switch_desc desc = {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thunderbolt/apple.c:837:18: error: 'struct typec_thunderbolt_switch_desc' has no member named 'fwnode'
     837 |                 .fwnode = pdev->dev.fwnode,
         |                  ^~~~~~
>> drivers/thunderbolt/apple.c:837:27: warning: excess elements in struct initializer
     837 |                 .fwnode = pdev->dev.fwnode,
         |                           ^~~~
   drivers/thunderbolt/apple.c:837:27: note: (near initialization for 'desc')
>> drivers/thunderbolt/apple.c:838:18: error: 'struct typec_thunderbolt_switch_desc' has no member named 'set'
     838 |                 .set = apple_cio_tbt_switch_set,
         |                  ^~~
   drivers/thunderbolt/apple.c:838:24: warning: excess elements in struct initializer
     838 |                 .set = apple_cio_tbt_switch_set,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/apple.c:838:24: note: (near initialization for 'desc')
>> drivers/thunderbolt/apple.c:839:18: error: 'struct typec_thunderbolt_switch_desc' has no member named 'drvdata'
     839 |                 .drvdata = acio,
         |                  ^~~~~~~
   drivers/thunderbolt/apple.c:839:28: warning: excess elements in struct initializer
     839 |                 .drvdata = acio,
         |                            ^~~~
   drivers/thunderbolt/apple.c:839:28: note: (near initialization for 'desc')
>> drivers/thunderbolt/apple.c:836:46: error: storage size of 'desc' isn't known
     836 |         struct typec_thunderbolt_switch_desc desc = {
         |                                              ^~~~
>> drivers/thunderbolt/apple.c:841:28: error: implicit declaration of function 'typec_thunderbolt_switch_register' [-Wimplicit-function-declaration]
     841 |         acio->tbt_switch = typec_thunderbolt_switch_register(dev, &desc);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thunderbolt/apple.c:836:46: warning: unused variable 'desc' [-Wunused-variable]
     836 |         struct typec_thunderbolt_switch_desc desc = {
         |                                              ^~~~
   drivers/thunderbolt/apple.c: In function 'apple_cio_remove':
>> drivers/thunderbolt/apple.c:853:9: error: implicit declaration of function 'typec_thunderbolt_switch_unregister'; did you mean 'typec_switch_unregister'? [-Wimplicit-function-declaration]
     853 |         typec_thunderbolt_switch_unregister(acio->tbt_switch);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         typec_switch_unregister


vim +701 drivers/thunderbolt/apple.c

   697	
   698	static int apple_cio_tbt_switch_set(struct typec_thunderbolt_switch_dev *sw,
 > 699					    const struct typec_thunderbolt_switch_data *data)
   700	{
 > 701		struct apple_cio *acio = typec_thunderbolt_switch_get_drvdata(sw);
   702	
   703		guard(mutex)(&acio->lock);
   704	
 > 705		dev_dbg(acio->dev, "set cable state: %d\n", data->state);
   706	
   707		switch (data->state) {
 > 708		case TYPEC_THUNDERBOLT_SWITCH_OFF:
   709			acio->target_cable_info = 0;
   710			break;
 > 711		case TYPEC_THUNDERBOLT_SWITCH_TBT:
   712			acio->target_cable_info = TB_VSE_CAP_APPLE_CABLE_INFO_PRESENT;
   713			acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_TBT2_3;
   714			if (data->tbt.cable_mode & TBT_CABLE_ACTIVE_PASSIVE) {
   715				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE;
   716				if (!(data->tbt.cable_mode & TBT_CABLE_LINK_TRAINING))
   717					acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_BIDIR_LSRX;
   718			}
   719			/* bit 16 of the Device Discover Mode VDO is 1 for a legacy TBT2 adapter */
   720			if (TBT_ADAPTER(data->tbt.device_mode))
   721				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_LEGACY_ADAPTER;
   722			if (TBT_CABLE_SPEED(data->tbt.cable_mode) == TBT_CABLE_10_AND_20GBPS)
   723				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS;
   724			if (data->orientation == TYPEC_ORIENTATION_REVERSE)
   725				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE;
   726			dev_dbg(acio->dev,
   727				"TBT cable: cable_mode 0x%x, device_mode 0x%x, enter_vdo 0x%x, orientation %d -> cable info 0x%x\n",
   728				data->tbt.cable_mode, data->tbt.device_mode,
   729				data->tbt.enter_vdo, data->orientation,
   730				acio->target_cable_info);
   731			break;
 > 732		case TYPEC_THUNDERBOLT_SWITCH_USB4:
   733			acio->target_cable_info = TB_VSE_CAP_APPLE_CABLE_INFO_PRESENT;
   734			if (FIELD_GET(EUDO_CABLE_TYPE_MASK, data->usb4.eudo) != EUDO_CABLE_TYPE_PASSIVE)
   735				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ACTIVE_CABLE;
   736			if (FIELD_GET(EUDO_CABLE_SPEED_MASK, data->usb4.eudo) == EUDO_CABLE_SPEED_USB4_GEN3)
   737				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_20_GBPS;
   738			if (data->orientation == TYPEC_ORIENTATION_REVERSE)
   739				acio->target_cable_info |= TB_VSE_CAP_APPLE_CABLE_INFO_ORIENTATION_REVERSE;
   740			dev_dbg(acio->dev, "USB4 cable: eudo 0x%x, orientation %d -> cable info 0x%x\n",
   741				data->usb4.eudo, data->orientation, acio->target_cable_info);
   742			break;
   743		}
   744	
   745		if (acio->target_cable_info == acio->current_cable_info)
   746			return 0;
   747	
   748		/*
   749		 * Transitions between different cables without a shutdown inbetween are invalid and can
   750		 * only happen when there's a bug inside the Type-C PD driver. If we tried such a
   751		 * transition, ACIO would crash and then trigger some watchdog that would reset the entire
   752		 * SoC a few seconds later. Shutting down instead only makes the connected device not work
   753		 * but we should be able to recover once the next cable is plugged in.
   754		 */
   755		if (acio->current_cable_info && acio->target_cable_info) {
   756			dev_err(acio->dev,
   757				"Invalid cable transition from 0x%x to 0x%x, shutting down instead\n",
   758				acio->current_cable_info, acio->target_cable_info);
   759			acio->target_cable_info = 0;
   760		}
   761	
   762		/*
   763		 * Bring up or power down the ACIO complex
   764		 * current_cable_info will be updated in the start/stop functions
   765		 */
   766		if (acio->target_cable_info)
   767			return apple_cio_start(acio);
   768	
   769		apple_cio_stop(acio);
   770		return 0;
   771	}
   772	
   773	static int apple_cio_probe(struct platform_device *pdev)
   774	{
   775		struct device *dev = &pdev->dev;
   776		struct apple_cio *acio;
   777		int ret;
   778	
   779		acio = devm_kzalloc(dev, sizeof(*acio), GFP_KERNEL);
   780		if (!acio)
   781			return -ENOMEM;
   782		platform_set_drvdata(pdev, acio);
   783	
   784		ret = devm_mutex_init(dev, &acio->lock);
   785		if (ret)
   786			return ret;
   787		init_completion(&acio->nhi_boot_completion);
   788		acio->dev = &pdev->dev;
   789		acio->np = dev->of_node;
   790	
   791		acio->sram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
   792		if (!acio->sram_res)
   793			return dev_err_probe(dev, -EIO, "Failed to get SRAM resource\n");
   794		acio->sram_base = devm_ioremap_resource(dev, acio->sram_res);
   795		if (IS_ERR(acio->sram_base))
   796			return dev_err_probe(dev, PTR_ERR(acio->sram_base), "Failed to map SRAM\n");
   797	
   798		acio->rc_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rc");
   799		acio->rc_base = devm_ioremap_resource(&pdev->dev, acio->rc_res);
   800		if (IS_ERR(acio->rc_base))
   801			return dev_err_probe(dev, PTR_ERR(acio->rc_base), "Unable to map rc regs\n");
   802		acio->rc_tunable =
   803			devm_apple_tunable_parse(dev, acio->np, "apple,tunable-rc", acio->rc_res);
   804		if (IS_ERR(acio->rc_tunable))
   805			return dev_err_probe(dev, PTR_ERR(acio->rc_tunable), "Unable to load rc tunable\n");
   806	
   807		acio->reset = devm_reset_control_get_exclusive(dev, NULL);
   808		if (IS_ERR(acio->reset))
   809			return dev_err_probe(dev, PTR_ERR(acio->reset), "Unable to get CIO reset\n");
   810	
   811		/*
   812		 * If there is only a single domain listed in the device tree the platform driver
   813		 * framework will already attach it. Thus, if we find an already attached domain
   814		 * here something's wrong in the device tree because we expect at least three separate
   815		 * domains that we have to control manually.
   816		 */
   817		if (dev->pm_domain) {
   818			dev_err(dev, "PM domain already attached, check if the DT lists three domains\n");
   819			return -EINVAL;
   820		}
   821	
   822		/*
   823		 * Find and attach the PM domains but don't power them on yet since we must only
   824		 * do that after the PHY has already been configured into USB4/Thunderbolt mode.
   825		 */
   826		struct dev_pm_domain_attach_data pd_data = {
   827			.pd_flags = PD_FLAG_NO_DEV_LINK,
   828		};
   829		ret = devm_pm_domain_attach_list(dev, &pd_data, &acio->pd_list);
   830		if (ret < 0)
   831			return dev_err_probe(dev, ret, "Unable to attach PM domains\n");
   832		else if (ret < 3)
   833			return dev_err_probe(dev, -EINVAL, "Not enough PM domains\n");
   834	
   835		/* And finally register the OOB notification for Thunderbolt/USB4 cables */
 > 836		struct typec_thunderbolt_switch_desc desc = {
 > 837			.fwnode = pdev->dev.fwnode,
 > 838			.set = apple_cio_tbt_switch_set,
 > 839			.drvdata = acio,
   840		};
 > 841		acio->tbt_switch = typec_thunderbolt_switch_register(dev, &desc);
   842		if (IS_ERR(acio->tbt_switch))
   843			return dev_err_probe(dev, PTR_ERR(acio->tbt_switch),
   844					     "Unable to register thunderbolt switch\n");
   845	
   846		return 0;
   847	}
   848	
   849	static void apple_cio_remove(struct platform_device *pdev)
   850	{
   851		struct apple_cio *acio = platform_get_drvdata(pdev);
   852	
 > 853		typec_thunderbolt_switch_unregister(acio->tbt_switch);
   854	
   855		guard(mutex)(&acio->lock);
   856		if (acio->current_cable_info)
   857			apple_cio_stop(acio);
   858	}
   859	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
