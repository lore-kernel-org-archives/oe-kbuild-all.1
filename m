Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963B2282F29
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Aug 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995398; cv=none; b=r9K4GVP5mC1vZInDIYPw5vbLAmrPosR79zg1NjmjZKOreKkGVJ+7VK8ssuQ2zsf2ik40Soi7pONWaymIi7ThIOhWb2tsjig9SPOaUPgVKxOVjMS1FCpmgReAw9wgcZk26OnzxvonzQc+tY7Emm0+tTf60HquNit4xSPZ74G04ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995398; c=relaxed/simple;
	bh=Eu3NhPDP9nB6RR5n5uFiIXV6oLpTFLEdSD+m1E/cpmI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MuCzjr403w+J2QaelIepdunuw7yqQFD/UC4LIr7I+Eui3zzsSofn0Mt2okKsxexDGiOpVVpm5D1zvF48DHJPVU71Ddttlo6OEUFaSe0cI2Gvyl3I8TJV+lBtOFd1sLyK+4i+P7fdfuCGShCpSoosoA0XdvgGj2IXA8HUil/Bjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kd2wOzMs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kd2wOzMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786995396; x=1818531396;
  h=date:from:to:cc:subject:message-id;
  bh=Eu3NhPDP9nB6RR5n5uFiIXV6oLpTFLEdSD+m1E/cpmI=;
  b=Kd2wOzMsmOGvCPSuky+bh1RGsJJrK4ZMykoldHjAn6y//Y6MmXc6JZpr
   SA2CUjqLa7AowmJp2AHfEhcaPYXxzJ6JVMig3S0fdJ3QEu0SRZb5X/0ma
   WFcHEvsiKWuaTV0apuPAlQ5lIb4XUnXdUo3vMgQHn1FXsMMCcKb1GWIvU
   zv5orMJM7h5kaVz9yTLgCY2ZQ7o2h2HgrxPjBBZ0eswBOQq0zf1ppGhb2
   oz6JXm3MNMWNaQ1HHb3mq1hSIohur4O9CY8kAjKmdr0sjwzeFCrTqryN1
   LM0u/e1sNk5b+hVyNTEbPagrYRjG5uuMLaVgEM9ybsu9LDnQdkYB6RY7e
   Q==;
X-CSE-ConnectionGUID: Y1Q3tpjvR6aOXC/a43mGPg==
X-CSE-MsgGUID: gaA02vpHQlWQzBQYRs5FFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113021365"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="113021365"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 12:36:36 -0700
X-CSE-ConnectionGUID: JV8Oz6h+TEmtFQcBW2A/yg==
X-CSE-MsgGUID: JtYMqik+RQ+8UcJjnPYIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="263673784"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Aug 2026 12:36:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww38K-00000000dmo-0sYf;
	Mon, 17 Aug 2026 19:36:32 +0000
Date: Tue, 18 Aug 2026 03:35:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous
 prototype for 'hyp_event_trace_iommu_idmap'
Message-ID: <202608180308.r7WXgbS9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: abd6c25f0d5feba7e4ad7717cf38275c2fcfac76 [2/2] ANDROID: KVM: arm64: iommu: Add idmap trace point
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260818/202608180308.r7WXgbS9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180308.r7WXgbS9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180308.r7WXgbS9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:14:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: in expansion of macro 'HYP_EVENT'
      75 | HYP_EVENT(__hyp_printk,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: in expansion of macro 'HYP_EVENT'
      95 | HYP_EVENT(host_ffa_call,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_psci_mem_protect' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:120:1: note: in expansion of macro 'HYP_EVENT'
     120 | HYP_EVENT(psci_mem_protect,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_iommu_idmap' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:133:1: note: in expansion of macro 'HYP_EVENT'
     133 | HYP_EVENT(iommu_idmap,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:217:6: warning: no previous prototype for 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     217 | bool hyp_trace_init_event_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:267:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     267 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:341:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     341 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:363:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     363 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:378:5: warning: no previous prototype for 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_iommu_idmap +17 arch/arm64/include/asm/kvm_define_hypevents.h

f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fbb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
