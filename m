Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB47F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 01:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686014018; x=1717550018;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=58a14qJxH/4AP+rtbhYQCjf7KJf5ddM7+KPSey+61QA=;
  b=oJIcXSZqbAZaONULBWXl9LV4mHM4a6sCnA+pSNEr+NTbcgeEeqRhydKW
   O5tYiP0ZoPOhEx6Sbz3yJsYurqBtgUPYhx/AjCiG5IsSw0UAZ8BP0SBJj
   9p+UUxrpGX3L33uzIal320bCmKolX/gxXYhLvQXhgvlROc0ea0+YQuR4e
   gny5qcc5yYN3dTbprIrMyHIBECzseyp1cK0Xsd/jdjeeLXuqrefRqKR/t
   PUsxEBms+Jd439CTq2jxfRqmu+OEuW0/XtANbhTTJHMXuMkrjEvD2QH8g
   3Xmo0StIk4vM28Ly3hcgTWCRytBsiBP/ZNmy4SLCAp7x7zwc8n2KuZxRg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="341167453"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="341167453"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 18:13:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="821391931"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="821391931"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Jun 2023 18:13:36 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6LGS-0004dh-0E;
	Tue, 06 Jun 2023 01:13:36 +0000
Date: Tue, 6 Jun 2023 09:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6544/10696]
 arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype
 for function 'hyp_event_trace_hyp_enter'
Message-ID: <202306060934.K8Sr0QF8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   6b3daa3bba510938667ade27c4fe7384a0e3f082
commit: 09014fb1f2df192b186cd253fa990925f262f308 [6544/10696] ANDROID: KVM: arm64: Add support for nVHE hyp events
config: arm64-randconfig-r006-20230605 (https://download.01.org/0day-ci/archive/20230606/202306060934.K8Sr0QF8-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 09014fb1f2df192b186cd253fa990925f262f308
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060934.K8Sr0QF8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:34:
>> arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
   HYP_EVENT(hyp_enter,
   ^
   arch/arm64/kvm/hyp_events.c:22:20: note: expanded from macro 'HYP_EVENT'
           enum print_line_t hyp_event_trace_##__name(struct trace_iterator *iter, \
                             ^
   <scratch space>:29:1: note: expanded from here
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
   <scratch space>:34:1: note: expanded from here
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
