Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26314D6EB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719520619; cv=none; b=sOOigVAUBnTGCVr9GSdTdlFmiRgZJKMwrnsRDWdvNFMAlDzWmXgdDSX6nZEv44NTYQcl5S0lXj/1inS562LladIH1KlTj1/zGS5x6s9ATnmtqPxyacAt77Cy7D6u+s+TY3sddA/qCDEPe1CYS0sA6Ks2grz27qLvHNbiudJ/QWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719520619; c=relaxed/simple;
	bh=F+QGA4HxNOYQznM1vZQsnSLCg9JN/YTneQHXy97ivdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gtin/TMELtSOjbf8vi/+SbffKJ303TgMOwfJ4buK/HM8OA6HvU6hbu6OZtMiZphRXxnxbkbnYbXifbgc4dTNoHb9nP9zxkqTgErZpVPXWkDZHf8SBfUxXALJcVv/QBQq7w2H7J1LM1CxM0Go982TLAYaE/f4weHTW3VGcHX6zJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M0C4GSZl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M0C4GSZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719520618; x=1751056618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+QGA4HxNOYQznM1vZQsnSLCg9JN/YTneQHXy97ivdo=;
  b=M0C4GSZldaIUyzOXMGBDQkply7+ic0QBHYL9y4rt4hTQyuDpLdIuIDPT
   /rRTCs7EiM17x3eSADMqk/rY05OarC9bCbSj0JFBR8acnUtrMtKDdYDHs
   L0Bs2qLYNyHzyyy56beBQ1we/QhjAI60Vqia/44u+RwHe0KVZ1MsBx6G5
   HtxBMml1xWJAbpJgRgKCrMQfJ2SU0z5IJ07AfwKUbdtQv6k90D56qhKUW
   GwTch69yBuq9c0s0mZtcUjN9tvmES7vnyfYe2XP4ehM7NdD2AOhxG4IfL
   WYxOcqEdtzZRLvlWLPvWAnHC1FJpJj5uZaz9WpQu3M+Hsl/r9BnHpODPQ
   Q==;
X-CSE-ConnectionGUID: Owb6y/ySRj2tIoPuW98elQ==
X-CSE-MsgGUID: 1DZLGAZmTxKKyAJW5xKZPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="16809598"
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="16809598"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 13:36:58 -0700
X-CSE-ConnectionGUID: 6a6fsf9WQyqThZ5vjjboOw==
X-CSE-MsgGUID: N48q4LRMTx6N60Z8agD2ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,167,1716274800"; 
   d="scan'208";a="82052707"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jun 2024 13:36:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMvrS-000GVu-11;
	Thu, 27 Jun 2024 20:36:54 +0000
Date: Fri, 28 Jun 2024 04:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 5/6]
 arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous
 prototype for 'hyp_event_trace_iommu_idmap'
Message-ID: <202406280419.BCNNhu1Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   45688919defd55d481bb8042c83c0d3bbaa96004
commit: abd6c25f0d5feba7e4ad7717cf38275c2fcfac76 [5/6] ANDROID: KVM: arm64: iommu: Add idmap trace point
config: arm64-randconfig-001-20240628 (https://download.01.org/0day-ci/archive/20240628/202406280419.BCNNhu1Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406280419.BCNNhu1Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406280419.BCNNhu1Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:14:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: in expansion of macro 'HYP_EVENT'
      75 | HYP_EVENT(__hyp_printk,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: in expansion of macro 'HYP_EVENT'
      95 | HYP_EVENT(host_ffa_call,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_psci_mem_protect' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:120:1: note: in expansion of macro 'HYP_EVENT'
     120 | HYP_EVENT(psci_mem_protect,
         | ^~~~~~~~~
>> arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_iommu_idmap' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
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

f6dbfc683cf5fb Vincent Donnefort 2023-01-26  14  
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  15  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  16  	HYP_EVENT_FORMAT(__name, __struct);					\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26 @17  	void hyp_event_trace_##__name(struct ht_iterator *iter)			\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  18  	{									\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  19  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  20  			(struct trace_hyp_format_##__name *)iter->ent;		\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  21  		trace_seq_puts(&iter->seq, #__name);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  22  		trace_seq_putc(&iter->seq, ' ');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  23  		trace_seq_printf(&iter->seq, __printk);				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  24  		trace_seq_putc(&iter->seq, '\n');				\
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  25  	}
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  26  #define HYP_EVENT_MULTI_READ
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  27  #include __HYP_EVENT_FILE
f6dbfc683cf5fb Vincent Donnefort 2023-01-26  28  

:::::: The code at line 17 was first introduced by commit
:::::: f6dbfc683cf5fbbd37b6fdead1b5b08912cf6570 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
