Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374DF7E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Apr 2023 03:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681528754; x=1713064754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QZsY8/e9xpmkaSSd7YmrcofT1V9u9cZQUOo0IV5yvZM=;
  b=FkQowIbZjkwtPFNppo7xUC8LXEJQ4Wm7KP8jlvAe90I6bjR/GoJjdcPV
   E1V19QijUMJKBESAQuhGg/TrJ9fvmc+r2pcCeNiL8VsefukKjrDe8iK5D
   14S02JgOnYReMlUko5X8+pIScAqd47fX1wGNQdrmrTrqM63zfrygGDNHj
   li7B+GBwchPRNN9wXr33O6QHLEDpslb9Cz1klkVwYa4miNZXI6PpqEeq9
   zn+8DVaDI1lCHPMMjZUMZPcBismp9P6uGW0FyoRBPazyT/eXeyQq/k9dY
   WfD8Vnogi/vYqJ9/6S0b/Uwvx6h33eoM+3Oe3xlUdmF2v9msd2Kd8YgLj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="328765883"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="328765883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 20:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="667406397"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="667406397"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 14 Apr 2023 20:19:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnWRO-000aMT-2U;
	Sat, 15 Apr 2023 03:19:06 +0000
Date: Sat, 15 Apr 2023 11:18:17 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/629 1515/9838]
 drivers/gpu/drm/bridge/nwl-dsi.c:838: undefined reference to `__udivdi3'
Message-ID: <202304151114.WCl2YCZY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/629
head:   d1033c2e51746dfdb7179c82e38b03ba7de39c63
commit: 09734170119b1928548a9adc0ace25f1fa45876e [1515/9838] LF-1373-1: drm/bridge: nwl-dsi: Add support for video_pll
config: i386-randconfig-a012 (https://download.01.org/0day-ci/archive/20230415/202304151114.WCl2YCZY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/Freescale/linux-fslc/commit/09734170119b1928548a9adc0ace25f1fa45876e
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/629
        git checkout 09734170119b1928548a9adc0ace25f1fa45876e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304151114.WCl2YCZY-lkp@intel.com/

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
https://github.com/intel/lkp-tests
