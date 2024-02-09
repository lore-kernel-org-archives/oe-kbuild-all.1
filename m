Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D31D549
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 11:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707478467; cv=none; b=ACaU892asIZE7ELIdnFGNbNadwswXHjQ2S61i+hLVs9jMQBFwIkEeGUQ2N+0t4xPSwVJd5j0/Xq/LiW6JJlxj4I4/x2hVaA7u9LveY8jzlkhHhLADhvc4YiGcPOEqlCj9k3bgrJG0u7UFnmmFlvtqpc16gg7u+pDI07rY6mY6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707478467; c=relaxed/simple;
	bh=X2pXjjdiKEXiMsnZbcJWtvTapY+HeNW25hU31VbTGbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g2EZh4SUCp0u3Qv14DwVd7+qUH0pO8Uo44nkpdxXmUJHqyILMgdnrdA2A6iQaam9vfetfNxHbrv+JsiJJsCKdvqkeHyGOxIaT3NfmY8v65yAixQTBe9LiOVZFH82hjnGOqR1j7hLC3rejWE7kzUKr4l829QTifRY4ibOhNfmh9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kK9kUGpF; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kK9kUGpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707478465; x=1739014465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X2pXjjdiKEXiMsnZbcJWtvTapY+HeNW25hU31VbTGbQ=;
  b=kK9kUGpFwvsg6PmiEnTM0yoW/MuENEuXXxCap8Jns7+QZ0VN5NHRifLh
   dn0omMNS+GLoPawhKP0OLN0iZcXb6mkTjSPtaiNDtdWGsEwFrr6DWs8Y0
   P9k91W4MlEnN246bZVE1cJwbNyr3exATZWEGc7lK303PW20Ojdgf7AmaG
   wRPIaj8a6HJdyD2/gjaOXjpWJ5cYszZum7kMRn2q8F1O5pz3qmjHXIh0N
   BwC3/++hUPi/56EC6ux5njnKy1tcMRfslunWfYqO9CTItWkINrMEOiDjp
   4hNoctXZehHZrup0UD0sfy7pucGQLZJjFopQRTZPbQAp8WEyYf6hQzj8G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="18827603"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="18827603"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 03:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; 
   d="scan'208";a="6689325"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2024 03:34:23 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYP9B-0004fe-0C;
	Fri, 09 Feb 2024 11:34:21 +0000
Date: Fri, 9 Feb 2024 19:33:26 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 4128/17898]
 drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for
 'caam_sm_example_shutdown'
Message-ID: <202402091922.j7O0rGzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: 9a605b9455ed929a437d6908d1a8d02d85c28141 [4128/17898] MLKU-25-3 crypto: caam - add Secure Memory support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240209/202402091922.j7O0rGzD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402091922.j7O0rGzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402091922.j7O0rGzD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/crypto/caam/sm_test.c:505:6: warning: no previous prototype for 'caam_sm_example_shutdown' [-Wmissing-prototypes]
     505 | void caam_sm_example_shutdown(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/caam_sm_example_shutdown +505 drivers/crypto/caam/sm_test.c

   504	
 > 505	void caam_sm_example_shutdown(void)
   506	{
   507		/* unused in present version */
   508		struct device_node *dev_node;
   509		struct platform_device *pdev;
   510	
   511		/*
   512		 * Do of_find_compatible_node() then of_find_device_by_node()
   513		 * once a functional device tree is available
   514		 */
   515		dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec-v4.0");
   516		if (!dev_node) {
   517			dev_node = of_find_compatible_node(NULL, NULL, "fsl,sec4.0");
   518			if (!dev_node)
   519				return;
   520		}
   521	
   522		pdev = of_find_device_by_node(dev_node);
   523		if (!pdev)
   524			return;
   525	
   526		of_node_get(dev_node);
   527	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
