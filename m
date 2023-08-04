Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D111105
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 02:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691115782; x=1722651782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ROIzihOz6a8DFWYoOnTWbxWaG59skVc51MJIEiUAh8=;
  b=MrI7TsMd7g+VVVArlDWrth5imLdH9Fwvn9MZwjFANVlnSdjawKg0d2Fc
   4E5sb6CyiO9mzeOxDQhkPNOyTLhF2gFCYPd9BFx2/qMw/0WApuehtbxKQ
   6Yrk52vISKY68gDvVMQWsHVSuS1dD1Lmc/ZFyw62DXmrwZSh9BGWMqD7+
   9LDRBjVUkMVsS1ky7I2DN0x9dOEpgpcbQl+HlH8vJjNQZOFGo/DWCUKlp
   M4w0puOqFfuIJp0u9S4Bg5noN7hSyRuXPZ/PYp3FjO97MqpRNA0P2CuYQ
   Vk9kCsZOQJgMGc9C7Cn7hfe2yK+TiYGKi9ustUx6G/RKhPjeunJSjo7AD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="368946353"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="368946353"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 19:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="853533853"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="853533853"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 03 Aug 2023 19:23:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRkSx-0002Xr-1Y;
	Fri, 04 Aug 2023 02:22:59 +0000
Date: Fri, 4 Aug 2023 10:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 290/387] kernel/sched/smp.h:14:20: error: redefinition
 of 'flush_smp_call_function_queue'
Message-ID: <202308041004.c5jU5yMz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   81c27c2ecb3019a7e76026b3fced2f750c2faf0a
commit: b93fdc02497d5dcf7405a2290c0acf7f7af011d9 [290/387] sched/alt: [Sync] 16bf5a5e1ec5 smp: Rename flush_smp_call_function_from_idle()
config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041004.c5jU5yMz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041004.c5jU5yMz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041004.c5jU5yMz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:35:
>> kernel/sched/smp.h:14:20: error: redefinition of 'flush_smp_call_function_queue'
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   kernel/sched/alt_sched.h:296:20: note: previous definition is here
   static inline void flush_smp_call_function_queue(void) { }
                      ^
   1 error generated.


vim +/flush_smp_call_function_queue +14 kernel/sched/smp.h

d664e399128bd7 Thomas Gleixner 2022-04-13  10  
d664e399128bd7 Thomas Gleixner 2022-04-13  11  #ifdef CONFIG_SMP
16bf5a5e1ec564 Thomas Gleixner 2022-04-13  12  extern void flush_smp_call_function_queue(void);
d664e399128bd7 Thomas Gleixner 2022-04-13  13  #else
16bf5a5e1ec564 Thomas Gleixner 2022-04-13 @14  static inline void flush_smp_call_function_queue(void) { }

:::::: The code at line 14 was first introduced by commit
:::::: 16bf5a5e1ec56474ed2a19d72f272ed09a5d3ea1 smp: Rename flush_smp_call_function_from_idle()

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
