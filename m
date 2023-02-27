Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E72113
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 11:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677495999; x=1709031999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnzzSjTFC17KwIEJ7taR34kuFH9yezDxzvUoNiAOfew=;
  b=Q7PcicRWrbYcpYCwT2EhFRT036oo1dnKUx6NflkJ9vUrGJVTpDTEJc8X
   SH/AweszBm0oXFdgT/GloB73omFGvbCDN3BdQnq98sYkrltbNjGt8zlt/
   4f2X60sczTcz13p/LcAzLYJ4yhvWxLWpo4H+Wsp4GOcAFXmEuOtRJV9tv
   WAmF7vgcf7Hq3WTlu4vhz47D1ZLhSA0eyRvN4urzgkXw4VcuUx0Q/zmK8
   JRo/sRf3iao4exdPPmJzN6RLzFBfe8V1DvnB/MvZD5jfXsyHVbhl0r4rs
   WHhjiGeK3R/rZKeXZ+NeOinFhRImAuPOdI+/muMu99H7YDdTsafskaR60
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="396385851"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="396385851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 03:06:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="737634838"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; 
   d="scan'208";a="737634838"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 03:06:37 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWbL3-0004Lb-13;
	Mon, 27 Feb 2023 11:06:37 +0000
Date: Mon, 27 Feb 2023 19:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 435/440]
 include/linux/kvm_host.h:429:9: error: implicit declaration of function
 'perf_event_guest_enter_exit'
Message-ID: <202302271833.4v9WbSB7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   6960696b1b5b8d8074bf2724321ff73782e42e6c
commit: b7377b41927c4fa035228a4eb3fb6151d64bf749 [435/440] perf, KVM: introduce software event on enter/exit to/from guest
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230227/202302271833.4v9WbSB7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b7377b41927c4fa035228a4eb3fb6151d64bf749
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b7377b41927c4fa035228a4eb3fb6151d64bf749
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302271833.4v9WbSB7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   include/linux/kvm_host.h: In function 'guest_context_enter_irqoff':
>> include/linux/kvm_host.h:429:9: error: implicit declaration of function 'perf_event_guest_enter_exit' [-Werror=implicit-function-declaration]
     429 |         perf_event_guest_enter_exit(true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/s390/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/perf_event_guest_enter_exit +429 include/linux/kvm_host.h

   418	
   419	/*
   420	 * Enter guest context and enter an RCU extended quiescent state.
   421	 *
   422	 * Between guest_context_enter_irqoff() and guest_context_exit_irqoff() it is
   423	 * unsafe to use any code which may directly or indirectly use RCU, tracing
   424	 * (including IRQ flag tracing), or lockdep. All code in this period must be
   425	 * non-instrumentable.
   426	 */
   427	static __always_inline void guest_context_enter_irqoff(void)
   428	{
 > 429		perf_event_guest_enter_exit(true);
   430		/*
   431		 * KVM does not hold any references to rcu protected data when it
   432		 * switches CPU into a guest mode. In fact switching to a guest mode
   433		 * is very similar to exiting to userspace from rcu point of view. In
   434		 * addition CPU may stay in a guest mode for quite a long time (up to
   435		 * one time slice). Lets treat guest mode as quiescent state, just like
   436		 * we do with user-mode execution.
   437		 */
   438		if (!context_tracking_guest_enter()) {
   439			instrumentation_begin();
   440			rcu_virt_note_context_switch();
   441			instrumentation_end();
   442		}
   443	}
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
