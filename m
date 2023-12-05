Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510706FCC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K++ggC0m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701812815; x=1733348815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lj3NHY0041nZyRSpbSOernijuFktdV2k+8wgDO/KRYE=;
  b=K++ggC0mkqOnByVg/Xpnu41BWacTeKoohNPHZ4299u/T5gqcMLbx1/Xz
   Um+IlYHE8Z5JBDOhlp9Wyxx05d9ffmH46u2bzsa3ZEZGNsNnfrnU3p8Wp
   N5Dte6I9KElLdML6gUxnFiHuy5WCVpUvc6eilur1wiuUj6dVEN1Yw3yPy
   EHD+MYcaPQvxHdjE9Y0lqVZQLhzyOAC80agwcNUmTqfq9Vg5vhEcZkZv3
   zJnfkezN5wBeTNt2qgwwiqvjAbLBucxP1J4LPKNySo5+LDD8lyYnvn7Vf
   4jKYPZDl7Ppd8jcAZg2JXx6Rvgw/gTIGvM1/mfFJfDiAjvyTaL2gT9fZM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="396754044"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="396754044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 13:46:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="19110308"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2023 13:46:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAdFj-0009lu-20;
	Tue, 05 Dec 2023 21:46:51 +0000
Date: Wed, 6 Dec 2023 05:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 3/3] drm/i915: Compute CMRR and calculate
 vtotal
Message-ID: <202312060546.Sa5v5w9R-lkp@intel.com>
References: <20231205183700.841096-4-mitulkumar.ajitkumar.golani@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205183700.841096-4-mitulkumar.ajitkumar.golani@intel.com>

Hi Mitul,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Mitul-Golani/drm-i915-Define-and-compute-Transcoder-CMRR-registers/20231206-024340
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231205183700.841096-4-mitulkumar.ajitkumar.golani%40intel.com
patch subject: [Intel-gfx] [PATCH 3/3] drm/i915: Compute CMRR and calculate vtotal
config: i386-defconfig (https://download.01.org/0day-ci/archive/20231206/202312060546.Sa5v5w9R-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060546.Sa5v5w9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060546.Sa5v5w9R-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/gpu/drm/i915/display/intel_vrr.o: in function `intel_vrr_compute_config':
   intel_vrr.c:(.text+0x3a1): undefined reference to `__divdi3'
>> ld: intel_vrr.c:(.text+0x3c4): undefined reference to `__divdi3'
   ld: intel_vrr.c:(.text+0x4a5): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
