Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B982904
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 11:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677064334; x=1708600334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWtLVeohLbZVpAx8wYuGuDtgjvxXH6XrhuiuQktmw+c=;
  b=T2Irn0Jw/a15kSkF5zMFSWol7zjRQyD1s/gRIPpKJtml8trB4mkHGT1k
   QTsJjxDin2W6EHQxWY/onCQwTE/70x/gkGI9r3qMcTVylvcyNdRh5ULqQ
   QuZG7jy4X2kNghB4m03pk/YnUoMfHW5Q1yJ59+Wka9tzgY+Sg9a+d+ojo
   fcl+amjjYZ6x0aR9WAUZPeyAFnHPkJ5aqG8camjWdfVb8VesPGKxWESzq
   TJd/PwBOn5Wk2KhaN271r7vsoJRVjb6NTsUVHGond1zuyM9wZsHsGLoJU
   +wv6A0Ix7uv+YRnJhUsVx1Ry+nQZZJ9j4heug/4ljVtWzZ2U5BwCVM49T
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330623506"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="330623506"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 03:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760921985"
X-IronPort-AV: E=Sophos;i="5.97,318,1669104000"; 
   d="scan'208";a="760921985"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2023 03:12:11 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUn2g-0000Hx-0G;
	Wed, 22 Feb 2023 11:12:10 +0000
Date: Wed, 22 Feb 2023 19:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-noreturn 30/31]
 tools/objtool/include/objtool/warn.h:68:13: error: implicit declaration of
 function 'access'
Message-ID: <202302221902.aBOgPdcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-noreturn
head:   f20b48dfed83779ea0e28735e62600d9c65b3a3b
commit: e62ce15b6733e6fadd692f461f9088094abacb89 [30/31] objtool: Add '--verbose' option for disassembling affected functions
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230222/202302221902.aBOgPdcZ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=e62ce15b6733e6fadd692f461f9088094abacb89
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-noreturn
        git checkout e62ce15b6733e6fadd692f461f9088094abacb89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221902.aBOgPdcZ-lkp@intel.com/

Note: the jpoimboe/objtool-noreturn HEAD f20b48dfed83779ea0e28735e62600d9c65b3a3b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from check.c:17:
   tools/objtool/include/objtool/warn.h: In function 'objdump_func':
>> tools/objtool/include/objtool/warn.h:68:13: error: implicit declaration of function 'access' [-Werror=implicit-function-declaration]
      68 |         if (access(script, X_OK))
         |             ^~~~~~
   In file included from special.c:17:
   tools/objtool/include/objtool/warn.h: In function 'objdump_func':
>> tools/objtool/include/objtool/warn.h:68:13: error: implicit declaration of function 'access' [-Werror=implicit-function-declaration]
      68 |         if (access(script, X_OK))
         |             ^~~~~~
   In file included from arch/powerpc/decode.c:8:
   tools/objtool/include/objtool/warn.h: In function 'objdump_func':
>> tools/objtool/include/objtool/warn.h:68:13: error: implicit declaration of function 'access' [-Werror=implicit-function-declaration]
      68 |         if (access(script, X_OK))
         |             ^~~~~~
   cc1: all warnings being treated as errors
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/arch/powerpc/decode.o] Error 1
   make[4]: *** [tools/build/Makefile.build:139: arch/powerpc] Error 2
   make[4]: *** Waiting for unfinished jobs....
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tools/objtool/special.o] Error 1
   cc1: all warnings being treated as errors
   make[4]: *** [tools/build/Makefile.build:96: tools/objtool/check.o] Error 1
   make[3]: *** [Makefile:66: tools/objtool/objtool-in.o] Error 2
   make[2]: *** [Makefile:73: objtool] Error 2
   make[1]: *** [Makefile:1451: tools/objtool] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/access +68 tools/objtool/include/objtool/warn.h

    43	
    44	static inline void objdump_func(struct section *sec, unsigned long offset)
    45	{
    46		struct symbol *sym = find_func_containing(sec, offset);
    47		const char *script_relative = "scripts/objdump-func";
    48		bool is_text = (sec->sh.sh_flags & SHF_EXECINSTR);
    49		char *cmd, *srctree, *script;
    50	
    51		if (is_text)
    52			sym = find_func_containing(sec, offset);
    53		if (!sym)
    54			sym = find_symbol_containing(sec, offset);
    55		if (!sym)
    56			return;
    57	
    58		srctree = getenv("abs_srctree");
    59		if (!srctree)
    60			return;
    61	
    62		script = malloc(strlen(srctree) + strlen(script_relative) + 2);
    63		if (!script)
    64			return;
    65	
    66		sprintf(script, "%s/%s", srctree, script_relative);
    67	
  > 68		if (access(script, X_OK))
    69			return;
    70	
    71		cmd = malloc(strlen(script) + strlen(objname) + strlen(sym->name) + 10);
    72		if (!cmd)
    73			return;
    74	
    75		sprintf(cmd, "%s %s %s 1>&2", script, objname, sym->name);
    76		system(cmd);
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
