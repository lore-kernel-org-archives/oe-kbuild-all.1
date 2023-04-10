Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C9322B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 13:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681133552; x=1712669552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P2/BhihYRrH4kYgV8FlJkKVW2+9jkb2hMbfm4jSGwQU=;
  b=n7pavEF1qCphnQcnUYQipH2l/M7EQI0iO0mBjWZN1bcfyEKTzpu5TeqL
   IbrABN0QKcgameR91rxYVr9WqDGzQeZ4Cswmazhz2Itu9cV37biivzdQ0
   j55gGZKbyTJXP69oEGVyN3KFAOfSwz+Je2aLx7OW5vPiqP+ButhJgVpHg
   Q+hAiD2/F6vReorS0T+i+1FStiaVbd7JeE6EM3iQ6l1Mm7qVrHfG5FF2S
   ntWi2BmCB1/DBBnn5LGvOE8+srmXn8GnunCB9wlw6jDjfwIqSaVKTHXjB
   WEVxNaj63YEhbN85qjNwWUU65ivHESvQjVwqOEO0cQlkYLrtZhKTbJaTG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371191745"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="371191745"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 06:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="862500056"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="862500056"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 Apr 2023 06:32:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plrdB-000VOt-0m;
	Mon, 10 Apr 2023 13:32:25 +0000
Date: Mon, 10 Apr 2023 21:31:26 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 16583/22025]
 drivers/phy/cadence/cdns-dphy.c:148:23: sparse: sparse: symbol 'rx_bands'
 was not declared. Should it be static?
Message-ID: <202304102145.KPn2neYG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 089a2a23c12d8940e8b0459ca473b28877c3f301 [16583/22025] phy: cdns-dphy: Add band config for dphy tx
config: arc-randconfig-s053-20230409 (https://download.01.org/0day-ci/archive/20230410/202304102145.KPn2neYG-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 089a2a23c12d8940e8b0459ca473b28877c3f301
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/phy/cadence/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304102145.KPn2neYG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/phy/cadence/cdns-dphy.c:148:23: sparse: sparse: symbol 'rx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:156:5: sparse: sparse: symbol 'num_rx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:158:23: sparse: sparse: symbol 'tx_bands' was not declared. Should it be static?
>> drivers/phy/cadence/cdns-dphy.c:166:5: sparse: sparse: symbol 'num_tx_bands' was not declared. Should it be static?

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
