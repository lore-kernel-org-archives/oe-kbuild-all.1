Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476163D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 02:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679107891; x=1710643891;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ri2MCaeRMo6RBnFVcxLkbYtQnqAfUdd4PsrPlosgVbA=;
  b=bMY5i9s+CaAja8c/NV5VXhQuA+haxgbaYxw581xaB8KExgMk7/1lTf8s
   ee6dVq1WrEfxoH5FhB0rUMkqBlCQk+B7riO0vJyENBO4q11SNg01xJ9Fa
   5ATjNVy8wqfYSo/ahiefD7tapU/osGopYsZDXQDfw+yZ93K13LbI3abZ7
   /DDuhTVbq8qb8ljukXx6q/aywjvlrtdl8TOTnd/Wc1cFPhkHQXV/ZoQMM
   UKVPYSG4KfWIekEe8XC0F5MtqMGGJdV+FFeUTwdb4PVOWUKiq2H1JjIF0
   TmLB4DFH75hwlgcSltRbnn6lbqv9Ow96H5accC1OgnzJaZQauulbpHbzE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="400978372"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="400978372"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 19:51:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="680497574"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="680497574"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 17 Mar 2023 19:51:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdMfJ-0009l1-1J;
	Sat, 18 Mar 2023 02:51:29 +0000
Date: Sat, 18 Mar 2023 10:50:33 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 9/9]
 include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_unseal'
 undeclared; did you mean '__SCK__trusted_key_unseal'?
Message-ID: <202303181054.8s0MllvU-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230318/202303181054.8s0MllvU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=7f7e0649e8daa4d77b60c9f9924def9324036069
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 7f7e0649e8daa4d77b60c9f9924def9324036069
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash security/keys/trusted-keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181054.8s0MllvU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from <command-line>:
   security/keys/trusted-keys/trusted_core.c: In function 'trusted_instantiate':
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_unseal' undeclared (first use in this function); did you mean '__SCK__trusted_key_unseal'?
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
   include/linux/static_call.h:271:18: note: in expansion of macro 'STATIC_CALL_TRAMP'
     271 |         ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:215:9: note: in expansion of macro '__static_call'
     215 |         __static_call(name);                                            \
         |         ^~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:182:23: note: in expansion of macro 'static_call'
     182 |                 ret = static_call(trusted_key_unseal)(payload, datablob);
         |                       ^~~~~~~~~~~
   include/linux/static_call_types.h:19:41: note: each undeclared identifier is reported only once for each function it appears in
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
   include/linux/static_call.h:271:18: note: in expansion of macro 'STATIC_CALL_TRAMP'
     271 |         ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:215:9: note: in expansion of macro '__static_call'
     215 |         __static_call(name);                                            \
         |         ^~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:182:23: note: in expansion of macro 'static_call'
     182 |                 ret = static_call(trusted_key_unseal)(payload, datablob);
         |                       ^~~~~~~~~~~
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_get_random' undeclared (first use in this function); did you mean '__SCK__trusted_key_get_random'?
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
   include/linux/static_call.h:271:18: note: in expansion of macro 'STATIC_CALL_TRAMP'
     271 |         ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:215:9: note: in expansion of macro '__static_call'
     215 |         __static_call(name);                                            \
         |         ^~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:189:23: note: in expansion of macro 'static_call'
     189 |                 ret = static_call(trusted_key_get_random)(payload->key,
         |                       ^~~~~~~~~~~
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_seal' undeclared (first use in this function); did you mean '__SCK__trusted_key_seal'?
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
   include/linux/static_call.h:271:18: note: in expansion of macro 'STATIC_CALL_TRAMP'
     271 |         ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:215:9: note: in expansion of macro '__static_call'
     215 |         __static_call(name);                                            \
         |         ^~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:200:23: note: in expansion of macro 'static_call'
     200 |                 ret = static_call(trusted_key_seal)(payload, datablob);
         |                       ^~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c: In function 'trusted_update':
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_seal' undeclared (first use in this function); did you mean '__SCK__trusted_key_seal'?
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
   include/linux/static_call.h:271:18: note: in expansion of macro 'STATIC_CALL_TRAMP'
     271 |         ((typeof(STATIC_CALL_TRAMP(name))*)(STATIC_CALL_KEY(name).func))
         |                  ^~~~~~~~~~~~~~~~~
   include/linux/static_call.h:215:9: note: in expansion of macro '__static_call'
     215 |         __static_call(name);                                            \
         |         ^~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c:269:15: note: in expansion of macro 'static_call'
     269 |         ret = static_call(trusted_key_seal)(new_p, datablob);
         |               ^~~~~~~~~~~
   security/keys/trusted-keys/trusted_core.c: In function 'init_trusted':
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_init' undeclared (first use in this function); did you mean '__SCK__trusted_key_init'?
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
   security/keys/trusted-keys/trusted_core.c:362:17: note: in expansion of macro 'static_call_update'
     362 |                 static_call_update(trusted_key_init,
         |                 ^~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/rcupdate.h:29,
                    from include/linux/rbtree.h:24,
                    from include/linux/key.h:15,
                    from include/keys/user-type.h:11,
                    from security/keys/trusted-keys/trusted_core.c:9:
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(void)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:362:17: note: in expansion of macro 'static_call_update'
     362 |                 static_call_update(trusted_key_init,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_seal' undeclared (first use in this function); did you mean '__SCK__trusted_key_seal'?
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
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(struct trusted_key_payload *, char *)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:364:17: note: in expansion of macro 'static_call_update'
     364 |                 static_call_update(trusted_key_seal,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_unseal' undeclared (first use in this function); did you mean '__SCK__trusted_key_unseal'?
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
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(struct trusted_key_payload *, char *)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:366:17: note: in expansion of macro 'static_call_update'
     366 |                 static_call_update(trusted_key_unseal,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_get_random' undeclared (first use in this function); did you mean '__SCK__trusted_key_get_random'?
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
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'int (*)(unsigned char *, size_t)' {aka 'int (*)(unsigned char *, unsigned int)'} makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:368:17: note: in expansion of macro 'static_call_update'
     368 |                 static_call_update(trusted_key_get_random,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_exit' undeclared (first use in this function); did you mean '__SCK__trusted_key_exit'?
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
>> include/linux/static_call.h:222:48: warning: initialization of 'int' from 'void (*)(void)' makes integer from pointer without a cast [-Wint-conversion]
     222 |         typeof(&STATIC_CALL_TRAMP(name)) __F = (func);                  \
         |                                                ^
   security/keys/trusted-keys/trusted_core.c:370:17: note: in expansion of macro 'static_call_update'
     370 |                 static_call_update(trusted_key_exit,
         |                 ^~~~~~~~~~~~~~~~~~
>> include/linux/static_call.h:224:60: warning: passing argument 3 of '__static_call_update' makes pointer from integer without a cast [-Wint-conversion]
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
>> include/linux/static_call_types.h:19:41: error: '__SCT__trusted_key_exit' undeclared (first use in this function); did you mean '__SCK__trusted_key_exit'?
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


vim +19 include/linux/static_call_types.h

115284d89a436e Josh Poimboeuf 2020-08-18  18  
115284d89a436e Josh Poimboeuf 2020-08-18 @19  #define STATIC_CALL_TRAMP_PREFIX	__SCT__
115284d89a436e Josh Poimboeuf 2020-08-18  20  #define STATIC_CALL_TRAMP_PREFIX_STR	__stringify(STATIC_CALL_TRAMP_PREFIX)
9183c3f9ed710a Josh Poimboeuf 2020-08-18  21  #define STATIC_CALL_TRAMP_PREFIX_LEN	(sizeof(STATIC_CALL_TRAMP_PREFIX_STR) - 1)
115284d89a436e Josh Poimboeuf 2020-08-18  22  #define STATIC_CALL_TRAMP(name)		__PASTE(STATIC_CALL_TRAMP_PREFIX, name)
115284d89a436e Josh Poimboeuf 2020-08-18  23  #define STATIC_CALL_TRAMP_STR(name)	__stringify(STATIC_CALL_TRAMP(name))
115284d89a436e Josh Poimboeuf 2020-08-18  24  

:::::: The code at line 19 was first introduced by commit
:::::: 115284d89a436e9b66da0c6c4f6efded806874b2 static_call: Add basic static call infrastructure

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
