Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6AA35AC0C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Sep 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899854; cv=none; b=rUAZjqcX55AKOKwsYEPxzNOdhJSsGxqyINrVuy6ylr+tEKsNvCCFjfJUsXAzCovhOp8vII2NXLzK4u6bGmnse6+MxzV21l6IUrx9/tfm3Pz828f3GbbArI+yat/IjgiAoLJWWN3OHvMSOaA18p84aRp2pM/28cl9If65o0cnJl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899854; c=relaxed/simple;
	bh=ResF+O04waBWLgeUUhV29FsCOjlRNzJ3nhorU5C0QyI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m52aEDwuNC9ttD+QLx+1vc07BY9E/0QuRHoCuZ/565CAu1NhinJp3QOogrrIFPcyz0Qdu2m5y2eTNPjiYPufYfI9SgAQAQhNFmxuDejsD/mGQSlzClJaCFqm2C73WKYlQqW7npd6wrvWGurQZ+P5VbuGNfDugxJsZpNPnGWnGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sn/zjbXG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sn/zjbXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789899851; x=1821435851;
  h=date:from:to:cc:subject:message-id;
  bh=ResF+O04waBWLgeUUhV29FsCOjlRNzJ3nhorU5C0QyI=;
  b=Sn/zjbXGTBwjBqRB5J4CB+UceGG8EM66pCawmv7wbqpwUJK+fyJnuMpo
   rDbxMZoBujQP/7lpWKF9cPqgOV2YhNi7+wog5CMZGVDtYgGIieokpbFgQ
   AsPj3iXkp1u4rXqHk0bE4U3UFovYhOI2R+CssHRzIm7kBvZh9YX9Qvi9z
   I7esuej042vmDMqURTCuYqsJdqWMDocawmx+ss2xpddm+H2UhL/PfbcqL
   3I1c+hadBtZ2NY6nljgqtc2th9i9xo/afjkf/bTXVFpxMlPrB1U3RQzUX
   /FaXwLqa2or8hayDkF1efK+CEeHEiSYiNVE4jBlMbBoEQo8FET4of3dx4
   Q==;
X-CSE-ConnectionGUID: q5JoZDE5QjKRuiH3Nwhmcg==
X-CSE-MsgGUID: Uh1JlwdKQVKxTBV7+E01MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11910"; a="94229615"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="94229615"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 03:24:10 -0700
X-CSE-ConnectionGUID: GA48+3XfSy6R2eQxXV2juQ==
X-CSE-MsgGUID: 5diL+RsaQ6eB93jSvPqHzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="268783934"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Sep 2026 03:24:09 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8EiM-00000000CHD-3vIE;
	Sun, 20 Sep 2026 10:24:06 +0000
Date: Sun, 20 Sep 2026 18:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/kvm/hyp_events.c:235:18: sparse: sparse: symbol
 '__hyp_trace_find_event_name' was not declared. Should it be static?
Message-ID: <202609201851.TmrUUTJj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   fb15c16e04b24c94825fe17e483d325c4ac239a8
commit: 12aaf60a831904372fbd91490acdeb2c4ab3cf78 [1/1] ANDROID: KVM: arm64: Allow registration of pKVM module hyp events
config: arm64-randconfig-r1301-20260919 (https://download.01.org/0day-ci/archive/20260920/202609201851.TmrUUTJj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260920/202609201851.TmrUUTJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609201851.TmrUUTJj-lkp@intel.com/

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
