Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294687E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 05:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHlCQZIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697262179; x=1728798179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c82+Iq9FwspZyyI8aNf4pU3Feg5Vob6ny/pooTd4vh4=;
  b=nHlCQZIpPLhRTe2K2FXszy/xJRNHfjLx+Mw1MQgy8wrKOD8EqsEvf38E
   f/abHUUcwVIcQQneNsfnE3HM22v/bUACiVk5Fnn8H+CLX9YJRzerHL6vX
   p1n7qXCruyeO2oHuUSJ1LgHqhISKJIiRC6UpEOoFDAfUWYnIDnIVAeske
   AGRSN7LbIa8sb+YACybb9X1Qbo6UdbTufsaua52eFQfywS75XWwuRVbN4
   1cLkPgNNiUB0+R+ol4UiWdbl+YDEluX05pIDtH47Wp7Fd1adspyq1qmfM
   OxZgOc0F1u7TS3Nk9lzFpAG+pzYQ/U5NvhicDLjulea73/Wqt8khGlQJo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388159521"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="388159521"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 22:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871372383"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871372383"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 22:42:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrXQN-0005kV-0T;
	Sat, 14 Oct 2023 05:42:55 +0000
Date: Sat, 14 Oct 2023 13:42:51 +0800
From: kernel test robot <lkp@intel.com>
To: Eileen Yoon <eyn@gmx.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/213 1/1]
 drivers/media/platform/apple/isp/isp-fw.c:271:13: warning: unused variable
 'val'
Message-ID: <202310141325.KnuACoNv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/213
head:   5ffecb67c173b2e06118e1dede556fdcc392a9d4
commit: 5ffecb67c173b2e06118e1dede556fdcc392a9d4 [1/1] media: apple: isp: Support system sleep
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310141325.KnuACoNv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141325.KnuACoNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141325.KnuACoNv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/apple/isp/isp-fw.c:43:5: warning: no previous prototype for 'apple_isp_power_up_domains' [-Wmissing-prototypes]
      43 | int apple_isp_power_up_domains(struct apple_isp *isp)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c:66:6: warning: no previous prototype for 'apple_isp_power_down_domains' [-Wmissing-prototypes]
      66 | void apple_isp_power_down_domains(struct apple_isp *isp)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/apple/isp/isp-fw.c: In function 'isp_firmware_boot_stage1':
>> drivers/media/platform/apple/isp/isp-fw.c:271:13: warning: unused variable 'val' [-Wunused-variable]
     271 |         u32 val;
         |             ^~~


vim +/val +271 drivers/media/platform/apple/isp/isp-fw.c

f0f1b152058cd2 Eileen Yoon 2023-08-31  267  
f0f1b152058cd2 Eileen Yoon 2023-08-31  268  static int isp_firmware_boot_stage1(struct apple_isp *isp)
f0f1b152058cd2 Eileen Yoon 2023-08-31  269  {
f0f1b152058cd2 Eileen Yoon 2023-08-31  270  	int err, retries;
54ddf210d129d7 Asahi Lina  2023-10-04 @271  	u32 val;
54ddf210d129d7 Asahi Lina  2023-10-04  272  
34b060f63773b3 Asahi Lina  2023-10-04  273  	err = apple_isp_power_up_domains(isp);
34b060f63773b3 Asahi Lina  2023-10-04  274  	if (err < 0)
34b060f63773b3 Asahi Lina  2023-10-04  275  		return err;
f0f1b152058cd2 Eileen Yoon 2023-08-31  276  
54ddf210d129d7 Asahi Lina  2023-10-04  277  
54ddf210d129d7 Asahi Lina  2023-10-04  278  	isp_gpio_write32(isp, ISP_GPIO_CLOCK_EN, 0x1);
54ddf210d129d7 Asahi Lina  2023-10-04  279  

:::::: The code at line 271 was first introduced by commit
:::::: 54ddf210d129d70ab137ead5d038826c407ed89f media: apple: isp: Only reset coproc when necessary, fix minor race

:::::: TO: Asahi Lina <lina@asahilina.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
