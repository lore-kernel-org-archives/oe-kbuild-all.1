Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A726413A3F8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 16:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712678928; cv=none; b=X6185mIutG1xWFE6YSgTfJA568WqxrBPjdIoPRPMDx+6nQq011uW3oBPRQ5mrGQAhc0EFJwOo36fjU3XIIC4d4mL69ux9rgMp0GfXSd7OVJgHChBdfkXk41TvNGSNZQt4cj9yEMld8boPNxyHWHrci/lGEWvKKVokVckSEyS23A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712678928; c=relaxed/simple;
	bh=CPAx8v1OTjp58Oao6p7kGmjczdV35caIlDfkSXkKOjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=maqxm7iI4ckiouEK6DXzbs2zB8SH1QkJpK/0pzP5zxlfJKclPgWZBJKSoNn5Oei2Lmf7x/Dh6VshlRnb08Cl9eV+V4t/ns7o1XzqV+1Zg02e85egKfm1OErDMF4FJ7Ac8VtAviF5u3PqE58RrPWq0lJ7ombBeiIH6aETBGnsFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8M15k5b; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8M15k5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712678927; x=1744214927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CPAx8v1OTjp58Oao6p7kGmjczdV35caIlDfkSXkKOjM=;
  b=e8M15k5bsmxtKXWOOdxPd+8beDvqFQuk9ZJAJiciPk/PvvuCVVj8b5lZ
   hnNneHDOmRaQbaYwU7Y0C8hCGIX+8IsCNDb9yWpo/rdWbJs8a6i/lXvIC
   ZHm2G2SWnDoXn/Fa2aZhEOBRclQW/eljKk6eIwcZWo7N9u8Z3JW3iZrQv
   H6fwZriWaj1wa8R7fyQT0EE5b/bzx7dIj+gNOfsNTb55vnQoVPZyGYlNl
   3uJ8HclmtzvKUBgWf1YSfn15fIQxweYYmHWTBaY1CuudtFHFM62d3T0JB
   5ZdhmhD7IC/68xRtxfRVd+8EiBW+OwHGaEbJ6JDccrDyf97jiXZ7UYd0X
   Q==;
X-CSE-ConnectionGUID: HjE3n0yOR3i8QPToO/DdEA==
X-CSE-MsgGUID: nSjCJGivTGyeAsjGEdKkgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19384326"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="19384326"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 09:08:46 -0700
X-CSE-ConnectionGUID: rWZpWn4rQdeiqhoEX9d4HA==
X-CSE-MsgGUID: 7slYU24wRd+0sGpqK5eeLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20238615"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Apr 2024 09:08:45 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruE1a-0006Gw-1m;
	Tue, 09 Apr 2024 16:08:42 +0000
Date: Wed, 10 Apr 2024 00:08:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:120:1: warning: no previous prototype
 for function 'hyp_event_trace_psci_mem_protect'
Message-ID: <202404092324.OSygPLBb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   d7ec982179df2206de37eee40cb129c82748eaad
commit: 455f1b852d3a3914611155c0219ce8f4285cec6d [2/2] ANDROID: KVM: arm64: Add psci_mem_protect hyp event
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240409/202404092324.OSygPLBb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240409/202404092324.OSygPLBb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404092324.OSygPLBb-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |              ^
   <scratch space>:118:1: note: expanded from here
     118 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:123:1: note: expanded from here
     123 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous prototype for function 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      32 | HYP_EVENT(host_hcall,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:128:1: note: expanded from here
     128 | hyp_event_trace_host_hcall
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:46:1: warning: no previous prototype for function 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      46 | HYP_EVENT(host_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:133:1: note: expanded from here
     133 | hyp_event_trace_host_smc
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:61:1: warning: no previous prototype for function 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      61 | HYP_EVENT(host_mem_abort,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:138:1: note: expanded from here
     138 | hyp_event_trace_host_mem_abort
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:75:1: warning: no previous prototype for function 'hyp_event_trace___hyp_printk' [-Wmissing-prototypes]
      75 | HYP_EVENT(__hyp_printk,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:143:1: note: expanded from here
     143 | hyp_event_trace___hyp_printk
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:95:1: warning: no previous prototype for function 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      95 | HYP_EVENT(host_ffa_call,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:148:1: note: expanded from here
     148 | hyp_event_trace_host_ffa_call
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:120:1: warning: no previous prototype for function 'hyp_event_trace_psci_mem_protect' [-Wmissing-prototypes]
     120 | HYP_EVENT(psci_mem_protect,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:153:1: note: expanded from here
     153 | hyp_event_trace_psci_mem_protect
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   arch/arm64/kvm/hyp_events.c:215:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     215 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     215 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:265:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     265 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     265 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:339:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     339 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:339:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     339 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:361:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     361 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:361:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     361 | int hyp_trace_init_events(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:378:5: warning: no previous prototype for function 'hyp_trace_init_mod_events' [-Wmissing-prototypes]
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         |     ^
   arch/arm64/kvm/hyp_events.c:378:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     378 | int hyp_trace_init_mod_events(struct hyp_event *event,
         | ^
         | static 
   18 warnings generated.


vim +/hyp_event_trace_psci_mem_protect +120 arch/arm64/include/asm/kvm_hypevents.h

    94	
  > 95	HYP_EVENT(host_ffa_call,
    96		HE_PROTO(u64 func_id, u64 res_a1, u64 res_a2, u64 res_a3, u64 res_a4, int handled, int err),
    97		HE_STRUCT(
    98			he_field(u64, func_id)
    99			he_field(u64, res_a1)
   100			he_field(u64, res_a2)
   101			he_field(u64, res_a3)
   102			he_field(u64, res_a4)
   103			he_field(int, handled)
   104			he_field(int, err)
   105		),
   106		HE_ASSIGN(
   107			__entry->func_id = func_id;
   108			__entry->res_a1 = res_a1;
   109			__entry->res_a2 = res_a2;
   110			__entry->res_a3 = res_a3;
   111			__entry->res_a4 = res_a4;
   112			__entry->handled = handled;
   113			__entry->err = err;
   114			),
   115		HE_PRINTK("ffa_func=0x%llx a1=0x%llx a2=0x%llx a3=0x%llx a4=%llx handled=%d err=%d",
   116			  __entry->func_id, __entry->res_a1, __entry->res_a2,
   117			  __entry->res_a3, __entry->res_a4, __entry->handled, __entry->err)
   118	);
   119	
 > 120	HYP_EVENT(psci_mem_protect,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
