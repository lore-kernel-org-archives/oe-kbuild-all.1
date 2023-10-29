Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B2D2E3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 21:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dx2fXHTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698613983; x=1730149983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SOR5VzH+3RIWr8TNv9RU5ppgaLdOMNOBJQ0tdaRwbWA=;
  b=dx2fXHTlOwiO51SIgszzT0iHIdfU1kvkSx5802cgLDCvSSjBHcfHQT2W
   Y7GUQOf/GPC/CuwO+UD6hlt9jaU9AXR/PLskOiI3QGb11r/yzQUsB8pqK
   A/V7mdjmawkF5KNO5tOC58ClnoHjjRzd12mD2HupYVFV63p7lDzWbMEF/
   yx730jb+onebiaBo8OkL2qATag/uLagT5nmUpt8WLtTAJxX6vTclG/JaQ
   QxcS9Jp8dVa87e3qJ7JiFE4nBv12M9w7S0VgEyWUZ+DhICpbNQOLVH+bP
   gPc98qy8GXTahyoVffN/ODiGuyzu0RXOcspmqRTBO+hupqMtj0SOR23vL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6614809"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="6614809"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 14:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789284070"
X-IronPort-AV: E=Sophos;i="6.03,261,1694761200"; 
   d="scan'208";a="789284070"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 29 Oct 2023 14:12:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxD5d-000Cop-2X;
	Sun, 29 Oct 2023 21:12:57 +0000
Date: Mon, 30 Oct 2023 05:12:02 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.15/linux 8/67]
 drivers/media/platform/intel/ipu6-tglrvp-pdata.c:69:13: warning:
 'ar0234_fixup_spdata' defined but not used
Message-ID: <202310300544.5uhOmzJh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   be9dd64367794ed5d4f3ac734bf996e416098f80
commit: e5e4def4bfd3c95dc117c308adab9c9449421ee6 [8/67] media: intel: isys: Add debug log for get i2c adapter.
config: xtensa-randconfig-001-20231030 (https://download.01.org/0day-ci/archive/20231030/202310300544.5uhOmzJh-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310300544.5uhOmzJh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310300544.5uhOmzJh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/intel/ipu6-tglrvp-pdata.c:69:13: warning: 'ar0234_fixup_spdata' defined but not used [-Wunused-function]
      69 | static void ar0234_fixup_spdata(const void *spdata_rep, void *spdata)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/ar0234_fixup_spdata +69 drivers/media/platform/intel/ipu6-tglrvp-pdata.c

cfb5743695d51c zouxiaoh 2022-11-28  66  
cfb5743695d51c zouxiaoh 2022-11-28  67  #if IS_ENABLED(CONFIG_VIDEO_INTEL_IPU_USE_PLATFORMDATA) \
cfb5743695d51c zouxiaoh 2022-11-28  68  	&& IS_ENABLED(CONFIG_VIDEO_INTEL_IPU_PDATA_DYNAMIC_LOADING)
b2d9ba9588cef2 zouxiaoh 2022-04-26 @69  static void ar0234_fixup_spdata(const void *spdata_rep, void *spdata)
b2d9ba9588cef2 zouxiaoh 2022-04-26  70  {
b2d9ba9588cef2 zouxiaoh 2022-04-26  71  	const struct ipu_spdata_rep *rep = spdata_rep;
b2d9ba9588cef2 zouxiaoh 2022-04-26  72  	struct ar0234_platform_data *platform = spdata;
b2d9ba9588cef2 zouxiaoh 2022-04-26  73  
b2d9ba9588cef2 zouxiaoh 2022-04-26  74  	if (spdata_rep && spdata) {
b2d9ba9588cef2 zouxiaoh 2022-04-26  75  		platform->port = rep->port_n;
b2d9ba9588cef2 zouxiaoh 2022-04-26  76  		platform->lanes = rep->lanes;
b2d9ba9588cef2 zouxiaoh 2022-04-26  77  		platform->i2c_slave_address = rep->slave_addr_n;
b2d9ba9588cef2 zouxiaoh 2022-04-26  78  		platform->gpios[0] = rep->gpios[0];
b2d9ba9588cef2 zouxiaoh 2022-04-26  79  		platform->irq_pin = rep->irq_pin;
b2d9ba9588cef2 zouxiaoh 2022-04-26  80  		platform->irq_pin_flags = rep->irq_pin_flags;
b2d9ba9588cef2 zouxiaoh 2022-04-26  81  		strcpy(platform->irq_pin_name, rep->irq_pin_name);
b2d9ba9588cef2 zouxiaoh 2022-04-26  82  		platform->suffix = rep->suffix;
b2d9ba9588cef2 zouxiaoh 2022-04-26  83  	}
b2d9ba9588cef2 zouxiaoh 2022-04-26  84  }
cfb5743695d51c zouxiaoh 2022-11-28  85  #endif
b2d9ba9588cef2 zouxiaoh 2022-04-26  86  

:::::: The code at line 69 was first introduced by commit
:::::: b2d9ba9588cef2ff54740e1a514eec22b8ec8e8d add ipu driver for kernel 5.15

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: nanli2x <nanx.li@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
