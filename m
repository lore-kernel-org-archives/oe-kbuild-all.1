Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E4435CB95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Oct 2026 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147735; cv=none; b=JycPXenZkTbY/dFc6Zl2OD7KW9CpYnLz7jjJGSsddbbTvn6OE93ukKYelnkTZpEZP7BkeRoutBz3/QH2BzzvBxuT5FqIrNugnyGtT9WFaoVVXTp1E2kn7JUcgeDMWxdv0qsftN4BwQcwX7/rLEIq+uhY/g1o09gOZKQAeQ+jnf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147735; c=relaxed/simple;
	bh=PljanyI3WFlpdG4zSPZsT9uRW0GFoqHNrkPLwx6cgPo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DmFcie4EwmiYaX9vFPPAMy420Sdu//2dY7CYsXnPiN/fRFlG1TTcBiX8VE8YIj9B+071/hk2V75ZQ3xWUlyk/lxTmXIcphaPtBBa/TkO+viRU2s8LBKZ6uvzYkTY5crTAl3hfC/WPyF1YOSGyznIFP1lKW6jV+TtiQFqf9O53js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6de/bw0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6de/bw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792147733; x=1823683733;
  h=date:from:to:cc:subject:message-id;
  bh=PljanyI3WFlpdG4zSPZsT9uRW0GFoqHNrkPLwx6cgPo=;
  b=f6de/bw08FPWBwtP7qIbff3IPJlZDSg2hGLHBAvw5ADwWfuKoxL04vvb
   QguVixnLh69zPcwTxjMKydIA58N/lGNqo8YIfZb0nQzqxc7Cg17LQITFN
   x9eLYlp4ExE4dsV4BQZqK7r3RyyY7kwhvYSgFHIu9vMMwovhcas2wuyTV
   opGIC4PcY8Aw6McZOneXpwUqJ7nIBu6v28A6bL/EdAtDVfCUPfmZHCvfU
   qWUKqOO4uSHOQ3JwIg8RTomyBcnFWOpCIf8jnHwy7rbehzYdvG5xQsd5l
   D6Bx5Zzm3YcadUwJ8yFfaMu0oh/fpJdAkytUAsRXCSIBcHulhDBpVibBm
   Q==;
X-CSE-ConnectionGUID: ANNlDg3BSKOG+Y4lIFnLZg==
X-CSE-MsgGUID: vR/8QEIuSziKkwaAhBEV6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="834626"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="834626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 03:48:52 -0700
X-CSE-ConnectionGUID: X/IG+07lTmeAQGz2bmEzlQ==
X-CSE-MsgGUID: VYuTBpDcSeuuqPzRoOjpkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2404720"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2026 03:48:51 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHfUX-00000000CCB-0t8p;
	Fri, 16 Oct 2026 10:48:49 +0000
Date: Fri, 16 Oct 2026 12:48:24 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 27/27]
 arch/arm64/kvm/hyp_events.c:139:1: sparse: sparse: symbol
 'hyp_ftrace_funcs_lock' was not declared. Should it be static?
Message-ID: <202610161258.T2Q8gsTn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   b4108abbd0e1cb0df40452dee77291f106e1d711
commit: 7a99750a2422d095fb44d8f93887b336a449822b [27/27] ANDROID: KVM: arm64: PROTECTED_NVHE_FTRACE to PKVM_FTRACE
config: arm64-randconfig-r2302-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161258.T2Q8gsTn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161258.T2Q8gsTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161258.T2Q8gsTn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:15:1: sparse: sparse: symbol 'hyp_event_func' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:28:1: sparse: sparse: symbol 'hyp_event_func_ret' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:40:1: sparse: sparse: symbol 'hyp_event_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:49:1: sparse: sparse: symbol 'hyp_event_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:58:1: sparse: sparse: symbol 'hyp_event_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:72:1: sparse: sparse: symbol 'hyp_event_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:87:1: sparse: sparse: symbol 'hyp_event_host_mem_abort' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:101:1: sparse: sparse: symbol 'hyp_event___hyp_printk' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:121:1: sparse: sparse: symbol 'hyp_event_psci_mem_protect' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:134:1: sparse: sparse: symbol 'hyp_event_vcpu_illegal_trap' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c:51:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table *
   arch/arm64/kvm/hyp_events.c:51:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:51:15: sparse:    struct hyp_table *
   arch/arm64/kvm/hyp_events.c:66:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:66:17: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:66:17: sparse:    struct hyp_table *
>> arch/arm64/kvm/hyp_events.c:139:1: sparse: sparse: symbol 'hyp_ftrace_funcs_lock' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_events.c:417:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp_events.c:417:23: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp_events.c:417:23: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp_events.c:428:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp_events.c:428:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp_events.c:428:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp_events.c:716:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:716:17: sparse:    struct hyp_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:716:17: sparse:    struct hyp_table *
--
>> arch/arm64/kvm/hyp/nvhe/ftrace.c:147:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:147:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:147:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:160:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:160:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:160:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:180:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:180:15: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:180:15: sparse:     got restricted __le32 [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:250:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __le32 [usertype] @@
   arch/arm64/kvm/hyp/nvhe/ftrace.c:250:23: sparse:     expected unsigned int [usertype]
   arch/arm64/kvm/hyp/nvhe/ftrace.c:250:23: sparse:     got restricted __le32 [usertype]

vim +/hyp_ftrace_funcs_lock +139 arch/arm64/kvm/hyp_events.c

76c84a105cca9c Vincent Donnefort 2024-10-01  138  
76c84a105cca9c Vincent Donnefort 2024-10-01 @139  DEFINE_MUTEX(hyp_ftrace_funcs_lock);
76c84a105cca9c Vincent Donnefort 2024-10-01  140  

:::::: The code at line 139 was first introduced by commit
:::::: 76c84a105cca9cfc5a218539bb401a58ab12d3e9 ANDROID: KVM: arm64: Add set_ftrace_filter for pKVM hyp

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Fuad Tabba <tabba@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
