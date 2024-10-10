Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F873D6B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728541914; cv=none; b=KbOYPb3u1+7emdiyGEmNfAqNzGqde6up5ElwyNpzt9fZyc0JUnG7lUcHSaBsdrhS4P228juylHxflJU0SMSjaTcGULy6x5+rDEOMWp+oiKkLysKTUn1vSuHy5Zbczacn9QZqnNyBJooC1AVGtAUUXMYGWlVcROku4lhpjLmi5UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728541914; c=relaxed/simple;
	bh=nEB9CnaFyHshzLVDKmeAOsnYguvl0Nqwa5hDfbG0WWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WPgmB8/IVQzeyE3EtCfY/iyF6xEV/8/KYm0Fa07tBF2KM4NripRC8vCpsJlRSUOfsHFQ+3/w3M/4+0Unc94psb1VCQ/ImTiP0+M82vN+G+jQOlsfyW3nhitDiQefzWaO7N9pL038Z9RxdnmNrKA1kn03ojBPlv/8QWZxu/otsRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZoFPEbW5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZoFPEbW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728541913; x=1760077913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEB9CnaFyHshzLVDKmeAOsnYguvl0Nqwa5hDfbG0WWQ=;
  b=ZoFPEbW5jGNHm6+YXprnZ0YbOAQ4NTXs8U4hR2F/c0vGdgpxm0CHMblQ
   PLG4n24SCRXLctlNnrZK9pjC3k6lMkddeleDgtGTknnrlmwtr8WDtVTc/
   rlsYemFRj4JQfWsLXAh7MSFZDcBJN2L4/piuJrrdrKi98rhkOGtq9wUPd
   C4jS44r0i1zwyuPrxK4le+KIk78LIATdPSHlAaBhNj+t7QEumwVPtO4VX
   O+UHk2V+EAqFQuxAx0RtpHn5vN4Y0cZwblB+A2ZVYCIZ9e97Rpy6TKoUg
   U49y2ED4QHadW0qY2bcE39bHcNH4hzvpbNYzyBnaowjM1Zqhp1K4i5YGO
   g==;
X-CSE-ConnectionGUID: JzAZXphCRXKoJQWzZiVZGw==
X-CSE-MsgGUID: 1mxFKlY4Sz2GCq4bq4+cSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31580391"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="31580391"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 23:31:52 -0700
X-CSE-ConnectionGUID: F/fi5L5eTCeXyioYpl7YlA==
X-CSE-MsgGUID: nfJXybg4Q0K4bJRw3RX39A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="76809553"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2024 23:31:51 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1symiC-000AHB-2p;
	Thu, 10 Oct 2024 06:31:48 +0000
Date: Thu, 10 Oct 2024 14:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: "steve.jeong" <jkhpro1003@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-5.15.y 137/204] ERROR: modpost:
 "phys_mem_access_prot" [drivers/char/aml-gpiomem.ko] undefined!
Message-ID: <202410101407.xZthHOaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   2402b85f3675cd92c0ba7cb5f051596e07bd3971
commit: 0a01b3c15e7c03cfbd687185d96a66d0cca87069 [137/204] ODROID-N2/C4: char: Add /dev/gpiomem device for rootless user GPIO access.
config: i386-buildonly-randconfig-004-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101407.xZthHOaH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101407.xZthHOaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101407.xZthHOaH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "phys_mem_access_prot" [drivers/char/aml-gpiomem.ko] undefined!
ERROR: modpost: "phys_mem_access_prot" [drivers/char/exynos-gpiomem.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
