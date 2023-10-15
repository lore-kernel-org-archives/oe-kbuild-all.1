Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E132EC8EA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxMWbV6o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697392302; x=1728928302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7g0P1nKh4SuHiS9MtQIiOTsT+SspU924YpkzBIHFKI=;
  b=nxMWbV6okVIF4RT4hShASV+rdpI5RNjJ8ugzOW9enxUSV51NNgbPsHCA
   Hi7/81pvRv+/1wEcXe1efzSyqB+MrOICOxXo1OKYDM3k+9Yk8R6lwMvZm
   OYrW/vWEz45pPv3pOFRKBe9UiTWkgzQkptfiAUrQqfNZGb8wMsr+Soq/6
   2jGuqzetvfCBDr1RmGw9zSUOqKhC2nC8leHwNX/OWFh8DtS3GxZVyF8Rc
   ZZGUG53q7/GDb0fZipv5eQHsDXU+yiY/W6KNSb18y7J6sfGXRE5briX/D
   NyNSZteHnRpxIJHZF3z7wplY5h4ux+bEGl905ZVPZFRllxklS8klgL8p5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364771699"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364771699"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 10:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002653896"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002653896"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2023 10:51:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs5H8-0007ed-2S;
	Sun, 15 Oct 2023 17:51:38 +0000
Date: Mon, 16 Oct 2023 01:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 608/30000]
 drivers/gpu/drm/imx/dcss/dcss-dev.c:64:13: warning: 'dcss_busfreq_disable'
 defined but not used
Message-ID: <202310160157.7K1gOD3k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 249ae4933e7a37449e0c27ae87b6566614b917a3 [608/30000] drm/imx/dcss: add busfreq support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160157.7K1gOD3k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160157.7K1gOD3k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160157.7K1gOD3k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/dcss/dcss-dev.c:64:13: warning: 'dcss_busfreq_disable' defined but not used [-Wunused-function]
      64 | static void dcss_busfreq_disable(struct dcss_dev *dcss)
         |             ^~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/dcss/dcss-dev.c:54:13: warning: 'dcss_busfreq_enable' defined but not used [-Wunused-function]
      54 | static void dcss_busfreq_enable(struct dcss_dev *dcss)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/dcss_busfreq_disable +64 drivers/gpu/drm/imx/dcss/dcss-dev.c

    53	
  > 54	static void dcss_busfreq_enable(struct dcss_dev *dcss)
    55	{
    56		if (dcss->bus_freq_on)
    57			return;
    58	
    59		request_bus_freq(BUS_FREQ_HIGH);
    60	
    61		dcss->bus_freq_on = true;
    62	}
    63	
  > 64	static void dcss_busfreq_disable(struct dcss_dev *dcss)
    65	{
    66		if (!dcss->bus_freq_on)
    67			return;
    68	
    69		release_bus_freq(BUS_FREQ_HIGH);
    70	
    71		dcss->bus_freq_on = false;
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
