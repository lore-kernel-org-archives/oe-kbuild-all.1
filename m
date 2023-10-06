Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7ADEA1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Oct 2023 05:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnBhV0n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696569021; x=1728105021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mo/U8NYUEsRpwNcCHu8W+0xeGiHg63Su6f8VTOpbGjk=;
  b=NnBhV0n81fKpe4heEL7bUDNCljTPEqZWhTwdPf5xyjnegiZFAcwgsb/s
   LFEaII+CU6GMBlrpOE+Q6KcS0vsHSvNpOTvQj01B1t593p2+N1GbK7Vhy
   hrwUstO7PmCdy8tlwa2hjLCoUZ9n1nHK9pWYiSabS/bxeO/QNNEVMnys/
   BEw8qPn/zKURwRpCgOgSwG/xPmNz2UiRLLAImKbxzfI9T+E2UweNFlK+Z
   33ougsq3vh1gbJ6zG6ttxOBL7wq7ftt8eeSfkYI9L/ErNYs6cVIwck9ib
   y2G/8+6Kx6yPWA+vyuKXITqbZaxqgfeCMbWi/brX6s12Jq6uTa1CN4tWm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="368758913"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="368758913"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 22:10:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="728716774"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="728716774"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2023 22:10:19 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qod6P-000MHd-0V;
	Fri, 06 Oct 2023 05:10:17 +0000
Date: Fri, 6 Oct 2023 13:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev, Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [chanwoo-extcon:extcon-next 4/4]
 drivers/extcon/extcon-max77843.c:949:34: warning:
 'of_max77843_muic_dt_match' defined but not used
Message-ID: <202310061358.wGFXNMsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/extcon.git extcon-next
head:   8b467b48e2837bdae738a3a53b121b2995df0be7
commit: 8b467b48e2837bdae738a3a53b121b2995df0be7 [4/4] extcon: max77843: add device-tree compatible string
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231006/202310061358.wGFXNMsU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061358.wGFXNMsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061358.wGFXNMsU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/extcon/extcon-max77843.c:949:34: warning: 'of_max77843_muic_dt_match' defined but not used [-Wunused-const-variable=]
     949 | static const struct of_device_id of_max77843_muic_dt_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/of_max77843_muic_dt_match +949 drivers/extcon/extcon-max77843.c

   948	
 > 949	static const struct of_device_id of_max77843_muic_dt_match[] = {
   950		{ .compatible = "maxim,max77843-muic", },
   951		{ /* sentinel */ },
   952	};
   953	MODULE_DEVICE_TABLE(of, of_max77843_muic_dt_match);
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
