Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFD12940F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 17:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727630683; cv=none; b=UaUolPMjClu99ILQ5l+yMjnfRP98KOcz3be1NNLn/E2np38y6fk5X5CbMZlH3qWy66St6WMtWCYB46jQ0bjSjzVGgDKqJp2YtPu4/WS7nmsZfjDm54uftP3FwfHZrBCRix1liTkpafVUTzJI7XdNdN9aHTk8o+oB3HjXUAQ3d2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727630683; c=relaxed/simple;
	bh=El3jTdjbL/IusAdsRgfsodGVSX/YGszuNZg9lSOcSS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iKZpkRRw8zH943CnKWqKHG2uE+h/LiYcboc6ca1JBI+e0HJy8mVjYcjWmrszERQftzZXMcfmXnFEZDOn5bDHwoY9RNQlKJAAfJOPT0S7aB9Um4IPfS6WSy3kUHzqz5dorQgYGuDkPUWlZEDk7Hs9sCP+HcSDcxg31Giqz2+mE80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1pvev4g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1pvev4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727630682; x=1759166682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=El3jTdjbL/IusAdsRgfsodGVSX/YGszuNZg9lSOcSS8=;
  b=F1pvev4gdjCiWyeCNwemk8DJj4cT1vpNpUblGVlJotrsTTac1BanETZq
   Io+jkFHXu5bswQUNijLqgbsXEDrkEgKh8Cu4ygriL0KLFjJIPLv5Lvaoq
   9e9kVkpdPy9eQWP+cZLLaMYSAze/Dv7x9feibTMeR+M4aRfZnzAVBNlKY
   A8MS+7n1TLV7SJy1QucY0iQ5UY/P/Orf0l8+jI/wF8B19/4kyIhkUpM7S
   gmUFeeyP2r55w0uMTVZ8SP+6GxwG+NvdEQyKu4EYR/8gTzdLTgVnFfAuu
   BFjHRKrKfkGatI9+NdS7EKgCPTqV3XW0lvPyL2oMF7enFdVh/a6aJXKeI
   A==;
X-CSE-ConnectionGUID: Nz5CEVjxQbCkHtDSFTdtHg==
X-CSE-MsgGUID: EYTL0q32S/SKhUWaPSDC0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30510187"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="30510187"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 10:24:41 -0700
X-CSE-ConnectionGUID: 3pa8YkfgTTum6bglTvj/0g==
X-CSE-MsgGUID: 0FOR2Dm4S9GcD/hjmphasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="72734237"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Sep 2024 10:24:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suxew-000OVH-1B;
	Sun, 29 Sep 2024 17:24:38 +0000
Date: Mon, 30 Sep 2024 01:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5708/16788]
 drivers/media/platform/nxp/dwc-mipi-csi2.c:117:57: error: implicit
 declaration of function 'FIELD_PREP'
Message-ID: <202409300154.umQ5sBFo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guoniu.zhou,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 082dd12f8b589393f5227c2d64e358da78bd6f35 [5708/16788] LF-10587-05: media: nxp: add DesignWare MIPI CSI controller driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240930/202409300154.umQ5sBFo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300154.umQ5sBFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300154.umQ5sBFo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/media/platform/nxp/dwc-mipi-csi2.c: In function 'dwc_csi_device_pg_enable':
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:117:57: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
     117 | #define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)              FIELD_PREP(GENMASK(15, 0), (x))
         |                                                         ^~~~~~~~~~
   drivers/media/platform/nxp/dwc-mipi-csi2.c:550:15: note: in expansion of macro 'CSI2RX_PPI_PG_PATTERN_HRES_HRES'
     550 |         val = CSI2RX_PPI_PG_PATTERN_HRES_HRES(format->width);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/nxp/dwc-mipi-csi2.c: At top level:
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1372:12: warning: 'dwc_csi_system_resume' defined but not used [-Wunused-function]
    1372 | static int dwc_csi_system_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/nxp/dwc-mipi-csi2.c:1367:12: warning: 'dwc_csi_system_suspend' defined but not used [-Wunused-function]
    1367 | static int dwc_csi_system_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +117 drivers/media/platform/nxp/dwc-mipi-csi2.c

   114	
   115	/* Pattern Generator horizontal Resolution */
   116	#define CSI2RX_PPI_PG_PATTERN_HRES			0x64
 > 117	#define CSI2RX_PPI_PG_PATTERN_HRES_HRES(x)		FIELD_PREP(GENMASK(15, 0), (x))
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
