Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6E923B4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675589129; x=1707125129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmulOLNHUcYGP9UTm02efcW45j3gLJmDYUkIRiiotMQ=;
  b=Ssd5JygHCn7Zw+TpVswffk4qYueBtCZYvxiSWSy23JjovnOKbVcJpHnu
   +/PtdbW8a2mbph0fBU2GHT2ixjtOT20QkaUNpamlGwTesITTw4643NqRS
   aQEiQ0/QsjKPCEetF8yoort9JFvYTr5EZ/eNBq5ITcqnhxMaFXKtvQFD5
   ZcXpJp7xxqtrMv+ZlpOKjEzbX7vtFOsd7gb9lfWDRbSpgFBK0VpYa3a/H
   Vh/x4afEegGo6urfm9QyAd2FUh/vY+1KwJN7+LbFKbihsIgyLaq6RHYw4
   wQYLUL/sQN45mrOcne7UIuN3e4PgpXFwM+ffCw8XkcmtApw+s0wd8U7kc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="329044776"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="329044776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 01:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698556186"
X-IronPort-AV: E=Sophos;i="5.97,274,1669104000"; 
   d="scan'208";a="698556186"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 01:25:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pObGt-0001uC-0a;
	Sun, 05 Feb 2023 09:25:15 +0000
Date: Sun, 5 Feb 2023 17:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 615/20208]
 drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: unused variable
 'imx_blk_ctrl_of_match'
Message-ID: <202302051735.1ojxNw21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 75921c395c22cf9a3d9ff9af0e9962fc2b62105a [615/20208] clk: imx: Add blk_ctrl combo driver
config: mips-buildonly-randconfig-r006-20230205 (https://download.01.org/0day-ci/archive/20230205/202302051735.1ojxNw21-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/75921c395c22cf9a3d9ff9af0e9962fc2b62105a
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 75921c395c22cf9a3d9ff9af0e9962fc2b62105a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/ar7/ drivers/clk/imx/ drivers/irqchip/ drivers/mailbox/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/clk/imx/clk-blk-ctrl.c:284:12: warning: unused function 'imx_blk_ctrl_runtime_suspend' [-Wunused-function]
   static int imx_blk_ctrl_runtime_suspend(struct device *dev)
              ^
   drivers/clk/imx/clk-blk-ctrl.c:291:12: warning: unused function 'imx_blk_ctrl_runtime_resume' [-Wunused-function]
   static int imx_blk_ctrl_runtime_resume(struct device *dev)
              ^
>> drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: unused variable 'imx_blk_ctrl_of_match' [-Wunused-const-variable]
   static const struct of_device_id imx_blk_ctrl_of_match[] = {
                                    ^
   3 warnings generated.


vim +/imx_blk_ctrl_of_match +305 drivers/clk/imx/clk-blk-ctrl.c

   304	
 > 305	static const struct of_device_id imx_blk_ctrl_of_match[] = {
   306	       { /* Sentinel */ }
   307	};
   308	MODULE_DEVICE_TABLE(of, imx_blk_ctrl_of_match);
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
