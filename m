Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2887C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 16:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681491041; x=1713027041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEOrkdoBWkTZ4l0bBeMOKcQl5RLOFo8JWp2Wh3I1f2A=;
  b=KNNpY5k1Ofu9iTDlBKt5h8JH12OEELn6wkwEBIVZrZCu/GZZRFzXEGha
   Z2lpzPa1zTvmg7x6aMc6YfMfbwP1T3f7dWWQ2yhSrXD04Hc3UW8gqQHIx
   AB9X0dhHHV/4PUZE/bNgjXqvm2ndLeafvUleDNL9o8ZTehsmR+XZWJ+P7
   gBiCcRFq+Xm/C/8haAocarCghu8EkxGLJP1V0dL1G3jnjSM+OZ4fTo4dg
   CdqILviVLImbgEfNB3kQZoCy0LEdEPa3TTL0zTsq3HidBRACjCTEXXSUJ
   61Pc9HQQsuQok47yVbWkqqLCvzJE6pCUlBIBdw1Zpqu9WZ59jXNt9SdCA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="430800654"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="430800654"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 09:50:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="864266250"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="864266250"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2023 09:50:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnMdC-000ZjJ-1z;
	Fri, 14 Apr 2023 16:50:38 +0000
Date: Sat, 15 Apr 2023 00:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.4/block 72/77] fault-inject.c:undefined reference
 to `config_group_init_type_name'
Message-ID: <202304150025.K0hczLR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.4/block
head:   d0b072f4b48953ed56b5a9069ce4bfbfe987e390
commit: 4668c7a2940d134bea50058e138591b97485c5da [72/77] fault-inject: allow configuration via configfs
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20230415/202304150025.K0hczLR4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=4668c7a2940d134bea50058e138591b97485c5da
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.4/block
        git checkout 4668c7a2940d134bea50058e138591b97485c5da
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150025.K0hczLR4-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: lib/fault-inject.o: in function `fault_config_init':
>> fault-inject.c:(.text+0x20e): undefined reference to `config_group_init_type_name'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
