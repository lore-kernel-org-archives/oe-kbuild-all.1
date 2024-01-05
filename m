Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B231F7E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 08:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFM9duwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704444658; x=1735980658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q//NvGDH0D/VlI5nhNRhh5wnh6YverjQOcpqlyIGDuw=;
  b=YFM9duwQDf4fW2deLt+iWJso+rpDca1HVl2X70EdiT10Lac1KaOw9KmL
   Auzns+w6/2aMENwblVdvJu1/SSiEX+hu3OaoxYWWsf311JbO8pC4CjVdP
   Dyql98BFj+8vzV99kPZwI6NA+8I0ema4bDgxvNXl7IrBd7VhTF4Q5Cyxl
   BBfyh00XpAlL4IAtondGyK4udF9DSyWH5C9gBMDWcP1iuqM+6jrQGHxWl
   1ANHjgwq9M8Cn6qQzQnkhYSZJhw/8x62qnqLC9VhrXIk0Jp7Fe+k8FSRk
   wPE7o1Wrd70Ifrr1rhvCFnkt7pMH3LFmCW7gTqiiPpSnQVIWIgD2sn3y2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428637035"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="428637035"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 00:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="730413260"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="730413260"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 05 Jan 2024 00:50:56 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLfum-00011A-0q;
	Fri, 05 Jan 2024 08:50:53 +0000
Date: Fri, 5 Jan 2024 16:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Zhuo <sagazchen@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev, "Song, Youquan" <youquan.song@intel.com>,
	Joerg Roedel <jroedel@suse.de>, Xinghui Li <korantli@tencent.com>
Subject: drivers/iommu/amd_iommu.c:442:27: warning: variable 'iommu' set but
 not used
Message-ID: <202401051627.v9bPLZ2U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009.spr
head:   2b05031ac9b7e23091affe1b717425ef76750bd9
commit: a3da370445bfe08989650b6ae0e06cb0d9a67e02 iommu/amd: Convert to probe/release_device() call-backs
date:   7 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20240105/202401051627.v9bPLZ2U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051627.v9bPLZ2U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051627.v9bPLZ2U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/amd_iommu.c: In function 'amd_iommu_uninit_device':
>> drivers/iommu/amd_iommu.c:442:27: warning: variable 'iommu' set but not used [-Wunused-but-set-variable]
     442 |         struct amd_iommu *iommu;
         |                           ^~~~~
   drivers/iommu/amd_iommu.c: In function 'amd_iommu_probe_finalize':
   drivers/iommu/amd_iommu.c:2281:17: error: 'dev_data' undeclared (first use in this function); did you mean '_edata'?
    2281 |                 dev_data->passthrough = true;
         |                 ^~~~~~~~
         |                 _edata
   drivers/iommu/amd_iommu.c:2281:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/iommu +442 drivers/iommu/amd_iommu.c

^590eaf1fec755 Kaixu Xia 2021-03-16  438  
a3da370445bfe0 Chen Zhuo 2021-11-18  439  static void amd_iommu_uninit_device(struct device *dev)
^590eaf1fec755 Kaixu Xia 2021-03-16  440  {
^590eaf1fec755 Kaixu Xia 2021-03-16  441  	struct iommu_dev_data *dev_data;
^590eaf1fec755 Kaixu Xia 2021-03-16 @442  	struct amd_iommu *iommu;
^590eaf1fec755 Kaixu Xia 2021-03-16  443  	int devid;
^590eaf1fec755 Kaixu Xia 2021-03-16  444  
^590eaf1fec755 Kaixu Xia 2021-03-16  445  	devid = get_device_id(dev);
^590eaf1fec755 Kaixu Xia 2021-03-16  446  	if (devid < 0)
^590eaf1fec755 Kaixu Xia 2021-03-16  447  		return;
^590eaf1fec755 Kaixu Xia 2021-03-16  448  
^590eaf1fec755 Kaixu Xia 2021-03-16  449  	iommu = amd_iommu_rlookup_table[devid];
^590eaf1fec755 Kaixu Xia 2021-03-16  450  
^590eaf1fec755 Kaixu Xia 2021-03-16  451  	dev_data = search_dev_data(devid);
^590eaf1fec755 Kaixu Xia 2021-03-16  452  	if (!dev_data)
^590eaf1fec755 Kaixu Xia 2021-03-16  453  		return;
^590eaf1fec755 Kaixu Xia 2021-03-16  454  
^590eaf1fec755 Kaixu Xia 2021-03-16  455  	if (dev_data->domain)
^590eaf1fec755 Kaixu Xia 2021-03-16  456  		detach_device(dev);
^590eaf1fec755 Kaixu Xia 2021-03-16  457  
^590eaf1fec755 Kaixu Xia 2021-03-16  458  	/*
^590eaf1fec755 Kaixu Xia 2021-03-16  459  	 * We keep dev_data around for unplugged devices and reuse it when the
^590eaf1fec755 Kaixu Xia 2021-03-16  460  	 * device is re-plugged - not doing so would introduce a ton of races.
^590eaf1fec755 Kaixu Xia 2021-03-16  461  	 */
^590eaf1fec755 Kaixu Xia 2021-03-16  462  }
^590eaf1fec755 Kaixu Xia 2021-03-16  463  

:::::: The code at line 442 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
