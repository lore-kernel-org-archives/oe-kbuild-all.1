Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29860EC6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 07:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679210225; x=1710746225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MPFzmTxfzGBXV6nI7I75ExwLy7hFaGScrwAqSySx++c=;
  b=LveWiOhqQ+O1f1o5m67k38evoZ7ZxwzNIZTD8URI929hETD4rJItlW40
   v7JdhxrAMuzPcqOw34DUJ/JCtzA5otPqWTMVoxCihgYbHDroeTF6vqoWC
   J3ouIo4EIq0Bf3j4mG702JA2crKLna2uEkPNehfLwBoPOy2kj72Brdr0H
   Vw+LKjUM4PjHn/9uvc3Tx+AJLR/P4og2Oru/USN+DDrjUgQNX+SF2Bun8
   niMQCCj9getFKIqN+b6fcH0GNkmsrLGPPkUeTftli7lU7Ep6GHZOGaJ9b
   sG2rchrDiVVc9vktbY1UyWCRHGbcYpePoGcEH2S3eQ1K2yMqEi0e19ZIR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="318886462"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="318886462"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 00:17:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="749727995"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="749727995"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2023 00:17:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdnHq-000ARi-20;
	Sun, 19 Mar 2023 07:17:02 +0000
Date: Sun, 19 Mar 2023 15:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 16/19] kernel/bpf/core.c:2036: warning:
 "EVAL1" redefined
Message-ID: <202303191503.35pBHw5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   e54619e733db4822727bc8cdec83db05a7249d5d
commit: 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10 [16/19] dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
config: alpha-buildonly-randconfig-r005-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191503.35pBHw5k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191503.35pBHw5k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1632:12: warning: no previous prototype for 'bpf_probe_read_kernel' [-Wmissing-prototypes]
    1632 | u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/core.c:2036: warning: "EVAL1" redefined
    2036 | #define EVAL1(FN, X) FN(X)
         | 
   In file included from include/linux/dynamic_debug.h:10,
                    from include/linux/printk.h:564,
                    from include/asm-generic/bug.h:22,
                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/ktime.h:26,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from include/linux/filter.h:9,
                    from kernel/bpf/core.c:21:
   include/linux/map.h:17: note: this is the location of the previous definition
      17 | #define EVAL1(...) EVAL0(EVAL0(EVAL0(__VA_ARGS__)))
         | 
>> kernel/bpf/core.c:2037: warning: "EVAL2" redefined
    2037 | #define EVAL2(FN, X, Y...) FN(X) EVAL1(FN, Y)
         | 
   include/linux/map.h:18: note: this is the location of the previous definition
      18 | #define EVAL2(...) EVAL1(EVAL1(EVAL1(__VA_ARGS__)))
         | 
>> kernel/bpf/core.c:2038: warning: "EVAL3" redefined
    2038 | #define EVAL3(FN, X, Y...) FN(X) EVAL2(FN, Y)
         | 
   include/linux/map.h:19: note: this is the location of the previous definition
      19 | #define EVAL3(...) EVAL2(EVAL2(EVAL2(__VA_ARGS__)))
         | 
>> kernel/bpf/core.c:2039: warning: "EVAL4" redefined
    2039 | #define EVAL4(FN, X, Y...) FN(X) EVAL3(FN, Y)
         | 
   include/linux/map.h:20: note: this is the location of the previous definition
      20 | #define EVAL4(...) EVAL3(EVAL3(EVAL3(__VA_ARGS__)))
         | 
   kernel/bpf/core.c:2069:6: warning: no previous prototype for 'bpf_patch_call_args' [-Wmissing-prototypes]
    2069 | void bpf_patch_call_args(struct bpf_insn *insn, u32 stack_depth)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/EVAL1 +2036 kernel/bpf/core.c

1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  2035  
b870aa901f4be1 Alexei Starovoitov 2017-05-30 @2036  #define EVAL1(FN, X) FN(X)
b870aa901f4be1 Alexei Starovoitov 2017-05-30 @2037  #define EVAL2(FN, X, Y...) FN(X) EVAL1(FN, Y)
b870aa901f4be1 Alexei Starovoitov 2017-05-30 @2038  #define EVAL3(FN, X, Y...) FN(X) EVAL2(FN, Y)
b870aa901f4be1 Alexei Starovoitov 2017-05-30 @2039  #define EVAL4(FN, X, Y...) FN(X) EVAL3(FN, Y)
b870aa901f4be1 Alexei Starovoitov 2017-05-30  2040  #define EVAL5(FN, X, Y...) FN(X) EVAL4(FN, Y)
b870aa901f4be1 Alexei Starovoitov 2017-05-30  2041  #define EVAL6(FN, X, Y...) FN(X) EVAL5(FN, Y)
b870aa901f4be1 Alexei Starovoitov 2017-05-30  2042  

:::::: The code at line 2036 was first introduced by commit
:::::: b870aa901f4be1d32c13faf9e8f40bf2a8562e19 bpf: use different interpreter depending on required stack size

:::::: TO: Alexei Starovoitov <ast@fb.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
