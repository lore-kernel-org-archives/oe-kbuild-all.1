Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D784198A17
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 02:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782699120; cv=none; b=A1cniYiTQSbaC/xJXc9kxYnImnGLo7tLfsqnJFqnCd+s28XSpRJFDXK3N94r4BwUEev6/+8j/xcmLAFN+4Mz8Xv4qQ/NG/PwdlIyN5XOcskcmiJdW8aOXWpSOWSwJlgp9v1E1UzxCLp7uulcv2bOLQK2AovmMmZjEOBhxAtDnJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782699120; c=relaxed/simple;
	bh=BiWHXR2DdxaaDOBjMeE3fDJUiRTYdd5SP6x9fztCB1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pNNG9uAjhc1Kx+M+CznRRjBAchSazCwhlHrBRRRI0q2nNyuzDZAWrbZ4NxJ33nxD2WPCpQt/35DQ+i83znaQaiNYZbLR13xUYE2ESnLGNFUhDy/aoCVapUUMr+/ws1vTTEt+j55x3m2HBnrLpxT/+AeBxnaUSyKAw63hSLvXJFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Efmxq6Gy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Efmxq6Gy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782699117; x=1814235117;
  h=date:from:to:cc:subject:message-id;
  bh=BiWHXR2DdxaaDOBjMeE3fDJUiRTYdd5SP6x9fztCB1I=;
  b=Efmxq6GylmUWaxZ+Hfrm/+zmK1822X/B41UtU7DgaKfoGUT53mguUyAe
   xAd+OhIBT1Fv77YrWvOgBJpSgnvZGVRbgAf3JgwB8BRPGmoQOcZEVNldF
   R4BfSqWxexZt8cAYnqzOwXUoHYmgccIZ0h3JYI7lzN/lpEJWCpDDa9Stn
   sjJFHaoxdwSAdJkUHssz6xpNstAZ3H27uAwBlRVbb+glVDXQEqWGBoC9E
   UstiD6+KA6VBGKKDHdV5PUc5ArMpOcB8/7rZI+GM6sgzeGa9LGBHKKuAV
   gpiDEpiFUAu1wBkk36H2c3WsK+dykQ2pJGdkDH3U9+tXzWMvKMvIduZ0r
   w==;
X-CSE-ConnectionGUID: f0VTeO/UQ4afl3mb5IE7tA==
X-CSE-MsgGUID: 2hZ+T5t+Sk2r8w+/d/sEkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="100924202"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="100924202"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 19:11:57 -0700
X-CSE-ConnectionGUID: z2q6jxeZQPm/xK3xr+GdUA==
X-CSE-MsgGUID: UDRfI2+PT+G53c/V8n/8Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="256231863"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jun 2026 19:11:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1we1TU-000000006lZ-3hlh;
	Mon, 29 Jun 2026 02:11:52 +0000
Date: Mon, 29 Jun 2026 10:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/030-misc 7/15] Warning:
 drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not
 described in 'genpd_power_off'
Message-ID: <202606291031.UnPJN0tw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   a747aa2ebd844e3946a05eb54c91161253d7fcac
commit: 99edfbfe21959856f2e33c9756f2cbcc1c765cc0 [7/15] PM: domains: Add a flag to defer power-off until all consumers probe
config: sh-randconfig-002-20260629 (https://download.01.org/0day-ci/archive/20260629/202606291031.UnPJN0tw-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291031.UnPJN0tw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291031.UnPJN0tw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'
>> Warning: drivers/pmdomain/core.c:980 function parameter 'one_dev_probing' not described in 'genpd_power_off'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
