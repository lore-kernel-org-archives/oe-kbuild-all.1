Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D67C2DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 22:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689633253; x=1721169253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eW9azAPUyEfDoF+VpyrLVsHbnYMQlqaAaEkwxUI1h1U=;
  b=NfWwecg30UU39EwL2slrulJQ9unaeqUbNRj0VM5Xy2Nu+vnfDpaNX6Qv
   cgsoXvqOyfyGjXDGIUtCuWnlZTHYbENSN4rnpzjERty7Q+lxsrMBLtu6h
   6D92ZoWdU5sfUZcNaKHGdYoVWSu/UXFxzbiyr4AD3FllhgtyZTiRr6QM2
   Pbnd2sWxaIWZaC7q3M2Slr4GrxTnDYw51XleQaaXnuIgmM+vPL1PXT6A/
   WITHoLc5SE/FbZChu5xzepYSHn7stLaJ0B9aeCrg6WX3f07IgDmMqwGKu
   GGKOpVCAej4YmTFsKtk9nqj2dlMFtL3Q2c+V+ocNSnhbHR5c2F/uu5iki
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452431264"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="452431264"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 15:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="813515931"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; 
   d="scan'208";a="813515931"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jul 2023 15:34:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLWnC-0009y0-1U;
	Mon, 17 Jul 2023 22:34:10 +0000
Date: Tue, 18 Jul 2023 06:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6546/11052]
 arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for
 function 'kvm_hyp_events_enable_early'
Message-ID: <202307180608.bZ3Ax3CU-lkp@intel.com>
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
commit: 605d8f6940c38faeaa0aa91a8c793d1d8cd5eab5 [6546/11052] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-r031-20230717 (https://download.01.org/0day-ci/archive/20230718/202307180608.bZ3Ax3CU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180608.bZ3Ax3CU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307180608.bZ3Ax3CU-lkp@intel.com/

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
>> arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for function 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
   bool kvm_hyp_events_enable_early(void)
        ^
   arch/arm64/kvm/hyp_events.c:204:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool kvm_hyp_events_enable_early(void)
   ^
   static 
   arch/arm64/kvm/hyp_events.c:239:6: warning: no previous prototype for function 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
        ^
   arch/arm64/kvm/hyp_events.c:239:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void kvm_hyp_init_events_tracefs(struct dentry *parent)
   ^
   static 
   arch/arm64/kvm/hyp_events.c:271:5: warning: no previous prototype for function 'kvm_hyp_init_events' [-Wmissing-prototypes]
   int kvm_hyp_init_events(void)
       ^
   arch/arm64/kvm/hyp_events.c:271:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kvm_hyp_init_events(void)
   ^
   static 
   5 warnings generated.


vim +/kvm_hyp_events_enable_early +204 arch/arm64/kvm/hyp_events.c

   203	
 > 204	bool kvm_hyp_events_enable_early(void)
   205	{
   206		char *token, *buf = early_events;
   207		bool enabled = false;
   208	
   209		while (true) {
   210			token = strsep(&buf, ",");
   211	
   212			if (!token)
   213				break;
   214	
   215			if (*token) {
   216				struct hyp_event *event;
   217				int ret;
   218	
   219				event = find_hyp_event(token);
   220				if (event) {
   221					ret = enable_hyp_event(event, true);
   222					if (ret)
   223						pr_warn("Couldn't enable hyp event %s:%d\n",
   224							token, ret);
   225					else
   226						enabled = true;
   227				} else {
   228					pr_warn("Couldn't find hyp event %s\n", token);
   229				}
   230			}
   231	
   232			if (buf)
   233				*(buf - 1) = ',';
   234		}
   235	
   236		return enabled;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
