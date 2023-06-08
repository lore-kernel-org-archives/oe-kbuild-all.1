Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D343D2FA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jun 2023 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686236366; x=1717772366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Ihb3eTb0Oy5zKcznUK4rYbxwV3bB4IAsc7InZzDn/o=;
  b=Nv4f9t5zbgWmDkVxRl3X+0Pv5vzJ/W+zllR2t0MS5iR6EC3LNEnxsNdC
   +x2shFg+d69ez4qYp0nPtsS7e2Jvt9CvVhu0U38nqdZjlrIAkeU4otLUn
   270MGkeDkjOp0RKgAhjrMwDyjRL3+zizCqYR9ReVzfd6dh/g7A1ck7atC
   Iefxvp/GIHVFcHZKQ0fGvQIiQA8y4TFB+dURUqIYsFBROQq+RBvo+ARzX
   x8tLthpKlekNFAOghYiSPZM4n+D2grCmaEBIuggzCUuFnBoQ07WhQcubQ
   3WKGLZnJS5S/wud/5l9v6mpipCQcRIWfiw45w3Zq6wiGRaiCHM5qHdV4c
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="420905805"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="420905805"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 07:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="884225527"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="884225527"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jun 2023 07:59:24 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7H6e-0007wa-0F;
	Thu, 08 Jun 2023 14:59:20 +0000
Date: Thu, 8 Jun 2023 22:59:07 +0800
From: kernel test robot <lkp@intel.com>
To: Roberto Sassu <roberto.sassu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [robertosassu:testlsm-v2 2/2]
 security/testlsm/testlsm-xattr.c:66:23: warning: assignment to 'struct xattr
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202306082230.1P5h5lMv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/robertosassu/linux testlsm-v2
head:   011adfbfa30f61c80c900db9a78f4f51b5463a4a
commit: 011adfbfa30f61c80c900db9a78f4f51b5463a4a [2/2] security: Add TestLSM
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230608/202306082230.1P5h5lMv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/robertosassu/linux/commit/011adfbfa30f61c80c900db9a78f4f51b5463a4a
        git remote add robertosassu https://github.com/robertosassu/linux
        git fetch --no-tags robertosassu testlsm-v2
        git checkout 011adfbfa30f61c80c900db9a78f4f51b5463a4a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash security/testlsm/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306082230.1P5h5lMv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   security/testlsm/testlsm-xattr.c:26:10: error: 'struct lsm_blob_sizes' has no member named 'lbs_xattr_count'
      26 |         .lbs_xattr_count = 1,
         |          ^~~~~~~~~~~~~~~
   security/testlsm/testlsm-xattr.c: In function 'testlsm_inode_init_security':
   security/testlsm/testlsm-xattr.c:66:25: error: implicit declaration of function 'lsm_get_xattr_slot' [-Werror=implicit-function-declaration]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                         ^~~~~~~~~~~~~~~~~~
>> security/testlsm/testlsm-xattr.c:66:23: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                       ^
   In file included from security/testlsm/testlsm-xattr.c:12:
   security/testlsm/testlsm-xattr.c: At top level:
   security/testlsm/testlsm-xattr.c:111:44: error: initialization of 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, size_t *)' {aka 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, unsigned int *)'} from incompatible pointer type 'int (*)(struct inode *, struct inode *, const struct qstr *, struct xattr *, int *)' [-Werror=incompatible-pointer-types]
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/testlsm/testlsm-xattr.c:111:44: note: (near initialization for 'testlsm_hook[0].hook.inode_init_security')
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: some warnings being treated as errors
--
   security/testlsm/testlsm-xattr-2.c:26:10: error: 'struct lsm_blob_sizes' has no member named 'lbs_xattr_count'
      26 |         .lbs_xattr_count = 1,
         |          ^~~~~~~~~~~~~~~
   security/testlsm/testlsm-xattr-2.c: In function 'testlsm_inode_init_security':
   security/testlsm/testlsm-xattr-2.c:66:25: error: implicit declaration of function 'lsm_get_xattr_slot' [-Werror=implicit-function-declaration]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                         ^~~~~~~~~~~~~~~~~~
>> security/testlsm/testlsm-xattr-2.c:66:23: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                       ^
   In file included from security/testlsm/testlsm-xattr-2.c:12:
   security/testlsm/testlsm-xattr-2.c: At top level:
   security/testlsm/testlsm-xattr-2.c:111:44: error: initialization of 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, size_t *)' {aka 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, unsigned int *)'} from incompatible pointer type 'int (*)(struct inode *, struct inode *, const struct qstr *, struct xattr *, int *)' [-Werror=incompatible-pointer-types]
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/testlsm/testlsm-xattr-2.c:111:44: note: (near initialization for 'testlsm_hook[0].hook.inode_init_security')
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: some warnings being treated as errors
--
   security/testlsm/testlsm-xattr-bug.c:26:10: error: 'struct lsm_blob_sizes' has no member named 'lbs_xattr_count'
      26 |         .lbs_xattr_count = 1,
         |          ^~~~~~~~~~~~~~~
   security/testlsm/testlsm-xattr-bug.c: In function 'testlsm_inode_init_security':
   security/testlsm/testlsm-xattr-bug.c:66:25: error: implicit declaration of function 'lsm_get_xattr_slot' [-Werror=implicit-function-declaration]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                         ^~~~~~~~~~~~~~~~~~
>> security/testlsm/testlsm-xattr-bug.c:66:23: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                       ^
   In file included from security/testlsm/testlsm-xattr-bug.c:12:
   security/testlsm/testlsm-xattr-bug.c: At top level:
   security/testlsm/testlsm-xattr-bug.c:111:44: error: initialization of 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, size_t *)' {aka 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, unsigned int *)'} from incompatible pointer type 'int (*)(struct inode *, struct inode *, const struct qstr *, struct xattr *, int *)' [-Werror=incompatible-pointer-types]
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/testlsm/testlsm-xattr-bug.c:111:44: note: (near initialization for 'testlsm_hook[0].hook.inode_init_security')
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: some warnings being treated as errors
--
   security/testlsm/testlsm-xattr-bug2.c:26:10: error: 'struct lsm_blob_sizes' has no member named 'lbs_xattr_count'
      26 |         .lbs_xattr_count = 1,
         |          ^~~~~~~~~~~~~~~
   security/testlsm/testlsm-xattr-bug2.c: In function 'testlsm_inode_init_security':
   security/testlsm/testlsm-xattr-bug2.c:66:25: error: implicit declaration of function 'lsm_get_xattr_slot' [-Werror=implicit-function-declaration]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                         ^~~~~~~~~~~~~~~~~~
>> security/testlsm/testlsm-xattr-bug2.c:66:23: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                       ^
   In file included from security/testlsm/testlsm-xattr-bug2.c:12:
   security/testlsm/testlsm-xattr-bug2.c: At top level:
   security/testlsm/testlsm-xattr-bug2.c:111:44: error: initialization of 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, size_t *)' {aka 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, unsigned int *)'} from incompatible pointer type 'int (*)(struct inode *, struct inode *, const struct qstr *, struct xattr *, int *)' [-Werror=incompatible-pointer-types]
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/testlsm/testlsm-xattr-bug2.c:111:44: note: (near initialization for 'testlsm_hook[0].hook.inode_init_security')
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: some warnings being treated as errors
--
   security/testlsm/testlsm2-xattr.c:29:10: error: 'struct lsm_blob_sizes' has no member named 'lbs_xattr_count'
      29 |         .lbs_xattr_count = 2,
         |          ^~~~~~~~~~~~~~~
   security/testlsm/testlsm2-xattr.c: In function 'testlsm_inode_init_security':
   security/testlsm/testlsm2-xattr.c:66:25: error: implicit declaration of function 'lsm_get_xattr_slot' [-Werror=implicit-function-declaration]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                         ^~~~~~~~~~~~~~~~~~
>> security/testlsm/testlsm2-xattr.c:66:23: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      66 |                 xattr = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                       ^
   security/testlsm/testlsm2-xattr.c:74:24: warning: assignment to 'struct xattr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      74 |                 xattr2 = lsm_get_xattr_slot(xattrs, num_filled_xattrs);
         |                        ^
   In file included from security/testlsm/testlsm2-xattr.c:12:
   security/testlsm/testlsm2-xattr.c: At top level:
   security/testlsm/testlsm2-xattr.c:111:44: error: initialization of 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, size_t *)' {aka 'int (*)(struct inode *, struct inode *, const struct qstr *, const char **, void **, unsigned int *)'} from incompatible pointer type 'int (*)(struct inode *, struct inode *, const struct qstr *, struct xattr *, int *)' [-Werror=incompatible-pointer-types]
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   security/testlsm/testlsm2-xattr.c:111:44: note: (near initialization for 'testlsm_hook[0].hook.inode_init_security')
     111 |         LSM_HOOK_INIT(inode_init_security, testlsm_inode_init_security),
         |                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lsm_hooks.h:81:64: note: in definition of macro 'LSM_HOOK_INIT'
      81 |         { .head = &security_hook_heads.HEAD, .hook = { .HEAD = HOOK } }
         |                                                                ^~~~
   cc1: some warnings being treated as errors


vim +66 security/testlsm/testlsm-xattr.c

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
