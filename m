Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B25B2900
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723951682; cv=none; b=l2aPT9KPF8VM/JGgoq867H1sBaYwPScKOS7b2TnRiJfXEcDFOYxVZSe0Nj2dREF8IcHffKaEPJPCHCeay1s+Yr1ULSH9WnxFoQW/Ovswfhs1PvE08ZRsURv5kRCKI6kJ8X6h1oo2CKBu9fWCpxfimPYC7sxF58C/B5v2tKV0/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723951682; c=relaxed/simple;
	bh=dFso1dDDy6ouhErClVMtTz8AGyv7l7S9ybkjUJGLDJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJvBHH9VRnJlUfdxzdeQRiJ9nj+kw2cGAkVLjMBq55RpHYBw8vKIGVEnxhZM2j5UUmWCKS4LlZaTYqL0pccmS36QCATXKMz6qTpiC1SLJsv9MGPGo/a0ZwFP81H82WWq+D/t1dF9VY7uHFOmCRb8Fegi7WnNl7IKdWw4pjYJdDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxbYb4vf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxbYb4vf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723951680; x=1755487680;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dFso1dDDy6ouhErClVMtTz8AGyv7l7S9ybkjUJGLDJw=;
  b=dxbYb4vf5q3fV+wC7foHsDdM+f8wLKyB0aelC7UEUCk0smH0eLPf6XSa
   0j3huaSk1IA8cFqLTFTmNl2K3XD7qdKM99XiIGVo0JbJ/VHpPTh3FX9XL
   IMz+ITc8YEY7efP7pquwyMWnEWxKuaLRnMMnvFy43eA5jrF1Fn2NSSGCu
   c5g/KSu2XtIo6dlQoSjUi7WdbThsNlL+YcufUlyR4QspxLGIcLaJtCh+a
   1xGPU0frEsJdaAULiTupi3dNWE/2O29GM4qEtOEwMAN5P8L+kb3sRAMbJ
   4DXJO5qzkfN9Y1XKbXwV+nS6NRoFCIwdi1HG6Vp25QQoAgbAQuovarQm8
   g==;
X-CSE-ConnectionGUID: Sq9jxEgUSDqSOz/yh4+7IA==
X-CSE-MsgGUID: xvzViEJZSdaYHNHAGwN+1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="33364955"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="33364955"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 20:28:00 -0700
X-CSE-ConnectionGUID: OIp6vdf1T86iT5M19xPcrg==
X-CSE-MsgGUID: blWFVuMhQjq/27ElDqXKFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="83253598"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 17 Aug 2024 20:27:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfWaC-0007yg-2G;
	Sun, 18 Aug 2024 03:27:56 +0000
Date: Sun, 18 Aug 2024 11:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Pardee <xi.pardee@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 6/7] platform/x86:intel/pmc: Add support to Retrieve LPM
 information
Message-ID: <202408181156.VDhT4cAF-lkp@intel.com>
References: <20240809204648.1124545-7-xi.pardee@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809204648.1124545-7-xi.pardee@linux.intel.com>

Hi Xi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xi-Pardee/platform-x86-intel-pmc-Remove-SSRAM-support-from-PMC-Core/20240810-114100
base:   linus/master
patch link:    https://lore.kernel.org/r/20240809204648.1124545-7-xi.pardee%40linux.intel.com
patch subject: [PATCH 6/7] platform/x86:intel/pmc: Add support to Retrieve LPM information
config: x86_64-randconfig-104-20240817 (https://download.01.org/0day-ci/archive/20240818/202408181156.VDhT4cAF-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408181156.VDhT4cAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408181156.VDhT4cAF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kasan/kasan_test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/ch341.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
>> ERROR: modpost: "pmc_ssram_telemetry_get_pmc_info" [drivers/platform/x86/intel/pmc/intel_pmc_core.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=m] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
