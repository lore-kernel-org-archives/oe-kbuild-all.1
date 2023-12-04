Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0784FBE8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Dec 2023 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US5rZW8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701680202; x=1733216202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=McEo/XNCWB4/AltTB63WLJdCfaL6mmAsgQpNkP34Txc=;
  b=US5rZW8UTHLTlJXDX9udWc1uyMX87OUiWLBxjhppx8gHnMZyMx3IfRCx
   LdjMPb4dANIwrljXR05HJ3h2NHxEOfUNtazE/1BtGSYaseEtMfQoAm6io
   7Wa5fkjw7ACmMLfIY2KVMfgHoVaN+eOljz2+P7enBTBti1Ihvk0V2qybQ
   z53gg0PjKloQjRllXJjIs5eZNPIi1qBsizLmVZDgSnH8lQGrf2gpXwHTV
   Q5GRUOCeOpEpzVrHHFm2L2DcCuSkG2ar0aPrPZKGdnwkKL5uH+nQsh6cd
   PY04vDl3XBQ9KdlucYR1GJ96q5d2kIUMxyw/zHITM6Wo+mt5/eMMbjvlL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="373136593"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="373136593"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 00:56:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="746769745"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="746769745"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2023 00:56:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA4kn-0007bu-1i;
	Mon, 04 Dec 2023 08:56:37 +0000
Date: Mon, 4 Dec 2023 16:56:34 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>
Subject: drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined
 but not used
Message-ID: <202312041505.xa4xbjAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Aswath,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: e4d4371253029528c02bfb43a46c252e1c3d035f phy: phy-can-transceiver: Add support for setting mux
date:   1 year, 8 months ago
config: x86_64-buildonly-randconfig-004-20230906 (https://download.01.org/0day-ci/archive/20231204/202312041505.xa4xbjAK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231204/202312041505.xa4xbjAK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312041505.xa4xbjAK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mux/adg792a.c:134:34: warning: 'adg792a_of_match' defined but not used [-Wunused-const-variable=]
     134 | static const struct of_device_id adg792a_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~


vim +/adg792a_of_match +134 drivers/mux/adg792a.c

afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  133  
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14 @134  static const struct of_device_id adg792a_of_match[] = {
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  135  	{ .compatible = "adi,adg792a", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  136  	{ .compatible = "adi,adg792g", },
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  137  	{ }
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  138  };
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  139  MODULE_DEVICE_TABLE(of, adg792a_of_match);
afda08c4caa948 drivers/mux/mux-adg792a.c Peter Rosin 2017-05-14  140  

:::::: The code at line 134 was first introduced by commit
:::::: afda08c4caa9489511557def51e322a5f2142a2f mux: adg792a: add mux controller driver for ADG792A/G

:::::: TO: Peter Rosin <peda@axentia.se>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
