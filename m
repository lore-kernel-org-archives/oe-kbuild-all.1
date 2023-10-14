Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2FF4F6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TGFoWB/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697277971; x=1728813971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lvWlwqd6swpGkq2r1kpFRpv8+n8+KIhzjKBB1f8tUdk=;
  b=TGFoWB/s8WgUEiifJbaUMxfAJON0Xx65OYLmxPeMhX1Jzoa5GMUCLmD1
   Po2PXyeJIyo9dW3qnybdW6NyRQVugW9mfUPVkzrMuCXzYPMHrbvLFnza6
   KiyEdNm8IWuJV4nS/UyCg15JXYFGuzKjYxBPZn/aCDemEUCILo1bgKhRF
   dDNxgQJHnjslOwJQTOmLeazIdUw7EC4APQHLz1/RAyZvQ+vM4l7jJkR2m
   DyAsuMqhnCfto0JkvakHj6HAt8CqCMlT82P/8m+GXc/UoWRpSRQPOT2pe
   gOe8tfKJrH8qAUaE2TZFGQY54PS8eIzpHSyxBZaoH/oHfcqrvnECKl45i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385157465"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="385157465"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 03:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="784442325"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="784442325"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2023 03:06:09 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrbX1-00062t-0U;
	Sat, 14 Oct 2023 10:06:04 +0000
Date: Sat, 14 Oct 2023 18:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 1515/15767]
 drivers/gpu/drm/bridge/nwl-dsi.c:838: undefined reference to `__udivdi3'
Message-ID: <202310141717.1TQFezHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 09734170119b1928548a9adc0ace25f1fa45876e [1515/15767] LF-1373-1: drm/bridge: nwl-dsi: Add support for video_pll
config: i386-randconfig-002-20231014 (https://download.01.org/0day-ci/archive/20231014/202310141717.1TQFezHE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141717.1TQFezHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141717.1TQFezHE-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/bridge/nwl-dsi.o: in function `nwl_dsi_get_lcm':
>> drivers/gpu/drm/bridge/nwl-dsi.c:838: undefined reference to `__udivdi3'


vim +838 drivers/gpu/drm/bridge/nwl-dsi.c

   815	
   816	/*
   817	 * Utility function to calculate least commom multiple, using an improved
   818	 * version of the Euclidean algorithm for greatest common factor.
   819	 */
   820	static unsigned long nwl_dsi_get_lcm(unsigned long a, unsigned long b)
   821	{
   822		u32 gcf = 0; /* greatest common factor */
   823		unsigned long tmp_a = a;
   824		unsigned long tmp_b = b;
   825	
   826		if (!a || !b)
   827			return 0;
   828	
   829		while (tmp_a % tmp_b) {
   830			gcf = tmp_a % tmp_b;
   831			tmp_a = tmp_b;
   832			tmp_b = gcf;
   833		}
   834	
   835		if (!gcf)
   836			return a;
   837	
 > 838		return ((unsigned long long)a * b) / gcf;
   839	}
   840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
