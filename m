Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BFBD535
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675623629; x=1707159629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2CV2/uITMEZkKafiWjs7HEwTHQbf/CGaIim/h8OFVBs=;
  b=A8ljt2BJPuRy1YA/Ule3VbSEWQ/XtguQjlKn6ijCAnpp9Ua9d558IsYw
   sZTOYtljinXZoKgUnlNLbgZnVJgP63iIARt8dHN6bnlgdHBHU+UE255Vc
   LeKXgDd40Z/LedC+N8AM1vBJBcnYFRN8y3reJe7OJUIRJ8/lNA1Msgv7v
   EWdqkdwwvr99PZeHVmz4o/kO4V2cMILOUKkPv99iWd/3ZXYkA4zHWuuX5
   NMJ/HnnQcSYKk2X/AN9X6eguvOnRO401ABNx76/hSjsagf1CL/NjXT0Ob
   qe27kUFWs4uJVOIY7bf9P0TiUoRyGU7tu8bzutiD4msALfZnIYcLxrfVI
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="312731817"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="312731817"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 11:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="659644216"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="659644216"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Feb 2023 11:00:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOkFX-0002A4-01;
	Sun, 05 Feb 2023 19:00:27 +0000
Date: Mon, 6 Feb 2023 03:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 13999/20208]
 drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable
 'imx93_clk_of_match'
Message-ID: <202302060221.F7bPXcwe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peng,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 4d99e4233d3a955ae9de56c0d83d778b4ab7e399 [13999/20208] clk: imx: add i.MX93 clk
config: mips-buildonly-randconfig-r006-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060221.F7bPXcwe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/4d99e4233d3a955ae9de56c0d83d778b4ab7e399
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 4d99e4233d3a955ae9de56c0d83d778b4ab7e399
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/clk/imx/ drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-imx93.c:324:34: warning: unused variable 'imx93_clk_of_match' [-Wunused-const-variable]
   static const struct of_device_id imx93_clk_of_match[] = {
                                    ^
   1 warning generated.


vim +/imx93_clk_of_match +324 drivers/clk/imx/clk-imx93.c

   323	
 > 324	static const struct of_device_id imx93_clk_of_match[] = {
   325		{ .compatible = "fsl,imx93-ccm" },
   326		{ /* Sentinel */ },
   327	};
   328	MODULE_DEVICE_TABLE(of, imx93_clk_of_match);
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
