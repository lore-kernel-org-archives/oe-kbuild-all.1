Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3226172BDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352015; cv=none; b=pBcV6OuzbcQFKc3zGTqnmTba66Sbi8vPuzSGa7LK43ewQoQZ/XNGLenFBwfv/KzyQYaK2pbDNxI5MwwMzigG3gbQcyepjyfcETbhnZt/fZl0CL+QZyd3B0Am0Lt8kJrzVlTiTMVjHBm7vkl4FUrRAwuehFVORXFA3AtL6DSYEpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352015; c=relaxed/simple;
	bh=djwe1PnNPePm1Lqv5KEoGcXJ+DsJCqNWAa5fUKNUj7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsj8u6X+8OXr+1AH/7BUkGVOevu3FvbkAwTf3D/BTAPLabZJNhVSxntVKc0blQ0kHCWSzA5czA/4fnM/ESwitviB7yAm6EG/7IPj2NggcvRKGcr+RBK2GuAyCNUMAuXPEmp5n07hrHOS3F/m6zyYzesZw7rpuy/Z2ozY12Co7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyEDFuFK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyEDFuFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727352014; x=1758888014;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=djwe1PnNPePm1Lqv5KEoGcXJ+DsJCqNWAa5fUKNUj7A=;
  b=SyEDFuFKBmulAPNuYlGJTb7+TEVsrRv9ARjmSmzcFzTp1rtkwMTvfve6
   guTh5aefsJkZZ0VFcQwyB0eCIv+ZramJWGm4YpEMI18aRZfAlKxqf9MkS
   aZiLPFzh0Tm3gfKxqhewMDMR3BuN98Nfksp+l3CtPXLQAW5zLysA/Vgur
   5RScNt68uDrG0J9LhT4K9s06C/OWbJaEzVKUjjSXxVcXLSMbl9oNcRgJd
   apbq8NGFqbc/coBIVFUaIWYlTYHAqgvi2Zpw/SCiKf4hL3hEbYAsp2q8q
   YXxpbp0xg18H/g3+h/iiEj6TWxaVPVqm9XMHr26x6HZrVskwds159rYxK
   w==;
X-CSE-ConnectionGUID: ACdK6m4FTTycMRqIKxil9A==
X-CSE-MsgGUID: 3BUGJSLvTb2q63O28hauHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="51856136"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="51856136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 05:00:13 -0700
X-CSE-ConnectionGUID: pwo2RyUPSM+lAExOvj2R6g==
X-CSE-MsgGUID: ExF5y75uQQecZjwYOXh6JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="72926845"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Sep 2024 05:00:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stnAH-000Kfl-2M;
	Thu, 26 Sep 2024 12:00:09 +0000
Date: Thu, 26 Sep 2024 19:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [esmil:d1-6.11.y 41/47]
 drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning:
 'st7701s_ids' defined but not used
Message-ID: <202409261958.Lrz4zRHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux d1-6.11.y
head:   d99b769766ff1b1ced32d8d279d28e581e02fa9d
commit: 51bda0979ee92a0aac9def03dd9716f7b032d4bb [41/47] drm/panel: Add driver for ST7701s DPI LCD panel
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240926/202409261958.Lrz4zRHj-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261958.Lrz4zRHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261958.Lrz4zRHj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701s.c:426:35: warning: 'st7701s_ids' defined but not used [-Wunused-const-variable=]
     426 | static const struct spi_device_id st7701s_ids[] = {
         |                                   ^~~~~~~~~~~


vim +/st7701s_ids +426 drivers/gpu/drm/panel/panel-sitronix-st7701s.c

   425	
 > 426	static const struct spi_device_id st7701s_ids[] = {
   427		{ "st7701s" },
   428		{ }
   429	};
   430	MODULE_DEVICE_TABLE(spi, st7701s_ids);
   431	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
