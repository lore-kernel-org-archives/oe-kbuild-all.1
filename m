Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4361648
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 05:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675141660; x=1706677660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2jsHRTI037t7DWtzjFtvNf+xlkvem57rBu62z3fzvek=;
  b=Ri9XGFV9blV9X29k0/B34WU5lrZSCXYHS0jTHFBnMb7svCGFJGX2So56
   6YkxWLkgZoZEwFpOG+AXRzJAxyCcUfj8Rgpg/TKSiSjkLkHUPKqT3lpWW
   mpMbPZqAryh2LUIUijkJuGWZsha+sBdea0oNPOQHTFFjZTCNDIrxgGOM4
   0OD992HvNr1P4+QwZfWEPvr9WsvOZyTHK9ALQbETC7U2FK5dLDw6IxO0I
   b3Rel4rqHWoUGYkzdqpFkpWNj8JHwmUPHy+U4tXbQSkDbOY0dPU2x8tzz
   lT1Ihfx7K624bXeSAWnFovDiYn0cQ0Ro2jqOKfmgyeeJ/VdO8xH4+oUEd
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="392300270"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="392300270"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 21:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="993137530"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="993137530"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jan 2023 21:07:37 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMiro-0004C4-2K;
	Tue, 31 Jan 2023 05:07:36 +0000
Date: Tue, 31 Jan 2023 13:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [jpoimboe:objtool/core 3/3] <stdin>:1:10: fatal error: libelf.h: No
 such file or directory
Message-ID: <202301311307.B6j1i7Cd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   391e6d2abd652b460d9017b2f8a8ded508c09558
commit: 49512234bf3baaf25905adafe841e3a5145c7e33 [3/3] objtool: Fix HOSTCC flag usage
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301311307.B6j1i7Cd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=49512234bf3baaf25905adafe841e3a5145c7e33
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool/core
        git checkout 49512234bf3baaf25905adafe841e3a5145c7e33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <stdin>:1:10: fatal error: libelf.h: No such file or directory
   compilation terminated.
   builtin-check.c:6:10: fatal error: subcmd/parse-options.h: No such file or directory
       6 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/builtin-check.o] Error 1
   make[4]: *** Waiting for unfinished jobs....
   In file included from elf.c:20:
   tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
       8 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   In file included from special.c:15:
   tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
       8 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   objtool.c:11:10: fatal error: subcmd/exec-cmd.h: No such file or directory
      11 | #include <subcmd/exec-cmd.h>
         |          ^~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/elf.o] Error 1
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/special.o] Error 1
   In file included from arch/powerpc/special.c:5:
   tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
       8 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/objtool.o] Error 1
   In file included from check.c:12:
   tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
       8 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/powerpc/special.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [tools/build/Makefile.build:97: tools/objtool/check.o] Error 1
   In file included from tools/objtool/include/objtool/warn.h:14,
                    from arch/powerpc/decode.c:8:
   tools/objtool/include/objtool/builtin.h:8:10: fatal error: subcmd/parse-options.h: No such file or directory
       8 | #include <subcmd/parse-options.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:97: tools/objtool/arch/powerpc/decode.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: arch/powerpc] Error 2
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[3]: *** Waiting for unfinished jobs....
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1439: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
