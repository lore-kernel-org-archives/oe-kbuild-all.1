Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE17C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 May 2023 04:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683172849; x=1714708849;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Itm0iABBHwodBsXYeo2FBblKRR35uNsH7x4E97NlssA=;
  b=gWX/8uWUGuEhbGuKUJF8+EqP+XXZ2BEyrNhQRjGrECME2alHhrqq2pMt
   AcXpZUKzGjGTaYDa/HYncvYPV0rJfi1wIothEcdq4rpy6vUKuxPF+V9H5
   NrT5v/NFMs/HwBcFQZvjyav07yFHHRHKNijH4DTAfANKqBflYvxRjftl0
   op4g6yEnidS+lS25CJpnwDx0W1dA7T+MN/fhmzttWI8dJlqiATRJMQl0o
   h4roi4ZupJ2PGwMTQVg7HaVSiYyUg1cFpEhNe35tlYfP483UTgVhCltVB
   PX14v+Vf1KQLxxqCFJIuHgtzEvCaGr5J4BO5zHT9rNR+a/gu89p5stz8O
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="328447003"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="328447003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2023 21:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10699"; a="871203658"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="871203658"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2023 21:00:47 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puQ98-0002Xg-0t;
	Thu, 04 May 2023 04:00:46 +0000
Date: Thu, 4 May 2023 12:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 08/16] block: Add support for atomic_write_unit
Message-ID: <202305041154.p1mq8hBE-lkp@intel.com>
References: <20230503183821.1473305-9-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503183821.1473305-9-john.g.garry@oracle.com>

Hi John,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xfs-linux/for-next]
[also build test ERROR on axboe-block/for-next mkp-scsi/for-next jejb-scsi/for-next v6.3]
[cannot apply to linus/master next-20230428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20230503183821.1473305-9-john.g.garry%40oracle.com
patch subject: [PATCH RFC 08/16] block: Add support for atomic_write_unit
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230504/202305041154.p1mq8hBE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d329c33e88eb0858b44571f95637067db4d352aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/block-Add-atomic-write-operations-to-request_queue-limits/20230504-041447
        git checkout d329c33e88eb0858b44571f95637067db4d352aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305041154.p1mq8hBE-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv32-linux-ld: block/bdev.o: in function `.L362':
   bdev.c:(.text+0xe5c): undefined reference to `__moddi3'
   riscv32-linux-ld: block/blk-merge.o: in function `.L61':
>> blk-merge.c:(.text+0x3b6): undefined reference to `__moddi3'
>> riscv32-linux-ld: blk-merge.c:(.text+0x3f2): undefined reference to `__moddi3'
   riscv32-linux-ld: block/blk-merge.o: in function `.L73':
   blk-merge.c:(.text+0x4b2): undefined reference to `__moddi3'
   riscv32-linux-ld: block/blk-merge.o: in function `.L96':
   blk-merge.c:(.text+0x5d4): undefined reference to `__moddi3'
   riscv32-linux-ld: block/blk-merge.o:blk-merge.c:(.text+0x608): more undefined references to `__moddi3' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
