Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5581D37D01
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 22:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKSh+O33"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702765443; x=1734301443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3fnze1D+yr7EUoKE3BbC4bQQYXG4sWlr2OjdV5B+o4=;
  b=RKSh+O33UEhVMO+nV+Q5cfZDuGHV7GBzHu99HgnYqXsxOcnntlV9OVpV
   jMA4OJlcjXqaUgmvWha7oZIU4D4Qg49r50edtkCMDHxKc6dnTZM0LBlzL
   fzhinNh6gEe40Am9Q3hxDDVC80zv3wUJJ+ky9siB4UrLI8ok/uYVopePX
   mngEMPJd/hAYIIEaXUQxIo9bjs33TDnBZkH7F7TzcBCJtEOHSwrrqbp9+
   RhF25UvqzbueOQrrddV+W0GtlFSp8fEpESnOsIu1SjMASYv5lNdTzjwzf
   vCycqgUFNfVbiPNsMa89L0oFyV24drTtjzosc3e/4LcN+SOCkT6dR7+zf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="16947073"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="16947073"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="778662986"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="778662986"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2023 14:24:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEd4h-0002Gw-1h;
	Sat, 16 Dec 2023 22:23:59 +0000
Date: Sun, 17 Dec 2023 06:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 625/16025]
 drivers/clk/imx/clk-blk-ctrl.c:316:34: warning: unused variable
 'imx_blk_ctrl_of_match'
Message-ID: <202312170658.bJO182gF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Abel,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   241e2f51bd87beb652196d1db92f0387c1209bfb
commit: 982caa7f57b68424730d255dbb6424e7f5c5e904 [625/16025] clk: imx: Add imx_dev_clk_hw_gate_shared to be used by clk-blk-ctl
config: i386-buildonly-randconfig-001-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170658.bJO182gF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170658.bJO182gF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170658.bJO182gF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-blk-ctrl.c:316:34: warning: unused variable 'imx_blk_ctrl_of_match' [-Wunused-const-variable]
   static const struct of_device_id imx_blk_ctrl_of_match[] = {
                                    ^
   1 warning generated.


vim +/imx_blk_ctrl_of_match +316 drivers/clk/imx/clk-blk-ctrl.c

78668ad4d3771b Abel Vesa 2020-06-18  315  
78668ad4d3771b Abel Vesa 2020-06-18 @316  static const struct of_device_id imx_blk_ctrl_of_match[] = {
3be659c45c35d2 Abel Vesa 2020-06-18  317  	{
3be659c45c35d2 Abel Vesa 2020-06-18  318  		.compatible = "fsl,imx8mp-audio-blk-ctrl",
3be659c45c35d2 Abel Vesa 2020-06-18  319  		.data = &imx8mp_audio_blk_ctrl_dev_data
3be659c45c35d2 Abel Vesa 2020-06-18  320  	},
6d81fafcd3dba6 Abel Vesa 2020-06-18  321  	{
6d81fafcd3dba6 Abel Vesa 2020-06-18  322  		.compatible = "fsl,imx8mp-media-blk-ctrl",
6d81fafcd3dba6 Abel Vesa 2020-06-18  323  		.data = &imx8mp_media_blk_ctrl_dev_data
6d81fafcd3dba6 Abel Vesa 2020-06-18  324  	},
d4ecee4f011e6d Abel Vesa 2020-06-18  325  	{
d4ecee4f011e6d Abel Vesa 2020-06-18  326  		.compatible = "fsl,imx8mp-hdmi-blk-ctrl",
d4ecee4f011e6d Abel Vesa 2020-06-18  327  		.data = &imx8mp_hdmi_blk_ctrl_dev_data
d4ecee4f011e6d Abel Vesa 2020-06-18  328  	},
78668ad4d3771b Abel Vesa 2020-06-18  329  	{ /* Sentinel */ }
78668ad4d3771b Abel Vesa 2020-06-18  330  };
78668ad4d3771b Abel Vesa 2020-06-18  331  MODULE_DEVICE_TABLE(of, imx_blk_ctrl_of_match);
78668ad4d3771b Abel Vesa 2020-06-18  332  

:::::: The code at line 316 was first introduced by commit
:::::: 78668ad4d3771b2b0caca88d8bea83e4f438f8b5 clk: imx: Add blk_ctrl combo driver

:::::: TO: Abel Vesa <abel.vesa@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
