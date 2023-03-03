Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0D538C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 11:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677844515; x=1709380515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J5WxTbMkEpRarF5xyFkdJLqLgkMLUPzS6Esp6GW002Q=;
  b=iiSnKWp95P9XU2LUNsDclBpiPu248R8EaQjrVrfaOg9XWT5ArTePSZUO
   i8lt3rzSdVfZfCdBzbJGNSwmR+XfYfDciQMgC55bJXqr1ldUDcX+E1qQ0
   8XW4Or4HItfZxhSIEHKI9irTTWFFtfK12OJlNh4CSvnkZw2pu0pfJky8N
   qAh6PsjDwk88TEmr7okyRUH7+CDgWH//8RsHGO8Ih0J/5cdKlMa2sphIw
   DxejJpYaPtXAiFR2J14e03lu077LPNoDPN2lL0u3UcG4c3GQHbeihCuto
   J0IiriOsx1k7eqa+ezEp2zZyfa/dAz+lQOYLWwx4hpJQez7WgTw5ly7aS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399832824"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="399832824"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2023 03:55:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="739482540"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; 
   d="scan'208";a="739482540"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 03 Mar 2023 03:55:13 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pY40H-0001Qa-0d;
	Fri, 03 Mar 2023 11:55:13 +0000
Date: Fri, 3 Mar 2023 19:54:45 +0800
From: kernel test robot <lkp@intel.com>
To: Coly Li <colyli@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [colyli-bcache:nvdimm-meta 16/16] drivers/md/bcache/alloc.c:488:9:
 warning: argument 1 null where non-null expected
Message-ID: <202303031931.Asa9BSzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git nvdimm-meta
head:   7ae909b6dcf328bd8757e42861dcbadc29cca872
commit: 7ae909b6dcf328bd8757e42861dcbadc29cca872 [16/16] bcache: support storing bcache btree nodes into NVDIMM meta device
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230303/202303031931.Asa9BSzE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git/commit/?id=7ae909b6dcf328bd8757e42861dcbadc29cca872
        git remote add colyli-bcache https://git.kernel.org/pub/scm/linux/kernel/git/colyli/linux-bcache.git
        git fetch --no-tags colyli-bcache nvdimm-meta
        git checkout 7ae909b6dcf328bd8757e42861dcbadc29cca872
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031931.Asa9BSzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/bcache/nvmpg.h:8,
                    from drivers/md/bcache/alloc.c:66:
   drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic' defined but not used [-Wunused-const-variable=]
     132 | static const __u8 bch_nvmpg_recs_magic[] = {
         |                   ^~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/nvmpg_format.h:129:19: warning: 'bch_nvmpg_magic' defined but not used [-Wunused-const-variable=]
     129 | static const __u8 bch_nvmpg_magic[] = {
         |                   ^~~~~~~~~~~~~~~
   In function '__bch_nvmpg_bucket_free',
       inlined from 'bch_bucket_free' at drivers/md/bcache/alloc.c:497:3:
>> drivers/md/bcache/alloc.c:488:9: warning: argument 1 null where non-null expected [-Wnonnull]
     488 |         memset(bch_nvmpg_offset_to_ptr(nvmpg_offset), 0, 1<<order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:20,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:13,
                    from arch/parisc/include/asm/hardware.h:5,
                    from arch/parisc/include/asm/processor.h:17,
                    from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/bcache/bcache.h:181,
                    from drivers/md/bcache/alloc.c:64:
   arch/parisc/include/asm/string.h: In function 'bch_bucket_free':
   arch/parisc/include/asm/string.h:6:15: note: in a call to function 'memset' declared 'nonnull'
       6 | extern void * memset(void *, int, size_t);
         |               ^~~~~~
--
   In file included from drivers/md/bcache/nvmpg.h:8,
                    from drivers/md/bcache/btree.c:29:
   drivers/md/bcache/nvmpg_format.h:132:19: warning: 'bch_nvmpg_recs_magic' defined but not used [-Wunused-const-variable=]
     132 | static const __u8 bch_nvmpg_recs_magic[] = {
         |                   ^~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/nvmpg_format.h:129:19: warning: 'bch_nvmpg_magic' defined but not used [-Wunused-const-variable=]
     129 | static const __u8 bch_nvmpg_magic[] = {
         |                   ^~~~~~~~~~~~~~~
   In function '__bch_nvmpg_btree_node_read',
       inlined from 'bch_btree_node_read' at drivers/md/bcache/btree.c:311:3:
>> drivers/md/bcache/btree.c:298:9: warning: argument 2 null where non-null expected [-Wnonnull]
     298 |         memcpy(b->keys.set[0].data, ptr, KEY_SIZE(&b->key) << 9);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:20,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:13,
                    from arch/parisc/include/asm/hardware.h:5,
                    from arch/parisc/include/asm/processor.h:17,
                    from arch/parisc/include/asm/spinlock.h:7,
                    from arch/parisc/include/asm/atomic.h:22,
                    from include/linux/atomic.h:7,
                    from arch/parisc/include/asm/bitops.h:13,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from arch/parisc/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/parisc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/mempool.h:8,
                    from include/linux/bio.h:8,
                    from drivers/md/bcache/bcache.h:181,
                    from drivers/md/bcache/btree.c:24:
   arch/parisc/include/asm/string.h: In function 'bch_btree_node_read':
   arch/parisc/include/asm/string.h:9:8: note: in a call to function 'memcpy' declared 'nonnull'
       9 | void * memcpy(void * dest,const void *src,size_t count);
         |        ^~~~~~


vim +488 drivers/md/bcache/alloc.c

   480	
   481	static void __bch_nvmpg_bucket_free(struct cache_set *c, struct bkey *k)
   482	{
   483		int order;
   484		unsigned long nvmpg_offset;
   485	
   486		order = ilog2(c->cache->sb.bucket_size / PAGE_SECTORS);
   487		nvmpg_offset = bkey_offset_to_nvmpg_offset(PTR_OFFSET(k, 0));
 > 488		memset(bch_nvmpg_offset_to_ptr(nvmpg_offset), 0, 1<<order);
   489		bch_nvmpg_free_pages(nvmpg_offset, order, c->set_uuid);
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
