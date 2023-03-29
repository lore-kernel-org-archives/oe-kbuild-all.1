Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D11F63D2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 17:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680112605; x=1711648605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pp/Qh95knNkBXt8Xc7q+8K6Ouqiay7lo9hsjnRe8M6Y=;
  b=ncGsknBpxj5VJjcpPvGX6CUMHfnBR4wGAY6txSJBV0aG6SFEIrhUVffw
   cHid0nLevG+VjLwWFDGGzCqHu+vcEgR46NhnM68Am+EpPqjYOrgHf4mom
   iPUV6JX3e73R3H64Xa8/C/yeXmxtyQbPSLuyecSH+IXIDjvmQ1U/neWYT
   AQtizXajYL+Yux0coTzSxm9kznaCTOf/+sEvtc04fSFUB601l2QHSDm3q
   9qneQ/p8MK7RnXGbcNxoZkGHwcSKtKwUccCqm7hctU1DfLsishRofJDHh
   pyzt9FDAzrZaxPwhTVBjFbJf3f1ruSL2p+xLvvEIe2PHP4tAdbtSbdDfr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405905034"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="405905034"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 10:55:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="930419424"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="930419424"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Mar 2023 10:55:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pha0m-000Jmg-1k;
	Wed, 29 Mar 2023 17:55:04 +0000
Date: Thu, 30 Mar 2023 01:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arm-linux-gnueabi-ld: error: .btf.vmlinux.bin.o is already in final
 BE8 format
Message-ID: <202303300146.J8Lk7uAS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fcd476ea6a888ef6e6627f4c21a2ea8cca3e9312
commit: 5d6f52671e76ca2d55d74e676ac4c38ceb14a2d3 ARM: rework endianess selection
date:   12 months ago
config: arm-randconfig-r023-20230329 (https://download.01.org/0day-ci/archive/20230330/202303300146.J8Lk7uAS-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5d6f52671e76ca2d55d74e676ac4c38ceb14a2d3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 5d6f52671e76ca2d55d74e676ac4c38ceb14a2d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300146.J8Lk7uAS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .btf.vmlinux.bin.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .btf.vmlinux.bin.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
