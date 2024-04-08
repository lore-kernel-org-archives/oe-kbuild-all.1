Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE314262C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712594873; cv=none; b=FFopzMBhL1bwy0wcvqXqFctetbJcS+8PGBtE/xfL6S5x+Hlwlr64vzmjW8L0lR+DR3Fls7q3LaLRC3St1LPGT9E7A6+534BhgJNEiTnX/QUIbmGNjAtkai2nsS00iTHavIwd0b4/744rRHE3eG6w9uqjNb0uLBQbefEKu1kEu5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712594873; c=relaxed/simple;
	bh=yLok36w//P9zSqyyzAP/i2XHrzlVyXLV6FD1nDCdYbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ARbh3RZNseqzMYsxMh0tD/N3Tt0VUXUbcS7PAtWVVPjBl5swdN9C9OhoPdzh2E3oMhGoQiCASQcOAVqjzYrHu8QPfENAZRdI2JYEmymiFFsHq/loZEYPcbMWq3l1fuCuiRyAcw69gMfYnxTTSIxAl5xIu+Oa5EvG1wU1do3Nlx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U/Eh+2TD; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U/Eh+2TD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712594872; x=1744130872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLok36w//P9zSqyyzAP/i2XHrzlVyXLV6FD1nDCdYbs=;
  b=U/Eh+2TDnMX7txy9o0JRhhqQgfucrVMirTFwk7PioYMaR0VLg/rCyysK
   +jVLhTuFHDQhrQG1obcQBBAplBBlbTWMo1YsA9+BYYVFITJoyYDJSkZlf
   Ep/OgoG3WTnkbmOV2r+43/Lw18niJwm59IKgfiXo7iN1uxBl03vKnKIO/
   o22VD45gNVTcFZE0tVhjAA4gbnGtmfcRNLx+ysDn1WuDY6zfDvMGTcFKD
   3L8HQpHcAC/kT8VhhwfArSs2lWuEkkDe6RzOhDrinnJkKyzVWs7aNYkdL
   kIcH8aDQgjfjG1xFSOIpcEmMccTLTn3hGE6T9UAK199ijb8DNCuX7d2NW
   g==;
X-CSE-ConnectionGUID: Pl31xrAxRb6MqudjxsFx+Q==
X-CSE-MsgGUID: f85jAnDsQLSafOFNAND7fg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="18494119"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="18494119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 09:47:50 -0700
X-CSE-ConnectionGUID: 5OQnPn1uRxmIRgV+EfPlCw==
X-CSE-MsgGUID: Fx9A1fBBTmuNTe4w5iqd6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="20383805"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 08 Apr 2024 09:47:50 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rts9q-0005N0-2X;
	Mon, 08 Apr 2024 16:47:46 +0000
Date: Tue, 9 Apr 2024 00:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 2/14]
 arch/arm64/kvm/hyp_events.c:260:25: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202404090046.mgHTeCi1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   cf7d2542ca250f0f7a6468288f6d7c7cb8a5dd88
commit: ea75c0835c8fcd34d65b62f6299bf8bdc7744740 [2/14] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-r111-20240408 (https://download.01.org/0day-ci/archive/20240409/202404090046.mgHTeCi1-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090046.mgHTeCi1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090046.mgHTeCi1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:14:1: sparse: sparse: symbol 'hyp_event_trace_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:23:1: sparse: sparse: symbol 'hyp_event_trace_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:32:1: sparse: sparse: symbol 'hyp_event_trace_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:46:1: sparse: sparse: symbol 'hyp_event_trace_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:61:1: sparse: sparse: symbol 'hyp_event_trace_host_mem_abort' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:14:1: sparse: sparse: symbol 'hyp_event_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:23:1: sparse: sparse: symbol 'hyp_event_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:32:1: sparse: sparse: symbol 'hyp_event_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:46:1: sparse: sparse: symbol 'hyp_event_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:61:1: sparse: sparse: symbol 'hyp_event_host_mem_abort' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_events.c:260:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:260:25: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:260:25: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:379:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:379:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:379:18: sparse:    struct hyp_event_table *

vim +260 arch/arm64/kvm/hyp_events.c

   198	
 > 199	bool hyp_trace_init_event_early(void)
   200	{
   201		char *token, *buf = early_events;
   202		bool enabled = false;
   203	
   204		while (true) {
   205			token = strsep(&buf, ",");
   206	
   207			if (!token)
   208				break;
   209	
   210			if (*token) {
   211				struct hyp_event *event;
   212				int ret;
   213	
   214				event = find_hyp_event(token);
   215				if (event) {
   216					ret = enable_hyp_event(event, true);
   217					if (ret)
   218						pr_warn("Couldn't enable hyp event %s:%d\n",
   219							token, ret);
   220					else
   221						enabled = true;
   222				} else {
   223					pr_warn("Couldn't find hyp event %s\n", token);
   224				}
   225			}
   226	
   227			if (buf)
   228				*(buf - 1) = ',';
   229		}
   230	
   231		return enabled;
   232	}
   233	
   234	static struct dentry *event_tracefs;
   235	static unsigned int last_event_id;
   236	
   237	struct hyp_event_table {
   238		struct hyp_event	*start;
   239		unsigned long		nr_events;
   240	};
   241	static struct hyp_event_mod_tables {
   242		struct hyp_event_table *tables;
   243		unsigned long		nr_tables;
   244	} mod_event_tables;
   245	
   246	#define nr_events(__start, __stop) \
   247		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   248	
   249	struct hyp_event *hyp_trace_find_event(int id)
   250	{
   251		struct hyp_event *event = __hyp_events_start + id;
   252	
   253		if ((unsigned long)event >= (unsigned long)__hyp_events_end) {
   254			struct hyp_event_table *table;
   255	
   256			event = NULL;
   257			id -= nr_events(__hyp_events_start, __hyp_events_end);
   258	
   259			rcu_read_lock();
 > 260			table = rcu_dereference(mod_event_tables.tables);
   261	
   262			for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   263				if (table->nr_events < id) {
   264					id -= table->nr_events;
   265					table++;
   266					continue;
   267				}
   268	
   269				event = table->start + id;
   270				break;
   271			}
   272			rcu_read_unlock();
   273		}
   274	
   275		return event;
   276	}
   277	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
