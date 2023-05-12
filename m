Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC7063C6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 07:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683876343; x=1715412343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uY11EgciZ4z61iEWEUaOU1J/ebTTPHbl2HHWof8//rs=;
  b=faoIauVV5aKO+MOaCKR/pDoEojUklbMlM5zZYOn70IRhMKnGl+b+PSSf
   OUe8ThIbY44CkeQ8++BOm+A0Ut4xCKFClrTtbskIYTMCvorZmZaH9FjyV
   mSbPwcp05uZsFFtAuIhFo5lbvv4uF/mkpnftG0p90JDhv2dUJ7r1dtKkN
   ljrxhlq6R5GwUPH0fZ60VYT8h+3yY8xByKh1QulKkyxN7U7hQTDdw6JSo
   QQDwl5TYPcKJUSznaRb3p2y+bbzgLgnDxNX/0e2nIhz5CI5oZTL4KdDOF
   ad9OC1VmABxb4F1UZA/Lo9LcNZJOdkqRwWhS17Zwqii5VJ0Qw1SW9dxH6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353857333"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353857333"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 00:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="650540180"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="650540180"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 May 2023 00:25:41 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxN9o-0004da-1D;
	Fri, 12 May 2023 07:25:40 +0000
Date: Fri, 12 May 2023 15:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 414/436] riscv64-linux-ld:
 clk-mt8192.c:undefined reference to `mtk_clk_register_pllfhs'
Message-ID: <202305121509.mM0P7y1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   101c17a196db9c062b3a17541bba4585f6e5681f
commit: c9375b7b7166d355b8e42aa6f7345498c10e6ff7 [414/436] UPSTREAM: clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
config: riscv-randconfig-r003-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121509.mM0P7y1i-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout c9375b7b7166d355b8e42aa6f7345498c10e6ff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121509.mM0P7y1i-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/clk/mediatek/clk-mt8192.o: in function `clk_mt8192_apmixed_probe':
   clk-mt8192.c:(.text+0x10a): undefined reference to `fhctl_parse_dt'
>> riscv64-linux-ld: clk-mt8192.c:(.text+0x122): undefined reference to `mtk_clk_register_pllfhs'
>> riscv64-linux-ld: clk-mt8192.c:(.text+0x16e): undefined reference to `mtk_clk_unregister_pllfhs'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
