Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1495A63C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677600882; x=1709136882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHh4YmKvXW/Rh1vBHlsq1BZWGAVDCF5s1SUxr6SMyww=;
  b=e8qaWpVn9LHzbI8tSo2yVc90BofFajs4CXEm+QjdG2JZ3vzdn/a9GQqU
   7MrPAfR5Yw8sl9KDUwxGoW7/PdAdKo++lZTOGGE2l18i0oMVzGhr2QyrV
   nMXBw6sQZwmENVfDQcJeKQd3VeHHjhr7Jqq6cgY/CmqlM7DlguD9pnXix
   6x7IkZNIkGeK3IF4CMd7gZbDwJIYgXgsoDJeBsLWG27dqMManjBqwRegP
   /loLtnwZ5ccyH/k+DxxuCqct3D3wEGshujYBzapcxkmf89dQ5VxNYQIcT
   QBMYl78qVs4MODc8fjzJLn2V21EpoKY1KAGTcMRrKEbIKfPgEXiLzuW6V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="396746955"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="396746955"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 08:14:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="783899707"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; 
   d="scan'208";a="783899707"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Feb 2023 08:14:40 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pX2ci-0005Vz-0r;
	Tue, 28 Feb 2023 16:14:40 +0000
Date: Wed, 1 Mar 2023 00:14:18 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 3/4] lib/unwind_kunit.c:69:20: error:
 implicit declaration of function 'stack_trace_save'; did you mean
 'stack_tracer_enable'?
Message-ID: <202303010010.7xHaDzqH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   99d1827fb123634f39fcce1943ab318fc289ce51
commit: 4afa4d021e069736095441453ef2126c6fb37888 [3/4] WIP: unwind tests
config: m68k-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230301/202303010010.7xHaDzqH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=4afa4d021e069736095441453ef2126c6fb37888
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout 4afa4d021e069736095441453ef2126c6fb37888
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303010010.7xHaDzqH-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/unwind_kunit.c: In function 'uwd_save_stacktrace':
>> lib/unwind_kunit.c:69:20: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Werror=implicit-function-declaration]
      69 |         uwd->len = stack_trace_save(uwd->stack_trace,
         |                    ^~~~~~~~~~~~~~~~
         |                    stack_tracer_enable
   lib/unwind_kunit.c: In function 'uwd_save_stacktrace_regs':
>> lib/unwind_kunit.c:86:20: error: implicit declaration of function 'stack_trace_save_regs' [-Werror=implicit-function-declaration]
      86 |         uwd->len = stack_trace_save_regs(regs,
         |                    ^~~~~~~~~~~~~~~~~~~~~
   lib/unwind_kunit.c: At top level:
   lib/unwind_kunit.c:83:13: warning: 'uwd_save_stacktrace_regs' defined but not used [-Wunused-function]
      83 | static void uwd_save_stacktrace_regs(struct unwind_data *uwd,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +69 lib/unwind_kunit.c

    66	
    67	static void uwd_save_stacktrace(struct unwind_data *uwd)
    68	{
  > 69		uwd->len = stack_trace_save(uwd->stack_trace,
    70					    NR_STACKTRACE_ELEMS,
    71					    0);
    72		uwd->hit = true;
    73	}
    74	
    75	static void uwd_save_stacktrace_reliable(struct unwind_data *uwd)
    76	{
    77		uwd->len = stack_trace_save_tsk_reliable(current,
    78							 uwd->stack_trace,
    79							 NR_STACKTRACE_ELEMS);
    80		uwd->hit = true;
    81	}
    82	
    83	static void uwd_save_stacktrace_regs(struct unwind_data *uwd,
    84					     struct pt_regs *regs)
    85	{
  > 86		uwd->len = stack_trace_save_regs(regs,
    87						 uwd->stack_trace,
    88						 NR_STACKTRACE_ELEMS,
    89						 0);
    90		uwd->hit = true;
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
