Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516B12B66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 23:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689637576; x=1721173576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Rfrg4SMEON8xl/TEvY8oQZkQM7rnO9GhxAO3H6LQOU=;
  b=Pu/W5sHr3TUxkuxTyTCYzNWpIDd5qXdmqUoDJhnhd7ZyySd/etH5EAEH
   uxrhXHEMNqre75UQHtCdITZhsH4yYChCrXN9er0pha6HE6ec4gZt/vidX
   SutdjeLJkFTla0qX2fuGPLFztcaNoceV2Ur6zInUwrNU+0/9EVFT33dbk
   6sIGWC7URe4c4mDuUvbdmgtmxtxu8+ZLWkiYZo3cFFJddVTNMXCGeXfVO
   gZj/FEndoUmfdGtcFi0kuYcJBH0XurxuOVKuf4ZJmYwXXI5sLQXQxd4ET
   A15s23cmmFC0ISSMMivfXUAlT0qnZxhoDY2EI9/TRcP7TzmRJristfgO7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="368707478"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="368707478"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 16:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813527644"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="813527644"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2023 16:46:13 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLXuu-000A0A-0T;
	Mon, 17 Jul 2023 23:46:12 +0000
Date: Tue, 18 Jul 2023 07:45:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6548/11052]
 arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous prototype
 for function 'hyp_event_trace_host_hcall'
Message-ID: <202307180748.lD0bctCx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a16d62a2960b9f3c3e809d8051accf68826f3d32
commit: 508af69a745a81d6fedd161b4d5d614a9d1f9788 [6548/11052] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180748.lD0bctCx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180748.lD0bctCx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180748.lD0bctCx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:37:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
   HYP_EVENT(hyp_enter,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:72:1: note: expanded from here
   hyp_event_trace_hyp_enter
   ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
   HYP_EVENT(hyp_exit,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:77:1: note: expanded from here
   hyp_event_trace_hyp_exit
   ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
>> arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous prototype for function 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
   HYP_EVENT(host_hcall,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:82:1: note: expanded from here
   hyp_event_trace_host_hcall
   ^
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
>> arch/arm64/include/asm/kvm_hypevents.h:46:1: warning: no previous prototype for function 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
   HYP_EVENT(host_smc,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:87:1: note: expanded from here
   hyp_event_trace_host_smc
   ^
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   In file included from arch/arm64/kvm/hyp_events.c:37:
>> arch/arm64/include/asm/kvm_hypevents.h:61:1: warning: no previous prototype for function 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
   HYP_EVENT(host_mem_abort,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:92:1: note: expanded from here
   hyp_event_trace_host_mem_abort
   ^
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:25:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   arch/arm64/kvm/hyp_events.c:249:6: warning: no previous prototype for function 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
   bool kvm_hyp_events_enable_early(void)
        ^
   arch/arm64/kvm/hyp_events.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool kvm_hyp_events_enable_early(void)
   ^
   static 
   arch/arm64/kvm/hyp_events.c:284:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
        ^
   arch/arm64/kvm/hyp_events.c:284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
   ^
   static 
   arch/arm64/kvm/hyp_events.c:323:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
   int kvm_hyp_init_events(void)
       ^
   arch/arm64/kvm/hyp_events.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_hyp_init_events(void)
   ^
   static 
   8 warnings generated.


vim +/hyp_event_trace_host_hcall +32 arch/arm64/include/asm/kvm_hypevents.h

    31	
  > 32	HYP_EVENT(host_hcall,
    33		HE_PROTO(unsigned int id, u8 invalid),
    34		HE_STRUCT(
    35			he_field(unsigned int, id)
    36			he_field(u8, invalid)
    37		),
    38		HE_ASSIGN(
    39			__entry->id = id;
    40			__entry->invalid = invalid;
    41		),
    42		HE_PRINTK("id=%u invalid=%u",
    43			  __entry->id, __entry->invalid)
    44	);
    45	
  > 46	HYP_EVENT(host_smc,
    47		HE_PROTO(u64 id, u8 forwarded),
    48		HE_STRUCT(
    49			he_field(u64, id)
    50			he_field(u8, forwarded)
    51		),
    52		HE_ASSIGN(
    53			__entry->id = id;
    54			__entry->forwarded = forwarded;
    55		),
    56		HE_PRINTK("id=%llu invalid=%u",
    57			  __entry->id, __entry->forwarded)
    58	);
    59	
    60	
  > 61	HYP_EVENT(host_mem_abort,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
