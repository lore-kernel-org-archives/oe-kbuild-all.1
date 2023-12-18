Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512171470
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 22:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiY7hUuh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702939465; x=1734475465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FEPFi5D+V48BC5S0HyWcLleT1/Au06DbZ7oDPW5hSVM=;
  b=BiY7hUuhjJD9YQuTn9HUfhmvrcGVkVYhlY4FDqHY5NdkZmnpOWxPHLe8
   QttTVzSYsTyr7W4Ef1KkElXHRAH3raVd0YF2MF4CadQO3t6tHBqTBzNbG
   BW51bMy6muwD2Nfwp5Jsjm0g0LFX1RQf9pIrAse0g/bMHuzhub9Wdse1m
   qe4ulbxms5fmxTrJVIZXe07l7nBdHDb+7nTL9ZnYLHwAb0vhnA12BAU0E
   JqzaYwgzCYwfKuLc5KqvZ5nBHHdHBdKtTHldvPTBVyHiJ7fG/BYUY2WnB
   L3c8VMYfffLsIS666PJlrO5ztQN6bS1L58j9PjRwu04Qnvn0nY1D29mwR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="8945480"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="8945480"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 14:44:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="779265051"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="779265051"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 18 Dec 2023 14:44:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFMLT-0004bF-2v;
	Mon, 18 Dec 2023 22:44:20 +0000
Date: Tue, 19 Dec 2023 06:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Safonov <dima@arista.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8772/9113] lib/aolib.h:320:45: warning: 'struct
 tcp_ao_add' declared inside parameter list will not be visible outside of
 this definition or declaration
Message-ID: <202312190645.q76MmHyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ceb2fe0d438644e1de06b9a6468a1fb8e2199c70
commit: cfbab37b3da094579b8f7492e4df8a8a4c8c41b0 [8772/9113] selftests/net: Add TCP-AO library
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190645.q76MmHyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190645.q76MmHyq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kconfig.c:6:
>> lib/aolib.h:320:45: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     320 | extern int test_prepare_key_sockaddr(struct tcp_ao_add *ao, const char *alg,
         |                                             ^~~~~~~~~~
   lib/aolib.h:326:43: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     326 | static inline int test_prepare_key(struct tcp_ao_add *ao,
         |                                           ^~~~~~~~~~
   lib/aolib.h: In function 'test_prepare_key':
>> lib/aolib.h:336:42: warning: passing argument 1 of 'test_prepare_key_sockaddr' from incompatible pointer type [-Wincompatible-pointer-types]
     336 |         return test_prepare_key_sockaddr(ao, alg, (void *)&addr, sizeof(addr),
         |                                          ^~
         |                                          |
         |                                          struct tcp_ao_add *
   lib/aolib.h:320:57: note: expected 'struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     320 | extern int test_prepare_key_sockaddr(struct tcp_ao_add *ao, const char *alg,
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   lib/aolib.h: At top level:
   lib/aolib.h:341:47: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     341 | static inline int test_prepare_def_key(struct tcp_ao_add *ao,
         |                                               ^~~~~~~~~~
   lib/aolib.h: In function 'test_prepare_def_key':
>> lib/aolib.h:349:33: warning: passing argument 1 of 'test_prepare_key' from incompatible pointer type [-Wincompatible-pointer-types]
     349 |         return test_prepare_key(ao, DEFAULT_TEST_ALGO, in_addr, false, false,
         |                                 ^~
         |                                 |
         |                                 struct tcp_ao_add *
   lib/aolib.h:326:55: note: expected 'struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     326 | static inline int test_prepare_key(struct tcp_ao_add *ao,
         |                                    ~~~~~~~~~~~~~~~~~~~^~
   lib/aolib.h: At top level:
>> lib/aolib.h:354:43: warning: 'struct tcp_ao_getsockopt' declared inside parameter list will not be visible outside of this definition or declaration
     354 | extern int test_get_one_ao(int sk, struct tcp_ao_getsockopt *out,
         |                                           ^~~~~~~~~~~~~~~~~
>> lib/aolib.h:357:44: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     357 | extern int test_get_ao_info(int sk, struct tcp_ao_info_opt *out);
         |                                            ^~~~~~~~~~~~~~~
   lib/aolib.h:358:44: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     358 | extern int test_set_ao_info(int sk, struct tcp_ao_info_opt *in);
         |                                            ^~~~~~~~~~~~~~~
   lib/aolib.h:360:56: warning: 'struct tcp_ao_getsockopt' declared inside parameter list will not be visible outside of this definition or declaration
     360 |                                           const struct tcp_ao_getsockopt *b);
         |                                                        ^~~~~~~~~~~~~~~~~
   lib/aolib.h:359:56: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     359 | extern int test_cmp_getsockopt_setsockopt(const struct tcp_ao_add *a,
         |                                                        ^~~~~~~~~~
   lib/aolib.h:361:59: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     361 | extern int test_cmp_getsockopt_setsockopt_ao(const struct tcp_ao_info_opt *a,
         |                                                           ^~~~~~~~~~~~~~~
   lib/aolib.h:364:57: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     364 | static inline int test_verify_socket_key(int sk, struct tcp_ao_add *key)
         |                                                         ^~~~~~~~~~
   lib/aolib.h: In function 'test_verify_socket_key':
   lib/aolib.h:366:16: error: variable 'key2' has initializer but incomplete type
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                ^~~~~~~~~~~~~~~~~
   lib/aolib.h:366:34: error: storage size of 'key2' isn't known
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                                  ^~~~
   lib/aolib.h:369:46: error: invalid use of undefined type 'struct tcp_ao_add'
     369 |         err = test_get_one_ao(sk, &key2, &key->addr, sizeof(key->addr),
         |                                              ^~
   lib/aolib.h:369:64: error: invalid use of undefined type 'struct tcp_ao_add'
     369 |         err = test_get_one_ao(sk, &key2, &key->addr, sizeof(key->addr),
         |                                                                ^~
   lib/aolib.h:370:34: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                  ^~
   lib/aolib.h:370:47: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                               ^~
   lib/aolib.h:370:59: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                                           ^~
>> lib/aolib.h:374:47: warning: passing argument 1 of 'test_cmp_getsockopt_setsockopt' from incompatible pointer type [-Wincompatible-pointer-types]
     374 |         return test_cmp_getsockopt_setsockopt(key, &key2);
         |                                               ^~~
         |                                               |
         |                                               struct tcp_ao_add *
   lib/aolib.h:359:68: note: expected 'const struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     359 | extern int test_cmp_getsockopt_setsockopt(const struct tcp_ao_add *a,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~^
>> lib/aolib.h:366:34: warning: unused variable 'key2' [-Wunused-variable]
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                                  ^~~~
   lib/aolib.h: In function 'test_add_key_vrf':
   lib/aolib.h:382:16: error: variable 'tmp' has initializer but incomplete type
     382 |         struct tcp_ao_add tmp = {};
         |                ^~~~~~~~~~
   lib/aolib.h:382:27: error: storage size of 'tmp' isn't known
     382 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h:390:43: error: 'TCP_AO_ADD_KEY' undeclared (first use in this function)
     390 |         err = setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &tmp, sizeof(tmp));
         |                                           ^~~~~~~~~~~~~~
   lib/aolib.h:390:43: note: each undeclared identifier is reported only once for each function it appears in
>> lib/aolib.h:382:27: warning: unused variable 'tmp' [-Wunused-variable]
     382 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h: At top level:
   lib/aolib.h:404:56: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     404 | static inline int test_verify_socket_ao(int sk, struct tcp_ao_info_opt *ao)
         |                                                        ^~~~~~~~~~~~~~~
   lib/aolib.h: In function 'test_verify_socket_ao':
   lib/aolib.h:406:16: error: variable 'ao2' has initializer but incomplete type
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                ^~~~~~~~~~~~~~~
   lib/aolib.h:406:32: error: storage size of 'ao2' isn't known
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                                ^~~
>> lib/aolib.h:413:50: warning: passing argument 1 of 'test_cmp_getsockopt_setsockopt_ao' from incompatible pointer type [-Wincompatible-pointer-types]
     413 |         return test_cmp_getsockopt_setsockopt_ao(ao, &ao2);
         |                                                  ^~
         |                                                  |
         |                                                  struct tcp_ao_info_opt *
   lib/aolib.h:361:76: note: expected 'const struct tcp_ao_info_opt *' but argument is of type 'struct tcp_ao_info_opt *'
     361 | extern int test_cmp_getsockopt_setsockopt_ao(const struct tcp_ao_info_opt *a,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> lib/aolib.h:406:32: warning: unused variable 'ao2' [-Wunused-variable]
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                                ^~~
   lib/aolib.h: In function 'test_set_ao_flags':
   lib/aolib.h:418:16: error: variable 'ao' has initializer but incomplete type
     418 |         struct tcp_ao_info_opt ao = {};
         |                ^~~~~~~~~~~~~~~
   lib/aolib.h:418:32: error: storage size of 'ao' isn't known
     418 |         struct tcp_ao_info_opt ao = {};
         |                                ^~
>> lib/aolib.h:418:32: warning: unused variable 'ao' [-Wunused-variable]
   lib/aolib.h: At top level:
>> lib/aolib.h:565:47: warning: 'struct tcp_ao_repair' declared inside parameter list will not be visible outside of this definition or declaration
     565 | extern void test_ao_checkpoint(int sk, struct tcp_ao_repair *state);
         |                                               ^~~~~~~~~~~~~
   lib/aolib.h:579:44: warning: 'struct tcp_ao_repair' declared inside parameter list will not be visible outside of this definition or declaration
     579 | extern void test_ao_restore(int sk, struct tcp_ao_repair *state);
         |                                            ^~~~~~~~~~~~~
   lib/aolib.h: In function 'test_add_repaired_key':
   lib/aolib.h:589:16: error: variable 'tmp' has initializer but incomplete type
     589 |         struct tcp_ao_add tmp = {};
         |                ^~~~~~~~~~
   lib/aolib.h:589:27: error: storage size of 'tmp' isn't known
     589 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h:599:41: error: 'TCP_AO_ADD_KEY' undeclared (first use in this function)
     599 |         if (setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &tmp, sizeof(tmp)) < 0)
         |                                         ^~~~~~~~~~~~~~
   lib/aolib.h:589:27: warning: unused variable 'tmp' [-Wunused-variable]
     589 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/kconfig.c: In function 'has_tcp_ao':
   lib/kconfig.c:47:16: error: variable 'tmp' has initializer but incomplete type
      47 |         struct tcp_ao_add tmp = {};
         |                ^~~~~~~~~~
   lib/kconfig.c:47:27: error: storage size of 'tmp' isn't known
      47 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/kconfig.c:64:41: error: 'TCP_AO_ADD_KEY' undeclared (first use in this function)
      64 |         if (setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &tmp, sizeof(tmp)) < 0) {
         |                                         ^~~~~~~~~~~~~~
>> lib/kconfig.c:47:27: warning: unused variable 'tmp' [-Wunused-variable]
      47 |         struct tcp_ao_add tmp = {};
         |                           ^~~
--
   In file included from lib/netlink.c:12:
>> lib/aolib.h:320:45: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     320 | extern int test_prepare_key_sockaddr(struct tcp_ao_add *ao, const char *alg,
         |                                             ^~~~~~~~~~
   lib/aolib.h:326:43: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     326 | static inline int test_prepare_key(struct tcp_ao_add *ao,
         |                                           ^~~~~~~~~~
   lib/aolib.h: In function 'test_prepare_key':
>> lib/aolib.h:336:42: warning: passing argument 1 of 'test_prepare_key_sockaddr' from incompatible pointer type [-Wincompatible-pointer-types]
     336 |         return test_prepare_key_sockaddr(ao, alg, (void *)&addr, sizeof(addr),
         |                                          ^~
         |                                          |
         |                                          struct tcp_ao_add *
   lib/aolib.h:320:57: note: expected 'struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     320 | extern int test_prepare_key_sockaddr(struct tcp_ao_add *ao, const char *alg,
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   lib/aolib.h: At top level:
   lib/aolib.h:341:47: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     341 | static inline int test_prepare_def_key(struct tcp_ao_add *ao,
         |                                               ^~~~~~~~~~
   lib/aolib.h: In function 'test_prepare_def_key':
>> lib/aolib.h:349:33: warning: passing argument 1 of 'test_prepare_key' from incompatible pointer type [-Wincompatible-pointer-types]
     349 |         return test_prepare_key(ao, DEFAULT_TEST_ALGO, in_addr, false, false,
         |                                 ^~
         |                                 |
         |                                 struct tcp_ao_add *
   lib/aolib.h:326:55: note: expected 'struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     326 | static inline int test_prepare_key(struct tcp_ao_add *ao,
         |                                    ~~~~~~~~~~~~~~~~~~~^~
   lib/aolib.h: At top level:
>> lib/aolib.h:354:43: warning: 'struct tcp_ao_getsockopt' declared inside parameter list will not be visible outside of this definition or declaration
     354 | extern int test_get_one_ao(int sk, struct tcp_ao_getsockopt *out,
         |                                           ^~~~~~~~~~~~~~~~~
>> lib/aolib.h:357:44: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     357 | extern int test_get_ao_info(int sk, struct tcp_ao_info_opt *out);
         |                                            ^~~~~~~~~~~~~~~
   lib/aolib.h:358:44: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     358 | extern int test_set_ao_info(int sk, struct tcp_ao_info_opt *in);
         |                                            ^~~~~~~~~~~~~~~
   lib/aolib.h:360:56: warning: 'struct tcp_ao_getsockopt' declared inside parameter list will not be visible outside of this definition or declaration
     360 |                                           const struct tcp_ao_getsockopt *b);
         |                                                        ^~~~~~~~~~~~~~~~~
   lib/aolib.h:359:56: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     359 | extern int test_cmp_getsockopt_setsockopt(const struct tcp_ao_add *a,
         |                                                        ^~~~~~~~~~
   lib/aolib.h:361:59: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     361 | extern int test_cmp_getsockopt_setsockopt_ao(const struct tcp_ao_info_opt *a,
         |                                                           ^~~~~~~~~~~~~~~
   lib/aolib.h:364:57: warning: 'struct tcp_ao_add' declared inside parameter list will not be visible outside of this definition or declaration
     364 | static inline int test_verify_socket_key(int sk, struct tcp_ao_add *key)
         |                                                         ^~~~~~~~~~
   lib/aolib.h: In function 'test_verify_socket_key':
   lib/aolib.h:366:16: error: variable 'key2' has initializer but incomplete type
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                ^~~~~~~~~~~~~~~~~
   lib/aolib.h:366:34: error: storage size of 'key2' isn't known
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                                  ^~~~
   lib/aolib.h:369:46: error: invalid use of undefined type 'struct tcp_ao_add'
     369 |         err = test_get_one_ao(sk, &key2, &key->addr, sizeof(key->addr),
         |                                              ^~
   lib/aolib.h:369:64: error: invalid use of undefined type 'struct tcp_ao_add'
     369 |         err = test_get_one_ao(sk, &key2, &key->addr, sizeof(key->addr),
         |                                                                ^~
   lib/aolib.h:370:34: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                  ^~
   lib/aolib.h:370:47: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                               ^~
   lib/aolib.h:370:59: error: invalid use of undefined type 'struct tcp_ao_add'
     370 |                               key->prefix, key->sndid, key->rcvid);
         |                                                           ^~
>> lib/aolib.h:374:47: warning: passing argument 1 of 'test_cmp_getsockopt_setsockopt' from incompatible pointer type [-Wincompatible-pointer-types]
     374 |         return test_cmp_getsockopt_setsockopt(key, &key2);
         |                                               ^~~
         |                                               |
         |                                               struct tcp_ao_add *
   lib/aolib.h:359:68: note: expected 'const struct tcp_ao_add *' but argument is of type 'struct tcp_ao_add *'
     359 | extern int test_cmp_getsockopt_setsockopt(const struct tcp_ao_add *a,
         |                                           ~~~~~~~~~~~~~~~~~~~~~~~~~^
>> lib/aolib.h:366:34: warning: unused variable 'key2' [-Wunused-variable]
     366 |         struct tcp_ao_getsockopt key2 = {};
         |                                  ^~~~
   lib/aolib.h: In function 'test_add_key_vrf':
   lib/aolib.h:382:16: error: variable 'tmp' has initializer but incomplete type
     382 |         struct tcp_ao_add tmp = {};
         |                ^~~~~~~~~~
   lib/aolib.h:382:27: error: storage size of 'tmp' isn't known
     382 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h:390:43: error: 'TCP_AO_ADD_KEY' undeclared (first use in this function)
     390 |         err = setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &tmp, sizeof(tmp));
         |                                           ^~~~~~~~~~~~~~
   lib/aolib.h:390:43: note: each undeclared identifier is reported only once for each function it appears in
>> lib/aolib.h:382:27: warning: unused variable 'tmp' [-Wunused-variable]
     382 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h: At top level:
   lib/aolib.h:404:56: warning: 'struct tcp_ao_info_opt' declared inside parameter list will not be visible outside of this definition or declaration
     404 | static inline int test_verify_socket_ao(int sk, struct tcp_ao_info_opt *ao)
         |                                                        ^~~~~~~~~~~~~~~
   lib/aolib.h: In function 'test_verify_socket_ao':
   lib/aolib.h:406:16: error: variable 'ao2' has initializer but incomplete type
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                ^~~~~~~~~~~~~~~
   lib/aolib.h:406:32: error: storage size of 'ao2' isn't known
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                                ^~~
>> lib/aolib.h:413:50: warning: passing argument 1 of 'test_cmp_getsockopt_setsockopt_ao' from incompatible pointer type [-Wincompatible-pointer-types]
     413 |         return test_cmp_getsockopt_setsockopt_ao(ao, &ao2);
         |                                                  ^~
         |                                                  |
         |                                                  struct tcp_ao_info_opt *
   lib/aolib.h:361:76: note: expected 'const struct tcp_ao_info_opt *' but argument is of type 'struct tcp_ao_info_opt *'
     361 | extern int test_cmp_getsockopt_setsockopt_ao(const struct tcp_ao_info_opt *a,
         |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
>> lib/aolib.h:406:32: warning: unused variable 'ao2' [-Wunused-variable]
     406 |         struct tcp_ao_info_opt ao2 = {};
         |                                ^~~
   lib/aolib.h: In function 'test_set_ao_flags':
   lib/aolib.h:418:16: error: variable 'ao' has initializer but incomplete type
     418 |         struct tcp_ao_info_opt ao = {};
         |                ^~~~~~~~~~~~~~~
   lib/aolib.h:418:32: error: storage size of 'ao' isn't known
     418 |         struct tcp_ao_info_opt ao = {};
         |                                ^~
>> lib/aolib.h:418:32: warning: unused variable 'ao' [-Wunused-variable]
   lib/aolib.h: At top level:
>> lib/aolib.h:565:47: warning: 'struct tcp_ao_repair' declared inside parameter list will not be visible outside of this definition or declaration
     565 | extern void test_ao_checkpoint(int sk, struct tcp_ao_repair *state);
         |                                               ^~~~~~~~~~~~~
   lib/aolib.h:579:44: warning: 'struct tcp_ao_repair' declared inside parameter list will not be visible outside of this definition or declaration
     579 | extern void test_ao_restore(int sk, struct tcp_ao_repair *state);
         |                                            ^~~~~~~~~~~~~
   lib/aolib.h: In function 'test_add_repaired_key':
   lib/aolib.h:589:16: error: variable 'tmp' has initializer but incomplete type
     589 |         struct tcp_ao_add tmp = {};
         |                ^~~~~~~~~~
   lib/aolib.h:589:27: error: storage size of 'tmp' isn't known
     589 |         struct tcp_ao_add tmp = {};
         |                           ^~~
   lib/aolib.h:599:41: error: 'TCP_AO_ADD_KEY' undeclared (first use in this function)
     599 |         if (setsockopt(sk, IPPROTO_TCP, TCP_AO_ADD_KEY, &tmp, sizeof(tmp)) < 0)
         |                                         ^~~~~~~~~~~~~~
   lib/aolib.h:589:27: warning: unused variable 'tmp' [-Wunused-variable]
     589 |         struct tcp_ao_add tmp = {};
         |                           ^~~
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
