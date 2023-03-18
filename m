Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A2641
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 03:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679109694; x=1710645694;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h4VN1fIkSibncWQd165adqXhTLa3a+gr079+hePRI0Q=;
  b=BTavSK73AeknANtJU7rICbdww37MUMATd9y78GZVPtFvw5j9kkzjaRdj
   lQB7worS24SeiraY33rVjT7HN45Cu7HV30Tcr+asoIP+oavoVfCPl14Yw
   58LDpUY/U9hwa4zIj/Bc4YxpiQzth465QDgUImGY7C4xN9/F+NDX2l5/g
   hSRjJn+lwF8W/8+u2AvnHcQJtVBHEp9/wkkAOgjwWMua+xP48vbe8Mi0R
   6Xip8VxgUQy1/XIIb0Sm0osKsuRGWqHbFLkLG3ph6hVCgSTOn9OtM+d79
   82N3/WlA/QPaZzD1vMZlWv7c1BUiZiiiOo1glU1oocb++P0X3y3/G3I69
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="337108386"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="337108386"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 20:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="673782827"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="673782827"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Mar 2023 20:21:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdN8M-0009lr-09;
	Sat, 18 Mar 2023 03:21:30 +0000
Date: Sat, 18 Mar 2023 11:21:17 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 9/9]
 include/linux/static_call.h:222:48: warning: initialization of 'int' from
 'int (*)(unsigned char *, size_t)' {aka 'int (*)(unsigned char *, long
 unsigned int)'} makes integer from pointer without a cast
Message-ID: <202303181139.Ok81yJvG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   7f7e0649e8daa4d77b60c9f9924def9324036069
commit: 7f7e0649e8daa4d77b60c9f9924def9324036069 [9/9] todo
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230318/202303181139.Ok81yJvG-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=7f7e0649e8daa4d77b60c9f9924def9324036069
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 7f7e0649e8daa4d77b60c9f9924def9324036069
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash security/keys/trusted-keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181139.Ok81yJvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
     224 |                              STATIC_CALL_TRAMP_ADDR(name), __F);        \
         |                                                            ^~~
         |                                                            |
         |                                                            int
   security/keys/trusted-keys/trusted_core.c:362:17: note: in expansion of macro 'static_call_update'
     362 |                 static_call_update(trusted_key_init,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:299:75: note: expected 'void *' but argument is of type 'int'
     299 | void __static_call_update(struct static_call_key *key, void *tramp, void *func)
         |                                                                     ~~~~~~^~~~
   include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_seal' undeclared (first use in this function); did you mean '__SCK__trusted_key_seal'?
      19 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:22:41: note: in expansion of macro '__PASTE'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:22:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:17: note: in expansion of macro 'STATIC_CALL_TRAMP'
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                 ^~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:364:17: note: in expansion of macro 'static_call_update'
     364 |                 static_call_update(trusted_key_seal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(struct trusted_key_payload *, char *)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:364:17: note: in expansion of macro 'static_call_update'
     364 |                 static_call_update(trusted_key_seal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
     224 |                              STATIC_CALL_TRAMP_ADDR(name), __F);        \
         |                                                            ^~~
         |                                                            |
         |                                                            int
   security/keys/trusted-keys/trusted_core.c:364:17: note: in expansion of macro 'static_call_update'
     364 |                 static_call_update(trusted_key_seal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:299:75: note: expected 'void *' but argument is of type 'int'
     299 | void __static_call_update(struct static_call_key *key, void *tramp, void *func)
         |                                                                     ~~~~~~^~~~
   include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_unseal' undeclared (first use in this function); did you mean '__SCK__trusted_key_unseal'?
      19 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:22:41: note: in expansion of macro '__PASTE'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:22:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:17: note: in expansion of macro 'STATIC_CALL_TRAMP'
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                 ^~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:366:17: note: in expansion of macro 'static_call_update'
     366 |                 static_call_update(trusted_key_unseal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(struct trusted_key_payload *, char *)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:366:17: note: in expansion of macro 'static_call_update'
     366 |                 static_call_update(trusted_key_unseal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
     224 |                              STATIC_CALL_TRAMP_ADDR(name), __F);        \
         |                                                            ^~~
         |                                                            |
         |                                                            int
   security/keys/trusted-keys/trusted_core.c:366:17: note: in expansion of macro 'static_call_update'
     366 |                 static_call_update(trusted_key_unseal,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:299:75: note: expected 'void *' but argument is of type 'int'
     299 | void __static_call_update(struct static_call_key *key, void *tramp, void *func)
         |                                                                     ~~~~~~^~~~
   include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_get_random' undeclared (first use in this function); did you mean '__SCK__trusted_key_get_random'?
      19 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:22:41: note: in expansion of macro '__PASTE'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:22:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:17: note: in expansion of macro 'STATIC_CALL_TRAMP'
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                 ^~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:368:17: note: in expansion of macro 'static_call_update'
     368 |                 static_call_update(trusted_key_get_random,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(unsigned char *, size_t)' {aka 'int (*)(unsigned char *, long unsigned int)'} makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:368:17: note: in expansion of macro 'static_call_update'
     368 |                 static_call_update(trusted_key_get_random,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
     224 |                              STATIC_CALL_TRAMP_ADDR(name), __F);        \
         |                                                            ^~~
         |                                                            |
         |                                                            int
   security/keys/trusted-keys/trusted_core.c:368:17: note: in expansion of macro 'static_call_update'
     368 |                 static_call_update(trusted_key_get_random,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:299:75: note: expected 'void *' but argument is of type 'int'
     299 | void __static_call_update(struct static_call_key *key, void *tramp, void *func)
         |                                                                     ~~~~~~^~~~
   include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_exit' undeclared (first use in this function); did you mean '__SCK__trusted_key_exit'?
      19 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:22:41: note: in expansion of macro '__PASTE'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:22:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:17: note: in expansion of macro 'STATIC_CALL_TRAMP'
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                 ^~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:370:17: note: in expansion of macro 'static_call_update'
     370 |                 static_call_update(trusted_key_exit,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:222:48: warning: initialization of 'int' from 'void (*)(void)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:370:17: note: in expansion of macro 'static_call_update'
     370 |                 static_call_update(trusted_key_exit,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
     224 |                              STATIC_CALL_TRAMP_ADDR(name), __F);        \
         |                                                            ^~~
         |                                                            |
         |                                                            int
   security/keys/trusted-keys/trusted_core.c:370:17: note: in expansion of macro 'static_call_update'
     370 |                 static_call_update(trusted_key_exit,
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:299:75: note: expected 'void *' but argument is of type 'int'
     299 | void __static_call_update(struct static_call_key *key, void *tramp, void *func)
         |                                                                     ~~~~~~^~~~
   security/keys/trusted-keys/trusted_core.c: In function 'cleanup_trusted':
   include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_exit' undeclared (first use in this function); did you mean '__SCK__trusted_key_exit'?
      19 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:22:41: note: in expansion of macro '__PASTE'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:22:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      22 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call.h:291:17: note: in expansion of macro 'STATIC_CALL_TRAMP'
     291 |         (typeof(STATIC_CALL_TRAMP(name))*)func;                         \
         |                 ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:218:47: note: in expansion of macro '__static_call_cond'
     218 | #define static_call_cond(name)          (void)__static_call_cond(name)
         |                                               ^~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:391:9: note: in expansion of macro 'static_call_cond'
     391 |         static_call_cond(trusted_key_exit)();
         |         ^~~~~~~~~~~~~~~~


vim +222 include/linux/static_call.h

452cddbff74b6a Peter Zijlstra 2020-08-18  219  
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17  220  #define static_call_update(name, func)					\
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17  221  ({									\
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17 @222  	typeof(&STATIC_CALL_TRAMP(name)) __F = (func);			\
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17  223  	__static_call_update(&STATIC_CALL_KEY(name),			\
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17  224  			     STATIC_CALL_TRAMP_ADDR(name), __F);	\
3f7bf8aa0ae189 Josh Poimboeuf 2023-03-17  225  })
6ea312d95e0226 Juergen Gross  2021-03-11  226  

:::::: The code at line 222 was first introduced by commit
:::::: 3f7bf8aa0ae1895f0c50e9d76c8e66b15cdb9064 static_call: Reorganize static call headers

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
