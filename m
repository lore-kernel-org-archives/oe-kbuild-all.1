Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E23347D5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 04:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751517991; cv=none; b=OCyY9vVEyLX/Oy7Zw2w9mGAIVeWsS7J0XDcvTfu2G9O8+p3C2K9Bn8iDWmQ/b14CGvrNrsS7525VFU9F41cxC/NrPnloZWr+i1qb/+U+p3BZGIhD9dNuAwGyizo8oQalwGpx06DLYqjkwxW5hy8qlANYn/hEpPtJEk8ytFYCiow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751517991; c=relaxed/simple;
	bh=eFjCWsetQWARVchAJKHMkgbJHBnDGMahFd8CGoPKtoE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeVx25ThoDmar0frluTwrFoSa59ggvn0uV4+eQLBcVjn920Pia+oYAzu2agWdCa5y4Z/pnS7xlSdlEVr2tND3o4BnAFsopeJpdv0NBNipgghuhNGAKLZx11mDZPzlBGTWeMvoea9hZcR0xft1u9dtw2aw031tUXS626k0Sn7gzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCTBxbdj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCTBxbdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751517990; x=1783053990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFjCWsetQWARVchAJKHMkgbJHBnDGMahFd8CGoPKtoE=;
  b=RCTBxbdjqV/0VImSZaM3IwCKQN8ZTvhn4JvOLLZInmmDVaRGflqA1JHZ
   cNM0vAGUmn71l+rqYIMwtjUe8dF46WadI6Gwumak82wzk2cDIDb+0EkUC
   WfGmT2aA/dSlBA4E7KIfvz7k6z0DobBv8gMWBlT7cp0cgURw03bgt73Nj
   v9R9sYzdg+WLLhkpBHw5cZXek5FnsWVvgej6Gmdu/1lQEgq1DS4DTX8Ne
   SBgAJGueur87djkA4VL0rCBmLlfrdxkYwE795pKbOLKbjd8MkKCmOBzHL
   52MA8TWRaqiNdWB11xYh7KkMLaxjIjU36NB1AS2dYdnP3SgIirkdaXcby
   A==;
X-CSE-ConnectionGUID: Dl+QUu6/SQGiw0oLnYBGwg==
X-CSE-MsgGUID: IYrFvs4nRK+s1OSxh5Mz9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65287136"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="65287136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 21:46:28 -0700
X-CSE-ConnectionGUID: ChRjhAPJR5CU3Th+i+O+Xg==
X-CSE-MsgGUID: TquwA7sYT/qBdYkvRbFU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154756948"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2025 21:46:26 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXBq2-0000Ov-1A;
	Thu, 03 Jul 2025 04:46:22 +0000
Date: Thu, 3 Jul 2025 06:46:06 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1605/1605]
 drivers/pwm/pwm-pca9685.c:173:21: warning: variable 'pwm' set but not used
Message-ID: <202507030648.wv6Tc1L9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   382711115afc1197da2c288679079946650ef017
commit: 0e0a61eb0d758e7fd91a0543e7d12fc065df5b70 [1605/1605] pwm: Clear chip_data in pwm_put()
config: x86_64-buildonly-randconfig-2004-20250501 (https://download.01.org/0day-ci/archive/20250703/202507030648.wv6Tc1L9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030648.wv6Tc1L9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030648.wv6Tc1L9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pwm/pwm-pca9685.c:173:21: warning: variable 'pwm' set but not used [-Wunused-but-set-variable]
     173 |         struct pwm_device *pwm;
         |                            ^
   1 warning generated.


vim +/pwm +173 drivers/pwm/pwm-pca9685.c

bccec89f0a35f65 Mika Westerberg   2016-09-20  169  
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  170  static void pca9685_pwm_gpio_free(struct gpio_chip *gpio, unsigned int offset)
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  171  {
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  172  	struct pca9685 *pca = gpiochip_get_data(gpio);
c40c461e1944b9c Sven Van Asbroeck 2017-04-13 @173  	struct pwm_device *pwm;
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  174  
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  175  	pca9685_pwm_gpio_set(gpio, offset, 0);
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  176  	pm_runtime_put(pca->chip.dev);
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  177  	mutex_lock(&pca->lock);
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  178  	pwm = &pca->chip.pwms[offset];
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  179  	mutex_unlock(&pca->lock);
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  180  }
c40c461e1944b9c Sven Van Asbroeck 2017-04-13  181  

:::::: The code at line 173 was first introduced by commit
:::::: c40c461e1944b9cfb520e04184ec1e5c80fb210b pwm: pca9685: Fix GPIO-only operation

:::::: TO: Sven Van Asbroeck <thesven73@gmail.com>
:::::: CC: Thierry Reding <thierry.reding@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
