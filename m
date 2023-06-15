Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EA15AE9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686837105; x=1718373105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pvaGCePEajKhEV5/MZLAjnZTtdf65c0Ui5RwtjZ0pfQ=;
  b=bGwY6aAdAKcGhWSDSn5fGUqHRDauNKEcm7GgZ62a4FXf4DQLhbqLexQX
   9XHY5yDrXCcm3NombLI5OzBSUWczOqJRzWns+6b5k0dY1YJogLdYQCEjW
   X6J3Ks1jH9NIdhFcrtvP4rMRYdVplFjo8J5Zd/t8fALvjCFMBD4ulwbbe
   sv5wRVxTbOu+N2bpYj/7GB934yDFtdvg1Hu6eAKZh2gPGRNiWgJTQPppX
   ST1/m3tKqY3RwOA7FcYmVRunpzjwjGumRWWJzjSRlbBtnn7/Av9S6Mx1+
   71mOWHP+WT3x1WYnqFnS2x8fDn6IT8mlQw2r+5Rqvd95XeKhcBofSy3Ly
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362306573"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362306573"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="825280835"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="825280835"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jun 2023 06:21:36 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9mut-0001vR-1m;
	Thu, 15 Jun 2023 13:21:35 +0000
Date: Thu, 15 Jun 2023 21:21:35 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_t 4138/30000]
 drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not
 used
Message-ID: <202306152116.EbRFNjyp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramesh,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_t
head:   73bac264a173617a7d813635c0731ba6ceb345e8
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [4138/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: i386-randconfig-r023-20230615 (https://download.01.org/0day-ci/archive/20230615/202306152116.EbRFNjyp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://github.com/intel/linux-intel-lts/commit/90f1d221943f2adfc6a62813733d6dc0347ab20c
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 4.19/android_t
        git checkout 90f1d221943f2adfc6a62813733d6dc0347ab20c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/mfd/ drivers/platform/x86/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306152116.EbRFNjyp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~


vim +/micd_ctp_ranges +115 drivers/mfd/arizona-i2c.c

   113	
   114	/***********WM8280 Codec Driver platform data*************/
 > 115	static const struct arizona_micd_range micd_ctp_ranges[] = {
   116		{ .max =  11, .key = BTN_0 },
   117		{ .max =  28, .key = BTN_1 },
   118		{ .max =  54, .key = BTN_2 },
   119		{ .max = 100, .key = BTN_3 },
   120		{ .max = 186, .key = BTN_4 },
   121		{ .max = 430, .key = BTN_5 },
   122	};
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
