Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E5A107B4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676372647; x=1707908647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlYfJnOXx2UhruOOZHu9oLk2bdQcO7opL6i/ucW5xRM=;
  b=AAddQRm4t/rrS18IqwiMZhBE+IyUgnHjEz6Tn03GzOrQd+iOdvQIr0c7
   ZL6/LnwXJqbapbxdVPbgdRJlXxlpWSkqkvXbJofLhpo/zzZZFu9iVsOfx
   3nEBSnMJMPNbmjwmczcKU1fCMNIYwRdy0zZa/UalGeFquny+jVi2h1Oa5
   FFy14fRorHX1Dn0f4MJOBeaYPCinhZ1gq6yEJ5oH82wnfR0A/FCA7jilq
   Jk3a0KmjNCb0L/BR2P13cT/cbdJs9urVtpY29aVZnp4ENGqm4+pp/IPAi
   5t7u10lK7MMOM/iQaaUNlv/gpJHEn7lULNZYFKtgS4Eja1Pv3la7ESR3E
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393536554"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="393536554"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 03:04:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="998033183"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="998033183"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Feb 2023 03:04:05 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRt6S-0008QX-20;
	Tue, 14 Feb 2023 11:04:04 +0000
Date: Tue, 14 Feb 2023 19:03:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 7/11]
 arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype
 for function 'hyp_event_trace_hyp_enter'
Message-ID: <202302141826.CELNvZxL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-5.15
head:   8e245b4c3a574fbb94b6b655f84e071febc147a6
commit: 089c9082c2fd92365acd669b092c2256267f2e13 [7/11] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141826.CELNvZxL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/089c9082c2fd92365acd669b092c2256267f2e13
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 089c9082c2fd92365acd669b092c2256267f2e13
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141826.CELNvZxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:34:
>> arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
   HYP_EVENT(hyp_enter,
   ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:80:1: note: expanded from here
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
   <scratch space>:85:1: note: expanded from here
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
https://github.com/intel/lkp-tests
