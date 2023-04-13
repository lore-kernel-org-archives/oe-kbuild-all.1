Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B95C361
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Apr 2023 00:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681347576; x=1712883576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xzBJZwGJT0V2v4gMI4Ir7aLJQ//s/fLmiy9Vi1z23Ds=;
  b=HY5LXynuuMdBlIgpPhmlTh+eCzNRZswqfyeYn1IJ496irj7MQCJEv2Us
   fRLWgYrmsBILbBbdJpkv9vVeFLGKG6Z+8E9Q7JzMMBv3vLwTAaeIbBdD8
   PZUtcJ38yJ0Rx4vkAzwQNC1W4h2SmRkJToGfyTNucieMfvs7aIwvnkrml
   mICwPYHXgGup4yxFZM9YEusz/x4Zly510SbaKfI4eM0sgOshUh+ZDOmAo
   qxfqRyIcjbl0TO3NhUWVPUNzm/+LjCWxUa5b8WExr8/uVeW6l+25Z0+Ze
   4jJ0DG2yPNSbwLAsPpbMd/i9nESSwKWcRC+1Z7RKT8g2nSIOi5yd9iFD/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406893497"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="406893497"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 17:59:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813188126"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813188126"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 17:59:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmlJA-000YBd-27;
	Thu, 13 Apr 2023 00:59:28 +0000
Date: Thu, 13 Apr 2023 08:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:epoll-min_ts.2 10/10] or1k-linux-ld:
 arch/openrisc/kernel/sys_call_table.o:undefined reference to
 `sys_epoll_pwait3'
Message-ID: <202304130824.2l7O3wqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git epoll-min_ts.2
head:   b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
commit: b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b [10/10] eventpoll: wire up epoll_pwait3() syscall
config: openrisc-randconfig-s031-20230409 (https://download.01.org/0day-ci/archive/20230413/202304130824.2l7O3wqk-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block epoll-min_ts.2
        git checkout b9cf9474f08ccfc0d8b4afad26ba2ca82e64a67b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130824.2l7O3wqk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> or1k-linux-ld: arch/openrisc/kernel/sys_call_table.o:(.data+0x70c): undefined reference to `sys_epoll_pwait3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
