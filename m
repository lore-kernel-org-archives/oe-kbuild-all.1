Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D60C2D7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689628933; x=1721164933;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5lt9zQofVGhHvQXKZC8vC67KbEdQ4ztI1WmVt8GK+Qc=;
  b=FnstYvgPhAwNKgNg7evdAQCkbxNzJkRo0oNqVEA3czI8oPeKy3qWSU8t
   V9Fsa4tuW7YEFzpbeLDCSrljD6ucFCSTZ1Mozll9z5ogo0OgB+OikgD0V
   ExaepPap7suL0B2Hsp41iGhw1VJ++8UkpKT4j6W/D9tq6tk48NhIFlqNz
   emJwZDoMnqdM7hngTO2hmDtcqF1S+JPGpvlxgbdRZCjnQNj1sTsZ4G6an
   pKlRb6Wt80ifuw6s6PMOV+LGRviH5SpzoChWAZK5Tk81YW07QG2IZbnTw
   WXP1CZeD3fYFQ71I+NhWn67TkMKTRCFLusSpgkj7Q3LLvhkljWzsZyFf9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452418090"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452418090"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 14:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="723349205"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="723349205"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Jul 2023 14:22:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLVfV-0009vk-0C;
	Mon, 17 Jul 2023 21:22:09 +0000
Date: Tue, 18 Jul 2023 05:22:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6544/11052]
 arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype
 for function 'hyp_event_trace_hyp_enter'
Message-ID: <202307180522.rilhfQms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   a16d62a2960b9f3c3e809d8051accf68826f3d32
commit: 09014fb1f2df192b186cd253fa990925f262f308 [6544/11052] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180522.rilhfQms-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180522.rilhfQms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180522.rilhfQms-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:34:
>> arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
   HYP_EVENT(hyp_enter,
   ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:70:1: note: expanded from here
   hyp_event_trace_hyp_enter
   ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
   In file included from arch/arm64/kvm/hyp_events.c:34:
>> arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
   HYP_EVENT(hyp_exit,
   ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:75:1: note: expanded from here
   hyp_event_trace_hyp_exit
   ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/kvm/hyp_events.c:22:2: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
           ^
>> arch/arm64/kvm/hyp_events.c:166:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
        ^
   arch/arm64/kvm/hyp_events.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
   ^
   static 
>> arch/arm64/kvm/hyp_events.c:198:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
   int kvm_hyp_init_events(void)
       ^
   arch/arm64/kvm/hyp_events.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_hyp_init_events(void)
   ^
   static 
   4 warnings generated.


vim +/hyp_event_trace_hyp_enter +14 arch/arm64/include/asm/kvm_hypevents.h

     9	
    10	/*
    11	 * Hypervisor events definitions.
    12	 */
    13	
  > 14	HYP_EVENT(hyp_enter,
    15		HE_PROTO(void),
    16		HE_STRUCT(
    17		),
    18		HE_ASSIGN(
    19		),
    20		HE_PRINTK(" ")
    21	);
    22	
  > 23	HYP_EVENT(hyp_exit,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
