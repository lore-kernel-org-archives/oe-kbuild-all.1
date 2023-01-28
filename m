Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281667491
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674939714; x=1706475714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5yvC3Pueu/uqnxKvXVIcwLp6rXs90KSHeUgP01pBrXI=;
  b=KCc20qYXyk9PN1Dps9ON4i2q61zXM2pgYxgloDNr2gveIBttHkIMriOT
   bPxumg3suZtSw3rAQvUPccI8eOpaKLxVjVoGg1fbX/4CjYg4ePFc59FYJ
   XIWWNQFF4YLIRUDAozoPla54zFYb/6kAA7vX7euTZ6iJppRRzypFKZB4a
   74lo9aTsSoeVJ213oWLMEpChWq51HvFtWs1FFOvpcitfxTdYKZfwvwXdv
   wnr+W/4PdG9TzYJyyZDtGDYnlJe2i/BSHWQoizqjiBS0JJySlbfCGZjvv
   t3VcFQR6IW4yTIpxda2O2ZrmlBb0SeVa4G2EbBvk39U/u+cTlkhi9Ljkn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306984309"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="306984309"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 13:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="695929857"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="695929857"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 28 Jan 2023 13:01:52 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLsKd-00016O-1t;
	Sat, 28 Jan 2023 21:01:51 +0000
Date: Sun, 29 Jan 2023 05:01:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6548/6550]
 arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for
 'hyp_event_trace_host_hcall'
Message-ID: <202301290444.gi9bVh2o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5a5282ca964178e46d1adb96ea1c3341303e94b
commit: 508af69a745a81d6fedd161b4d5d614a9d1f9788 [6548/6550] ANDROID: KVM: arm64: Add EL2 wakeup cause hyp events
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290444.gi9bVh2o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 508af69a745a81d6fedd161b4d5d614a9d1f9788
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_hcall' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:32:1: note: in expansion of macro 'HYP_EVENT'
      32 | HYP_EVENT(host_hcall,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_smc' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:46:1: note: in expansion of macro 'HYP_EVENT'
      46 | HYP_EVENT(host_smc,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:25:27: warning: no previous prototype for 'hyp_event_trace_host_mem_abort' [-Wmissing-prototypes]
      25 |         enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
         |                           ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:61:1: note: in expansion of macro 'HYP_EVENT'
      61 | HYP_EVENT(host_mem_abort,
         | ^~~~~~~~~
   arch/arm64/kvm/hyp_events.c:249:6: warning: no previous prototype for 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
     249 | bool kvm_hyp_events_enable_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:284:6: warning: no previous prototype for 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     284 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:323:5: warning: no previous prototype for 'kvm_hyp_init_events' [-Wmissing-prototypes]
     323 | int kvm_hyp_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/hyp_event_trace_host_hcall +25 arch/arm64/kvm/hyp_events.c

09014fb1f2df19 Vincent Donnefort 2023-01-26  22  
09014fb1f2df19 Vincent Donnefort 2023-01-26  23  #define HYP_EVENT(__name, __proto, __struct, __assign, __printk)		\
09014fb1f2df19 Vincent Donnefort 2023-01-26  24  	HYP_EVENT_FORMAT(__name, __struct);					\
09014fb1f2df19 Vincent Donnefort 2023-01-26 @25  	enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter,	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  26  					  int flags, struct trace_event *event) \
09014fb1f2df19 Vincent Donnefort 2023-01-26  27  	{									\
09014fb1f2df19 Vincent Donnefort 2023-01-26  28  		struct ht_iterator *ht_iter = (struct ht_iterator *)iter;	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  29  		struct trace_hyp_format_##__name __maybe_unused *__entry =	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  30  			(struct trace_hyp_format_##__name *)ht_iter->ent;	\
09014fb1f2df19 Vincent Donnefort 2023-01-26  31  		trace_seq_puts(&ht_iter->seq, #__name);				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  32  		trace_seq_putc(&ht_iter->seq, ' ');				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  33  		trace_seq_printf(&ht_iter->seq, __printk);			\
09014fb1f2df19 Vincent Donnefort 2023-01-26  34  		trace_seq_putc(&ht_iter->seq, '\n');				\
09014fb1f2df19 Vincent Donnefort 2023-01-26  35  		return TRACE_TYPE_HANDLED;					\
09014fb1f2df19 Vincent Donnefort 2023-01-26  36  	}
09014fb1f2df19 Vincent Donnefort 2023-01-26  37  #include <asm/kvm_hypevents.h>
09014fb1f2df19 Vincent Donnefort 2023-01-26  38  

:::::: The code at line 25 was first introduced by commit
:::::: 09014fb1f2df192b186cd253fa990925f262f308 ANDROID: KVM: arm64: Add support for nVHE hyp events

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Vincent Donnefort <vdonnefort@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
