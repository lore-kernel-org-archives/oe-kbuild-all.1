Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468615B7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676378830; x=1707914830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i1EqxaeaQi9CKDVbr84tj+4qQbxMZzqdQtcO+cg7QQM=;
  b=VrFudpEXgmYDZvs3f6Jh84u6n2xHCe7pT0N6IQq7rCM4WlxHgd2Jhecp
   Iacg4RD6ZsYxBlk9AktKMonrRoH2giblYNxy4pI1qOZkWsEOujxTdAfr8
   SlCyRQl/gxvtYhBctorRJAV7hmLkyHCY7hw8nSqp/ASZDGmzBxIZYX3Ag
   R886+54kcOUD4B7mpUzjTwo/4vSeT7SX06yvWGhcd0dyQZf0b1NH++7vB
   CoxeoUiF4mc/DY+5Ki8FQuELnca7nK6RDcP6hgHnpPlgexqJl4tkdVqgV
   zL8UO6m3JKEqeDSwOrpJkoQrbzzieBEhRNLz+Pzw5yyCj9b7tBqt4NR1o
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314794823"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="314794823"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2023 04:47:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671210454"
X-IronPort-AV: E=Sophos;i="5.97,296,1669104000"; 
   d="scan'208";a="671210454"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 14 Feb 2023 04:47:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRuiB-0008VJ-36;
	Tue, 14 Feb 2023 12:47:07 +0000
Date: Tue, 14 Feb 2023 20:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-5.15 9/11]
 arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for
 function 'kvm_hyp_events_enable_early'
Message-ID: <202302142007.gWTNqVkp-lkp@intel.com>
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
commit: 8f1f4a1b65a4aa9b4ab2c37052d08d59404a06db [9/11] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302142007.gWTNqVkp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/8f1f4a1b65a4aa9b4ab2c37052d08d59404a06db
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android14-5.15
        git checkout 8f1f4a1b65a4aa9b4ab2c37052d08d59404a06db
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302142007.gWTNqVkp-lkp@intel.com/

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
https://github.com/intel/lkp-tests
