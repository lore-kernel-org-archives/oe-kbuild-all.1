Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E6BC088
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676383936; x=1707919936;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uLcATDpVNrBAuHLrSS0RSlmnbsbKv1nHfv/BZdwTTJg=;
  b=ECbOKIfVRt89ncdl2HMls80GbbwLY9MVsYazQwM3ul7POfahnXfxrd/j
   9unVBG1cPg/pjhIxdCVHiIuqZmySVLho1MQbcQ+P6S+JpB/lU/g0S74g1
   +p2bm0aqniofKMneOKVhnlGmlQitqc84t+gg4K3sSdlVLZTyqF6CGksHu
   GD2SXh9uM8/BI9ytTpX174gUHTEXviGwf4c2eiDotm+dKH5KXUdXLQ/i+
   v+nNp+wGPLRnuFiyN3iUUFvAS1dIthb0/ODgPmYQTeJHhphJovKoF7sc5
   LqFl9w4k2MAWGe3rBpXNsy74wPwK+dIqiBwr1eZQIeAhAazP5KSXWDLSQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="314811396"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="314811396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 06:12:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619069812"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="619069812"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Feb 2023 06:12:12 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRw2V-0008Yp-2R;
	Tue, 14 Feb 2023 14:12:11 +0000
Date: Tue, 14 Feb 2023 22:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15
 11/11] arch/arm64/include/asm/kvm_hypevents.h:32:1: warning: no previous
 prototype for function 'hyp_event_trace_host_hcall'
Message-ID: <202302142222.8PzhsqQ3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   27e5fbdd8569f72e6fc38ffd7f3b6b4992099026
commit: 25d0badbe3f4c15b5a29fd6d91b207fc7e5921c1 [11/11] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302142222.8PzhsqQ3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/25d0badbe3f4c15b5a29fd6d91b207fc7e5921c1
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 25d0badbe3f4c15b5a29fd6d91b207fc7e5921c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142222.8PzhsqQ3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:37:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
   HYP_EVENT(hyp_enter,
   ^
   arch/arm64/kvm/hyp_events.c:25:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:80:1: note: expanded from here
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
   <scratch space>:85:1: note: expanded from here
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
   <scratch space>:90:1: note: expanded from here
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
   <scratch space>:95:1: note: expanded from here
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
   <scratch space>:5:1: note: expanded from here
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
https://github.com/intel/lkp-tests
