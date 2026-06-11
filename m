Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7F37CD27
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 09:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781170613; cv=none; b=eEykT+CvIGW5eTf0GLGYX5INsF7symgNQqUFKolfxxMor0zurIF+CiSf2fhcopEH2dX+bgvX+LgGQ+vqMyzvV0tuRojPauyH/yHmNRo8IPxKXkPSnIF6Ow47W3XCDFyYzAgQEP21LkurRFoktEHcaNJyyDMhzAOtyTVtwp2//t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781170613; c=relaxed/simple;
	bh=2kcV9tzPfbLiA/nERkGhHBgxHzAgkdWV5jxbhsYU6HE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xgr1lrb6eY8uWbMiSnK4+iCVhokvEE4t0NqIs4ujoHd1k9eVXj6+S4l8Vw0Y5bxLl63xXS+DoXyUdoQjnEHKhSDTkZG8f1Jwn67qTbV1rjVqAssIEVNCbKzdvsUSA7sGlm9sJI2zEDz/ohzCapGztNu9Pll/BUpCvxsZ9NXso10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XnrDBZWc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XnrDBZWc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781170612; x=1812706612;
  h=date:from:to:cc:subject:message-id;
  bh=2kcV9tzPfbLiA/nERkGhHBgxHzAgkdWV5jxbhsYU6HE=;
  b=XnrDBZWcpQhfzr78MD1Gh4ssa7brrUY37KAHyilFAqfrgs0cIm2LHwvq
   yNL+0GnbDGmuoqYMyn6/QDfEVUwvZCrt16EmNkpLi6Oi02FJO1+ah4I08
   zhSR4EkVNfsl93SQIFNJNGcWYUqVF8NDBhXTfK1DBxevovdje199fFgcV
   U2jzVGUXSb/JWiomRyqYXGsk6Emr7axn74BiKYIq4CzVz0Weeg7YDCAEK
   LKgm8GUq6+SUFnvQbXYEIVLZCf/zoKh/wGrCLBNEb4xUfDxNleQdnni5c
   931TWJA+e0e6FWgctf7h6RnMnTiXuTRI0nwtxZI/vRmdcLspqnHeTThLd
   g==;
X-CSE-ConnectionGUID: kPCuW9f2TVamyXL7TksCdQ==
X-CSE-MsgGUID: DOjltCxUQI2MJBgyhW1UIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82040631"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="82040631"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 02:36:51 -0700
X-CSE-ConnectionGUID: 9Vq/fg76SXeBJXrEO6djHA==
X-CSE-MsgGUID: XMTVNdYKSey/vGKfpEqj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="242004458"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2026 02:36:49 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXbqB-00000000Mho-0xxF;
	Thu, 11 Jun 2026 09:36:47 +0000
Date: Thu, 11 Jun 2026 17:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Hovold <johan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Ulf Hansson <ulfh@kernel.org>
Subject: [ulfh-pm:next 12/12] drivers/pmdomain/core.c:36:23: warning:
 'genpd_provider_bus' defined but not used
Message-ID: <202606111746.kAxaAbwg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git next
head:   ea1ca762328194de780a8e92df0b2e41bf6eeed2
commit: ea1ca762328194de780a8e92df0b2e41bf6eeed2 [12/12] pmdomain: fix early domain registration
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260611/202606111746.kAxaAbwg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111746.kAxaAbwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111746.kAxaAbwg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pmdomain/core.c:36:23: warning: 'genpd_provider_bus' defined but not used [-Wunused-variable]
      36 | static struct device *genpd_provider_bus;
         |                       ^~~~~~~~~~~~~~~~~~


vim +/genpd_provider_bus +36 drivers/pmdomain/core.c

31cb75077003ac Ulf Hansson  2025-07-01  34  
31cb75077003ac Ulf Hansson  2025-07-01  35  /* The parent for genpd_provider devices. */
a96e40f4afdcb5 Johan Hovold 2026-04-24 @36  static struct device *genpd_provider_bus;
31cb75077003ac Ulf Hansson  2025-07-01  37  

:::::: The code at line 36 was first introduced by commit
:::::: a96e40f4afdcb52a9c97a5465c964e010734d105 pmdomain: core: switch to dynamic root device

:::::: TO: Johan Hovold <johan@kernel.org>
:::::: CC: Ulf Hansson <ulfh@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
