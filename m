Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA744BE65
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Nov 2023 13:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7EtH2OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699191219; x=1730727219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q0rVf+QT/S5erBixy5mT+tZDHS3kGRllmdND002iAWI=;
  b=O7EtH2ORBSEXlLOM+5PckEPf1izxbUZm7Hgog2um+V/5G4whjawp6yaZ
   M5YjBjwMQBP0ftrnuM2ehPEak8BmP5S3RvE4xCE+husBusnWzbg3EupX6
   LZObbImaoVW1oIFjAK1Rd/zLpnKUUv89IY3NjbbPEfCRf8NyxdkPo4fpL
   H+m7ZrJVvv8J/Qo9eVlmyMuTSp2u5SJFwtvk/4+9EItS375DSGZ8F6wvQ
   LZTuE/7lLo8RYTr6T8E0ER/3HhbsXu3ujde69ESddej6M/fDzu8xIYwOY
   hz3chcNfzEoPA+BtnyerZStigYF9hd1wC8k/tO2CR2ssHazOW0lvLX46L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="369355421"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="369355421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 05:33:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755611771"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="755611771"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 05 Nov 2023 05:33:37 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzdFv-0005To-0S;
	Sun, 05 Nov 2023 13:33:35 +0000
Date: Sun, 5 Nov 2023 21:32:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 325/382]
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:837:45: warning:
 unused variable 'ti_csi2rx_video_entity_ops'
Message-ID: <202311052115.WN0cUbax-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 8d22a2769b4e64ee3576ee74cbb0efc2a23c0117 [325/382] media: ti: j721e-csi2rx: separate out device and context
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231105/202311052115.WN0cUbax-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231105/202311052115.WN0cUbax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311052115.WN0cUbax-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c:837:45: warning: unused variable 'ti_csi2rx_video_entity_ops' [-Wunused-const-variable]
     837 | static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
         |                                             ^
   1 warning generated.


vim +/ti_csi2rx_video_entity_ops +837 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c

70f7e7ba6c6684 Pratyush Yadav 2023-04-20  836  
70f7e7ba6c6684 Pratyush Yadav 2023-04-20 @837  static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  838  	.link_validate = ti_csi2rx_link_validate,
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  839  };
70f7e7ba6c6684 Pratyush Yadav 2023-04-20  840  

:::::: The code at line 837 was first introduced by commit
:::::: 70f7e7ba6c66846ac3f73fcee04f2faf9836c1c6 media: ti: Add CSI2RX support for J721E

:::::: TO: Pratyush Yadav <p.yadav@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
