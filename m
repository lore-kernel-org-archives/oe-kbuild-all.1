Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A958B33C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676045383; x=1707581383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqcHK/MJ23Bbo4ovVxX/BhGh8ChLLW7FZEM9kMQIpQM=;
  b=UBJYUXD4bhQw22J7y5jCe8gttcQQYXhDHyjXnGfZwlGDZOiAW/7vPnVE
   ZZbGO+nfFr60a5NAwUzxbg4LeBDa7xAb+F08d+QHBg3g1PQEcWX5aI9Kk
   US7juP9V+VCLAXsDIYlBcFjGYkLmC3QA+xbtZNtiHXfzsqcufNjHL6MwM
   gw2vOVvYNIhSkQUoGA/T2A2ZeAVXXg97LJJCOZ9FBU5qPTMutuWPIBvQF
   tXoVI82swRP92uYIFrJcNkGoh48ZPriZS8fcjO0QTQQwDHlGS1ru60aJx
   S++zpX0RSzcs15uZmKGQQQhJ12vAphQGck6O8hnmYCRpKtVq6LOnWr0zN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="328142969"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="328142969"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 08:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="913573636"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="913573636"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2023 08:09:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQVxz-0005tB-0x;
	Fri, 10 Feb 2023 16:09:39 +0000
Date: Sat, 11 Feb 2023 00:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 17137/21442] ld.lld: error:
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.o:(.riscv.attributes):
 rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302110048.QIFn62Uj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rahul,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: de3c3af242ae34519098deef095637cf138eb509 [17137/21442] drm/bridge: cdns-dsi: Add support for J721E wrapper
config: riscv-randconfig-r042-20230209 (https://download.01.org/0day-ci/archive/20230211/202302110048.QIFn62Uj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout de3c3af242ae34519098deef095637cf138eb509
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110048.QIFn62Uj-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/bridge/cadence/cdns-dsi-core.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
