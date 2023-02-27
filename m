Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DBE367
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 00:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677457335; x=1708993335;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PgIBSCvI8gcAxyRaQadLpOoXkFl662LSLvEEBLf6ZZQ=;
  b=jOFvh0+jj526h61E8sl5fC69YN95BQbArOzKGwR0mM+o2t1+zBIX5Ico
   5AJ0I66OX6hLGT6NIQ0Q++PWabnkyu6Br2TlZ+8/6jXTJpkOF20nnOLfH
   rhTb+QuvbsiduGGOjNINlyd2Zh2Wr6kQFq8YKhFqH9ysrX2rLZTbEAcKV
   VV8VzlzJejRBKOYMrFKOvvC0bYi2kVtAgbg+lop+Hc3vz3PdeeH7OjqDV
   REb768cESXaUtYUjxtzUZqUgvllf3cThugUs21gqsWL0SawAHdDLy7FUj
   3rnF9pnKsbYetPatUHTUYtZX2FYVHVLis0d91Ulbzkz/WEGza6SiL8L0L
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="396301536"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="396301536"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 16:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="762459737"
X-IronPort-AV: E=Sophos;i="5.97,330,1669104000"; 
   d="scan'208";a="762459737"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2023 16:22:13 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWRHQ-0003xr-1X;
	Mon, 27 Feb 2023 00:22:12 +0000
Date: Mon, 27 Feb 2023 08:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y-cicd 17138/22727]
 drivers/phy/cadence/cdns-dphy.c:148:23: sparse: sparse: symbol 'rx_bands'
 was not declared. Should it be static?
Message-ID: <202302270813.qXlQyE9T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y-cicd
head:   d14fbab5ccb21ffeb010ce57792c56a1308ed314
commit: 089a2a23c12d8940e8b0459ca473b28877c3f301 [17138/22727] phy: cdns-dphy: Add band config for dphy tx
config: openrisc-randconfig-s051-20230226 (https://download.01.org/0day-ci/archive/20230227/202302270813.qXlQyE9T-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y-cicd
        git checkout 089a2a23c12d8940e8b0459ca473b28877c3f301
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/phy/cadence/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302270813.qXlQyE9T-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/cadence/cdns-dphy.c:148:23: sparse: sparse: symbol 'rx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:156:5: sparse: sparse: symbol 'num_rx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:158:23: sparse: sparse: symbol 'tx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:166:5: sparse: sparse: symbol 'num_tx_bands' was not declared. Should it be static?
   drivers/phy/cadence/cdns-dphy.c: note: in included file (through arch/openrisc/include/asm/io.h, include/linux/io.h):
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:267:16: sparse: sparse: cast to restricted __le32

vim +/rx_bands +148 drivers/phy/cadence/cdns-dphy.c

   146	
   147	/* Order of bands is important since the index is the band number. */
 > 148	struct cdns_dphy_band rx_bands[] = {
   149		{80, 100}, {100, 120}, {120, 160}, {160, 200}, {200, 240},
   150		{240, 280}, {280, 320}, {320, 360}, {360, 400}, {400, 480},
   151		{480, 560}, {560, 640}, {640, 720}, {720, 800}, {800, 880},
   152		{880, 1040}, {1040, 1200}, {1200, 1350}, {1350, 1500}, {1500, 1750},
   153		{1750, 2000}, {2000, 2250}, {2250, 2500}
   154	};
   155	
 > 156	int num_rx_bands = ARRAY_SIZE(rx_bands);
   157	
 > 158	struct cdns_dphy_band tx_bands[] = {
   159		{80, 100}, {100, 120}, {120, 160}, {160, 200}, {200, 240},
   160		{240, 320}, {320, 390}, {390, 450}, {450, 510}, {510, 560},
   161		{560, 640}, {640, 690}, {690, 770}, {770, 870}, {870, 950},
   162		{950, 1000}, {1000, 1200}, {1200, 1400}, {1400, 1600}, {1600, 1800},
   163		{1800, 2000}, {2000, 2200}, {2200, 2500}
   164	};
   165	
 > 166	int num_tx_bands = ARRAY_SIZE(tx_bands);
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
