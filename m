Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13A8366
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676631610; x=1708167610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xyJjYO/FSk19hHcpL4dW0nhxSYNe+Bu2QUOWQTu7FRs=;
  b=m68BFN6/59fDVmfSdXbKr9sgfi/9wnlPpoDAD9dfq4GQtc9rdD5V5ryz
   0PItsnEnBbb5V+PWT6yte8+Qy3iyBn0DbWJ4YuIhOzUMGRAvDT5MdNsdn
   JD7K9BFXFsy8LycVR1CsSijTsR5dbo6g+uWPlYmAhN70r4BQCfWd79+Fj
   6+8Ir+NdRU8yLm/F8Sa2Ta767ZscutGnkeqwx04mXEfMnbQP9h/k1LAGD
   pGXYdXcg0wJEjrf1SyoX2pSbMBkJkw2uoFgu1JQ+Hxi2XbpwG7KKSngo8
   gQAOeKUnA2fcU1KWmk6VlWsfPIdcLvw/HRGGNjN1b2uP+3pjQj1RmTcW2
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320068272"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="320068272"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:00:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="663840520"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="663840520"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Feb 2023 03:00:08 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSyTH-000BMG-2Q;
	Fri, 17 Feb 2023 11:00:07 +0000
Date: Fri, 17 Feb 2023 18:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-4.19-stable
 5785/9999] include/keys/asymmetric-type.h:76:19: error: invalid use of
 undefined type 'const struct key'
Message-ID: <202302171829.ASzALvQg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-4.19-stable
head:   ddaaba8f70bf512e25206d71e0bc661b19d9d25e
commit: 0d2a1b4679cf032563b744d96b2a66ce46034a53 [5785/9999] Revert "ANDROID: Incremental fs: Remove unnecessary dependencies"
config: ia64-randconfig-r013-20230217 (https://download.01.org/0day-ci/archive/20230217/202302171829.ASzALvQg-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/0d2a1b4679cf032563b744d96b2a66ce46034a53
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-4.19-stable
        git checkout 0d2a1b4679cf032563b744d96b2a66ce46034a53
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash crypto/asymmetric_keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302171829.ASzALvQg-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/keys/asymmetric-subtype.h:18,
                    from crypto/asymmetric_keys/asymmetric_type.c:13:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:76:19: error: invalid use of undefined type 'const struct key'
      76 |         return key->payload.data[asym_key_ids];
         |                   ^~
   include/keys/asymmetric-subtype.h: In function 'asymmetric_key_subtype':
>> include/keys/asymmetric-subtype.h:52:19: error: invalid use of undefined type 'const struct key'
      52 |         return key->payload.data[asym_subtype];
         |                   ^~
   In file included from crypto/asymmetric_keys/asymmetric_type.c:14:
   include/keys/asymmetric-parser.h: At top level:
>> include/keys/asymmetric-parser.h:31:29: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
      31 |         int (*parse)(struct key_preparsed_payload *prep);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'find_asymmetric_key':
>> crypto/asymmetric_keys/asymmetric_type.c:55:9: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
      55 |         key_ref_t ref;
         |         ^~~~~~~~~
         |         key_ref_put
>> crypto/asymmetric_keys/asymmetric_type.c:88:15: error: implicit declaration of function 'keyring_search' [-Werror=implicit-function-declaration]
      88 |         ref = keyring_search(make_key_ref(keyring, 1),
         |               ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:90:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
      90 |         if (IS_ERR(ref))
         |                    ^~~
         |                    |
         |                    int
   In file included from include/linux/rwsem.h:18,
                    from include/linux/fs.h:22,
                    from include/linux/seq_file.h:11,
                    from include/keys/asymmetric-subtype.h:17:
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
   In file included from include/linux/kernel.h:13,
                    from include/asm-generic/bug.h:18,
                    from arch/ia64/include/asm/bug.h:17,
                    from include/linux/bug.h:5,
                    from include/linux/seq_file.h:7:
>> crypto/asymmetric_keys/asymmetric_type.c:91:73: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      91 |                 pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
         |                                                                         ^~~
         |                                                                         |
         |                                                                         int
   include/linux/printk.h:137:31: note: in definition of macro 'no_printk'
     137 |                 printk(fmt, ##__VA_ARGS__);             \
         |                               ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:91:17: note: in expansion of macro 'pr_debug'
      91 |                 pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
         |                 ^~~~~~~~
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c:94:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
      94 |         if (IS_ERR(ref)) {
         |                    ^~~
         |                    |
         |                    int
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c:95:33: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      95 |                 switch (PTR_ERR(ref)) {
         |                                 ^~~
         |                                 |
         |                                 int
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> crypto/asymmetric_keys/asymmetric_type.c:102:41: warning: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
     102 |                         return ERR_CAST(ref);
         |                                         ^~~
         |                                         |
         |                                         int
   include/linux/err.h:51:64: note: expected 'const void *' but argument is of type 'int'
      51 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                    ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:251:45: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     251 |                                const struct key_match_data *match_data)
         |                                             ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp':
>> crypto/asymmetric_keys/asymmetric_type.c:254:62: error: invalid use of undefined type 'const struct key_match_data'
     254 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:264:53: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     264 |                                        const struct key_match_data *match_data)
         |                                                     ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp_partial':
   crypto/asymmetric_keys/asymmetric_type.c:267:62: error: invalid use of undefined type 'const struct key_match_data'
     267 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:286:49: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     286 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:289:38: error: invalid use of undefined type 'struct key_match_data'
     289 |         const char *spec = match_data->raw_data;
         |                                      ^~
>> crypto/asymmetric_keys/asymmetric_type.c:292:17: error: initialization of 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} from incompatible pointer type 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} [-Werror=incompatible-pointer-types]
     292 |                 asymmetric_key_cmp;
         |                 ^~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:300:21: error: assignment to 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} from incompatible pointer type 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} [-Werror=incompatible-pointer-types]
     300 |                 cmp = asymmetric_key_cmp_partial;
         |                     ^
   crypto/asymmetric_keys/asymmetric_type.c:313:19: error: invalid use of undefined type 'struct key_match_data'
     313 |         match_data->preparsed = match_id;
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c:314:19: error: invalid use of undefined type 'struct key_match_data'
     314 |         match_data->cmp = cmp;
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c:315:19: error: invalid use of undefined type 'struct key_match_data'
     315 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                   ^~
>> crypto/asymmetric_keys/asymmetric_type.c:315:35: error: 'KEYRING_SEARCH_LOOKUP_ITERATE' undeclared (first use in this function)
     315 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:315:35: note: each undeclared identifier is reported only once for each function it appears in
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:325:46: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     325 | static void asymmetric_key_match_free(struct key_match_data *match_data)
         |                                              ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_free':
   crypto/asymmetric_keys/asymmetric_type.c:327:25: error: invalid use of undefined type 'struct key_match_data'
     327 |         kfree(match_data->preparsed);
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_describe':
>> crypto/asymmetric_keys/asymmetric_type.c:341:24: error: invalid use of undefined type 'const struct key'
     341 |         seq_puts(m, key->description);
         |                        ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:372:43: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     372 | static int asymmetric_key_preparse(struct key_preparsed_payload *prep)
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:379:17: error: invalid use of undefined type 'struct key_preparsed_payload'
     379 |         if (prep->datalen == 0)
         |                 ^~
>> crypto/asymmetric_keys/asymmetric_type.c:388:37: error: passing argument 1 of 'parser->parse' from incompatible pointer type [-Werror=incompatible-pointer-types]
     388 |                 ret = parser->parse(prep);
         |                                     ^~~~
         |                                     |
         |                                     struct key_preparsed_payload *
   crypto/asymmetric_keys/asymmetric_type.c:388:37: note: expected 'struct key_preparsed_payload *' but argument is of type 'struct key_preparsed_payload *'
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:418:49: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     418 | static void asymmetric_key_free_preparse(struct key_preparsed_payload *prep)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_free_preparse':
   crypto/asymmetric_keys/asymmetric_type.c:420:54: error: invalid use of undefined type 'struct key_preparsed_payload'
     420 |         struct asymmetric_key_subtype *subtype = prep->payload.data[asym_subtype];
         |                                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:421:47: error: invalid use of undefined type 'struct key_preparsed_payload'
     421 |         struct asymmetric_key_ids *kids = prep->payload.data[asym_key_ids];
         |                                               ^~
   crypto/asymmetric_keys/asymmetric_type.c:426:38: error: invalid use of undefined type 'struct key_preparsed_payload'
     426 |                 subtype->destroy(prep->payload.data[asym_crypto],
         |                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:427:38: error: invalid use of undefined type 'struct key_preparsed_payload'
     427 |                                  prep->payload.data[asym_auth]);
         |                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:431:19: error: invalid use of undefined type 'struct key_preparsed_payload'
     431 |         kfree(prep->description);
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_destroy':
>> crypto/asymmetric_keys/asymmetric_type.c:440:46: error: invalid use of undefined type 'struct key'
     440 |         struct asymmetric_key_ids *kids = key->payload.data[asym_key_ids];
         |                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c:441:25: error: invalid use of undefined type 'struct key'
     441 |         void *data = key->payload.data[asym_crypto];
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c:442:25: error: invalid use of undefined type 'struct key'
     442 |         void *auth = key->payload.data[asym_auth];
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c:444:12: error: invalid use of undefined type 'struct key'
     444 |         key->payload.data[asym_crypto] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:445:12: error: invalid use of undefined type 'struct key'
     445 |         key->payload.data[asym_subtype] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:446:12: error: invalid use of undefined type 'struct key'
     446 |         key->payload.data[asym_key_ids] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:447:12: error: invalid use of undefined type 'struct key'
     447 |         key->payload.data[asym_auth] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:458:9: error: unknown type name 'key_restrict_link_func_t'
     458 |         key_restrict_link_func_t check,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_lookup_restriction':
   crypto/asymmetric_keys/asymmetric_type.c:486:24: error: implicit declaration of function 'asymmetric_restriction_alloc' [-Werror=implicit-function-declaration]
     486 |                 return asymmetric_restriction_alloc(
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from crypto/asymmetric_keys/asymmetric_type.c:20:
   include/keys/system_keyring.h:25:42: error: 'restrict_link_reject' undeclared (first use in this function)
      25 | #define restrict_link_by_builtin_trusted restrict_link_reject
         |                                          ^~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:487:25: note: in expansion of macro 'restrict_link_by_builtin_trusted'
     487 |                         restrict_link_by_builtin_trusted, NULL);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:504:17: error: unknown type name 'key_restrict_link_func_t'
     504 |                 key_restrict_link_func_t link_fn =
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:505:25: warning: initialization of 'int' from 'int (*)(struct key *, const struct key_type *, const union key_payload *, struct key *)' makes integer from pointer without a cast [-Wint-conversion]
     505 |                         restrict_link_by_key_or_keyring;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:514:33: warning: assignment to 'int' from 'int (*)(struct key *, const struct key_type *, const union key_payload *, struct key *)' makes integer from pointer without a cast [-Wint-conversion]
     514 |                         link_fn = restrict_link_by_key_or_keyring_chain;
         |                                 ^
   crypto/asymmetric_keys/asymmetric_type.c:524:31: error: implicit declaration of function 'key_lookup'; did you mean 'd_lookup'? [-Werror=implicit-function-declaration]
     524 |                         key = key_lookup(serial);
         |                               ^~~~~~~~~~
         |                               d_lookup
   crypto/asymmetric_keys/asymmetric_type.c:524:29: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     524 |                         key = key_lookup(serial);
         |                             ^
   crypto/asymmetric_keys/asymmetric_type.c:531:21: warning: assignment to 'struct key_restriction *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     531 |                 ret = asymmetric_restriction_alloc(link_fn, key);
         |                     ^
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:541:8: error: variable 'key_type_asymmetric' has initializer but incomplete type
     541 | struct key_type key_type_asymmetric = {
         |        ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:542:10: error: 'struct key_type' has no member named 'name'
     542 |         .name                   = "asymmetric",
         |          ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:542:35: warning: excess elements in struct initializer
     542 |         .name                   = "asymmetric",
         |                                   ^~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:542:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:543:10: error: 'struct key_type' has no member named 'preparse'
     543 |         .preparse               = asymmetric_key_preparse,
         |          ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:543:35: warning: excess elements in struct initializer
     543 |         .preparse               = asymmetric_key_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:543:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:544:10: error: 'struct key_type' has no member named 'free_preparse'
     544 |         .free_preparse          = asymmetric_key_free_preparse,
         |          ^~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:544:35: warning: excess elements in struct initializer
     544 |         .free_preparse          = asymmetric_key_free_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:544:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:545:10: error: 'struct key_type' has no member named 'instantiate'
     545 |         .instantiate            = generic_key_instantiate,
         |          ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:545:35: error: 'generic_key_instantiate' undeclared here (not in a function)
     545 |         .instantiate            = generic_key_instantiate,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:545:35: warning: excess elements in struct initializer
   crypto/asymmetric_keys/asymmetric_type.c:545:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:546:10: error: 'struct key_type' has no member named 'match_preparse'
     546 |         .match_preparse         = asymmetric_key_match_preparse,
         |          ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:546:35: warning: excess elements in struct initializer
     546 |         .match_preparse         = asymmetric_key_match_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:546:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:547:10: error: 'struct key_type' has no member named 'match_free'
     547 |         .match_free             = asymmetric_key_match_free,
         |          ^~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:547:35: warning: excess elements in struct initializer
     547 |         .match_free             = asymmetric_key_match_free,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:547:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:548:10: error: 'struct key_type' has no member named 'destroy'
     548 |         .destroy                = asymmetric_key_destroy,
         |          ^~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:548:35: warning: excess elements in struct initializer
     548 |         .destroy                = asymmetric_key_destroy,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:548:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:549:10: error: 'struct key_type' has no member named 'describe'
     549 |         .describe               = asymmetric_key_describe,
         |          ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:549:35: warning: excess elements in struct initializer
     549 |         .describe               = asymmetric_key_describe,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:549:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:550:10: error: 'struct key_type' has no member named 'lookup_restriction'
     550 |         .lookup_restriction     = asymmetric_lookup_restriction,
         |          ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:550:35: warning: excess elements in struct initializer
     550 |         .lookup_restriction     = asymmetric_lookup_restriction,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:550:35: note: (near initialization for 'key_type_asymmetric')
--
   In file included from crypto/asymmetric_keys/asymmetric_keys.h:12,
                    from crypto/asymmetric_keys/restrict.c:17:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
>> include/keys/asymmetric-type.h:76:19: error: invalid use of undefined type 'const struct key'
      76 |         return key->payload.data[asym_key_ids];
         |                   ^~
   crypto/asymmetric_keys/restrict.c: In function 'restrict_link_by_signature':
>> crypto/asymmetric_keys/restrict.c:91:22: error: invalid use of undefined type 'const union key_payload'
      91 |         sig = payload->data[asym_auth];
         |                      ^~
>> crypto/asymmetric_keys/restrict.c:107:43: error: 'KEY_FLAG_BUILTIN' undeclared (first use in this function)
     107 |         if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
         |                                           ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/restrict.c:107:43: note: each undeclared identifier is reported only once for each function it appears in
>> crypto/asymmetric_keys/restrict.c:107:65: error: invalid use of undefined type 'struct key'
     107 |         if (use_builtin_keys && !test_bit(KEY_FLAG_BUILTIN, &key->flags))
         |                                                                 ^~
   crypto/asymmetric_keys/restrict.c: In function 'key_or_keyring_common':
   crypto/asymmetric_keys/restrict.c:135:30: error: invalid use of undefined type 'struct key'
     135 |         else if (dest_keyring->type != &key_type_keyring)
         |                              ^~
>> crypto/asymmetric_keys/restrict.c:135:41: error: 'key_type_keyring' undeclared (first use in this function); did you mean 'dest_keyring'?
     135 |         else if (dest_keyring->type != &key_type_keyring)
         |                                         ^~~~~~~~~~~~~~~~
         |                                         dest_keyring
   crypto/asymmetric_keys/restrict.c:144:22: error: invalid use of undefined type 'const union key_payload'
     144 |         sig = payload->data[asym_auth];
         |                      ^~
   crypto/asymmetric_keys/restrict.c:151:28: error: invalid use of undefined type 'struct key'
     151 |                 if (trusted->type == &key_type_keyring) {
         |                            ^~
   crypto/asymmetric_keys/restrict.c:157:35: error: invalid use of undefined type 'struct key'
     157 |                 } else if (trusted->type == &key_type_asymmetric) {
         |                                   ^~
>> crypto/asymmetric_keys/restrict.c:184:47: error: implicit declaration of function '__key_get'; did you mean 'key_get'? [-Werror=implicit-function-declaration]
     184 |                                         key = __key_get(trusted);
         |                                               ^~~~~~~~~
         |                                               key_get
>> crypto/asymmetric_keys/restrict.c:184:45: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     184 |                                         key = __key_get(trusted);
         |                                             ^
   crypto/asymmetric_keys/restrict.c:190:37: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     190 |                                 key = __key_get(trusted);
         |                                     ^
   cc1: some warnings being treated as errors
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
   Depends on [n]: CRYPTO [=y] && KEYS [=n]
   Selected by [m]:
   - INCREMENTAL_FS [=m] && BLOCK [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +76 include/keys/asymmetric-type.h

7901c1a8effbe5 David Howells   2014-09-16  62  
7901c1a8effbe5 David Howells   2014-09-16  63  extern bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
7901c1a8effbe5 David Howells   2014-09-16  64  				   const struct asymmetric_key_id *kid2);
7901c1a8effbe5 David Howells   2014-09-16  65  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  66  extern bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  67  				      const struct asymmetric_key_id *kid2);
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  68  
7901c1a8effbe5 David Howells   2014-09-16  69  extern struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
7901c1a8effbe5 David Howells   2014-09-16  70  							    size_t len_1,
7901c1a8effbe5 David Howells   2014-09-16  71  							    const void *val_2,
7901c1a8effbe5 David Howells   2014-09-16  72  							    size_t len_2);
146aa8b1453bd8 David Howells   2015-10-21  73  static inline
146aa8b1453bd8 David Howells   2015-10-21  74  const struct asymmetric_key_ids *asymmetric_key_ids(const struct key *key)
146aa8b1453bd8 David Howells   2015-10-21  75  {
146aa8b1453bd8 David Howells   2015-10-21 @76  	return key->payload.data[asym_key_ids];
146aa8b1453bd8 David Howells   2015-10-21  77  }
7901c1a8effbe5 David Howells   2014-09-16  78  

:::::: The code at line 76 was first introduced by commit
:::::: 146aa8b1453bd8f1ff2304ffb71b4ee0eb9acdcc KEYS: Merge the type-specific data with the payload data

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
