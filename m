Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676918F57
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 18:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693505109; x=1725041109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=myBwoZxzh2Oj1b5kSCi9owRosfCdhdt5/EnO4LswNOc=;
  b=hmUGwktD2I95F37pDt0xfx/dJ1939KIQg6JYnWCAoBzZMKrKm5NW1YEm
   vohpthwZ+2+/0ai71Zz3ocKSGGP38+7lBexxgojHwztnZA0QuN/PnnFPO
   nflvnY9nDH9ZMFDJRqJ0EFDAc0cFs7zgrNJVoPlpHJ0XQj11RPwkuzjd9
   nxsfjIRgcQH6w8wrSAYL0iibRDIDi+rO60ERxQ8lpjnn0SYW76AkVsK0T
   QSD2nhHKTTBy+y687VeprDqThdpPaYii8dU8WnSFfxcOLl93/Ilwt3Jl4
   8HVhN7kskupcz+Zp3Kdzhg91Qgtj28cNLD3qGBGbhOY4SRzTZZUbnzJu6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="361044118"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="361044118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863221826"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="863221826"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 31 Aug 2023 11:05:01 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbm2N-0000Qp-0l;
	Thu, 31 Aug 2023 18:04:59 +0000
Date: Fri, 1 Sep 2023 02:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 615/24603]
 drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: 'imx_blk_ctrl_of_match'
 defined but not used
Message-ID: <202309010118.t1wYP9bb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 75921c395c22cf9a3d9ff9af0e9962fc2b62105a [615/24603] clk: imx: Add blk_ctrl combo driver
config: x86_64-buildonly-randconfig-005-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010118.t1wYP9bb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010118.t1wYP9bb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010118.t1wYP9bb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clk/imx/clk-blk-ctrl.c:305:34: warning: 'imx_blk_ctrl_of_match' defined but not used [-Wunused-const-variable=]
     305 | static const struct of_device_id imx_blk_ctrl_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~


vim +/imx_blk_ctrl_of_match +305 drivers/clk/imx/clk-blk-ctrl.c

   304	
 > 305	static const struct of_device_id imx_blk_ctrl_of_match[] = {
   306	       { /* Sentinel */ }
   307	};
   308	MODULE_DEVICE_TABLE(of, imx_blk_ctrl_of_match);
   309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
