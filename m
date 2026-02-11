Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6EF346FB0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 03:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770781336; cv=none; b=L8Zn5FWzoOO6PviRtxAB2hWm8hWJNap97nWxHuORrGmPx1LM6ejlqzFB/zV605vY/B1OKJhKWwxIAGdbprAuRut6rMkFXykx2g0TFcuZ7neAqNvyNknQFhLUTg1M3mQeDlyY5yPZUlDl2m0O9u8SC6QNF4DtCL9NyaV8QWYikBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770781336; c=relaxed/simple;
	bh=IlPyzjoeBLbrfajCYdqWZnhfiVWNSxsuRnfoWfM85YU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dvR3lm/OJ520nMgA/w2SPWdMRQ0AKCl+aapwSuqD0RzDvT+Kg95k0PDs96zgEefFTTjnSBAzxJkbhv/2kcKeG9ZF8epqAY6BICliV2BYSwyC1KkXd6gzqkNE2GWZGgwI6ssaD/xickyeHGNMYGajnbf3nTuSzp7IJLMQ8uCUxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRoxuGBX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRoxuGBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770781333; x=1802317333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlPyzjoeBLbrfajCYdqWZnhfiVWNSxsuRnfoWfM85YU=;
  b=GRoxuGBXbDo6557BXlIvJnO6PdlEhJ61W3seH1wOcLB4wj+A1lJ1B00n
   jqjOyiq39593dnjV9IjWTX/ud1o+3DJSL/32DmkAb5jYbHUL8UazKlb7C
   vMwydbyvbcu2hSlNNb52Y7EUVHH1z3p5BkLzYXil/6fGa7xj+RuwoPXmL
   9V6diCavsqOIXhsRoRPTx5u7oI/pn+fqbsybkIeykJOF2KIzil4+93vET
   IsJDTo+Zvt9FXZLGmPVJYoKHVepqiLenWlogOLZsSfpy79M4+LHaBNtk6
   jYEaQ1aSaDW+O+vXGGGC5+4kaaJHQ/BXyMvNl/WjWT6mOhfzWnnJFN2fR
   Q==;
X-CSE-ConnectionGUID: bYztvDClQwSAlYn8n7Yu8g==
X-CSE-MsgGUID: HTXC6+EQT5SHotHKrddZKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71819808"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71819808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 19:42:13 -0800
X-CSE-ConnectionGUID: YVj5qstSQ/uO6BdFE1H5IQ==
X-CSE-MsgGUID: k+QYX856QQ64r1X/OWNtoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211175745"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2026 19:42:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq17A-00000000pdy-2tDt;
	Wed, 11 Feb 2026 03:42:08 +0000
Date: Wed, 11 Feb 2026 11:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 60/61]
 drivers/accel/ethosu/ethosu_drv.c:26:1: error: type defaults to 'int' in
 declaration of 'DRM_CLASSMAP_USE'
Message-ID: <202602111116.HVACgFny-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   b160ea7e81b14378daf7dc40cd85e1b26ebb6634
commit: 409d5f2c32913392326ac7923364665eca17c1bb [60/61] accel/ethosu: enable drm.debug control
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602111116.HVACgFny-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111116.HVACgFny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111116.HVACgFny-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/ethosu/ethosu_drv.c:26:1: warning: data definition has no type or storage class
      26 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
>> drivers/accel/ethosu/ethosu_drv.c:26:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Wimplicit-int]
>> drivers/accel/ethosu/ethosu_drv.c:26:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +26 drivers/accel/ethosu/ethosu_drv.c

    25	
  > 26	DRM_CLASSMAP_USE(drm_debug_classes);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
