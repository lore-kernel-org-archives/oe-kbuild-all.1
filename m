Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DBD1B983F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813151; cv=none; b=WVIZXcdPa5mS2tri1B2Y+DuVjPk5Rqu6dV6X451OF0fO9oQXNWK3JUooJJ7h+giwYowxKMblqKmxCrBij7rETKzaI4yL0rKaoG5YPHumRM4TmJ6CB5JmgfVYIMYuwN46HSz92bmORvhJ+UkAYTHDQt0c4UksMXYOWsiUSqH2AI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813151; c=relaxed/simple;
	bh=gKqsUY8QiFOiqbi69Ne3X2+9oK3B3tyFLBelCaADXTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWaB5dYCUfx3MlsK6kwD1RPAT0JKAfS77nVAe0bC2tQGtlg3Kw2KlSin8l/WBBZYviHrElJwe2Tc2lpRoLWGI94JQVudRx89TbefOgPXs0sMPFCrffOUNC85MEQ4YDpjJzEKomdhsC/t2EVVgeQx088gwYYpnnKUvDFHED20TRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRzzLydh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRzzLydh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770813150; x=1802349150;
  h=date:from:to:cc:subject:message-id;
  bh=gKqsUY8QiFOiqbi69Ne3X2+9oK3B3tyFLBelCaADXTQ=;
  b=JRzzLydhMuHD76FqSPd67sMo5Dg52raa6k9xgIAMC7sYKobioOZthLYO
   9S+S0GTOTmK6vzp66JzCNDgFwUha1XFm3fS6Lb01uQkr8IQyY2utbsMuC
   9OyxP0LG4y5ndh7ua0zGfMRSRoqNnEytmr3zbQLNWbTBULXk2MZzhHi/i
   y2C5CL0akgQTvTn+0xS5TTrQ11pl+2YCqRrLjZp7DkwfP6/o7GNkACHU1
   chFDvvNqhmsZ0Z+wR16usa6nJztqylplJkjyiZOscChN5sa/XQa9NQ9/r
   k14M5Klue5V+AVGqRauMhASqO3wWfwUFwCBV+ikSEC9T4Rqo5utLe9ntL
   A==;
X-CSE-ConnectionGUID: OO2pO2rkRCC4ydL1xNpg3Q==
X-CSE-MsgGUID: EiBFHw77S0+LdNj1Ua86zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82596826"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82596826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 04:32:30 -0800
X-CSE-ConnectionGUID: MXSdDXjsQHijgetgHVpAoQ==
X-CSE-MsgGUID: Afu+bkvdQJ2flQWJHaccJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217198190"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Feb 2026 04:32:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq9OL-00000000pyA-3wbT;
	Wed, 11 Feb 2026 12:32:25 +0000
Date: Wed, 11 Feb 2026 20:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [geert-renesas-drivers:master 13/53]
 drivers/gpu/drm/xe/xe_survivability_mode.c:241:17: error: implicit
 declaration of function 'xe_nvm_fini'; did you mean 'xe_nvm_init'?
Message-ID: <202602112026.Di2Vv6FF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git master
head:   7f66ef0ac030a3da0d0a0e8c0dfee1aa9c266dfa
commit: 2f8a7331e1404f4364092565c145c7cf3cd377d4 [13/53] Merge remote-tracking branch 'drm/drm-next' into renesas-drivers
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602112026.Di2Vv6FF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112026.Di2Vv6FF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602112026.Di2Vv6FF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_survivability_mode.c: In function 'xe_survivability_mode_fini':
>> drivers/gpu/drm/xe/xe_survivability_mode.c:241:17: error: implicit declaration of function 'xe_nvm_fini'; did you mean 'xe_nvm_init'? [-Wimplicit-function-declaration]
     241 |                 xe_nvm_fini(xe);
         |                 ^~~~~~~~~~~
         |                 xe_nvm_init


vim +241 drivers/gpu/drm/xe/xe_survivability_mode.c

5e940312a2ac64 Riana Tauro     2025-01-28  232  
d40f275d96e890 Lucas De Marchi 2025-02-21  233  static void xe_survivability_mode_fini(void *arg)
d40f275d96e890 Lucas De Marchi 2025-02-21  234  {
d40f275d96e890 Lucas De Marchi 2025-02-21  235  	struct xe_device *xe = arg;
1987ea95ac37ea Riana Tauro     2025-12-08  236  	struct xe_survivability *survivability = &xe->survivability;
d40f275d96e890 Lucas De Marchi 2025-02-21  237  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
d40f275d96e890 Lucas De Marchi 2025-02-21  238  	struct device *dev = &pdev->dev;
d40f275d96e890 Lucas De Marchi 2025-02-21  239  
1987ea95ac37ea Riana Tauro     2025-12-08  240  	if (survivability->fdo_mode)
1987ea95ac37ea Riana Tauro     2025-12-08 @241  		xe_nvm_fini(xe);
1987ea95ac37ea Riana Tauro     2025-12-08  242  
f4e9fc967afdb5 Riana Tauro     2025-12-08  243  	device_remove_file(dev, &dev_attr_survivability_mode);
d40f275d96e890 Lucas De Marchi 2025-02-21  244  }
d40f275d96e890 Lucas De Marchi 2025-02-21  245  

:::::: The code at line 241 was first introduced by commit
:::::: 1987ea95ac37ea3f9299d220974676207d5262f6 drm/xe/xe_survivability: Add support for survivability mode v2

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
