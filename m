Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A13C261
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678383217; x=1709919217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dJL65IUqe3tqNBkaylXwZXTwco+zRkXD3nepcU72Wc=;
  b=jqVVFyOtYqvCcSHYxRmrMR6rGHEzUpUiAVNGqyT8lnPcE07sE+kQnXYq
   OK+cIBTOH1QQr1paZlgMEs0/qOUjSsZbQUKZwDh7cQ3xGILZUV1PI7z1Z
   w0k1Qet8JWKS5smMCwD1Bog4Zod2edFnEyDblBnWCOpUhF6JiEjmdF3qR
   llSoJAf4PlDsWIAz2Bkkq5tIdKLLxyO3vI95fuX9SMnZ66VLmV6IRW9gf
   /oDa8kxyi3W47uVcJ/sJ0TjCz+piOp7c7dZNroBJbVP+ERH3IVuJ5faJz
   51xI8olk8hByFbeZzZlQAbFoPHsB34Axtbxsy6MT5mQ7JbGV6261f4vfD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="399104343"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="399104343"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 09:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923341626"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="923341626"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Mar 2023 09:33:35 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paK91-00037L-0J;
	Thu, 09 Mar 2023 17:33:35 +0000
Date: Fri, 10 Mar 2023 01:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 661/694]
 drivers/parport/parport_pc.c:85:23: warning: initialization of 'void
 (*)(struct pci_dev *, int)' from 'int' makes pointer from integer without a
 cast
Message-ID: <202303100100.cSwXsho5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   fa900f3355c2fc70beaacc2dfd07ebb8c127d230
commit: b43aa0aacaf8fd33bdec52b403c5e763de31b9d3 [661/694] parport_pc: Set up mode and ECR masks for Oxford Semiconductor devices
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230310/202303100100.cSwXsho5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=b43aa0aacaf8fd33bdec52b403c5e763de31b9d3
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout b43aa0aacaf8fd33bdec52b403c5e763de31b9d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/parport/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100100.cSwXsho5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/parport.h:18,
                    from drivers/parport/parport_pc.c:65:
>> include/uapi/linux/parport.h:60:33: warning: initialization of 'int (*)(struct pci_dev *, int,  int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2665:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2665 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:33: note: (near initialization for 'cards[19].preinit_hook')
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2665:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2665 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:85:23: warning: initialization of 'void (*)(struct pci_dev *, int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2665:64: note: in expansion of macro 'ECR_MODE_MASK'
    2665 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:85:23: note: (near initialization for 'cards[19].postinit_hook')
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2665:64: note: in expansion of macro 'ECR_MODE_MASK'
    2665 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
   include/uapi/linux/parport.h:59:33: warning: initialization of 'int (*)(struct pci_dev *, int,  int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      59 | #define PARPORT_MODE_ECP        (1<<3) /* Hardware ECP. */
         |                                 ^
   drivers/parport/parport_pc.c:2667:43: note: in expansion of macro 'PARPORT_MODE_ECP'
    2667 |                                           PARPORT_MODE_ECP |
         |                                           ^~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:59:33: note: (near initialization for 'cards[20].preinit_hook')
      59 | #define PARPORT_MODE_ECP        (1<<3) /* Hardware ECP. */
         |                                 ^
   drivers/parport/parport_pc.c:2667:43: note: in expansion of macro 'PARPORT_MODE_ECP'
    2667 |                                           PARPORT_MODE_ECP |
         |                                           ^~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:85:23: warning: initialization of 'void (*)(struct pci_dev *, int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2668:64: note: in expansion of macro 'ECR_MODE_MASK'
    2668 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:85:23: note: (near initialization for 'cards[20].postinit_hook')
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2668:64: note: in expansion of macro 'ECR_MODE_MASK'
    2668 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
>> include/uapi/linux/parport.h:60:33: warning: initialization of 'int (*)(struct pci_dev *, int,  int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2670:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2670 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:33: note: (near initialization for 'cards[21].preinit_hook')
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2670:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2670 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:85:23: warning: initialization of 'void (*)(struct pci_dev *, int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2670:64: note: in expansion of macro 'ECR_MODE_MASK'
    2670 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:85:23: note: (near initialization for 'cards[21].postinit_hook')
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2670:64: note: in expansion of macro 'ECR_MODE_MASK'
    2670 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
>> include/uapi/linux/parport.h:60:33: warning: initialization of 'int (*)(struct pci_dev *, int,  int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2672:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2672 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
   include/uapi/linux/parport.h:60:33: note: (near initialization for 'cards[22].preinit_hook')
      60 | #define PARPORT_MODE_COMPAT     (1<<4) /* Hardware 'printer protocol'. */
         |                                 ^
   drivers/parport/parport_pc.c:2672:43: note: in expansion of macro 'PARPORT_MODE_COMPAT'
    2672 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                           ^~~~~~~~~~~~~~~~~~~
>> drivers/parport/parport_pc.c:85:23: warning: initialization of 'void (*)(struct pci_dev *, int)' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2672:64: note: in expansion of macro 'ECR_MODE_MASK'
    2672 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~
   drivers/parport/parport_pc.c:85:23: note: (near initialization for 'cards[22].postinit_hook')
      85 | #define ECR_MODE_MASK 0xe0
         |                       ^~~~
   drivers/parport/parport_pc.c:2672:64: note: in expansion of macro 'ECR_MODE_MASK'
    2672 |                                           PARPORT_MODE_COMPAT, ECR_MODE_MASK },
         |                                                                ^~~~~~~~~~~~~


vim +85 drivers/parport/parport_pc.c

7fbacd5213a03b Al Viro        2005-05-04  75  
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  /* ECR modes */
^1da177e4c3f41 Linus Torvalds 2005-04-16  77  #define ECR_SPP 00
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  #define ECR_PS2 01
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  #define ECR_PPF 02
^1da177e4c3f41 Linus Torvalds 2005-04-16  80  #define ECR_ECP 03
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  #define ECR_EPP 04
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  #define ECR_VND 05
^1da177e4c3f41 Linus Torvalds 2005-04-16  83  #define ECR_TST 06
^1da177e4c3f41 Linus Torvalds 2005-04-16  84  #define ECR_CNF 07
^1da177e4c3f41 Linus Torvalds 2005-04-16 @85  #define ECR_MODE_MASK 0xe0
^1da177e4c3f41 Linus Torvalds 2005-04-16  86  #define ECR_WRITE(p, v) frob_econtrol((p), 0xff, (v))
^1da177e4c3f41 Linus Torvalds 2005-04-16  87  

:::::: The code at line 85 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
