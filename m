Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E742C9D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 23:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679094924; x=1710630924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pu5Wp1BRyg4NemTWpZ2iZ4BK5ZF8ZwF7NLUxloxLwT0=;
  b=HWG80Dvcugdo1uTjvvDbnXQk2/aQGPYDkk6+9l/kScdcLlV3MbtQHogi
   3wzvSSLps4SS3rpDr39f5UUvEX8RTDevPmw4O54Xh7IlOjoOsmGuLB2Bq
   BHSvtfEtcXrhKG6tKVdH1Lg3Oidkq6UhB2H9RrRzgKbreeLxXQ7/ze5Yr
   JyzdeE+vLQXLcarIAUKFDvIbkvDsEjQaQ75aw1T2UaP5y62M9LzCQAJF9
   V/F7bEe7xV+vUMHSKJ50g6azDgdR6XJ8zexJZcjD9E6jA0paHpuYqO/8K
   ciQmjY59xDKFSfDmicUeWzla3v8zZkaLvJF/aTGJ/KNoFFDygSgqSWwFW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="322230423"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="322230423"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 16:15:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680448437"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="680448437"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 16:15:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdJIA-0009e8-24;
	Fri, 17 Mar 2023 23:15:22 +0000
Date: Sat, 18 Mar 2023 07:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 5/8] sound/soc/intel/avs/trace.c:15:26:
 error: 'PAGE_SIZE' undeclared; did you mean 'TASK_SIZE'?
Message-ID: <202303180741.fKONcsaI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   74dbc56ffbac4b4912e598d245eaf4b0a6db638f
commit: 8515ceedf9e1709310184254bfea56eca6bf8617 [5/8] static_call: Remove static_call.h dependency on cpu.h
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303180741.fKONcsaI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=8515ceedf9e1709310184254bfea56eca6bf8617
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 8515ceedf9e1709310184254bfea56eca6bf8617
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180741.fKONcsaI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:26,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/tracepoint.h:15,
                    from sound/soc/intel/avs/trace.h:9,
                    from sound/soc/intel/avs/trace.c:12:
   sound/soc/intel/avs/trace.c: In function 'trace_avs_msg_payload':
>> sound/soc/intel/avs/trace.c:15:26: error: 'PAGE_SIZE' undeclared (first use in this function); did you mean 'TASK_SIZE'?
      15 | #define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */  \
         |                          ^~~~~~~~~
   include/linux/minmax.h:20:46: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                              ^
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:126:33: note: in expansion of macro '__careful_cmp'
     126 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   sound/soc/intel/avs/trace.c:27:25: note: in expansion of macro 'min_t'
      27 |                 chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
         |                         ^~~~~
   sound/soc/intel/avs/trace.c:27:50: note: in expansion of macro 'MAX_CHUNK_SIZE'
      27 |                 chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
         |                                                  ^~~~~~~~~~~~~~
   sound/soc/intel/avs/trace.c:15:26: note: each undeclared identifier is reported only once for each function it appears in
      15 | #define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */  \
         |                          ^~~~~~~~~
   include/linux/minmax.h:20:46: note: in definition of macro '__typecheck'
      20 |         (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                              ^
   include/linux/minmax.h:36:31: note: in expansion of macro '__safe_cmp'
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/minmax.h:126:33: note: in expansion of macro '__careful_cmp'
     126 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   sound/soc/intel/avs/trace.c:27:25: note: in expansion of macro 'min_t'
      27 |                 chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
         |                         ^~~~~
   sound/soc/intel/avs/trace.c:27:50: note: in expansion of macro 'MAX_CHUNK_SIZE'
      27 |                 chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
         |                                                  ^~~~~~~~~~~~~~
   include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:126:33: note: in expansion of macro '__careful_cmp'
     126 | #define min_t(type, x, y)       __careful_cmp((type)(x), (type)(y), <)
         |                                 ^~~~~~~~~~~~~
   sound/soc/intel/avs/trace.c:27:25: note: in expansion of macro 'min_t'
      27 |                 chunk = min_t(size_t, remaining, MAX_CHUNK_SIZE);
         |                         ^~~~~


vim +15 sound/soc/intel/avs/trace.c

69b23b3937a1a1 Cezary Rojewski 2022-05-16  13  
69b23b3937a1a1 Cezary Rojewski 2022-05-16  14  #define BYTES_PER_LINE 16
69b23b3937a1a1 Cezary Rojewski 2022-05-16 @15  #define MAX_CHUNK_SIZE ((PAGE_SIZE - 150) /* Place for trace header */	\
69b23b3937a1a1 Cezary Rojewski 2022-05-16  16  			/ (2 * BYTES_PER_LINE + 4) /* chars per line */	\
69b23b3937a1a1 Cezary Rojewski 2022-05-16  17  			* BYTES_PER_LINE)
69b23b3937a1a1 Cezary Rojewski 2022-05-16  18  

:::::: The code at line 15 was first introduced by commit
:::::: 69b23b3937a1a1019f3d34696897d89f2d987edf ASoC: Intel: avs: Event tracing

:::::: TO: Cezary Rojewski <cezary.rojewski@intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
