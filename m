Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4A27F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676008047; x=1707544047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TE/Q4OU0jPR9NIpNC0oNUKhggpcAeDS4UuRgVHuIcvk=;
  b=P0igWCyVbbhPcn+OwEqZPMxELsV2tK/3irSppGWeol2RVKtn4ZMC1N/t
   XxlUsxKUGNn09KGpUIiEJMhVr4D1xZo5RtSet3oDtJ6KW/dcLtFM64IOE
   xJiBHxJzEUTn+fnGWokai1kPeWo/eOqzYWVWx5NiYpqJwv+C/bX4ydTHM
   Kl46E+XpF8AVd1QdUyYfMOljhb5K/1CbSUHsk0nmUG4rCMGomYZKDJs3l
   nykQdTHVLQ11jZqgc/yfPVrtEQcoP2T5paCxFbSuH0UWwwYxt9KUOxHEu
   gemVbbyswySp3YgcXE8yDQxF7ArGfV0ICLOPO7Nv0KvdguiZ5h72gQOLV
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="416569948"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="416569948"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="731616314"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="731616314"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Feb 2023 21:47:25 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQMFo-0005aw-2M;
	Fri, 10 Feb 2023 05:47:24 +0000
Date: Fri, 10 Feb 2023 13:47:04 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 17138/21442]
 drivers/phy/cadence/cdns-dphy.c:148:23: sparse: sparse: symbol 'rx_bands'
 was not declared. Should it be static?
Message-ID: <202302101321.A5Jl8EDD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: 089a2a23c12d8940e8b0459ca473b28877c3f301 [17138/21442] phy: cdns-dphy: Add band config for dphy tx
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230210/202302101321.A5Jl8EDD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout 089a2a23c12d8940e8b0459ca473b28877c3f301
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/phy/cadence/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101321.A5Jl8EDD-lkp@intel.com/

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
