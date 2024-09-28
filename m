Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79218030
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727539523; cv=none; b=E5Zh+p7zZEaFNLLinlnEU2phmmkIrY+GNUed5HR0ZSYOca5SAMLKQ5TZF/XJnXOscr9FQhMhdFlk7qwJ6hEyezwHVU0LtT2x7OHfd6xfYN20dVsGWXSQkC6dIiutDpswX7d+ICLUk/mfzJao7Y7j4JKCCz4Cxo4kRz82S+1JiNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727539523; c=relaxed/simple;
	bh=jQDk6TGUidkIPFBGaq9hUcYODPO7lKm/ryUVNyuetsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TShEbQkfYWToLR18OpJeYTiJ6MFh3nU51mbn2h2fm67Qpff6VCBGh9j4OKtF8EUnNQyheJ1AQHr2r53Gb6i5FRhkPptsEzJtuP8UQNJEn42gpLdH8mYATlmHqE/Md+5qg1cWMaNUHLkwGI8+uCv4ez8Z98iCwqZfi7DvB7YRlUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mhn9b6Il; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mhn9b6Il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727539522; x=1759075522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jQDk6TGUidkIPFBGaq9hUcYODPO7lKm/ryUVNyuetsM=;
  b=Mhn9b6IlE4ewJBcWCEDmsJS5Aporg/izqMyGRbAEUeigyi5a4OydwYD4
   7T7JxJqVzdiCORSkNHEerCOiHErH4boyn48SmQbaYDeSW9TppvgoRHPoD
   PlWFby9ERsBKuwx4cAAq4RQ8KR+tRgIWePrGuNI+W/aawZ/zuLCs1QhX7
   n6ZGIakkPALKydtxb6Ea9XXfLXLNecfFWzXc4AOtri1GzlShvA2ZHGAu0
   7t5x50GZFrqb9X+AjxVFxXtMeLUh3/qRlPGLpG2yl384qFr+5L4zKAX+Q
   pSMPZ82UJuEFcmIGP8wmOJxXfXTS0BI4o0mXIG+QVaxhopis56LU66CV4
   g==;
X-CSE-ConnectionGUID: +YXUkXTrT7mqQon/xxjMKA==
X-CSE-MsgGUID: VSlT9XMVQ2mM1lY6YEcbHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26803353"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26803353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 09:05:21 -0700
X-CSE-ConnectionGUID: TjkFHyv/QvKs4FS7Q0PFig==
X-CSE-MsgGUID: TGjhEPryQla4E1veWCLYYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="72707372"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Sep 2024 09:05:19 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suZwb-000NOp-1g;
	Sat, 28 Sep 2024 16:05:17 +0000
Date: Sun, 29 Sep 2024 00:05:05 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 2628/16788]
 drivers/i2c/busses/i2c-imx-lpi2c.c:668:12: warning: 'lpi2c_resume_noirq'
 defined but not used
Message-ID: <202409290025.O3i5UQ1I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 212ab755514bb0cfcdcb3f498eb33e8b5e685457 [2628/16788] MLK-16713 i2c: imx-lpi2c: add runtime pm support
config: arm-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290025.O3i5UQ1I-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409290025.O3i5UQ1I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409290025.O3i5UQ1I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx-lpi2c.c:668:12: warning: 'lpi2c_resume_noirq' defined but not used [-Wunused-function]
     668 | static int lpi2c_resume_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-imx-lpi2c.c:655:12: warning: 'lpi2c_suspend_noirq' defined but not used [-Wunused-function]
     655 | static int lpi2c_suspend_noirq(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/lpi2c_resume_noirq +668 drivers/i2c/busses/i2c-imx-lpi2c.c

   654	
 > 655	static int lpi2c_suspend_noirq(struct device *dev)
   656	{
   657		int ret;
   658	
   659		ret = pm_runtime_force_suspend(dev);
   660		if (ret)
   661			return ret;
   662	
   663		pinctrl_pm_select_sleep_state(dev);
   664	
   665		return 0;
   666	}
   667	
 > 668	static int lpi2c_resume_noirq(struct device *dev)
   669	{
   670		return pm_runtime_force_resume(dev);
   671	}
   672	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
