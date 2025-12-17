Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A3C328B7D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 12:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765974406; cv=none; b=RO5SALuBuBTR2TfndhMB6k1hqt9LDGakicuNll1O59+p6it8pJy5OAJ3X5oAJyiaNSd6qaE7lfcGEoWtWYXD3d8shAadLXfDOqdYsvovox0PtVXgvKkU9tpHl4JnPaTFetaZ8uE3SVyHJOHjsUNobzq3g7Hsmy/OiGv+LSSlXr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765974406; c=relaxed/simple;
	bh=vJg+Ae33OPq7j3w9IC0gSHfg8SSEBJPYW8LzntKDebQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZUurlyYvc48M+uO1SSmzNekJTABy+7XorB6K1mTtE71z1tgzgkuvZzSumxZSf156PJT/8vYthUoh+CNEq8V7uI9a71V49et+qZvf2XWKMiKl64c+tQyMPqPZnZ9PVVcCN3qjzPyzn5AZ/9koNw4sPoQlFLKV6Qo8YYFOkhvwPb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhIO9kfC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhIO9kfC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765974404; x=1797510404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJg+Ae33OPq7j3w9IC0gSHfg8SSEBJPYW8LzntKDebQ=;
  b=fhIO9kfCBlPw2Qydjc5xNYGmdJNDhp2YZ+3cvXmDEZNWkHCv8ze2vU6A
   5dZCWQ9P2AVyu51jQpIyiu4GDpeq1npDVrOnVK7MO9abdT3+K4C2DiX9b
   NvJe5brkA5HVc6EpUVRn8XbLJjxxM75l5rK18iDjiSRnEOtGbLPh3qog+
   jkR7pLQdOtaIJLhgawVd+zf73hqklhYjVU0gz12cRc61REb6xafOW+KUh
   6ll+/01ZVtioJwsSvK1jCf0/iCHnonOx4tGy9K512s0BA/o2X5xwV8X5P
   41+GxfmZChFb/6aF14z7UzReYT/zuQh7XUQriUeRFh5nHbc+/Vj3mnYEK
   w==;
X-CSE-ConnectionGUID: y9hWlSbaRG6CPbWG3vMzdg==
X-CSE-MsgGUID: GD2Y88seT+yxeqOC0CJGJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78548225"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="78548225"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 04:26:38 -0800
X-CSE-ConnectionGUID: EpFtJVNmR36IWPsrzhjY8Q==
X-CSE-MsgGUID: JCGB2aVDTJaPwReUMUSZDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="199099466"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Dec 2025 04:26:36 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVqby-000000000X5-1W99;
	Wed, 17 Dec 2025 12:26:34 +0000
Date: Wed, 17 Dec 2025 20:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 drivers/android/binder.c:7490:undefined reference to
 `remove_event_from_tracers'
Message-ID: <202512172024.XBRDgqb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   2b1f0a93a5abad60f8ee238f6e3ed4ea784ce209
commit: 43c26111cafa87d81570c63d96c497e13ec883da [2/2] ANDROID: binder: unload C Binder trace events
config: arm-randconfig-r052-20251217 (https://download.01.org/0day-ci/archive/20251217/202512172024.XBRDgqb9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172024.XBRDgqb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172024.XBRDgqb9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/entry-armv.o: in function `__irq_svc':
   arch/arm/kernel/entry-armv.S:228:(.entry.text+0x11c): relocation truncated to fit: R_ARM_PC24 against symbol `generic_handle_arch_irq' defined in .noinstr.text section in kernel/irq/handle.o
   arch/arm/kernel/entry-armv.S:228:(.entry.text+0x128): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/entry-armv.o: in function `svc_preempt':
   arch/arm/kernel/entry-armv.S:248:(.entry.text+0x164): relocation truncated to fit: R_ARM_PC24 against symbol `preempt_schedule_irq' defined in .sched.text section in kernel/sched/core.o
   arch/arm/kernel/entry-armv.o: in function `__irq_usr':
   arch/arm/kernel/entry-armv.S:443:(.entry.text+0x454): relocation truncated to fit: R_ARM_PC24 against symbol `call_with_stack' defined in .text section in arch/arm/lib/call_with_stack.o
   arch/arm/kernel/traps.o: in function `dump_backtrace_stm':
   arch/arm/kernel/traps.c:100:(.text+0x3c): relocation truncated to fit: R_ARM_PC24 against symbol `memset' defined in .text section in arch/arm/lib/memset.o
   arch/arm/kernel/traps.c:106:(.text+0xa4): relocation truncated to fit: R_ARM_PC24 against symbol `sprintf' defined in .text section in lib/vsprintf.o
   arch/arm/kernel/traps.c:116:(.text+0x11c): relocation truncated to fit: R_ARM_PC24 against symbol `__stack_chk_fail' defined in .noinstr.text section in kernel/panic.o
   arch/arm/kernel/traps.o: in function `die':
   arch/arm/kernel/traps.c:370:(.text+0x208): relocation truncated to fit: R_ARM_PC24 against symbol `report_bug' defined in .text section in lib/bug.o
   arch/arm/kernel/traps.o: in function `oops_end':
   arch/arm/kernel/traps.c:349:(.text+0x308): relocation truncated to fit: R_ARM_PC24 against symbol `warn_bogus_irq_restore' defined in .noinstr.text section in kernel/locking/irqflag-debug.o
   arch/arm/kernel/traps.o: in function `is_valid_bugaddr':
   arch/arm/kernel/traps.c:410:(.text+0x5ec): relocation truncated to fit: R_ARM_PC24 against symbol `__stack_chk_fail' defined in .noinstr.text section in kernel/panic.o
   arch/arm/kernel/traps.o: in function `register_undef_hook':
   arch/arm/kernel/traps.c:421:(.text+0x618): additional relocation overflows omitted from the output
   arm-linux-gnueabi-ld: drivers/android/binder.o: in function `binder_remove_trace_events':
>> drivers/android/binder.c:7490:(.text+0x37c0): undefined reference to `remove_event_from_tracers'
>> arm-linux-gnueabi-ld: drivers/android/binder.c:7496:(.text+0x3860): undefined reference to `event_mutex'
>> arm-linux-gnueabi-ld: drivers/android/binder.c:7496:(.text+0x3864): undefined reference to `ftrace_events'
>> arm-linux-gnueabi-ld: drivers/android/binder.c:7496:(.text+0x3868): undefined reference to `trace_types_lock'
>> arm-linux-gnueabi-ld: drivers/android/binder.c:7496:(.text+0x386c): undefined reference to `trace_event_sem'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DMA_ENGINE_RAID
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=m] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +7490 drivers/android/binder.c

  7475	
  7476	void binder_remove_trace_events(struct module *module)
  7477	{
  7478		struct trace_event_call *call, *tmp;
  7479		const char *name;
  7480	
  7481		mutex_lock(&event_mutex);
  7482		mutex_lock(&trace_types_lock);
  7483		down_write(&trace_event_sem);
  7484		list_for_each_entry_safe(call, tmp, &ftrace_events, list) {
  7485			name = trace_event_name(call);
  7486			if (!name || strncmp(name, "binder_", 7))
  7487				continue;
  7488			if (call->module != module)
  7489				continue;
> 7490			remove_event_from_tracers(call);
  7491			list_del_init(&call->list);
  7492		}
  7493		up_write(&trace_event_sem);
  7494		mutex_unlock(&trace_types_lock);
  7495		mutex_unlock(&event_mutex);
> 7496	}
  7497	EXPORT_SYMBOL_GPL(binder_remove_trace_events);
  7498	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
