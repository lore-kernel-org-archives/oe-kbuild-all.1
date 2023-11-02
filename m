Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21D8200AC
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SbOqMvFY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698947118; x=1730483118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uBgwUAKoJRQxzL+5tq69drMxZUYEKwY6IRCKet7Opz0=;
  b=SbOqMvFYlUQdUGG6rb/s8CigBJZ/BPv68qZNkJ5vWmY3It7BQ6ptPBwS
   XEAQzZLg0Lnz0oUXZfFHeaKGTOG5q+A3BX/CZJH2XWrDCKCvwnmUlSBuY
   cblFTN1Y1gZc+pYZCNuIUecRT2DhRqWPJq4xx2kzZNEnCM5ck/NFRfEp4
   fosh/A6yukxA19ECv6PJ2sEo2nomkk8CM32za57UylgtnrGhX8k1/tHYD
   hUslHZhFby1t22FJp193LbMz6PwMkQm04BlLN/DKIyz5A95PUcssr0Lsv
   lbzg6COPnrUb/5DrcGpLoT6pkJ8+c2FTzqc/iarN4XcUHntKSoknTsPoA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="475019314"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="475019314"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 10:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1092792342"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="1092792342"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Nov 2023 10:45:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qybko-0001jR-20;
	Thu, 02 Nov 2023 17:45:14 +0000
Date: Fri, 3 Nov 2023 01:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [esmil:visionfive 34/47] drivers/usb/cdns3/cdns3-starfive.c:23:
 warning: expecting prototype for cdns3(). Prototype was for JH7100_USB0()
 instead
Message-ID: <202311030143.0miOSAK1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   f20633e6824b415b4926e353c80e6fe0951a8f0d
commit: 0950ffda52028e83a6ce34905bb7953dcab483b9 [34/47] usb: cdns3: starfive: Initialize JH7100 host mode
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20231103/202311030143.0miOSAK1-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311030143.0miOSAK1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311030143.0miOSAK1-lkp@intel.com/

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
