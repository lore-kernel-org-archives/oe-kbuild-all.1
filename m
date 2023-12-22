Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011A6241E2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Dec 2023 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RmTBPyfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703262060; x=1734798060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Raet7dC3QoP7ZT11xDo5817jqFLb7tzXj6bf6yxjOZU=;
  b=RmTBPyfk5WkABt1mn9HI6yqZv0eN90c//VW1auIPNSzkxV9CvoPnsXte
   ivADPIL3EYPwjPm/j2370uhYWF8nB9QAE5I7+pwdE8bwC6kfUXxp7DhSO
   +I67ThQI74iYdzgtm9RT+dwwGTS90IBgKPHkGRa0TC17WcDSEcOM0F+aX
   Da1uHI0YuWwjKVpVSnlwPh3VPcQmnhB9mSWXz4OjQ4LgCavLZNRbfepRM
   eLc3l3wWKoIhfuk+FKs0DuhptCqXvZgshTdmhgpAQRjnsRR/SKGCNWMi/
   ELf27Czj1sIvAcPUmG8Iym4gITckzoV8EyeL1dlyQdW0VYG32cY4Gb1Bb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="399955212"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="399955212"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 08:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="842979012"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
   d="scan'208";a="842979012"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 22 Dec 2023 08:20:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGiGd-0009dB-22;
	Fri, 22 Dec 2023 16:20:55 +0000
Date: Sat, 23 Dec 2023 00:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 3084/28639]
 crypto/asymmetric_keys/asymmetric_type.c:87:20: warning: passing argument 1
 of 'IS_ERR' makes pointer from integer without a cast
Message-ID: <202312230029.YEy4B0Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   70db018a109f8ff0106a193be649d741389d1f69
commit: 1be052b20ba04b635cf87bcff80de5314697953e [3084/28639] ANDROID: Initial commit of Incremental FS
config: i386-randconfig-051-20231222 (https://download.01.org/0day-ci/archive/20231223/202312230029.YEy4B0Oq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312230029.YEy4B0Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312230029.YEy4B0Oq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/keys/asymmetric-subtype.h:14,
                    from crypto/asymmetric_keys/asymmetric_type.c:9:
   include/keys/asymmetric-type.h: In function 'asymmetric_key_ids':
   include/keys/asymmetric-type.h:72:19: error: invalid use of undefined type 'const struct key'
      72 |         return key->payload.data[asym_key_ids];
         |                   ^~
   include/keys/asymmetric-subtype.h: In function 'asymmetric_key_subtype':
>> include/keys/asymmetric-subtype.h:57:19: error: invalid use of undefined type 'const struct key'
      57 |         return key->payload.data[asym_subtype];
         |                   ^~
   In file included from crypto/asymmetric_keys/asymmetric_type.c:10:
   include/keys/asymmetric-parser.h: At top level:
>> include/keys/asymmetric-parser.h:27:29: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
      27 |         int (*parse)(struct key_preparsed_payload *prep);
         |                             ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'find_asymmetric_key':
>> crypto/asymmetric_keys/asymmetric_type.c:52:9: error: unknown type name 'key_ref_t'; did you mean 'key_ref_put'?
      52 |         key_ref_t ref;
         |         ^~~~~~~~~
         |         key_ref_put
>> crypto/asymmetric_keys/asymmetric_type.c:85:15: error: implicit declaration of function 'keyring_search' [-Werror=implicit-function-declaration]
      85 |         ref = keyring_search(make_key_ref(keyring, 1),
         |               ^~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:87:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
      87 |         if (IS_ERR(ref))
         |                    ^~~
         |                    |
         |                    int
   In file included from arch/x86/include/asm/processor.h:32,
                    from include/linux/mutex.h:19,
                    from include/linux/seq_file.h:8,
                    from include/keys/asymmetric-subtype.h:13:
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
   In file included from include/linux/printk.h:332,
                    from include/linux/kernel.h:15,
                    from include/asm-generic/bug.h:19,
                    from arch/x86/include/asm/bug.h:83,
                    from include/linux/bug.h:5,
                    from include/linux/seq_file.h:7:
>> crypto/asymmetric_keys/asymmetric_type.c:88:73: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      88 |                 pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
         |                                                                         ^~~
         |                                                                         |
         |                                                                         int
   include/linux/dynamic_debug.h:125:29: note: in definition of macro '__dynamic_func_call'
     125 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:153:9: note: in expansion of macro '_dynamic_func_call'
     153 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:336:9: note: in expansion of macro 'dynamic_pr_debug'
     336 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:88:17: note: in expansion of macro 'pr_debug'
      88 |                 pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
         |                 ^~~~~~~~
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c:91:20: warning: passing argument 1 of 'IS_ERR' makes pointer from integer without a cast [-Wint-conversion]
      91 |         if (IS_ERR(ref)) {
         |                    ^~~
         |                    |
         |                    int
   include/linux/err.h:34:60: note: expected 'const void *' but argument is of type 'int'
      34 | static inline bool __must_check IS_ERR(__force const void *ptr)
         |                                                ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c:92:33: warning: passing argument 1 of 'PTR_ERR' makes pointer from integer without a cast [-Wint-conversion]
      92 |                 switch (PTR_ERR(ref)) {
         |                                 ^~~
         |                                 |
         |                                 int
   include/linux/err.h:29:61: note: expected 'const void *' but argument is of type 'int'
      29 | static inline long __must_check PTR_ERR(__force const void *ptr)
         |                                                 ~~~~~~~~~~~~^~~
>> crypto/asymmetric_keys/asymmetric_type.c:99:41: warning: passing argument 1 of 'ERR_CAST' makes pointer from integer without a cast [-Wint-conversion]
      99 |                         return ERR_CAST(ref);
         |                                         ^~~
         |                                         |
         |                                         int
   include/linux/err.h:51:64: note: expected 'const void *' but argument is of type 'int'
      51 | static inline void * __must_check ERR_CAST(__force const void *ptr)
         |                                                    ~~~~~~~~~~~~^~~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:248:45: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     248 |                                const struct key_match_data *match_data)
         |                                             ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp':
>> crypto/asymmetric_keys/asymmetric_type.c:251:62: error: invalid use of undefined type 'const struct key_match_data'
     251 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:261:53: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     261 |                                        const struct key_match_data *match_data)
         |                                                     ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_cmp_partial':
   crypto/asymmetric_keys/asymmetric_type.c:264:62: error: invalid use of undefined type 'const struct key_match_data'
     264 |         const struct asymmetric_key_id *match_id = match_data->preparsed;
         |                                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:283:49: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     283 | static int asymmetric_key_match_preparse(struct key_match_data *match_data)
         |                                                 ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:286:38: error: invalid use of undefined type 'struct key_match_data'
     286 |         const char *spec = match_data->raw_data;
         |                                      ^~
>> crypto/asymmetric_keys/asymmetric_type.c:289:17: error: initialization of 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} from incompatible pointer type 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} [-Werror=incompatible-pointer-types]
     289 |                 asymmetric_key_cmp;
         |                 ^~~~~~~~~~~~~~~~~~
>> crypto/asymmetric_keys/asymmetric_type.c:297:21: error: assignment to 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} from incompatible pointer type 'bool (*)(const struct key *, const struct key_match_data *)' {aka '_Bool (*)(const struct key *, const struct key_match_data *)'} [-Werror=incompatible-pointer-types]
     297 |                 cmp = asymmetric_key_cmp_partial;
         |                     ^
   crypto/asymmetric_keys/asymmetric_type.c:310:19: error: invalid use of undefined type 'struct key_match_data'
     310 |         match_data->preparsed = match_id;
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c:311:19: error: invalid use of undefined type 'struct key_match_data'
     311 |         match_data->cmp = cmp;
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c:312:19: error: invalid use of undefined type 'struct key_match_data'
     312 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                   ^~
>> crypto/asymmetric_keys/asymmetric_type.c:312:35: error: 'KEYRING_SEARCH_LOOKUP_ITERATE' undeclared (first use in this function)
     312 |         match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:312:35: note: each undeclared identifier is reported only once for each function it appears in
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:322:46: warning: 'struct key_match_data' declared inside parameter list will not be visible outside of this definition or declaration
     322 | static void asymmetric_key_match_free(struct key_match_data *match_data)
         |                                              ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_match_free':
   crypto/asymmetric_keys/asymmetric_type.c:324:25: error: invalid use of undefined type 'struct key_match_data'
     324 |         kfree(match_data->preparsed);
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_describe':
>> crypto/asymmetric_keys/asymmetric_type.c:338:24: error: invalid use of undefined type 'const struct key'
     338 |         seq_puts(m, key->description);
         |                        ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:369:43: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     369 | static int asymmetric_key_preparse(struct key_preparsed_payload *prep)
         |                                           ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_preparse':
>> crypto/asymmetric_keys/asymmetric_type.c:376:17: error: invalid use of undefined type 'struct key_preparsed_payload'
     376 |         if (prep->datalen == 0)
         |                 ^~
>> crypto/asymmetric_keys/asymmetric_type.c:385:37: error: passing argument 1 of 'parser->parse' from incompatible pointer type [-Werror=incompatible-pointer-types]
     385 |                 ret = parser->parse(prep);
         |                                     ^~~~
         |                                     |
         |                                     struct key_preparsed_payload *
   crypto/asymmetric_keys/asymmetric_type.c:385:37: note: expected 'struct key_preparsed_payload *' but argument is of type 'struct key_preparsed_payload *'
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:415:49: warning: 'struct key_preparsed_payload' declared inside parameter list will not be visible outside of this definition or declaration
     415 | static void asymmetric_key_free_preparse(struct key_preparsed_payload *prep)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_free_preparse':
   crypto/asymmetric_keys/asymmetric_type.c:417:54: error: invalid use of undefined type 'struct key_preparsed_payload'
     417 |         struct asymmetric_key_subtype *subtype = prep->payload.data[asym_subtype];
         |                                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:418:47: error: invalid use of undefined type 'struct key_preparsed_payload'
     418 |         struct asymmetric_key_ids *kids = prep->payload.data[asym_key_ids];
         |                                               ^~
   crypto/asymmetric_keys/asymmetric_type.c:423:38: error: invalid use of undefined type 'struct key_preparsed_payload'
     423 |                 subtype->destroy(prep->payload.data[asym_crypto],
         |                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:424:38: error: invalid use of undefined type 'struct key_preparsed_payload'
     424 |                                  prep->payload.data[asym_auth]);
         |                                      ^~
   crypto/asymmetric_keys/asymmetric_type.c:428:19: error: invalid use of undefined type 'struct key_preparsed_payload'
     428 |         kfree(prep->description);
         |                   ^~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_destroy':
>> crypto/asymmetric_keys/asymmetric_type.c:437:46: error: invalid use of undefined type 'struct key'
     437 |         struct asymmetric_key_ids *kids = key->payload.data[asym_key_ids];
         |                                              ^~
   crypto/asymmetric_keys/asymmetric_type.c:438:25: error: invalid use of undefined type 'struct key'
     438 |         void *data = key->payload.data[asym_crypto];
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c:439:25: error: invalid use of undefined type 'struct key'
     439 |         void *auth = key->payload.data[asym_auth];
         |                         ^~
   crypto/asymmetric_keys/asymmetric_type.c:441:12: error: invalid use of undefined type 'struct key'
     441 |         key->payload.data[asym_crypto] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:442:12: error: invalid use of undefined type 'struct key'
     442 |         key->payload.data[asym_subtype] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:443:12: error: invalid use of undefined type 'struct key'
     443 |         key->payload.data[asym_key_ids] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c:444:12: error: invalid use of undefined type 'struct key'
     444 |         key->payload.data[asym_auth] = NULL;
         |            ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
>> crypto/asymmetric_keys/asymmetric_type.c:455:9: error: unknown type name 'key_restrict_link_func_t'
     455 |         key_restrict_link_func_t check,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_lookup_restriction':
>> crypto/asymmetric_keys/asymmetric_type.c:483:24: error: implicit declaration of function 'asymmetric_restriction_alloc' [-Werror=implicit-function-declaration]
     483 |                 return asymmetric_restriction_alloc(
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from crypto/asymmetric_keys/asymmetric_type.c:16:
   include/keys/system_keyring.h:21:42: error: 'restrict_link_reject' undeclared (first use in this function)
      21 | #define restrict_link_by_builtin_trusted restrict_link_reject
         |                                          ^~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:484:25: note: in expansion of macro 'restrict_link_by_builtin_trusted'
     484 |                         restrict_link_by_builtin_trusted, NULL);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:501:17: error: unknown type name 'key_restrict_link_func_t'
     501 |                 key_restrict_link_func_t link_fn =
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:502:25: warning: initialization of 'int' from 'int (*)(struct key *, const struct key_type *, const union key_payload *, struct key *)' makes integer from pointer without a cast [-Wint-conversion]
     502 |                         restrict_link_by_key_or_keyring;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:511:33: warning: assignment to 'int' from 'int (*)(struct key *, const struct key_type *, const union key_payload *, struct key *)' makes integer from pointer without a cast [-Wint-conversion]
     511 |                         link_fn = restrict_link_by_key_or_keyring_chain;
         |                                 ^
   crypto/asymmetric_keys/asymmetric_type.c:521:31: error: implicit declaration of function 'key_lookup'; did you mean 'd_lookup'? [-Werror=implicit-function-declaration]
     521 |                         key = key_lookup(serial);
         |                               ^~~~~~~~~~
         |                               d_lookup
   crypto/asymmetric_keys/asymmetric_type.c:521:29: warning: assignment to 'struct key *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     521 |                         key = key_lookup(serial);
         |                             ^
   crypto/asymmetric_keys/asymmetric_type.c:528:21: warning: assignment to 'struct key_restriction *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     528 |                 ret = asymmetric_restriction_alloc(link_fn, key);
         |                     ^
   crypto/asymmetric_keys/asymmetric_type.c: In function 'asymmetric_key_eds_op':
   crypto/asymmetric_keys/asymmetric_type.c:547:16: error: invalid use of undefined type 'struct key'
     547 |         if (key->type != &key_type_asymmetric)
         |                ^~
   crypto/asymmetric_keys/asymmetric_type.c:551:17: error: invalid use of undefined type 'struct key'
     551 |             !key->payload.data[0])
         |                 ^~
   crypto/asymmetric_keys/asymmetric_type.c: At top level:
   crypto/asymmetric_keys/asymmetric_type.c:577:8: error: variable 'key_type_asymmetric' has initializer but incomplete type
     577 | struct key_type key_type_asymmetric = {
         |        ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:10: error: 'struct key_type' has no member named 'name'
     578 |         .name                   = "asymmetric",
         |          ^~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:35: warning: excess elements in struct initializer
     578 |         .name                   = "asymmetric",
         |                                   ^~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:578:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:579:10: error: 'struct key_type' has no member named 'preparse'
     579 |         .preparse               = asymmetric_key_preparse,
         |          ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:579:35: warning: excess elements in struct initializer
     579 |         .preparse               = asymmetric_key_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:579:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:580:10: error: 'struct key_type' has no member named 'free_preparse'
     580 |         .free_preparse          = asymmetric_key_free_preparse,
         |          ^~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:580:35: warning: excess elements in struct initializer
     580 |         .free_preparse          = asymmetric_key_free_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:580:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:581:10: error: 'struct key_type' has no member named 'instantiate'
     581 |         .instantiate            = generic_key_instantiate,
         |          ^~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:581:35: error: 'generic_key_instantiate' undeclared here (not in a function)
     581 |         .instantiate            = generic_key_instantiate,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:581:35: warning: excess elements in struct initializer
   crypto/asymmetric_keys/asymmetric_type.c:581:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:582:10: error: 'struct key_type' has no member named 'match_preparse'
     582 |         .match_preparse         = asymmetric_key_match_preparse,
         |          ^~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:582:35: warning: excess elements in struct initializer
     582 |         .match_preparse         = asymmetric_key_match_preparse,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:582:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:583:10: error: 'struct key_type' has no member named 'match_free'
     583 |         .match_free             = asymmetric_key_match_free,
         |          ^~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:583:35: warning: excess elements in struct initializer
     583 |         .match_free             = asymmetric_key_match_free,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:583:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:584:10: error: 'struct key_type' has no member named 'destroy'
     584 |         .destroy                = asymmetric_key_destroy,
         |          ^~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:584:35: warning: excess elements in struct initializer
     584 |         .destroy                = asymmetric_key_destroy,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:584:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:585:10: error: 'struct key_type' has no member named 'describe'
     585 |         .describe               = asymmetric_key_describe,
         |          ^~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:585:35: warning: excess elements in struct initializer
     585 |         .describe               = asymmetric_key_describe,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:585:35: note: (near initialization for 'key_type_asymmetric')
   crypto/asymmetric_keys/asymmetric_type.c:586:10: error: 'struct key_type' has no member named 'lookup_restriction'
     586 |         .lookup_restriction     = asymmetric_lookup_restriction,
         |          ^~~~~~~~~~~~~~~~~~
   crypto/asymmetric_keys/asymmetric_type.c:586:35: warning: excess elements in struct initializer
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
   Depends on [n]: CRYPTO [=y] && KEYS [=n]
   Selected by [y]:
   - INCREMENTAL_FS [=y] && BLOCK [=y]


vim +/IS_ERR +87 crypto/asymmetric_keys/asymmetric_type.c

46c6f1776e2f53 David Howells   2012-09-13   34  
983023f28bff62 David Howells   2016-04-06   35  /**
9eb029893ad5bf David Howells   2016-04-06   36   * find_asymmetric_key - Find a key by ID.
983023f28bff62 David Howells   2016-04-06   37   * @keyring: The keys to search.
9eb029893ad5bf David Howells   2016-04-06   38   * @id_0: The first ID to look for or NULL.
9eb029893ad5bf David Howells   2016-04-06   39   * @id_1: The second ID to look for or NULL.
983023f28bff62 David Howells   2016-04-06   40   * @partial: Use partial match if true, exact if false.
983023f28bff62 David Howells   2016-04-06   41   *
983023f28bff62 David Howells   2016-04-06   42   * Find a key in the given keyring by identifier.  The preferred identifier is
9eb029893ad5bf David Howells   2016-04-06   43   * the id_0 and the fallback identifier is the id_1.  If both are given, the
9eb029893ad5bf David Howells   2016-04-06   44   * lookup is by the former, but the latter must also match.
983023f28bff62 David Howells   2016-04-06   45   */
9eb029893ad5bf David Howells   2016-04-06   46  struct key *find_asymmetric_key(struct key *keyring,
9eb029893ad5bf David Howells   2016-04-06   47  				const struct asymmetric_key_id *id_0,
9eb029893ad5bf David Howells   2016-04-06   48  				const struct asymmetric_key_id *id_1,
983023f28bff62 David Howells   2016-04-06   49  				bool partial)
983023f28bff62 David Howells   2016-04-06   50  {
983023f28bff62 David Howells   2016-04-06   51  	struct key *key;
983023f28bff62 David Howells   2016-04-06  @52  	key_ref_t ref;
983023f28bff62 David Howells   2016-04-06   53  	const char *lookup;
983023f28bff62 David Howells   2016-04-06   54  	char *req, *p;
983023f28bff62 David Howells   2016-04-06   55  	int len;
983023f28bff62 David Howells   2016-04-06   56  
b3811d36a3e7e7 Chun-Yi Lee     2017-10-04   57  	BUG_ON(!id_0 && !id_1);
b3811d36a3e7e7 Chun-Yi Lee     2017-10-04   58  
9eb029893ad5bf David Howells   2016-04-06   59  	if (id_0) {
9eb029893ad5bf David Howells   2016-04-06   60  		lookup = id_0->data;
9eb029893ad5bf David Howells   2016-04-06   61  		len = id_0->len;
983023f28bff62 David Howells   2016-04-06   62  	} else {
9eb029893ad5bf David Howells   2016-04-06   63  		lookup = id_1->data;
9eb029893ad5bf David Howells   2016-04-06   64  		len = id_1->len;
983023f28bff62 David Howells   2016-04-06   65  	}
983023f28bff62 David Howells   2016-04-06   66  
983023f28bff62 David Howells   2016-04-06   67  	/* Construct an identifier "id:<keyid>". */
983023f28bff62 David Howells   2016-04-06   68  	p = req = kmalloc(2 + 1 + len * 2 + 1, GFP_KERNEL);
983023f28bff62 David Howells   2016-04-06   69  	if (!req)
983023f28bff62 David Howells   2016-04-06   70  		return ERR_PTR(-ENOMEM);
983023f28bff62 David Howells   2016-04-06   71  
983023f28bff62 David Howells   2016-04-06   72  	if (partial) {
983023f28bff62 David Howells   2016-04-06   73  		*p++ = 'i';
983023f28bff62 David Howells   2016-04-06   74  		*p++ = 'd';
983023f28bff62 David Howells   2016-04-06   75  	} else {
983023f28bff62 David Howells   2016-04-06   76  		*p++ = 'e';
983023f28bff62 David Howells   2016-04-06   77  		*p++ = 'x';
983023f28bff62 David Howells   2016-04-06   78  	}
983023f28bff62 David Howells   2016-04-06   79  	*p++ = ':';
983023f28bff62 David Howells   2016-04-06   80  	p = bin2hex(p, lookup, len);
983023f28bff62 David Howells   2016-04-06   81  	*p = 0;
983023f28bff62 David Howells   2016-04-06   82  
983023f28bff62 David Howells   2016-04-06   83  	pr_debug("Look up: \"%s\"\n", req);
983023f28bff62 David Howells   2016-04-06   84  
983023f28bff62 David Howells   2016-04-06  @85  	ref = keyring_search(make_key_ref(keyring, 1),
dcf49dbc8077e2 David Howells   2019-06-26   86  			     &key_type_asymmetric, req, true);
983023f28bff62 David Howells   2016-04-06  @87  	if (IS_ERR(ref))
983023f28bff62 David Howells   2016-04-06  @88  		pr_debug("Request for key '%s' err %ld\n", req, PTR_ERR(ref));
983023f28bff62 David Howells   2016-04-06   89  	kfree(req);
983023f28bff62 David Howells   2016-04-06   90  
983023f28bff62 David Howells   2016-04-06   91  	if (IS_ERR(ref)) {
983023f28bff62 David Howells   2016-04-06   92  		switch (PTR_ERR(ref)) {
983023f28bff62 David Howells   2016-04-06   93  			/* Hide some search errors */
983023f28bff62 David Howells   2016-04-06   94  		case -EACCES:
983023f28bff62 David Howells   2016-04-06   95  		case -ENOTDIR:
983023f28bff62 David Howells   2016-04-06   96  		case -EAGAIN:
983023f28bff62 David Howells   2016-04-06   97  			return ERR_PTR(-ENOKEY);
983023f28bff62 David Howells   2016-04-06   98  		default:
983023f28bff62 David Howells   2016-04-06  @99  			return ERR_CAST(ref);
983023f28bff62 David Howells   2016-04-06  100  		}
983023f28bff62 David Howells   2016-04-06  101  	}
983023f28bff62 David Howells   2016-04-06  102  
983023f28bff62 David Howells   2016-04-06  103  	key = key_ref_to_ptr(ref);
9eb029893ad5bf David Howells   2016-04-06  104  	if (id_0 && id_1) {
983023f28bff62 David Howells   2016-04-06  105  		const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
9eb029893ad5bf David Howells   2016-04-06  106  
6a6d2a77addce6 Chun-Yi Lee     2017-10-04  107  		if (!kids->id[1]) {
9eb029893ad5bf David Howells   2016-04-06  108  			pr_debug("First ID matches, but second is missing\n");
983023f28bff62 David Howells   2016-04-06  109  			goto reject;
983023f28bff62 David Howells   2016-04-06  110  		}
9eb029893ad5bf David Howells   2016-04-06  111  		if (!asymmetric_key_id_same(id_1, kids->id[1])) {
9eb029893ad5bf David Howells   2016-04-06  112  			pr_debug("First ID matches, but second does not\n");
983023f28bff62 David Howells   2016-04-06  113  			goto reject;
983023f28bff62 David Howells   2016-04-06  114  		}
983023f28bff62 David Howells   2016-04-06  115  	}
983023f28bff62 David Howells   2016-04-06  116  
983023f28bff62 David Howells   2016-04-06  117  	pr_devel("<==%s() = 0 [%x]\n", __func__, key_serial(key));
983023f28bff62 David Howells   2016-04-06  118  	return key;
983023f28bff62 David Howells   2016-04-06  119  
983023f28bff62 David Howells   2016-04-06  120  reject:
983023f28bff62 David Howells   2016-04-06  121  	key_put(key);
983023f28bff62 David Howells   2016-04-06  122  	return ERR_PTR(-EKEYREJECTED);
983023f28bff62 David Howells   2016-04-06  123  }
9eb029893ad5bf David Howells   2016-04-06  124  EXPORT_SYMBOL_GPL(find_asymmetric_key);
983023f28bff62 David Howells   2016-04-06  125  
7901c1a8effbe5 David Howells   2014-09-16  126  /**
7901c1a8effbe5 David Howells   2014-09-16  127   * asymmetric_key_generate_id: Construct an asymmetric key ID
7901c1a8effbe5 David Howells   2014-09-16  128   * @val_1: First binary blob
7901c1a8effbe5 David Howells   2014-09-16  129   * @len_1: Length of first binary blob
7901c1a8effbe5 David Howells   2014-09-16  130   * @val_2: Second binary blob
7901c1a8effbe5 David Howells   2014-09-16  131   * @len_2: Length of second binary blob
7901c1a8effbe5 David Howells   2014-09-16  132   *
7901c1a8effbe5 David Howells   2014-09-16  133   * Construct an asymmetric key ID from a pair of binary blobs.
7901c1a8effbe5 David Howells   2014-09-16  134   */
7901c1a8effbe5 David Howells   2014-09-16  135  struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
7901c1a8effbe5 David Howells   2014-09-16  136  						     size_t len_1,
7901c1a8effbe5 David Howells   2014-09-16  137  						     const void *val_2,
7901c1a8effbe5 David Howells   2014-09-16  138  						     size_t len_2)
7901c1a8effbe5 David Howells   2014-09-16  139  {
7901c1a8effbe5 David Howells   2014-09-16  140  	struct asymmetric_key_id *kid;
7901c1a8effbe5 David Howells   2014-09-16  141  
7901c1a8effbe5 David Howells   2014-09-16  142  	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
7901c1a8effbe5 David Howells   2014-09-16  143  		      GFP_KERNEL);
7901c1a8effbe5 David Howells   2014-09-16  144  	if (!kid)
7901c1a8effbe5 David Howells   2014-09-16  145  		return ERR_PTR(-ENOMEM);
7901c1a8effbe5 David Howells   2014-09-16  146  	kid->len = len_1 + len_2;
7901c1a8effbe5 David Howells   2014-09-16  147  	memcpy(kid->data, val_1, len_1);
7901c1a8effbe5 David Howells   2014-09-16  148  	memcpy(kid->data + len_1, val_2, len_2);
7901c1a8effbe5 David Howells   2014-09-16  149  	return kid;
7901c1a8effbe5 David Howells   2014-09-16  150  }
7901c1a8effbe5 David Howells   2014-09-16  151  EXPORT_SYMBOL_GPL(asymmetric_key_generate_id);
7901c1a8effbe5 David Howells   2014-09-16  152  
7901c1a8effbe5 David Howells   2014-09-16  153  /**
7901c1a8effbe5 David Howells   2014-09-16  154   * asymmetric_key_id_same - Return true if two asymmetric keys IDs are the same.
7901c1a8effbe5 David Howells   2014-09-16  155   * @kid_1, @kid_2: The key IDs to compare
7901c1a8effbe5 David Howells   2014-09-16  156   */
7901c1a8effbe5 David Howells   2014-09-16  157  bool asymmetric_key_id_same(const struct asymmetric_key_id *kid1,
7901c1a8effbe5 David Howells   2014-09-16  158  			    const struct asymmetric_key_id *kid2)
7901c1a8effbe5 David Howells   2014-09-16  159  {
7901c1a8effbe5 David Howells   2014-09-16  160  	if (!kid1 || !kid2)
7901c1a8effbe5 David Howells   2014-09-16  161  		return false;
7901c1a8effbe5 David Howells   2014-09-16  162  	if (kid1->len != kid2->len)
7901c1a8effbe5 David Howells   2014-09-16  163  		return false;
7901c1a8effbe5 David Howells   2014-09-16  164  	return memcmp(kid1->data, kid2->data, kid1->len) == 0;
7901c1a8effbe5 David Howells   2014-09-16  165  }
7901c1a8effbe5 David Howells   2014-09-16  166  EXPORT_SYMBOL_GPL(asymmetric_key_id_same);
7901c1a8effbe5 David Howells   2014-09-16  167  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  168  /**
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  169   * asymmetric_key_id_partial - Return true if two asymmetric keys IDs
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  170   * partially match
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  171   * @kid_1, @kid_2: The key IDs to compare
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  172   */
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  173  bool asymmetric_key_id_partial(const struct asymmetric_key_id *kid1,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  174  			       const struct asymmetric_key_id *kid2)
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  175  {
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  176  	if (!kid1 || !kid2)
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  177  		return false;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  178  	if (kid1->len < kid2->len)
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  179  		return false;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  180  	return memcmp(kid1->data + (kid1->len - kid2->len),
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  181  		      kid2->data, kid2->len) == 0;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  182  }
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  183  EXPORT_SYMBOL_GPL(asymmetric_key_id_partial);
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  184  
7901c1a8effbe5 David Howells   2014-09-16  185  /**
7901c1a8effbe5 David Howells   2014-09-16  186   * asymmetric_match_key_ids - Search asymmetric key IDs
7901c1a8effbe5 David Howells   2014-09-16  187   * @kids: The list of key IDs to check
7901c1a8effbe5 David Howells   2014-09-16  188   * @match_id: The key ID we're looking for
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  189   * @match: The match function to use
7901c1a8effbe5 David Howells   2014-09-16  190   */
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  191  static bool asymmetric_match_key_ids(
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  192  	const struct asymmetric_key_ids *kids,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  193  	const struct asymmetric_key_id *match_id,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  194  	bool (*match)(const struct asymmetric_key_id *kid1,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  195  		      const struct asymmetric_key_id *kid2))
7901c1a8effbe5 David Howells   2014-09-16  196  {
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  197  	int i;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  198  
7901c1a8effbe5 David Howells   2014-09-16  199  	if (!kids || !match_id)
7901c1a8effbe5 David Howells   2014-09-16  200  		return false;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  201  	for (i = 0; i < ARRAY_SIZE(kids->id); i++)
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  202  		if (match(kids->id[i], match_id))
7901c1a8effbe5 David Howells   2014-09-16  203  			return true;
7901c1a8effbe5 David Howells   2014-09-16  204  	return false;
7901c1a8effbe5 David Howells   2014-09-16  205  }
7901c1a8effbe5 David Howells   2014-09-16  206  
f2b3dee484f9ce Mimi Zohar      2015-02-11  207  /* helper function can be called directly with pre-allocated memory */
f2b3dee484f9ce Mimi Zohar      2015-02-11  208  inline int __asymmetric_key_hex_to_key_id(const char *id,
f2b3dee484f9ce Mimi Zohar      2015-02-11  209  				   struct asymmetric_key_id *match_id,
f2b3dee484f9ce Mimi Zohar      2015-02-11  210  				   size_t hexlen)
f2b3dee484f9ce Mimi Zohar      2015-02-11  211  {
f2b3dee484f9ce Mimi Zohar      2015-02-11  212  	match_id->len = hexlen;
f2b3dee484f9ce Mimi Zohar      2015-02-11  213  	return hex2bin(match_id->data, id, hexlen);
f2b3dee484f9ce Mimi Zohar      2015-02-11  214  }
f2b3dee484f9ce Mimi Zohar      2015-02-11  215  
7901c1a8effbe5 David Howells   2014-09-16  216  /**
7901c1a8effbe5 David Howells   2014-09-16  217   * asymmetric_key_hex_to_key_id - Convert a hex string into a key ID.
7901c1a8effbe5 David Howells   2014-09-16  218   * @id: The ID as a hex string.
7901c1a8effbe5 David Howells   2014-09-16  219   */
7901c1a8effbe5 David Howells   2014-09-16  220  struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
7901c1a8effbe5 David Howells   2014-09-16  221  {
7901c1a8effbe5 David Howells   2014-09-16  222  	struct asymmetric_key_id *match_id;
f2b3dee484f9ce Mimi Zohar      2015-02-11  223  	size_t asciihexlen;
d1ac5540455c3a David Howells   2014-09-22  224  	int ret;
7901c1a8effbe5 David Howells   2014-09-16  225  
7901c1a8effbe5 David Howells   2014-09-16  226  	if (!*id)
7901c1a8effbe5 David Howells   2014-09-16  227  		return ERR_PTR(-EINVAL);
f2b3dee484f9ce Mimi Zohar      2015-02-11  228  	asciihexlen = strlen(id);
f2b3dee484f9ce Mimi Zohar      2015-02-11  229  	if (asciihexlen & 1)
7901c1a8effbe5 David Howells   2014-09-16  230  		return ERR_PTR(-EINVAL);
7901c1a8effbe5 David Howells   2014-09-16  231  
f2b3dee484f9ce Mimi Zohar      2015-02-11  232  	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
7901c1a8effbe5 David Howells   2014-09-16  233  			   GFP_KERNEL);
7901c1a8effbe5 David Howells   2014-09-16  234  	if (!match_id)
7901c1a8effbe5 David Howells   2014-09-16  235  		return ERR_PTR(-ENOMEM);
f2b3dee484f9ce Mimi Zohar      2015-02-11  236  	ret = __asymmetric_key_hex_to_key_id(id, match_id, asciihexlen / 2);
d1ac5540455c3a David Howells   2014-09-22  237  	if (ret < 0) {
d1ac5540455c3a David Howells   2014-09-22  238  		kfree(match_id);
d1ac5540455c3a David Howells   2014-09-22  239  		return ERR_PTR(-EINVAL);
d1ac5540455c3a David Howells   2014-09-22  240  	}
7901c1a8effbe5 David Howells   2014-09-16  241  	return match_id;
7901c1a8effbe5 David Howells   2014-09-16  242  }
7901c1a8effbe5 David Howells   2014-09-16  243  
b3426827c848d2 Dmitry Kasatkin 2014-06-17  244  /*
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  245   * Match asymmetric keys by an exact match on an ID.
964f3b3bf49eb8 David Howells   2012-09-13  246   */
0c903ab64feb0f David Howells   2014-09-16  247  static bool asymmetric_key_cmp(const struct key *key,
462919591a1791 David Howells   2014-09-16 @248  			       const struct key_match_data *match_data)
964f3b3bf49eb8 David Howells   2012-09-13  249  {
46963b774d441c David Howells   2014-09-16  250  	const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
46963b774d441c David Howells   2014-09-16 @251  	const struct asymmetric_key_id *match_id = match_data->preparsed;
964f3b3bf49eb8 David Howells   2012-09-13  252  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  253  	return asymmetric_match_key_ids(kids, match_id,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  254  					asymmetric_key_id_same);
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  255  }
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  256  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  257  /*
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  258   * Match asymmetric keys by a partial match on an IDs.
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  259   */
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  260  static bool asymmetric_key_cmp_partial(const struct key *key,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  261  				       const struct key_match_data *match_data)
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  262  {
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  263  	const struct asymmetric_key_ids *kids = asymmetric_key_ids(key);
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  264  	const struct asymmetric_key_id *match_id = match_data->preparsed;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  265  
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  266  	return asymmetric_match_key_ids(kids, match_id,
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  267  					asymmetric_key_id_partial);
964f3b3bf49eb8 David Howells   2012-09-13  268  }
964f3b3bf49eb8 David Howells   2012-09-13  269  
462919591a1791 David Howells   2014-09-16  270  /*
462919591a1791 David Howells   2014-09-16  271   * Preparse the match criterion.  If we don't set lookup_type and cmp,
462919591a1791 David Howells   2014-09-16  272   * the default will be an exact match on the key description.
462919591a1791 David Howells   2014-09-16  273   *
462919591a1791 David Howells   2014-09-16  274   * There are some specifiers for matching key IDs rather than by the key
462919591a1791 David Howells   2014-09-16  275   * description:
462919591a1791 David Howells   2014-09-16  276   *
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  277   *	"id:<id>" - find a key by partial match on any available ID
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  278   *	"ex:<id>" - find a key by exact match on any available ID
462919591a1791 David Howells   2014-09-16  279   *
462919591a1791 David Howells   2014-09-16  280   * These have to be searched by iteration rather than by direct lookup because
462919591a1791 David Howells   2014-09-16  281   * the key is hashed according to its description.
462919591a1791 David Howells   2014-09-16  282   */
462919591a1791 David Howells   2014-09-16  283  static int asymmetric_key_match_preparse(struct key_match_data *match_data)
462919591a1791 David Howells   2014-09-16  284  {
46963b774d441c David Howells   2014-09-16  285  	struct asymmetric_key_id *match_id;
46963b774d441c David Howells   2014-09-16 @286  	const char *spec = match_data->raw_data;
46963b774d441c David Howells   2014-09-16  287  	const char *id;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  288  	bool (*cmp)(const struct key *, const struct key_match_data *) =
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  289  		asymmetric_key_cmp;
46963b774d441c David Howells   2014-09-16  290  
46963b774d441c David Howells   2014-09-16  291  	if (!spec || !*spec)
46963b774d441c David Howells   2014-09-16  292  		return -EINVAL;
46963b774d441c David Howells   2014-09-16  293  	if (spec[0] == 'i' &&
46963b774d441c David Howells   2014-09-16  294  	    spec[1] == 'd' &&
46963b774d441c David Howells   2014-09-16  295  	    spec[2] == ':') {
46963b774d441c David Howells   2014-09-16  296  		id = spec + 3;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  297  		cmp = asymmetric_key_cmp_partial;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  298  	} else if (spec[0] == 'e' &&
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  299  		   spec[1] == 'x' &&
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  300  		   spec[2] == ':') {
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  301  		id = spec + 3;
46963b774d441c David Howells   2014-09-16  302  	} else {
46963b774d441c David Howells   2014-09-16  303  		goto default_match;
46963b774d441c David Howells   2014-09-16  304  	}
46963b774d441c David Howells   2014-09-16  305  
46963b774d441c David Howells   2014-09-16  306  	match_id = asymmetric_key_hex_to_key_id(id);
40b50e80c5ca78 Dmitry Kasatkin 2014-10-03  307  	if (IS_ERR(match_id))
40b50e80c5ca78 Dmitry Kasatkin 2014-10-03  308  		return PTR_ERR(match_id);
46963b774d441c David Howells   2014-09-16  309  
46963b774d441c David Howells   2014-09-16  310  	match_data->preparsed = match_id;
f1b731dbc2530c Dmitry Kasatkin 2014-10-06  311  	match_data->cmp = cmp;
46963b774d441c David Howells   2014-09-16  312  	match_data->lookup_type = KEYRING_SEARCH_LOOKUP_ITERATE;
46963b774d441c David Howells   2014-09-16  313  	return 0;
46963b774d441c David Howells   2014-09-16  314  
46963b774d441c David Howells   2014-09-16  315  default_match:
462919591a1791 David Howells   2014-09-16  316  	return 0;
462919591a1791 David Howells   2014-09-16  317  }
462919591a1791 David Howells   2014-09-16  318  

:::::: The code at line 87 was first introduced by commit
:::::: 983023f28bff62b4462fd3575a86a8947ac592d8 KEYS: Move x509_request_asymmetric_key() to asymmetric_type.c

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
