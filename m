Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57351EC6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679210825; x=1710746825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U+910INUnbRmXRfdWQtSMT4r4QKwpGsd/YJI3L0vhkE=;
  b=ONX0P3CgV3m0ZFeqZEak4NTWBEruwBTGm08YPMRkVRJPObSWLYW+6rbv
   Icd6GZMmZsZscteERqFY1aIllz94ehD/t35Wn1CI14Kx89cqB1/TwXI3o
   wVq6m9q4jJtHqCnDWHiTG9CPBEmAsKLntx9WRFicmzfvujD0jZU+1P9IO
   cSlBP8MLY0yGLf5XRcpuqpVcOpF4UjxZ2Gm114waU/djBdmVKIw6xTSBI
   eiY0bvMXfqB7pplmVtAVepEAHCiCjknKFmwdv0mAMj3QzP0uAJ0IRi+aE
   qGkZ335wHCFt3eiwNROrQvFO00U7fY2a0QwU1b+F3crV3hmqYPCZrW/cO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="338509685"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="338509685"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 00:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="674001151"
X-IronPort-AV: E=Sophos;i="5.98,273,1673942400"; 
   d="scan'208";a="674001151"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 19 Mar 2023 00:27:03 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdnRW-000ARm-2B;
	Sun, 19 Mar 2023 07:27:02 +0000
Date: Sun, 19 Mar 2023 15:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix-next 16/19] kernel/bpf/core.c:2036:9: warning:
 'EVAL1' macro redefined
Message-ID: <202303191502.W0Fj74qX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix-next
head:   c4b31485bf709f2667d85485ee94f8bc2f7c91d1
commit: 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10 [16/19] dyndbg-API: DYNDBG_CLASSMAP_DEFINE() improvements
config: riscv-randconfig-r016-20230319 (https://download.01.org/0day-ci/archive/20230319/202303191502.W0Fj74qX-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/jimc/linux/commit/1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc dd-drm-fix-next
        git checkout 1ea6546fdc0cb7ab5b9c4dc05af37dff22781c10
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303191502.W0Fj74qX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/core.c:1632:12: warning: no previous prototype for function 'bpf_probe_read_kernel' [-Wmissing-prototypes]
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
              ^
   kernel/bpf/core.c:1632:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 __weak bpf_probe_read_kernel(void *dst, u32 size, const void *unsafe_ptr)
   ^
   static 
>> kernel/bpf/core.c:2036:9: warning: 'EVAL1' macro redefined [-Wmacro-redefined]
   #define EVAL1(FN, X) FN(X)
           ^
   include/linux/map.h:17:9: note: previous definition is here
   #define EVAL1(...) EVAL0(EVAL0(EVAL0(__VA_ARGS__)))
           ^
>> kernel/bpf/core.c:2037:9: warning: 'EVAL2' macro redefined [-Wmacro-redefined]
   #define EVAL2(FN, X, Y...) FN(X) EVAL1(FN, Y)
           ^
   include/linux/map.h:18:9: note: previous definition is here
   #define EVAL2(...) EVAL1(EVAL1(EVAL1(__VA_ARGS__)))
           ^
>> kernel/bpf/core.c:2038:9: warning: 'EVAL3' macro redefined [-Wmacro-redefined]
   #define EVAL3(FN, X, Y...) FN(X) EVAL2(FN, Y)
           ^
   include/linux/map.h:19:9: note: previous definition is here
   #define EVAL3(...) EVAL2(EVAL2(EVAL2(__VA_ARGS__)))
           ^
>> kernel/bpf/core.c:2039:9: warning: 'EVAL4' macro redefined [-Wmacro-redefined]
   #define EVAL4(FN, X, Y...) FN(X) EVAL3(FN, Y)
           ^
   include/linux/map.h:20:9: note: previous definition is here
   #define EVAL4(...) EVAL3(EVAL3(EVAL3(__VA_ARGS__)))
           ^
   5 warnings generated.


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
