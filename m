Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D312DE708
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 23:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751499226; cv=none; b=o7uf+5OsXOIGlvoz8jyNKBLSKNsofjp36hC8vQ+aEf1K188kbS8bAI4yLgpKTsTCVbJbmWtbXCVBMx97CVJAl00DpFoif9tDXdIVAAdaiNy4twQx2FHDUgnnjPMc37apL0zIVrb/3JDQZSt6rAEfZL+N/c5cEahgbP49plWsFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751499226; c=relaxed/simple;
	bh=nb67R8mTAqLee0bGwTy2p1mM3bW9sNGJGhesygKCY0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOZuX50xpm0jUBLfxFU8vJ9ZKbYrwiz8YIZ12Gk8I7p7zjx2uRkaPSxexn++NCdO2KajGqcXfQ/cns1XKLctKQ4vVYsndQsa4ZFpDOm+OALnn35pKC5XrNAaZkzxjuAOyf48OdrkTQZqWMZm5K/uTLlwUa2TcUzVfhiLFpQhw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XDyjxHrC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XDyjxHrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751499224; x=1783035224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nb67R8mTAqLee0bGwTy2p1mM3bW9sNGJGhesygKCY0A=;
  b=XDyjxHrCrF9Czf4T+ZxcEOd/yd4E+rtarzKqKpvvA41EUCOYSMLrKPt+
   iGFzOLKqqzeXZ1RundW9TY7JvVs6u/DCXfNxzTgGmG+IgNqFx2vIiPe+H
   HaywybCXM+n5cWRKF6nacsF+Cn4Zvgv7sdkd830jeuzxXsARsdS1SF2+B
   +VIXmUEIJFe6ltPpbF453i0aIKdU5BBClPCh/a81NY8HWnme7DdoF1U4r
   sKggEn6iSt78sPTHnhLLOq9P9I4lz8NWUOe3+C7Riq5ozpKL7FeFLeGSJ
   yNoqesjPWqMuzFAn98NJPstaPSEMo3jEb+nfxHLsznwehTpEYbLCNaVsu
   g==;
X-CSE-ConnectionGUID: xp3dtp2QQcmlMItgc7rv6g==
X-CSE-MsgGUID: fPC65kxFQFCPKj/p4QouIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="71244299"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="71244299"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 16:33:36 -0700
X-CSE-ConnectionGUID: COKopxrwSoGF43P86VtfIg==
X-CSE-MsgGUID: Y0nhqa1ORK6Q3SBT7cTrKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; 
   d="scan'208";a="153848731"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jul 2025 16:33:34 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uX6xH-0001Dz-2Q;
	Wed, 02 Jul 2025 23:33:31 +0000
Date: Thu, 3 Jul 2025 07:33:27 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, riana.tauro@intel.com,
	anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
	lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
	raag.jadav@intel.com, umesh.nerlige.ramappa@intel.com,
	frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime
 survivability mode
Message-ID: <202507030724.ANdFmYRE-lkp@intel.com>
References: <20250702141118.3564242-4-riana.tauro@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702141118.3564242-4-riana.tauro@intel.com>

Hi Riana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.16-rc4 next-20250702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Riana-Tauro/drm-Add-a-vendor-specific-recovery-method-to-device-wedged-uevent/20250703-014925
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250702141118.3564242-4-riana.tauro%40intel.com
patch subject: [PATCH v3 3/7] drm/xe/xe_survivability: Add support for Runtime survivability mode
config: arc-randconfig-002-20250703 (https://download.01.org/0day-ci/archive/20250703/202507030724.ANdFmYRE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030724.ANdFmYRE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030724.ANdFmYRE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/xe/xe_survivability_mode.c:272 function parameter 'type' not described in 'xe_survivability_mode_enable'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
