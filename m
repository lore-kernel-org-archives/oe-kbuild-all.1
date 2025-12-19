Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F89CAD5A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 01:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766109525; cv=none; b=ApYqBLZCewNSR9KINrhY2Ohf2exB+Aj79oyYUjeaeNVXZWGF4kRIowsUkvBBKhBI7X4rcaIuZerthFDrezslgxZ4zDKBM4g2XL3Vq9R/rM1CkQw0ThKv4kTOx5Z2+7WZ57/UTop7BFtESYV6G494qruzjExOp/fv9oLdEEQAXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766109525; c=relaxed/simple;
	bh=O1nFvJyxDjVvhW2hEjZJgJV+82SMIHBoH04Th5R1lZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vAHsj9NVguZbc1eh1XL+wAF7U16WCeWrSnLXsFj64pcdWzfsstZ1Cz79o5x3x+WjjaMPH6IWEUpQr+xUt5H5CYR56wjzrcJExLq9uLccdAMa/s4BGDNyFqZUgsJjZ4cXvUdBOgBxfQr7TqlssQHFj41ovqi4w+UwcIDw8TMADC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loIMwjDL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loIMwjDL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766109524; x=1797645524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O1nFvJyxDjVvhW2hEjZJgJV+82SMIHBoH04Th5R1lZA=;
  b=loIMwjDLblGT2eudEflpeVvZWUGNG+szWkG6PdmKaE3HC6QEfuZTjnc8
   NZZFafG1suaRaE0QanbbTXlNEiQ2JeizGqVHxKM+cmuP7SNtHcxqIeTAv
   uTD2nQv0Bv+uylkB/6aPdpX/hjy4qGxOtW8eCcoKKPqfJwqrjYn9WpZK4
   bTreTa3ebGlRgpFMrliZv7kiLI8Qiowzw2+ncjazI1gR5Gp0xO2VEB/2G
   +hhsbvgSwsR7dBq0n6tS71WEVz+9AuKj8iMBfQh8xgGHd20IJnxLN/+lp
   8qAEtGb9r6yjfIJBfLzFN4Y0bcgWkeyn/9cL6AfgRsuJVWvX4cxoLZbDs
   A==;
X-CSE-ConnectionGUID: iT9fd8cjSJuOGwZWkQ2ZXw==
X-CSE-MsgGUID: ebUT94drQdmC32zvx8ldJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68111814"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68111814"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:58:43 -0800
X-CSE-ConnectionGUID: p5HshuktQaSTjTfMQe+1iA==
X-CSE-MsgGUID: WVj2eKSnTE6gpu4XfYmMAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="198640516"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Dec 2025 17:58:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWPlP-000000002sX-1Q4G;
	Fri, 19 Dec 2025 01:58:39 +0000
Date: Fri, 19 Dec 2025 09:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/include/asm/kvm_hypevents.h:95:1: warning: no previous prototype
 for function 'hyp_event_trace_host_ffa_call'
Message-ID: <202512190910.AqX9XpGV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   16aa689262af24cd0897f463b3d0dd9ecee6b37c
commit: 107000fef3c7d0562e234da7033f35b53d0e8b3d [2/2] ANDROID: KVM: arm64: Add FF-A trace event
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251219/202512190910.AqX9XpGV-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512190910.AqX9XpGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512190910.AqX9XpGV-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:111:1: note: expanded from here
     111 | hyp_event_trace_hyp_enter
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
   <scratch space>:116:1: note: expanded from here
     116 | hyp_event_trace_hyp_exit
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
   <scratch space>:121:1: note: expanded from here
     121 | hyp_event_trace_host_hcall
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
   <scratch space>:126:1: note: expanded from here
     126 | hyp_event_trace_host_smc
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
   <scratch space>:131:1: note: expanded from here
     131 | hyp_event_trace_host_mem_abort
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
   <scratch space>:136:1: note: expanded from here
     136 | hyp_event_trace___hyp_printk
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:75:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:14:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/kvm_hypevents.h:95:1: warning: no previous prototype for function 'hyp_event_trace_host_ffa_call' [-Wmissing-prototypes]
      95 | HYP_EVENT(host_ffa_call,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:141:1: note: expanded from here
     141 | hyp_event_trace_host_ffa_call
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:95:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
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
   17 warnings generated.


vim +/hyp_event_trace_host_ffa_call +95 arch/arm64/include/asm/kvm_hypevents.h

    74	
  > 75	HYP_EVENT(__hyp_printk,
    76		HE_PROTO(const char *fmt, u64 a, u64 b, u64 c, u64 d),
    77		HE_STRUCT(
    78			he_field(u8, fmt_id)
    79			he_field(u64, a)
    80			he_field(u64, b)
    81			he_field(u64, c)
    82			he_field(u64, d)
    83		),
    84		HE_ASSIGN(
    85			__entry->fmt_id = hyp_printk_fmt_to_id(fmt);
    86			__entry->a = a;
    87			__entry->b = b;
    88			__entry->c = c;
    89			__entry->d = d;
    90		),
    91		HE_PRINTK_UNKNOWN_FMT(hyp_printk_fmt_from_id(__entry->fmt_id),
    92			__entry->a, __entry->b, __entry->c, __entry->d)
    93	);
    94	
  > 95	HYP_EVENT(host_ffa_call,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
