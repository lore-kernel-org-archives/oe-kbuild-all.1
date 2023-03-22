Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA3A28FC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679490667; x=1711026667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkmVg5fI2zfQCQ8UOgionLiDcmjnNGvAWCR311mbJMc=;
  b=FCes6VoITQ6ofHGfqC/D9a56CsfH7MgyIDqomlfmg4GhfNEB5B263kyL
   l+14AKuKH5dtkSYjL+ALuct0pD14kSlKpc7zYGis8oQEtcXiZzJRDujWL
   n3VuzXERMhrTx7GkTl90bOvqzmhl5SIIjFvMieS3S7D0wroC/7jwq70Jr
   VKjo6TTNMKy5NeajSkKUOCdbxbX0GeheplGR8e3+A2MaphxwNlM/qb+p2
   a99JEfBzYvQi1+HIAo7NB/PxDLXJ0KVMuaYpSYFuOQPTcXEnEbRY7RG1K
   7FXE5DkKHPnx+7dL82uhJyLz4Fmc/6bTITv1L8Z9B3uulQXTMZBcHTaMS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="318852136"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="318852136"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 06:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="631989970"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="631989970"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Mar 2023 06:10:38 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peyEf-000DKW-30;
	Wed, 22 Mar 2023 13:10:37 +0000
Date: Wed, 22 Mar 2023 21:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Rosenberg <drosen@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Gwendal Grignou <gwendal@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.14 8834/9354] fs/esdfs/file.c:371:1:
 sparse: sparse: symbol 'esdfs_read_iter' was not declared. Should it be
 static?
Message-ID: <202303222155.Ze1CDPRs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.14
head:   6f750b16c322c9191168a3a97c427c90581d9144
commit: b946d1193a393461b24b6777ac8b4f165abbb815 [8834/9354] CHROMIUM: esdfs: Clean up for Android
config: alpha-randconfig-s053-20230322 (https://download.01.org/0day-ci/archive/20230322/202303222155.Ze1CDPRs-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/b946d1193a393461b24b6777ac8b4f165abbb815
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.14
        git checkout b946d1193a393461b24b6777ac8b4f165abbb815
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash arch/alpha/mm/ fs/esdfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303222155.Ze1CDPRs-lkp@intel.com/

Note: the jsarha/topic/cros-sof-v4.14 HEAD 6f750b16c322c9191168a3a97c427c90581d9144 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   arch/alpha/mm/init.c:265:1: error: no previous declaration for 'srm_paging_stop' [-Werror=missing-declarations]
    srm_paging_stop (void)
    ^~~~~~~~~~~~~~~
>> arch/alpha/mm/init.c:297:1: error: no previous declaration for 'free_initrd_mem' [-Werror=missing-declarations]
    free_initrd_mem(unsigned long start, unsigned long end)
    ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/alpha/mm/numa.c:252:1: error: no previous declaration for 'setup_memory' [-Werror=missing-declarations]
    setup_memory(void *kernel_end)
    ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/alpha/mm/init.c:265:1: sparse: sparse: symbol 'srm_paging_stop' was not declared. Should it be static?
   arch/alpha/mm/init.c:297:1: sparse: sparse: symbol 'free_initrd_mem' was not declared. Should it be static?
   arch/alpha/mm/init.c:265:1: error: no previous declaration for 'srm_paging_stop' [-Werror=missing-declarations]
    srm_paging_stop (void)
    ^~~~~~~~~~~~~~~
>> arch/alpha/mm/init.c:297:1: error: no previous declaration for 'free_initrd_mem' [-Werror=missing-declarations]
    free_initrd_mem(unsigned long start, unsigned long end)
    ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
   arch/alpha/mm/numa.c:252:1: sparse: sparse: symbol 'setup_memory' was not declared. Should it be static?
>> arch/alpha/mm/numa.c:252:1: error: no previous declaration for 'setup_memory' [-Werror=missing-declarations]
    setup_memory(void *kernel_end)
    ^~~~~~~~~~~~
   cc1: all warnings being treated as errors

sparse warnings: (new ones prefixed by >>)
>> fs/esdfs/file.c:371:1: sparse: sparse: symbol 'esdfs_read_iter' was not declared. Should it be static?
>> fs/esdfs/file.c:399:1: sparse: sparse: symbol 'esdfs_write_iter' was not declared. Should it be static?
   fs/esdfs/file.c: note: in included file:
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/alpha/include/asm/atomic.h:5,
                    from include/linux/atomic.h:5,
                    from include/linux/dcache.h:5,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/file.c:14:
   fs/esdfs/esdfs.h: In function 'esdfs_put_reset_lower_paths':
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   fs/esdfs/file.c: At top level:
   fs/esdfs/file.c:371:1: warning: no previous declaration for 'esdfs_read_iter' [-Wmissing-declarations]
    esdfs_read_iter(struct kiocb *iocb, struct iov_iter *iter)
    ^~~~~~~~~~~~~~~
   fs/esdfs/file.c:399:1: warning: no previous declaration for 'esdfs_write_iter' [-Wmissing-declarations]
    esdfs_write_iter(struct kiocb *iocb, struct iov_iter *iter)
    ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/esdfs/inode.c:149:26: sparse: sparse: no member 'i_mutex' in struct inode
   fs/esdfs/inode.c:153:28: sparse: sparse: no member 'i_mutex' in struct inode
   fs/esdfs/inode.c: note: in included file:
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/alpha/include/asm/atomic.h:5,
                    from include/linux/atomic.h:5,
                    from include/linux/dcache.h:5,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/inode.c:14:
   fs/esdfs/esdfs.h: In function 'esdfs_put_reset_lower_paths':
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   fs/esdfs/inode.c: In function 'esdfs_drop_sb_icache':
   fs/esdfs/inode.c:149:21: error: 'struct inode' has no member named 'i_mutex'; did you mean 'i_mode'?
     mutex_lock(&inode->i_mutex);
                        ^~~~~~~
                        i_mode
   fs/esdfs/inode.c:153:23: error: 'struct inode' has no member named 'i_mutex'; did you mean 'i_mode'?
     mutex_unlock(&inode->i_mutex);
                          ^~~~~~~
                          i_mode
   cc1: some warnings being treated as errors
--
   fs/esdfs/lookup.c:313:51: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected char const * @@     got unsigned int [assigned] [usertype] len @@
   fs/esdfs/lookup.c:313:51: sparse:     expected char const *
   fs/esdfs/lookup.c:313:51: sparse:     got unsigned int [assigned] [usertype] len
   fs/esdfs/lookup.c:313:35: sparse: sparse: not enough arguments for function full_name_hash
   fs/esdfs/lookup.c: note: in included file:
   fs/esdfs/esdfs.h:297:41: sparse: sparse: in initializer for lower_stub_path: positional init of field in struct path, declared with attribute designated_init
   fs/esdfs/esdfs.h:297:47: sparse: sparse: in initializer for lower_stub_path: positional init of field in struct path, declared with attribute designated_init
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/alpha/include/asm/atomic.h:5,
                    from include/linux/atomic.h:5,
                    from include/linux/dcache.h:5,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/lookup.c:14:
   fs/esdfs/esdfs.h: In function 'esdfs_put_reset_lower_paths':
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   fs/esdfs/lookup.c: In function '__esdfs_lookup':
   fs/esdfs/lookup.c:313:40: warning: passing argument 2 of 'full_name_hash' makes pointer from integer without a cast [-Wint-conversion]
     this.hash = full_name_hash(this.name, this.len);
                                           ^~~~
   In file included from include/linux/dcache.h:14:0,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/lookup.c:14:
   include/linux/stringhash.h:66:28: note: expected 'const char *' but argument is of type 'u32 {aka unsigned int}'
    extern unsigned int __pure full_name_hash(const void *salt, const char *, unsigned int);
                               ^~~~~~~~~~~~~~
   fs/esdfs/lookup.c:313:14: error: too few arguments to function 'full_name_hash'
     this.hash = full_name_hash(this.name, this.len);
                 ^~~~~~~~~~~~~~
   In file included from include/linux/dcache.h:14:0,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/lookup.c:14:
   include/linux/stringhash.h:66:28: note: declared here
    extern unsigned int __pure full_name_hash(const void *salt, const char *, unsigned int);
                               ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/esdfs/mmap.c: note: in included file:
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
>> fs/esdfs/esdfs.h:460:51: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct cred const *current_creds @@     got struct cred const [noderef] <asn:4> *cred @@
   fs/esdfs/esdfs.h:460:51: sparse:     expected struct cred const *current_creds
   fs/esdfs/esdfs.h:460:51: sparse:     got struct cred const [noderef] <asn:4> *cred
   In file included from include/uapi/linux/posix_types.h:5:0,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from arch/alpha/include/asm/atomic.h:5,
                    from include/linux/atomic.h:5,
                    from include/linux/dcache.h:5,
                    from fs/esdfs/esdfs.h:17,
                    from fs/esdfs/mmap.c:14:
   fs/esdfs/esdfs.h: In function 'esdfs_put_reset_lower_paths':
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:34: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                     ^~~~
   include/linux/stddef.h:8:14: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   include/linux/stddef.h:8:14: note: (near initialization for 'lower_stub_path')
    #define NULL ((void *)0)
                 ^
   fs/esdfs/esdfs.h:297:40: note: in expansion of macro 'NULL'
     struct path lower_stub_path = { NULL, NULL };
                                           ^~~~
   cc1: some warnings being treated as errors

vim +/esdfs_read_iter +371 fs/esdfs/file.c

f38c4149df1364f Russ W. Knize 2013-04-07  366  
f38c4149df1364f Russ W. Knize 2013-04-07  367  /*
f38c4149df1364f Russ W. Knize 2013-04-07  368   * Wrapfs read_iter, redirect modified iocb to lower read_iter
f38c4149df1364f Russ W. Knize 2013-04-07  369   */
f38c4149df1364f Russ W. Knize 2013-04-07  370  ssize_t
f38c4149df1364f Russ W. Knize 2013-04-07 @371  esdfs_read_iter(struct kiocb *iocb, struct iov_iter *iter)
f38c4149df1364f Russ W. Knize 2013-04-07  372  {
f38c4149df1364f Russ W. Knize 2013-04-07  373  	int err;
f38c4149df1364f Russ W. Knize 2013-04-07  374  	struct file *file = iocb->ki_filp, *lower_file;
f38c4149df1364f Russ W. Knize 2013-04-07  375  
f38c4149df1364f Russ W. Knize 2013-04-07  376  	lower_file = esdfs_lower_file(file);
f38c4149df1364f Russ W. Knize 2013-04-07  377  	if (!lower_file->f_op->read_iter) {
f38c4149df1364f Russ W. Knize 2013-04-07  378  		err = -EINVAL;
f38c4149df1364f Russ W. Knize 2013-04-07  379  		goto out;
f38c4149df1364f Russ W. Knize 2013-04-07  380  	}
f38c4149df1364f Russ W. Knize 2013-04-07  381  
f38c4149df1364f Russ W. Knize 2013-04-07  382  	get_file(lower_file); /* prevent lower_file from being released */
f38c4149df1364f Russ W. Knize 2013-04-07  383  	iocb->ki_filp = lower_file;
f38c4149df1364f Russ W. Knize 2013-04-07  384  	err = lower_file->f_op->read_iter(iocb, iter);
f38c4149df1364f Russ W. Knize 2013-04-07  385  	iocb->ki_filp = file;
f38c4149df1364f Russ W. Knize 2013-04-07  386  	fput(lower_file);
f38c4149df1364f Russ W. Knize 2013-04-07  387  	/* update upper inode atime as needed */
f38c4149df1364f Russ W. Knize 2013-04-07  388  	if (err >= 0 || err == -EIOCBQUEUED)
f38c4149df1364f Russ W. Knize 2013-04-07  389  		fsstack_copy_attr_atime(file->f_path.dentry->d_inode,
f38c4149df1364f Russ W. Knize 2013-04-07  390  					file_inode(lower_file));
f38c4149df1364f Russ W. Knize 2013-04-07  391  out:
f38c4149df1364f Russ W. Knize 2013-04-07  392  	return err;
f38c4149df1364f Russ W. Knize 2013-04-07  393  }
f38c4149df1364f Russ W. Knize 2013-04-07  394  
f38c4149df1364f Russ W. Knize 2013-04-07  395  /*
f38c4149df1364f Russ W. Knize 2013-04-07  396   * Wrapfs write_iter, redirect modified iocb to lower write_iter
f38c4149df1364f Russ W. Knize 2013-04-07  397   */
f38c4149df1364f Russ W. Knize 2013-04-07  398  ssize_t
f38c4149df1364f Russ W. Knize 2013-04-07 @399  esdfs_write_iter(struct kiocb *iocb, struct iov_iter *iter)
f38c4149df1364f Russ W. Knize 2013-04-07  400  {
f38c4149df1364f Russ W. Knize 2013-04-07  401  	int err;
f38c4149df1364f Russ W. Knize 2013-04-07  402  	struct file *file = iocb->ki_filp, *lower_file;
f38c4149df1364f Russ W. Knize 2013-04-07  403  
f38c4149df1364f Russ W. Knize 2013-04-07  404  	lower_file = esdfs_lower_file(file);
f38c4149df1364f Russ W. Knize 2013-04-07  405  	if (!lower_file->f_op->write_iter) {
f38c4149df1364f Russ W. Knize 2013-04-07  406  		err = -EINVAL;
f38c4149df1364f Russ W. Knize 2013-04-07  407  		goto out;
f38c4149df1364f Russ W. Knize 2013-04-07  408  	}
f38c4149df1364f Russ W. Knize 2013-04-07  409  
f38c4149df1364f Russ W. Knize 2013-04-07  410  	get_file(lower_file); /* prevent lower_file from being released */
f38c4149df1364f Russ W. Knize 2013-04-07  411  	iocb->ki_filp = lower_file;
f38c4149df1364f Russ W. Knize 2013-04-07  412  	err = lower_file->f_op->write_iter(iocb, iter);
f38c4149df1364f Russ W. Knize 2013-04-07  413  	iocb->ki_filp = file;
f38c4149df1364f Russ W. Knize 2013-04-07  414  	fput(lower_file);
f38c4149df1364f Russ W. Knize 2013-04-07  415  	/* update upper inode times/sizes as needed */
f38c4149df1364f Russ W. Knize 2013-04-07  416  	if (err >= 0 || err == -EIOCBQUEUED) {
f38c4149df1364f Russ W. Knize 2013-04-07  417  		fsstack_copy_inode_size(file->f_path.dentry->d_inode,
f38c4149df1364f Russ W. Knize 2013-04-07  418  					file_inode(lower_file));
f38c4149df1364f Russ W. Knize 2013-04-07  419  		fsstack_copy_attr_times(file->f_path.dentry->d_inode,
f38c4149df1364f Russ W. Knize 2013-04-07  420  					file_inode(lower_file));
f38c4149df1364f Russ W. Knize 2013-04-07  421  	}
f38c4149df1364f Russ W. Knize 2013-04-07  422  out:
f38c4149df1364f Russ W. Knize 2013-04-07  423  	return err;
f38c4149df1364f Russ W. Knize 2013-04-07  424  }
f38c4149df1364f Russ W. Knize 2013-04-07  425  

:::::: The code at line 371 was first introduced by commit
:::::: f38c4149df1364f9c37a8f75d960fb9fff0864a2 CHROMIUM: fs: Import esdfs code

:::::: TO: Russ W. Knize <Russ.Knize@motorola.com>
:::::: CC: chrome-bot <chrome-bot@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
