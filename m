Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC322EAE5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726955170; cv=none; b=ok0EHNuxYPxbE9cdeoXdGTZfo1l99lqtolsSVJAo3wGRZLq+OFOZADixkHTs5IL5UIS0lpDUYpWJAPqa8UN9sSitigVkM2dH4geYydOM4WUd5VGWIW6CNJFYJpUUZh7JWjQ74YHCZRJXmuF9qFXuV9Sntl9cq4LneFqO41D2jM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726955170; c=relaxed/simple;
	bh=wCwkl2ahzjHkozmSYNnsPO2B6c1N+7G1hNFeRjY3Au8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kfh8YqQs+mahwCQFpPklKyAFNcsY54tOlswWD1XbZOmQ7ZgrRloAX0dwvsmFewO0K1oU4ARIbL2LMhuTUfI51TSPSwQMMTNcCz0LlYhW6isYCqpqQ17cUDeup6cK4WrE/ZaDtnVCTOESH1BXmUXS3kSajnumSVQiVZLXcywC1VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j03GKON2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j03GKON2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726955168; x=1758491168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wCwkl2ahzjHkozmSYNnsPO2B6c1N+7G1hNFeRjY3Au8=;
  b=j03GKON2oe6BYvRYqOXbttg5C4j+Y7WEeReLBBnYedsB0zSamwRdgH5o
   Xs20vh5QqRxXjnhrhpMEEuxdKdFSLzne4p/Wd6cQI0Hgu0V5PufvPlh8Y
   VDl/y666MgdUHKAe6QBzU3+EYnKIAx9dXr9V7FpsoC3sSvCdBtL5Qe+vN
   w0FsTbGShHz7hVXbfDy88rvm+fUrSbmADUnR2e0Vgv3t6MZldMbUAjKX5
   dGgV8ihOhJy/wOIu7Hf7BeJc27bp7esCarUojNnLDN6Fefl8DVU1Yg3dg
   RvFCTfh/WBUULa3c6/QFwMDVW2glaxk/DyrlIobeHC3/PfvTOL+DkFY2o
   g==;
X-CSE-ConnectionGUID: xlDfRM/PRuCUnheQkTZYDg==
X-CSE-MsgGUID: HeSRUgxLRm6TCuO5QKswOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36508835"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="36508835"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 14:46:08 -0700
X-CSE-ConnectionGUID: Uvp1Qi6nTzqFxeGdoawLfw==
X-CSE-MsgGUID: +ELAuwTWSn2k6iK/7ct6PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="108095024"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2024 14:46:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss7vY-000Fos-36;
	Sat, 21 Sep 2024 21:46:04 +0000
Date: Sun, 22 Sep 2024 05:45:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 1067/16782]
 include/drm/drm_of.h:87:12: warning: 'drm_of_component_probe_with_match'
 defined but not used
Message-ID: <202409220821.fhMaSB6b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   d023c381fa6161a7af966abaad8e7d9a997f07e7
commit: dcc7dc895c2b1880da843c82b41c0ed26c5c5756 [1067/16782] MLK-16290 drm: Add drm_of_component_probe_with_match() helper
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240922/202409220821.fhMaSB6b-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220821.fhMaSB6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220821.fhMaSB6b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_bridge.c:34:
>> include/drm/drm_of.h:87:12: warning: 'drm_of_component_probe_with_match' defined but not used [-Wunused-function]
      87 | static int drm_of_component_probe_with_match(struct device *dev,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/drm_of_component_probe_with_match +87 include/drm/drm_of.h

    86	
  > 87	static int drm_of_component_probe_with_match(struct device *dev,
    88				   struct component_match *match,
    89				   int (*compare_of)(struct device *, void *),
    90				   const struct component_master_ops *m_ops)
    91	{
    92		return -EINVAL;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
