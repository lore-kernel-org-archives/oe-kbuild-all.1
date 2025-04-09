Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655411C5F23
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Apr 2025 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744227890; cv=none; b=RvZSkX3E8Vr9hVKCZ/XRZWQWdGhyfjPRMpHj2o0Udh0ZvYHe63uyVBaMlvtE/PFAljHmuPWZARiBxXppQbhIkUyOcQnSkuiOoawDWF63hriBnX//JHu3I4YFkgEyTYE4OVY6DLxtJUEv/iHRMqThcmHK9HOZfzFYqZeBdUgo2AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744227890; c=relaxed/simple;
	bh=1+6sKReRXoT/3PWOdG5/wEdtsbiWLCCHMNyGocKIS+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdZOCqA07yW5NW42QxB+Pg5Mn9mNnX21ESI7t0xoOrClckDkwiKmz5IE1OUFP3xmlqvIptJIXSVSQivhxg7vkMsUt1aizliG7kjDCLBtdCXo6Km1gg49oDzd/QFGU5FJ8IJWk3ETbIPbQ+zm0uJNkapwxU5voQM6T3itcG5N5rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lw74DDwS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lw74DDwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744227889; x=1775763889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+6sKReRXoT/3PWOdG5/wEdtsbiWLCCHMNyGocKIS+c=;
  b=Lw74DDwSsRrNhaKRYdIUo/b29fntrHDGrm8pqFVXbMUA30ZpbXAoeaF4
   ShZ9poSUu6iKoHkA7zhy7lJQRPrQVRVfFzDkdcJ2B2juTjjUPQCo/NkIG
   3elHhzNsPWOQPNgyLUjnHIQmZ1in40231+VzoZXuL9bOzrLeqWOMAY1FB
   W3w/JpOgCLV2CENATwbljMV8p12/bTmpOtrguvdnQt+X3SB1VIYcvlrHT
   JzLacC3IVlszW1WDGz7GQXJYotre8WKzak5XkfZbK7H1oeS2vmzgYb4CV
   FRPgRUJk8hIjvRi81ztxl3XElwF8ab9922dJ3YI3G4EhTfZ2EfQbH9k32
   w==;
X-CSE-ConnectionGUID: Ssz3MvrBRm+7nxgC5G+MPg==
X-CSE-MsgGUID: k3VAJpF6THqf1jX4xfvB5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="44968563"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="44968563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 12:44:48 -0700
X-CSE-ConnectionGUID: NRJ2mkFnQKesQOKn4MPYgQ==
X-CSE-MsgGUID: jam1TzfwT9WXIQAz0UvMdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133548146"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 12:44:46 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2bLo-0009FZ-1Q;
	Wed, 09 Apr 2025 19:44:44 +0000
Date: Thu, 10 Apr 2025 03:44:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp_events.c:235:18: sparse: sparse: symbol
 '__hyp_trace_find_event_name' was not declared. Should it be static?
Message-ID: <202504100339.vqr59ZkW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   234a951b246d8500f6b621fe23c238bdc2afcef5
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [1/1] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-r131-20250409 (https://download.01.org/0day-ci/archive/20250410/202504100339.vqr59ZkW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce: (https://download.01.org/0day-ci/archive/20250410/202504100339.vqr59ZkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504100339.vqr59ZkW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/hyp_events.c: note: in included file (through arch/arm64/include/asm/kvm_define_hypevents.h):
   arch/arm64/include/asm/kvm_hypevents.h:14:1: sparse: sparse: symbol 'hyp_event_hyp_enter' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:23:1: sparse: sparse: symbol 'hyp_event_hyp_exit' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:32:1: sparse: sparse: symbol 'hyp_event_host_hcall' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:46:1: sparse: sparse: symbol 'hyp_event_host_smc' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:61:1: sparse: sparse: symbol 'hyp_event_host_mem_abort' was not declared. Should it be static?
   arch/arm64/include/asm/kvm_hypevents.h:75:1: sparse: sparse: symbol 'hyp_event___hyp_printk' was not declared. Should it be static?
>> arch/arm64/kvm/hyp_events.c:235:18: sparse: sparse: symbol '__hyp_trace_find_event_name' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c:258:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:258:17: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:258:17: sparse:    struct hyp_event_table *
>> arch/arm64/kvm/hyp_events.c:247:18: sparse: sparse: symbol 'hyp_trace_find_event_name' was not declared. Should it be static?
   arch/arm64/kvm/hyp_events.c:284:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:284:25: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:284:25: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:451:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:451:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:451:18: sparse:    struct hyp_event_table *
   arch/arm64/kvm/hyp_events.c:451:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   arch/arm64/kvm/hyp_events.c:451:18: sparse:    struct hyp_event_table [noderef] __rcu *
   arch/arm64/kvm/hyp_events.c:451:18: sparse:    struct hyp_event_table *

vim +/__hyp_trace_find_event_name +235 arch/arm64/kvm/hyp_events.c

   231	
   232	#define nr_events(__start, __stop) \
   233		(((unsigned long)__stop - (unsigned long)__start) / sizeof(*__start))
   234	
 > 235	struct hyp_event *__hyp_trace_find_event_name(const char *name,
   236						      struct hyp_event *start,
   237						      struct hyp_event *end)
   238	{
   239		for (; start < end; start++) {
   240			if (!strncmp(name, start->name, HYP_EVENT_NAME_MAX))
   241				return start;
   242		}
   243	
   244		return NULL;
   245	}
   246	
 > 247	struct hyp_event *hyp_trace_find_event_name(const char *name)
   248	{
   249		struct hyp_event_table *table;
   250		struct hyp_event *event =
   251			__hyp_trace_find_event_name(name, __hyp_events_start,
   252						    __hyp_events_end);
   253	
   254		if (event)
   255			return event;
   256	
   257		rcu_read_lock();
   258		table = rcu_dereference(mod_event_tables.tables);
   259	
   260		for (int i = 0; i < mod_event_tables.nr_tables; i++) {
   261			struct hyp_event *end = table->start + table->nr_events;
   262	
   263			event = __hyp_trace_find_event_name(name, table->start, end);
   264			if (event)
   265				break;
   266		}
   267	
   268		rcu_read_unlock();
   269	
   270		return event;
   271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
