Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE51E2C6AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ust3QY5n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702596391; x=1734132391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HOqxcFIyy5uLMwCAMkL8MDaYu8jDVs4FdwznvmHSJ08=;
  b=Ust3QY5nCj3hDJlYNxyEp3ol5e0rCGmP8LhiwscS+mJdJOSkADP+slfF
   qe19HJJCfpHvM1xHHQHMLMf9O3XOrDU4Ye8BxOqg/fx7D4u/MH2GnO863
   AJKxoTIR2hlfH78Pp6fucMBQMOwV+uI0Dh+0pvDJDfBh0Yi33IseBY6IL
   1Q+BT0KJ2pTfjEurX5G9jF7NmhvBXqZ8K3Xy77G9cf+FNmAu9iVEeEOYy
   b7cv8zxi06Yg6xc0U57NQtW04uEsfNtjSYhcvC8+O74T9TFFNYzQB8kWB
   mskbXMTI9918HQ9p+/z39SgmWUPWXKbX/AC5+Bqb1khKauTXR6xvzT8j9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="394946127"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="394946127"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 15:26:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897922130"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="897922130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2023 15:26:30 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDv63-000Mjb-2s;
	Thu, 14 Dec 2023 23:26:27 +0000
Date: Fri, 15 Dec 2023 07:25:38 +0800
From: kernel test robot <lkp@intel.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Steev Klimaszewski <steev@kali.org>
Subject: [steev:lenovo-x13s-v6.7-rc5 127/138]
 drivers/media/i2c/ap1302.c:30:29: warning: 'normal_i2c' defined but not used
Message-ID: <202312150707.fnkougTN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-v6.7-rc5
head:   b8cd563c115473e27fa4778c1eca7b25f6f9a7ee
commit: 7da5b55865db90b714879aed9c29a75411767c9f [127/138] media: i2c: ap1302: Getting the thing to probe
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231215/202312150707.fnkougTN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231215/202312150707.fnkougTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312150707.fnkougTN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ap1302.c:30:29: warning: 'normal_i2c' defined but not used [-Wunused-const-variable=]
      30 | static const unsigned short normal_i2c[] = { 0x00, I2C_CLIENT_END };
         |                             ^~~~~~~~~~


vim +/normal_i2c +30 drivers/media/i2c/ap1302.c

    29	
  > 30	static const unsigned short normal_i2c[] = { 0x00, I2C_CLIENT_END };
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
