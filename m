Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905B7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 03:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686627870; x=1718163870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQMXzxCZR6vFzwj2mw50ufr3paDs/2hP07kJfbFO7N8=;
  b=UDpXdXYuuE9hdpY9UHrBTdORQinSmMkxTOwMCjbN1G8oyE98TI/ltTy7
   Kfda5pDCnqQObRR1IlITNjepMVDo79HcH/w30Rz7dPkx5FbTiIx1dtgEV
   FFPcAP2BfktJ2YISFcSg5YoGo86I3qF/8YmAE+geXt965AJMTarXOX5S8
   yxmARy6M0oHNEZQepa+hvapC+RFL3445uoAemD0iHi1wgNfZcaGoN19w6
   712C/yeDZoxyrJX+e4mydp76+Q1t/APdrnKwVRE/ocdA8KmeD7V+tc+nY
   4hFO9MW/+6DYAWcHva/IBPsBXy3VJkGkoiN3i/ovf3VVsET7mWtnEq42v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="342911052"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="342911052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 20:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="705637368"
X-IronPort-AV: E=Sophos;i="6.00,238,1681196400"; 
   d="scan'208";a="705637368"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Jun 2023 20:44:28 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8uxH-0000zQ-2X;
	Tue, 13 Jun 2023 03:44:27 +0000
Date: Tue, 13 Jun 2023 11:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Jan Kara <jack@suse.cz>, Dave Chinner <dchinner@redhat.com>
Subject: [axboe-block:for-6.5/block 79/171] xtensa-linux-ld: section
 .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data
 VMA [00000000,0008e777]
Message-ID: <202306131125.aYE2LEml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block
head:   4f1731df60f9033669f024d06ae26a6301260b55
commit: 74e6464a987b2572771ac19163e961777fd0252e [79/171] block: turn bdev_lock into a mutex
config: xtensa-buildonly-randconfig-r005-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131125.aYE2LEml-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=74e6464a987b2572771ac19163e961777fd0252e
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.5/block
        git checkout 74e6464a987b2572771ac19163e961777fd0252e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131125.aYE2LEml-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [00000180,00000193] overlaps section .data VMA [00000000,0008e777]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
