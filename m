Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1022741AB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 04:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766032835; cv=none; b=mbhTiJ2Ut3y1tDVu5lQMljAEaJSIm2TfJLAeVgbKAsKpQioh6mH7XeRhlnVGxq3cieefj6lM18JybGfVPUh4DQb5DAOXE7gWwMZQ0hoM48+88IpOyueBtn/ApqcgdZ/gXbGci36iZUxUoz3k2LozEQXW0GqoAFf8SRCGxyv/NhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766032835; c=relaxed/simple;
	bh=EdAyScp6pBafd0fzy0EHi9auR7qJ9UDV0wbPQrHs+w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qnlSs0oQHWA+sN9elUySahGjk7zMerXv5ui5sMiWlAI9bhwwoiq3yaORgfxpkisqFnhT2vGAVbppwtdYD12JFWqNC2kMdW6/qjJ11OJRvabKy7vWgPzurChzwh0iNErLofaO3Y5t7qJkzHvZ43NGcyfXgj6RKIT5Jk7i1OC8GT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cov1oyb9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cov1oyb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766032834; x=1797568834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdAyScp6pBafd0fzy0EHi9auR7qJ9UDV0wbPQrHs+w0=;
  b=Cov1oyb9Eh8AFb8CUWCnMarlG8lyDNM38MPfgwdLsCXtTH3Xc9EjtCsl
   py4NQ58FZsOmmUsFrqA4hUCcR663l8Cbw0CEkycoOtdnLl3qOD67HDAtD
   farmnbIEMKk5fBAa/hXvBIk4c1UyHzzhooYmDje/F6TMDsipwKeN+CY17
   wmq+AKedtAZxNAxxyruwdOTTF39M7CDRymmkNepotqWDdXVyfjfx5/Tpi
   lWTUBdnPL1nJDCk8FQ9DThy8GGqcJIrqQK+ZiuYEwfCfEd9Hw9j7MtTQk
   vGD67vfgOekVZVJXDNkb4K769mxXePDig7EoH0yn/7DDTEHXc4WKWN878
   A==;
X-CSE-ConnectionGUID: jm/gn8xnT9WKdqzkc7VUqA==
X-CSE-MsgGUID: jN9tiPN0TT6EaM2FzC6jzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78295634"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78295634"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 20:40:34 -0800
X-CSE-ConnectionGUID: rCHe101XSwmDYcG/nC/BAA==
X-CSE-MsgGUID: 8weFLhaaRIG+rLN3zPCPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198729056"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Dec 2025 20:40:32 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW5oU-000000001aI-09Pt;
	Thu, 18 Dec 2025 04:40:30 +0000
Date: Thu, 18 Dec 2025 12:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:undefined
 reference to `xe_configfs_init'
Message-ID: <202512181211.UgYxbE0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 16280ded45fba1216d1d4c6acfc20c2d5b45ef50 drm/xe: Add configfs to enable survivability mode
date:   8 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181211.UgYxbE0z-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181211.UgYxbE0z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181211.UgYxbE0z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
>> powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
