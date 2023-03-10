Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E62CC957
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 21:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678484551; x=1710020551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vN3rkqzUxxNCvHCQSV6du5wyixdcIxCvenA60mqhHxg=;
  b=MIfF73wsDGotoKooaOxAPtZevvQ3XCW2XAtwfS3ACzZ5IAwO0+EA9Zs7
   P1pxnZ3r6f0u8+H20iGlTe6sTrJQ6Mb+4elyZ7CUArTxgGE316RmudzlA
   +9iNGk+eXlqzokCbMQQx2dvYXFWvz7b5iyUdzM1W38KAGHuPvH58DaXI4
   craJf8gARYoHH3udVtvNTFEPvrD75jlY7dWMtzvg7eZ/L9gcEDPGPAFVT
   asKC1Zlv4zz+Zf8IIdw+kS/xAkRwRWd1hMWSM3dHlEVpNDO2mLQ+K3D04
   3eiGO9QS+PsxLLfgt55FiRVa32CtCYKkEtkWn8/ICYbACqRzHaJmZle/p
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316483947"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="316483947"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 13:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="680326122"
X-IronPort-AV: E=Sophos;i="5.98,250,1673942400"; 
   d="scan'208";a="680326122"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2023 13:42:29 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pakVQ-00046d-2W;
	Fri, 10 Mar 2023 21:42:28 +0000
Date: Sat, 11 Mar 2023 05:41:31 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-3 2/5] include/linux/static_call.h:210:9:
 warning: data definition has no type or storage class
Message-ID: <202303110556.xL8rPgkm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-3
head:   432e4844ba65840af4a24f5e3f561aead867f6e7
commit: 999f0b7f8056dcb51476a6515a8601c9d6374aa2 [2/5] static_call: Make NULL static calls return 0
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230311/202303110556.xL8rPgkm-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=999f0b7f8056dcb51476a6515a8601c9d6374aa2
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-3
        git checkout 999f0b7f8056dcb51476a6515a8601c9d6374aa2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/events/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110556.xL8rPgkm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:88,
                    from kernel/events/core.c:34:
>> include/linux/static_call.h:210:9: warning: data definition has no type or storage class
     210 |         ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:210:9: note: in definition of macro 'DEFINE_STATIC_CALL_NULL'
     210 |         ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:13769:1: note: in expansion of macro 'DEFINE_STATIC_CALL_RET0'
   13769 | DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:210:9: error: type defaults to 'int' in declaration of 'ARCH_DEFINE_STATIC_CALL_NULL_TRAMP' [-Werror=implicit-int]
     210 |         ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:210:9: note: in definition of macro 'DEFINE_STATIC_CALL_NULL'
     210 |         ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:13769:1: note: in expansion of macro 'DEFINE_STATIC_CALL_RET0'
   13769 | DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
         | ^~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:207:16: warning: parameter names (without types) in function declaration
     207 |         struct static_call_key STATIC_CALL_KEY(name) = {                \
         |                ^~~~~~~~~~~~~~~
   include/linux/static_call.h:212:33: note: in expansion of macro 'DEFINE_STATIC_CALL_NULL'
     212 | #define DEFINE_STATIC_CALL_RET0 DEFINE_STATIC_CALL_NULL
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:13769:1: note: in expansion of macro 'DEFINE_STATIC_CALL_RET0'
   13769 | DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
         | ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +210 include/linux/static_call.h

a945c8345ec0de Peter Zijlstra   2020-08-18  197  
df21c0d7a94db6 Christophe Leroy 2022-03-14  198  #define DEFINE_STATIC_CALL(name, _func)					\
115284d89a436e Josh Poimboeuf   2020-08-18  199  	DECLARE_STATIC_CALL(name, _func);				\
115284d89a436e Josh Poimboeuf   2020-08-18  200  	struct static_call_key STATIC_CALL_KEY(name) = {		\
df21c0d7a94db6 Christophe Leroy 2022-03-14  201  		.func = _func,						\
115284d89a436e Josh Poimboeuf   2020-08-18  202  	};								\
df21c0d7a94db6 Christophe Leroy 2022-03-14  203  	ARCH_DEFINE_STATIC_CALL_TRAMP(name, _func)
115284d89a436e Josh Poimboeuf   2020-08-18  204  
452cddbff74b6a Peter Zijlstra   2020-08-18  205  #define DEFINE_STATIC_CALL_NULL(name, _func)				\
452cddbff74b6a Peter Zijlstra   2020-08-18  206  	DECLARE_STATIC_CALL(name, _func);				\
452cddbff74b6a Peter Zijlstra   2020-08-18 @207  	struct static_call_key STATIC_CALL_KEY(name) = {		\
999f0b7f8056dc Josh Poimboeuf   2023-03-10  208  		.func = __static_call_return0,				\
452cddbff74b6a Peter Zijlstra   2020-08-18  209  	};								\
452cddbff74b6a Peter Zijlstra   2020-08-18 @210  	ARCH_DEFINE_STATIC_CALL_NULL_TRAMP(name)
452cddbff74b6a Peter Zijlstra   2020-08-18  211  

:::::: The code at line 210 was first introduced by commit
:::::: 452cddbff74b6a15b9354505671011700fe03710 static_call: Add static_call_cond()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
