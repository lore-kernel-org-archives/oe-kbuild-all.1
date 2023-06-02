Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C6107B1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 10:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685703516; x=1717239516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lnKOLywcWUR2VD38gxemPR130n0+UufTBdjahzx28M4=;
  b=ek1ztcqvgeWMijeHqyJ1xbdnCTmIEx02PJnEu3/RFiJZjHWu7qq7PQxD
   rb7cEzR1S8O6ddp2fKjIXpSsMIhWMDNmIvGLfvm+4Wk3BMTbW1FROC/QU
   KkiqeQ4hC1Mw3WSzh6um1VnPS4291d5iWRcjKRiGVujiOPXFnrbfT7HhZ
   fD7Z1TYHVwj5icYixwWzEH2QmzGYjoRtHOr2nDV0sfSu+LRqfcnmG9MjK
   t5PJ2rVdo3yeLbYUGQ3a+BpdJYS6QkL6i3wfChMxTy3QWhY827J6mAhKB
   c9Asr/OQhJgnXA33/jU2F0aEG6X29mk5w1XEg5mROMwj2GnpOfbxeE01r
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345421467"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="345421467"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 03:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="772865787"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="772865787"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 02 Jun 2023 03:58:25 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q52UD-0000MZ-0B;
	Fri, 02 Jun 2023 10:58:25 +0000
Date: Fri, 2 Jun 2023 18:58:15 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:raid-stripe-tree 21/31]
 ./usr/include/linux/btrfs_tree.h:728:9: error: unknown type name 'u8'
Message-ID: <202306021850.cHadr9at-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git raid-stripe-tree
head:   7f755507b2a1f921afadd2b041bc46829e2bda2b
commit: f495eb8d4ebbe88a04587f269313981704d8205e [21/31] btrfs: add raid stripe tree definitions
config: x86_64-randconfig-a002-20230531 (https://download.01.org/0day-ci/archive/20230602/202306021850.cHadr9at-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add hch-misc git://git.infradead.org/users/hch/misc.git
        git fetch --no-tags hch-misc raid-stripe-tree
        git checkout f495eb8d4ebbe88a04587f269313981704d8205e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021850.cHadr9at-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> ./usr/include/linux/btrfs_tree.h:728:9: error: unknown type name 'u8'
     728 |         u8 encoding;
         |         ^~
   ./usr/include/linux/btrfs_tree.h:729:9: error: unknown type name 'u8'
     729 |         u8 reserved[7];
         |         ^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
