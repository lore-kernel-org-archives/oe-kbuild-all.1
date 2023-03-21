Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF6AD2ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679420579; x=1710956579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGHEeYjJxghDx/sm7aLgQ4PBiEMIs5tOQyNOQsacX2I=;
  b=Up+WUU9iD2cA8V7d9BJQ1czK7COgeD/QakPChKZw8B9tLSFrBq9xNv/6
   MhbPIDGa1S+wY25UtjDhVbHyViaXuOrH8YS3PzhfYjxr96/M+M9o9E5e5
   7I/cLtxNOsl1Grp2NKIaVT/yJ9h55eVSyf6U3EQBJ+V9bBfpYRXtKWpZc
   XTXQf5Deo9TT7XWU3/hkpApNcHmiL81+jU9XQAOqP71Ct/cnxCDTK+jru
   +4q64k5NQxPqfFA8P9XHiSLG9v4S/38U3k5wvMj85OKB2N3BBIl68Qau3
   o0dbexSeNgJpM0JJ8BOejcvQiT3pJpflZtUcS+cIfp66Ns5qvNClkiSjA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340553581"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="340553581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 10:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="805503024"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400"; 
   d="scan'208";a="805503024"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Mar 2023 10:42:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peg0Q-000CDX-1r;
	Tue, 21 Mar 2023 17:42:42 +0000
Date: Wed, 22 Mar 2023 01:42:34 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:tls-netlink.v7 10/20]
 arch/m68k/include/asm/string.h:48:25: warning: 'memset' used with length
 equal to number of elements without multiplication by element size
Message-ID: <202303220114.LshhKV5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git tls-netlink.v7
head:   5c13b43fa2c503188a6d668b0dec6a22078329a2
commit: 31b3d10dcf4a28f931001df8b4e539716bcbd5d3 [10/20] nvme-tcp: enable TLS handshake upcall
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303220114.LshhKV5V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git/commit/?id=31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        git remote add hare-scsi-devel https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git
        git fetch --no-tags hare-scsi-devel tls-netlink.v7
        git checkout 31b3d10dcf4a28f931001df8b4e539716bcbd5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303220114.LshhKV5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:20,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/nvme/host/tcp.c:7:
   drivers/nvme/host/tcp.c: In function 'nvme_tcp_alloc_admin_queue':
>> arch/m68k/include/asm/string.h:48:25: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
      48 | #define memset(d, c, n) __builtin_memset(d, c, n)
         |                         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1897:9: note: in expansion of macro 'memset'
    1897 |         memset(keylist, 0, sizeof(key_serial_t));
         |         ^~~~~~
   drivers/nvme/host/tcp.c: In function '__nvme_tcp_alloc_io_queues':
>> arch/m68k/include/asm/string.h:48:25: warning: 'memset' used with length equal to number of elements without multiplication by element size [-Wmemset-elt-size]
      48 | #define memset(d, c, n) __builtin_memset(d, c, n)
         |                         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:1927:9: note: in expansion of macro 'memset'
    1927 |         memset(keylist, 0, sizeof(key_serial_t));
         |         ^~~~~~
   In file included from <command-line>:
   drivers/nvme/host/tcp.c: In function 'nvme_tcp_init_module':
   include/linux/compiler_types.h:397:45: error: call to '__compiletime_assert_726' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct nvme_tcp_term_pdu) != 24
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:378:25: note: in definition of macro '__compiletime_assert'
     378 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:397:9: note: in expansion of macro '_compiletime_assert'
     397 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/nvme/host/tcp.c:2860:9: note: in expansion of macro 'BUILD_BUG_ON'
    2860 |         BUILD_BUG_ON(sizeof(struct nvme_tcp_term_pdu) != 24);
         |         ^~~~~~~~~~~~


vim +/memset +48 arch/m68k/include/asm/string.h

ea61bc461d09e8d Greg Ungerer 2010-09-07  45  
ea61bc461d09e8d Greg Ungerer 2010-09-07  46  #define __HAVE_ARCH_MEMSET
ea61bc461d09e8d Greg Ungerer 2010-09-07  47  extern void *memset(void *, int, __kernel_size_t);
ea61bc461d09e8d Greg Ungerer 2010-09-07 @48  #define memset(d, c, n) __builtin_memset(d, c, n)
ea61bc461d09e8d Greg Ungerer 2010-09-07  49  

:::::: The code at line 48 was first introduced by commit
:::::: ea61bc461d09e8d331a307916530aaae808c72a2 m68k/m68knommu: merge MMU and non-MMU string.h

:::::: TO: Greg Ungerer <gerg@snapgear.com>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
