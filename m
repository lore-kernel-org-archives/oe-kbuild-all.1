Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B0379
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 03:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682047993; x=1713583993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5DgbHe1jEaZWjryYQl84x7W03ZRL2P8GiaXA+d97tmQ=;
  b=l7llqiDQbFUU3Stx0OvHXRPsdNSnZhvnvQt1VLb4DG9cb0dp37WadXzL
   Q4tIVxqENgZNn6P84WM5pvuVFOtUzE1dIRpq3NLhne4wsi4V2FM3yqFzx
   qxe5DGM/GZ4QzFgaWG7aXgqt/UlhjPEJ+V2Z0B82854wNDiDElFIKpmN0
   4w8D8G0jLAHYaDCw5qAd2mNYJAujcUrTfqxWSNocFRYUTgBEHVuYCfJO9
   fwyH4NkNehf7bdfwwEGonB23/xg5ftzqa/I5Z82yaJf4PLr0NSwJDmmP+
   TxeqE+JA/go/UTxjPwhQCdP4xPGoZB0N12R/v3V10nDDOIqX9CdpqnudK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343397525"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="343397525"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 20:33:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="685602126"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="685602126"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 20:33:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pphW9-000gHg-1J;
	Fri, 21 Apr 2023 03:33:01 +0000
Date: Fri, 21 Apr 2023 11:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Scott Mayhew <smayhew@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
Message-ID: <202304211152.9YWnNOJa-lkp@intel.com>
References: <20230420202004.239116-6-smayhew@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420202004.239116-6-smayhew@redhat.com>

Hi Scott,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trondmy-nfs/linux-next]
[also build test WARNING on linus/master v6.3-rc7 next-20230420]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
patch link:    https://lore.kernel.org/r/20230420202004.239116-6-smayhew%40redhat.com
patch subject: [RFC PATCH 5/5] SUNRPC: store GSS creds in keyrings
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230421/202304211152.9YWnNOJa-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6a654188690846a7c5e1de83e390a2bce53d79a8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Scott-Mayhew/keys-export-keyring_ptr_to_key/20230421-042202
        git checkout 6a654188690846a7c5e1de83e390a2bce53d79a8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash net/sunrpc/auth_gss/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211152.9YWnNOJa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/auth_gss/auth_gss.c:35:
   include/keys/request_key_auth-type.h: In function 'get_request_key_auth':
   include/keys/request_key_auth-type.h:29:19: error: invalid use of undefined type 'const struct key'
      29 |         return key->payload.data[0];
         |                   ^~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_create_upcall':
   net/sunrpc/auth_gss/auth_gss.c:730:31: error: implicit declaration of function 'key_instantiate_and_link'; did you mean 'd_instantiate_anon'? [-Werror=implicit-function-declaration]
     730 |                         err = key_instantiate_and_link(key, gss_cred,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~
         |                               d_instantiate_anon
   net/sunrpc/auth_gss/auth_gss.c:734:33: error: implicit declaration of function 'key_set_timeout'; did you mean 'reqsk_timeout'? [-Werror=implicit-function-declaration]
     734 |                                 key_set_timeout(key, gss_msg->timeout);
         |                                 ^~~~~~~~~~~~~~~
         |                                 reqsk_timeout
   net/sunrpc/auth_gss/auth_gss.c:735:39: error: implicit declaration of function 'key_link'; did you mean 'kfree_link'? [-Werror=implicit-function-declaration]
     735 |                                 err = key_link(gss_auth->keyring_cred->thread_keyring,
         |                                       ^~~~~~~~
         |                                       kfree_link
   net/sunrpc/auth_gss/auth_gss.c:735:70: error: 'struct cred' has no member named 'thread_keyring'
     735 |                                 err = key_link(gss_auth->keyring_cred->thread_keyring,
         |                                                                      ^~
   net/sunrpc/auth_gss/auth_gss.c:738:25: error: implicit declaration of function 'complete_request_key'; did you mean 'complete_release'? [-Werror=implicit-function-declaration]
     738 |                         complete_request_key(authkey, err);
         |                         ^~~~~~~~~~~~~~~~~~~~
         |                         complete_release
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_create_new':
   net/sunrpc/auth_gss/auth_gss.c:1154:27: error: implicit declaration of function 'keyring_alloc'; did you mean 'warn_alloc'? [-Werror=implicit-function-declaration]
    1154 |                 keyring = keyring_alloc("gss_keyring",
         |                           ^~~~~~~~~~~~~
         |                           warn_alloc
   net/sunrpc/auth_gss/auth_gss.c:1156:42: error: 'KEY_POS_ALL' undeclared (first use in this function)
    1156 |                                         (KEY_POS_ALL & ~KEY_POS_SETATTR) |
         |                                          ^~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1156:42: note: each undeclared identifier is reported only once for each function it appears in
   net/sunrpc/auth_gss/auth_gss.c:1156:57: error: 'KEY_POS_SETATTR' undeclared (first use in this function)
    1156 |                                         (KEY_POS_ALL & ~KEY_POS_SETATTR) |
         |                                                         ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1157:41: error: 'KEY_USR_VIEW' undeclared (first use in this function)
    1157 |                                         KEY_USR_VIEW | KEY_USR_READ,
         |                                         ^~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1157:56: error: 'KEY_USR_READ' undeclared (first use in this function); did you mean 'KEYCTL_READ'?
    1157 |                                         KEY_USR_VIEW | KEY_USR_READ,
         |                                                        ^~~~~~~~~~~~
         |                                                        KEYCTL_READ
   net/sunrpc/auth_gss/auth_gss.c:1158:41: error: 'KEY_ALLOC_NOT_IN_QUOTA' undeclared (first use in this function)
    1158 |                                         KEY_ALLOC_NOT_IN_QUOTA, NULL, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1163:25: error: 'KEY_FLAG_ROOT_CAN_CLEAR' undeclared (first use in this function)
    1163 |                 set_bit(KEY_FLAG_ROOT_CAN_CLEAR, &keyring->flags);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1163:58: error: invalid use of undefined type 'struct key'
    1163 |                 set_bit(KEY_FLAG_ROOT_CAN_CLEAR, &keyring->flags);
         |                                                          ^~
   net/sunrpc/auth_gss/auth_gss.c:1164:21: error: 'struct cred' has no member named 'thread_keyring'
    1164 |                 cred->thread_keyring = keyring;
         |                     ^~
   net/sunrpc/auth_gss/auth_gss.c:1165:21: error: 'struct cred' has no member named 'jit_keyring'
    1165 |                 cred->jit_keyring = KEY_REQKEY_DEFL_THREAD_KEYRING;
         |                     ^~
   net/sunrpc/auth_gss/auth_gss.c:1170:55: error: 'struct cred' has no member named 'thread_keyring'
    1170 |                                 gss_auth->keyring_cred->thread_keyring : NULL);
         |                                                       ^~
   net/sunrpc/auth_gss/auth_gss.c:1190:55: error: 'struct cred' has no member named 'thread_keyring'
    1190 |                                 gss_auth->keyring_cred->thread_keyring : NULL);
         |                                                       ^~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_key_gc_iterator':
   net/sunrpc/auth_gss/auth_gss.c:1223:27: error: implicit declaration of function 'keyring_ptr_to_key' [-Werror=implicit-function-declaration]
    1223 |         struct key *key = keyring_ptr_to_key(object);
         |                           ^~~~~~~~~~~~~~~~~~
>> net/sunrpc/auth_gss/auth_gss.c:1223:27: warning: initialization of 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   net/sunrpc/auth_gss/auth_gss.c:1224:36: error: invalid use of undefined type 'struct key'
    1224 |         struct gss_cred *cred = key->payload.data[0];
         |                                    ^~
   net/sunrpc/auth_gss/auth_gss.c:1227:20: error: invalid use of undefined type 'struct key'
    1227 |                 key->payload.data[0] = NULL;
         |                    ^~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_destroy':
   net/sunrpc/auth_gss/auth_gss.c:1253:17: error: implicit declaration of function 'keyring_gc_custom' [-Werror=implicit-function-declaration]
    1253 |                 keyring_gc_custom(gss_auth->keyring_cred->thread_keyring,
         |                 ^~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1253:57: error: 'struct cred' has no member named 'thread_keyring'
    1253 |                 keyring_gc_custom(gss_auth->keyring_cred->thread_keyring,
         |                                                         ^~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_request_key':
   net/sunrpc/auth_gss/auth_gss.c:1483:9: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
    1483 |         key_ref_t keyref;
         |         ^~~~~~~~~
         |         key_ref_put
   net/sunrpc/auth_gss/auth_gss.c:1485:18: error: implicit declaration of function 'lookup_user_key' [-Werror=implicit-function-declaration]
    1485 |         keyref = lookup_user_key(KEY_SPEC_USER_KEYRING,
         |                  ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1486:34: error: 'KEY_LOOKUP_CREATE' undeclared (first use in this function)
    1486 |                                  KEY_LOOKUP_CREATE, KEY_NEED_SEARCH);
         |                                  ^~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1486:53: error: 'KEY_NEED_SEARCH' undeclared (first use in this function); did you mean 'KEYCTL_SEARCH'?
    1486 |                                  KEY_LOOKUP_CREATE, KEY_NEED_SEARCH);
         |                                                     ^~~~~~~~~~~~~~~
         |                                                     KEYCTL_SEARCH
>> net/sunrpc/auth_gss/auth_gss.c:1487:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
    1487 |         if (IS_ERR(keyref))
         |                    ^~~~~~
         |                    |
         |                    int
   In file included from include/linux/rwsem.h:17,
                    from include/linux/mm_types.h:13,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from net/sunrpc/auth_gss/auth_gss.c:14:
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
>> net/sunrpc/auth_gss/auth_gss.c:1488:33: warning: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
    1488 |                 return ERR_CAST(keyref);
         |                                 ^~~~~~
         |                                 |
         |                                 int
   include/linux/err.h:51:64: note: expected 'const void *' but argument is of type 'int'
      51 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                    ~~~~~~~~~~~~^~~
   net/sunrpc/auth_gss/auth_gss.c:1524:15: error: implicit declaration of function 'request_key_with_auxdata' [-Werror=implicit-function-declaration]
    1524 |         key = request_key_with_auxdata(&key_type_gss_cred, desc,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
>> net/sunrpc/auth_gss/auth_gss.c:1524:13: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1524 |         key = request_key_with_auxdata(&key_type_gss_cred, desc,
         |             ^
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_lookup_keyring':
   net/sunrpc/auth_gss/auth_gss.c:1547:23: error: invalid use of undefined type 'struct key'
    1547 |         down_read(&key->sem);
         |                       ^~
   net/sunrpc/auth_gss/auth_gss.c:1548:23: error: invalid use of undefined type 'struct key'
    1548 |         gss_cred = key->payload.data[0];
         |                       ^~
   net/sunrpc/auth_gss/auth_gss.c:1555:21: error: invalid use of undefined type 'struct key'
    1555 |         up_read(&key->sem);
         |                     ^~
   net/sunrpc/auth_gss/auth_gss.c: At top level:
>> net/sunrpc/auth_gss/auth_gss.c:1615:34: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
    1615 |                     const struct key_match_data *match_data)
         |                                  ^~~~~~~~~~~~~~
   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11:
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_cmp':
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/rcupdate.h:462:17: note: in definition of macro '__rcu_dereference_check'
     462 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                 ^
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/rcupdate.h:462:38: note: in definition of macro '__rcu_dereference_check'
     462 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                      ^
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   In file included from <command-line>:
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:50: note: in expansion of macro 'READ_ONCE'
     462 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:610:9: note: in expansion of macro '__rcu_dereference_check'
     610 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:462:50: note: in expansion of macro 'READ_ONCE'
     462 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:610:9: note: in expansion of macro '__rcu_dereference_check'
     610 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/compiler_types.h:377:23: note: in definition of macro '__compiletime_assert'
     377 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
--
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:610:9: note: in expansion of macro '__rcu_dereference_check'
     610 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   In file included from ./arch/csky/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12:
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   include/linux/rcupdate.h:462:50: note: in expansion of macro 'READ_ONCE'
     462 |         typeof(*p) *local = (typeof(*p) *__force)READ_ONCE(p); \
         |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:610:9: note: in expansion of macro '__rcu_dereference_check'
     610 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:56: error: invalid use of undefined type 'const struct key'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                                        ^~
   include/linux/rcupdate.h:465:19: note: in definition of macro '__rcu_dereference_check'
     465 |         ((typeof(*p) __force __kernel *)(local)); \
         |                   ^
   include/linux/rcupdate.h:682:28: note: in expansion of macro 'rcu_dereference_check'
     682 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1617:37: note: in expansion of macro 'rcu_dereference'
    1617 |         struct gss_cred *gss_cred = rcu_dereference(key->payload.rcu_data0);
         |                                     ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1639:25: error: invalid use of undefined type 'const struct key'
    1639 |         ret = strcmp(key->description, match_data->raw_data) == 0;
         |                         ^~
   net/sunrpc/auth_gss/auth_gss.c:1639:50: error: invalid use of undefined type 'const struct key_match_data'
    1639 |         ret = strcmp(key->description, match_data->raw_data) == 0;
         |                                                  ^~
   net/sunrpc/auth_gss/auth_gss.c: At top level:
   net/sunrpc/auth_gss/auth_gss.c:1643:38: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
    1643 | static int gss_match_preparse(struct key_match_data *match_data)
         |                                      ^~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_match_preparse':
   net/sunrpc/auth_gss/auth_gss.c:1645:19: error: invalid use of undefined type 'struct key_match_data'
    1645 |         match_data->cmp = gss_cmp;
         |                   ^~
   net/sunrpc/auth_gss/auth_gss.c:1646:19: error: invalid use of undefined type 'struct key_match_data'
    1646 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                   ^~
   net/sunrpc/auth_gss/auth_gss.c:1646:35: error: 'KEYRING_SEARCH_LOOKUP_ITERATE' undeclared (first use in this function)
    1646 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: At top level:
   net/sunrpc/auth_gss/auth_gss.c:1675:6: warning: no previous prototype for 'gss_key_revoke' [-Wmissing-prototypes]
    1675 | void gss_key_revoke(struct key *key)
         |      ^~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_key_revoke':
   net/sunrpc/auth_gss/auth_gss.c:1677:36: error: invalid use of undefined type 'struct key'
    1677 |         struct gss_cred *cred = key->payload.data[0];
         |                                    ^~
   net/sunrpc/auth_gss/auth_gss.c:1680:20: error: invalid use of undefined type 'struct key'
    1680 |                 key->payload.data[0] = NULL;
         |                    ^~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_key_destroy':
   net/sunrpc/auth_gss/auth_gss.c:1685:36: error: invalid use of undefined type 'struct key'
    1685 |         struct gss_cred *cred = key->payload.data[0];
         |                                    ^~
   net/sunrpc/auth_gss/auth_gss.c:1688:20: error: invalid use of undefined type 'struct key'
    1688 |                 key->payload.data[0] = NULL;
         |                    ^~
   net/sunrpc/auth_gss/auth_gss.c: At top level:
   net/sunrpc/auth_gss/auth_gss.c:1691:6: warning: no previous prototype for 'gss_describe' [-Wmissing-prototypes]
    1691 | void gss_describe(const struct key *key, struct seq_file *m)
         |      ^~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_describe':
   net/sunrpc/auth_gss/auth_gss.c:1693:40: error: invalid use of undefined type 'const struct key'
    1693 |         struct gss_cred *gss_cred = key->payload.data[0];
         |                                        ^~
   net/sunrpc/auth_gss/auth_gss.c:1698:24: error: invalid use of undefined type 'const struct key'
    1698 |         seq_puts(m, key->description);
         |                        ^~
   net/sunrpc/auth_gss/auth_gss.c:1699:13: error: implicit declaration of function 'key_is_positive'; did you mean 'd_is_positive'? [-Werror=implicit-function-declaration]
    1699 |         if (key_is_positive(key)) {
         |             ^~~~~~~~~~~~~~~
         |             d_is_positive
   net/sunrpc/auth_gss/auth_gss.c: At top level:
>> net/sunrpc/auth_gss/auth_gss.c:1704:49: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
    1704 | int gss_key_instantiate(struct key *key, struct key_preparsed_payload *prep)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1704:5: warning: no previous prototype for 'gss_key_instantiate' [-Wmissing-prototypes]
    1704 | int gss_key_instantiate(struct key *key, struct key_preparsed_payload *prep)
         |     ^~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: In function 'gss_key_instantiate':
   net/sunrpc/auth_gss/auth_gss.c:1706:17: error: invalid use of undefined type 'struct key_preparsed_payload'
    1706 |         if (prep->datalen != key->type->def_datalen)
         |                 ^~
   net/sunrpc/auth_gss/auth_gss.c:1706:33: error: invalid use of undefined type 'struct key'
    1706 |         if (prep->datalen != key->type->def_datalen)
         |                                 ^~
   net/sunrpc/auth_gss/auth_gss.c:1709:9: error: implicit declaration of function 'rcu_assign_keypointer'; did you mean 'rcu_assign_pointer'? [-Werror=implicit-function-declaration]
    1709 |         rcu_assign_keypointer(key, (struct gss_cred *)prep->data);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         rcu_assign_pointer
   net/sunrpc/auth_gss/auth_gss.c:1709:59: error: invalid use of undefined type 'struct key_preparsed_payload'
    1709 |         rcu_assign_keypointer(key, (struct gss_cred *)prep->data);
         |                                                           ^~
   net/sunrpc/auth_gss/auth_gss.c: At top level:
   net/sunrpc/auth_gss/auth_gss.c:1713:15: error: variable 'key_type_gss_cred' has initializer but incomplete type
    1713 | static struct key_type key_type_gss_cred = {
         |               ^~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1714:10: error: 'struct key_type' has no member named 'name'
    1714 |         .name = "gss_cred",
         |          ^~~~
>> net/sunrpc/auth_gss/auth_gss.c:1714:17: warning: excess elements in struct initializer
    1714 |         .name = "gss_cred",
         |                 ^~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1714:17: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1715:10: error: 'struct key_type' has no member named 'def_datalen'
    1715 |         .def_datalen    = sizeof(struct gss_cred *),
         |          ^~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1715:27: warning: excess elements in struct initializer
    1715 |         .def_datalen    = sizeof(struct gss_cred *),
         |                           ^~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1715:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1716:10: error: 'struct key_type' has no member named 'instantiate'
    1716 |         .instantiate    = gss_key_instantiate,
         |          ^~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1716:27: warning: excess elements in struct initializer
    1716 |         .instantiate    = gss_key_instantiate,
         |                           ^~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1716:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1717:10: error: 'struct key_type' has no member named 'match_preparse'
    1717 |         .match_preparse = gss_match_preparse,
         |          ^~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1717:27: warning: excess elements in struct initializer
    1717 |         .match_preparse = gss_match_preparse,
         |                           ^~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1717:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1718:10: error: 'struct key_type' has no member named 'revoke'
    1718 |         .revoke         = gss_key_revoke,
         |          ^~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1718:27: warning: excess elements in struct initializer
    1718 |         .revoke         = gss_key_revoke,
         |                           ^~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1718:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1719:10: error: 'struct key_type' has no member named 'destroy'
    1719 |         .destroy        = gss_key_destroy,
         |          ^~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1719:27: warning: excess elements in struct initializer
    1719 |         .destroy        = gss_key_destroy,
         |                           ^~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1719:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1720:10: error: 'struct key_type' has no member named 'describe'
    1720 |         .describe       = gss_describe,
         |          ^~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1720:27: warning: excess elements in struct initializer
    1720 |         .describe       = gss_describe,
         |                           ^~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1720:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c:1721:10: error: 'struct key_type' has no member named 'request_key'
    1721 |         .request_key    = gss_request_key_upcall,
         |          ^~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1721:27: warning: excess elements in struct initializer
    1721 |         .request_key    = gss_request_key_upcall,
         |                           ^~~~~~~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1721:27: note: (near initialization for 'key_type_gss_cred')
   net/sunrpc/auth_gss/auth_gss.c: In function 'init_rpcsec_gss':
   net/sunrpc/auth_gss/auth_gss.c:2569:23: error: implicit declaration of function 'register_key_type' [-Werror=implicit-function-declaration]
    2569 |                 err = register_key_type(&key_type_gss_cred);
         |                       ^~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c: In function 'exit_rpcsec_gss':
   net/sunrpc/auth_gss/auth_gss.c:2586:17: error: implicit declaration of function 'unregister_key_type'; did you mean 'unregister_one_node'? [-Werror=implicit-function-declaration]
    2586 |                 unregister_key_type(&key_type_gss_cred);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 unregister_one_node
   net/sunrpc/auth_gss/auth_gss.c: At top level:
   net/sunrpc/auth_gss/auth_gss.c:1713:24: error: storage size of 'key_type_gss_cred' isn't known
    1713 | static struct key_type key_type_gss_cred = {
         |                        ^~~~~~~~~~~~~~~~~
   net/sunrpc/auth_gss/auth_gss.c:1713:24: error: storage size of 'key_type_gss_cred' isn't known
   include/keys/request_key_auth-type.h: In function 'get_request_key_auth':
   include/keys/request_key_auth-type.h:30:1: error: control reaches end of non-void function [-Werror=return-type]
      30 | }
         | ^
   cc1: some warnings being treated as errors


vim +1223 net/sunrpc/auth_gss/auth_gss.c

  1220	
  1221	static bool gss_key_gc_iterator(void *object, void *__unused)
  1222	{
> 1223		struct key *key = keyring_ptr_to_key(object);
  1224		struct gss_cred *cred = key->payload.data[0];
  1225	
  1226		if (cred && put_rpccred(&cred->gc_base)) {
  1227			key->payload.data[0] = NULL;
  1228			return false;
  1229		}
  1230		key_get(key);
  1231		return true;
  1232	}
  1233	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
