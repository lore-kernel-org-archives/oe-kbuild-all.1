Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B8E46AF0B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 13:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852514; cv=none; b=s6xXQ2e9WL/f2kdsLgoH0o2ywSsMfvAGRS/dy2Wf/IsORgmWBeceCXGP/32mRVDMcfb3PGM71A4VI+mzT16QQgi1SG/mbixSE6FKXO60mdwL3jOSzoW/hOUC9FykE4ct2sR+mj9Gj7iKnB7aVN3Q6v05v6ymR3sogbqbz67g+NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852514; c=relaxed/simple;
	bh=2VQI6QbBw0xiLxAi6EtLypkON9kA5pn3c/pSgo9rNKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c70C3xvBolzl8ZIt3C6hlXWDp6yQmjYJU9TglX2o/ystp9Fr/26RXe3Y5Lda3IUmI1AgI4W3jDUdNnbYG4glMIEFcKeyqsie8vMjc2OTt7/Z2TW3k6nTRSSBsT4LiXsgYtkp6d88TdwstosZ9h8JCoNYLBq9/Opd/mG87rZ8H4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apwXZLTz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apwXZLTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778852513; x=1810388513;
  h=date:from:to:cc:subject:message-id;
  bh=2VQI6QbBw0xiLxAi6EtLypkON9kA5pn3c/pSgo9rNKY=;
  b=apwXZLTzHiKyzhNLtKcUJITCpAPahgM8Zb2dz0fpAeKhbmg0LOCzZr9v
   8KAQB5fr04R03LCdiGW9rZL5KudbJLx2IT5iX/BU1tCRohmJ1A2zhvtuD
   JqExR5R4pk3kvBTEh1XU8hMTshgXK/hoDDQSMHh70Ah1b/SjeS8yqjX+e
   zghBuWEsctMEPfn5XelaXx7VX5sFCep1xWxeVFrXzmcRFyUS5ST8Us1Gd
   FmexVT+npcwHxwcVji9SC8XlT+ARPzdL4E3gLRSHY6vFNeKR7MMn3WsSC
   nushFCxNsyNPXAoZoG6ABmbP7AAA7UZBDS9Svd4mGiwY4XSraDCuSoS/4
   w==;
X-CSE-ConnectionGUID: iWk7GUfZRMGIS9Bkkecsqw==
X-CSE-MsgGUID: HRNYOAqATwaMCf/tynNIwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97235027"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="97235027"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 06:41:52 -0700
X-CSE-ConnectionGUID: IH3YAVrgT/SFXEzbIxg03A==
X-CSE-MsgGUID: e5d4jTkMT5eUe9oblDP6Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="243045292"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 May 2026 06:41:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNsnU-000000001hz-1BGX;
	Fri, 15 May 2026 13:41:48 +0000
Date: Fri, 15 May 2026 21:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/hyp_events.c:139:1: sparse: sparse: symbol
 'hyp_ftrace_funcs_lock' was not declared. Should it be static?
Message-ID: <202605152132.Uk68x7Go-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   6d689dd8b2631ce3829b6c20ff3b92cbc1c17599
commit: 7a99750a2422d095fb44d8f93887b336a449822b [2/2] ANDROID: KVM: arm64: PROTECTED_NVHE_FTRACE to PKVM_FTRACE
config: arm64-randconfig-r112-20260515 (https://download.01.org/0day-ci/archive/20260515/202605152132.Uk68x7Go-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152132.Uk68x7Go-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152132.Uk68x7Go-lkp@intel.com/

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
