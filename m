Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F1C79DC5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709502126; cv=none; b=OrRyVi27ADrFsm7SQ6XxkscHtfbqiJJmA5ArqzmtMRZywuBjBZvuu4mZuk+QPTWkW4Xdiq4wSqQrYNoTwowXix2obd+NXzSrDKNGTXeVnCfI3cGpoaWmh5ins/Esny63cUPCDYZNlKLrdSnBYf/ZQI+CqnmsD2eFfCqMHhKg2Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709502126; c=relaxed/simple;
	bh=248Rh+tdcAIhLkqBHDqUzXabX9I58tsGEpkU3RCnD/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pi2xTo5i0FfJc+xvENad8O+ZhOkLCfCzgs1tI23WKG0VQ6Lme9PCt5VdMw7j53bnVZ3TaouIfZUpUFGbdhaqRNhJnl/VkTutfR4KkWhiBY07fsE0iKns13lhe/IIpN2LLZOyEdB56hBV8KJzCUTBtEzpv8qC0QGrcVHRMKg05Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLl7Ev8W; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLl7Ev8W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709502124; x=1741038124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=248Rh+tdcAIhLkqBHDqUzXabX9I58tsGEpkU3RCnD/I=;
  b=MLl7Ev8WWeKkDkaj6/K7iYeWu/f6bJ8QR4as/xp9aEY3qTb5R9ySizQa
   hpY4kuZ2gxTe/DwUnon05pai+eFvrSVT9YrltNd1SxxvosJq4CohodKQ2
   dIUskweMhh8ELjH+4XKJBk4rMW4j0TvLXxer6vrR1nElweoRPC+de68yf
   IF2+P99d1jAQBXA3fftaqcUclSsrwhxr1RMJH26PaNKofYUVhx2mQXrPA
   VuXF17yfp2zcJgiwZjEC/x3VE2m6eCNEapJCcSr8JKpqaiVUbd+xO/ifs
   U4/J7cuYzhNNzYhES8xICVfHOJW0rBJnWWvC1dX9MtqC4EXbmeCOyc0fv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4149198"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="4149198"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 13:42:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="13348316"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2024 13:42:03 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgtaq-00027w-2t;
	Sun, 03 Mar 2024 21:42:00 +0000
Date: Mon, 4 Mar 2024 05:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 6157/27938]
 drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for
 'check_m4_enabled'
Message-ID: <202403040543.MSHoez7G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: afbf4e009ee7f83d492eabf1144fed73e9112a42 [6157/27938] Merge branch 'clock/next' into next
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240304/202403040543.MSHoez7G-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040543.MSHoez7G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040543.MSHoez7G-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx8m.c:279:5: warning: no previous prototype for 'check_m4_enabled' [-Wmissing-prototypes]
     279 | int check_m4_enabled(void)
         |     ^~~~~~~~~~~~~~~~


vim +/check_m4_enabled +279 drivers/soc/imx/soc-imx8m.c

d1e806347e888e Dong Aisheng 2019-04-19  278  
d1e806347e888e Dong Aisheng 2019-04-19 @279  int check_m4_enabled(void)

:::::: The code at line 279 was first introduced by commit
:::::: d1e806347e888e13d6fdddb28275dbce7fd9f780 soc: imx: fix build error of missing imx_src_is_m4_enabled

:::::: TO: Dong Aisheng <aisheng.dong@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
