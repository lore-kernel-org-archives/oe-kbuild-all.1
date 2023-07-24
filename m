Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFD1E574
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jul 2023 17:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690221265; x=1721757265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCPFC+uPSMhAXaezip81m9MIEiAnyPYkWakQXTVHmU8=;
  b=U6s9iMFyRrgbzBuObdNQ8WXntRckSY0oZ+HUkeVuJ4JE+KjYjOka8Z7r
   vcaQ630VtPUwkIeoa/rgXu0NqPY4xRkeVlorUQqK9UT21ujScKZQ4VuM0
   nPINai71U3PYKoXom8UkvuE01cdfQ/bwWt1os1WB/E0i93W56SGNi2PH9
   OAm4TsjOLTgl3k1vgpFE9RS5dytgRvjfFTAoI2RgyjCBPsWMxHemU3WgM
   QnFFlqmdRwYpRGwZXb+2R4m5f/FuV38gLLXkAcNtdTun0xN0/eiii16Ym
   KRlhuvZNCBLnwRvN8Uu8W2GCP7KsnxNwbd+oRVFp+hIyCMKtPrktzxMqu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352407379"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="352407379"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 10:54:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="795849547"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; 
   d="scan'208";a="795849547"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 24 Jul 2023 10:54:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNzlH-0009vw-10;
	Mon, 24 Jul 2023 17:54:23 +0000
Date: Tue, 25 Jul 2023 01:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 59/75] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0()
 instead
Message-ID: <202307250110.WdWavXf1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   4370487fce31acaedcc03e8bd2e64f3a9c591821
commit: 34239151b9d9915e17d26d6a656f02c5f3cb1e73 [59/75] usb: cdns3: starfive: Initialize JH7100 host mode
config: alpha-randconfig-r001-20230724 (https://download.01.org/0day-ci/archive/20230725/202307250110.WdWavXf1-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307250110.WdWavXf1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307250110.WdWavXf1-lkp@intel.com/

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
