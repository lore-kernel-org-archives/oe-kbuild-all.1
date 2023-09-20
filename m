Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929703B284
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 14:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695219223; x=1726755223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VsLmQVgOwyQBVouxl4moQmFtH2w1p1MMoDfK9CXUnAE=;
  b=BwTPv1rNk7ocVYWOkNVhojHbHnHDoxZQtEFtPdiVqp287MknMhO5cfqi
   YH+rxrcW5SYsGDdSC4rxYaQxJIEXtzU0hzclA7U+0odCZC22auljcNCc3
   7wq7GGj6cwDXrdsU8ubPJD7B0UX/FXHFs+P0pfnDq5LZ2CZXhwCdI9150
   Zty//Pa8uV0glk712UQDa5ilXXaAXngS+QooiktT6otYciCN+ssBxSK2f
   IZeSPtDwC7enlAPRFNRw8C3tXNUsA5NZkD2UNTXcBBQw5+ejwWSd2b3eK
   YrxW7og2nS67UIaH1yl9R4BEFpXGgtAeo/WYL8Ksi3LfnzTckHjJv2t9h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444323767"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="444323767"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="870393384"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="870393384"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Sep 2023 07:09:22 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qixso-0008o0-1b;
	Wed, 20 Sep 2023 14:09:10 +0000
Date: Wed, 20 Sep 2023 22:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 31/46] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0()
 instead
Message-ID: <202309202220.OG4AFvkD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   726782fad491c490b32476a34f0a50062352cf58
commit: 8892e2e6a4a1f770ce8aae1c3619e4ca0ab9774f [31/46] usb: cdns3: starfive: Initialize JH7100 host mode
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309202220.OG4AFvkD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202220.OG4AFvkD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202220.OG4AFvkD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/cdns3/cdns3-starfive.c:23: warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0() instead


vim +23 drivers/usb/cdns3/cdns3-starfive.c

    22	
  > 23	#define JH7100_USB0			0x20
    24	#define JH7100_USB0_MODE_STRAP_MASK	GENMASK(2, 0)
    25	#define JH7100_USB0_MODE_STRAP_HOST	2
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
