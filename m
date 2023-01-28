Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654133F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 19:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674933530; x=1706469530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/Kn147JzbeeIHlWX+HHCUFQJHl46PLLFA0zI37g0Rc=;
  b=OEC2Ix7sw/nFsf5vM/P90CNotPOUXgVb3JuY5BUmNmdInJo3GpjkqtsF
   M/guvMa8EQouOGpchnyXp5AEVYclDyQSgJeGYtaIlC2lk3cph9kisBmtl
   hOQE2nC+qDIej2xTuR6tSIFr0Ptfs89MOEF0NmmRwLGrvfDxmt4kcrhV4
   cgcqAQ9qXxb6jfpvjtZwxjOKv29FIxmyn/Eee5OYuQ0iAiDsxnk4LQRQI
   71p1VHw89MFtY/W5/u8PUU/pfVv9RggB9W6DUqTFFEi26KlcjJ1Q/5jLe
   pjcWO2EnhtgK20zZCiEPLK9hDmZ+J1BxGmjyF2yXvCIwUzRz7u/teWn/f
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="391880961"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="391880961"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 11:18:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="787562333"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="787562333"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2023 11:18:48 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLqit-00011G-2n;
	Sat, 28 Jan 2023 19:18:47 +0000
Date: Sun, 29 Jan 2023 03:18:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 6546/6550]
 arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for
 'kvm_hyp_events_enable_early'
Message-ID: <202301290349.oa107FA6-lkp@intel.com>
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
commit: 605d8f6940c38faeaa0aa91a8c793d1d8cd5eab5 [6546/6550] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230129/202301290349.oa107FA6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout 605d8f6940c38faeaa0aa91a8c793d1d8cd5eab5
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
>> arch/arm64/kvm/hyp_events.c:204:6: warning: no previous prototype for 'kvm_hyp_events_enable_early' [-Wmissing-prototypes]
     204 | bool kvm_hyp_events_enable_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:239:6: warning: no previous prototype for 'kvm_hyp_init_events_tracefs' [-Wmissing-prototypes]
     239 | void kvm_hyp_init_events_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:271:5: warning: no previous prototype for 'kvm_hyp_init_events' [-Wmissing-prototypes]
     271 | int kvm_hyp_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~


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
