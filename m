Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854554A23
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI85b9GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705162412; x=1736698412;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VO8c02YiNFoaQWRgIe9t/4cK2RsKBPLqvBRemO97sjY=;
  b=EI85b9GZw8vS23hQcCOiW0DwA2rhz/hLY3Bctb9UF4ZhJhUT3xZK30B0
   ganzq4NiaC6pOInXXNnGlxFi90i/xJ6ZQSmInP27k6cIJCFpsl9zqGbsN
   1pfHsaWED2CSbcpqTyvWj5eW58pyuOMi1/VAz7iVWa2U+oeRWUQqmBeVv
   Y+jyWWLv+mcn7SwRc/OR+5ih/aqFLFIAClY0ZdftTJSTYB1Yi4UVspeMx
   qDcea++30wL4EPzILbvWc6Tvqo/vYRuPckgZZoOtP/4S+DWO9qdvXetBD
   PxKFWBQiiDyzTdWH/qFypZDCXSBkXcumuF0olqGf3Vva7eCalKOHGhTUD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="12867493"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="12867493"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 08:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="817392404"
X-IronPort-AV: E=Sophos;i="6.04,192,1695711600"; 
   d="scan'208";a="817392404"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Jan 2024 08:13:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOgdT-000Afk-1t;
	Sat, 13 Jan 2024 16:13:27 +0000
Date: Sun, 14 Jan 2024 00:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1515/17888] nwl-dsi.c:undefined
 reference to `__aeabi_uldivmod'
Message-ID: <202401140046.6kRApLN7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   32a344619c750cdcbe31bed754adc1b30d362e45
commit: 09734170119b1928548a9adc0ace25f1fa45876e [1515/17888] LF-1373-1: drm/bridge: nwl-dsi: Add support for video_pll
config: arm-randconfig-004-20240113 (https://download.01.org/0day-ci/archive/20240114/202401140046.6kRApLN7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140046.6kRApLN7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140046.6kRApLN7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/bridge/nwl-dsi.o: in function `nwl_dsi_bridge_mode_valid':
>> nwl-dsi.c:(.text+0xc2c): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
