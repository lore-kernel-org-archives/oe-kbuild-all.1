Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149A01F7094
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 14:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733321042; cv=none; b=iZtrEc3cW0m/N/DxVSDbH2Ndx618NNf3DtUd8r/6l8ZB2ZAn+dq1cwYGdN4t7S/MHoLzaQEk9hyzIzfShV1ijShEtuz9OH7JHzDN+FwDzBTX7DmXvXgemQlfOhPRCr95tqilCQmOnJJt4Cb8G7seyiKYbauMKr0iGJwTBFvSHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733321042; c=relaxed/simple;
	bh=7KLMpaj3psPE975L+wGRX1NRSUDet9hdWj+hEc/t+XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtPMCihfjFE4I5lThvUs3PR3zWyJf0DJWjvdKDeaQyQAhfh9xQWAHja6zkC7maLEHaxM/pZpP7aRFcSSz9h+jfGfhzzw24Yqjmvhw0LttA4PSP03eTJ+HTJNF0+7VyEXqLjyisXSjWZLlU8m1Q3qahFmoRyqSTOqd8SFGfdZdX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFcW0JUc; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFcW0JUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733321041; x=1764857041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7KLMpaj3psPE975L+wGRX1NRSUDet9hdWj+hEc/t+XE=;
  b=SFcW0JUcV5HsTJwzIxd3YL4oeL+pZTiu6QCOJVI+wkPbtIYy3HJPNVhY
   R7owYyAgwLRtXmlOizOd9fHIZz6LgcaOrieTIl1TlYfmDEQkTu1YpcDiC
   IY+Wi4Ni3rX7B1h9TfpGgNndRcJ56OQEbaU4uou6/DWyQbqF6+Sn4e0tV
   M73LM1fPh1S5CSTmXQS/4a6JewjZpFN4T+/Px/ASc3A+YicRLgrYwx8Ey
   X4NnKgMrsDzjxMefB73obluOhqc+98Lmrqj6yWRttYTXbIEPfVCXi0YCL
   SMUx4IeADGqqeK14sbJIEsvW4CPOYOMRyoOomN7GuWH7UxbpJ9a2RKTx8
   w==;
X-CSE-ConnectionGUID: zx2ybhg5QEuvqMcGf5TBCg==
X-CSE-MsgGUID: DcOa2ZejTRit1bdwkVWLng==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44617557"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="44617557"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 06:04:00 -0800
X-CSE-ConnectionGUID: 4yfn1dd1SteZ8DH1tW0vMg==
X-CSE-MsgGUID: 435jbu0ITeikpMsf38kSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="94600355"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 06:03:57 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIpys-00035D-2A;
	Wed, 04 Dec 2024 14:03:54 +0000
Date: Wed, 4 Dec 2024 22:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2 1/5] drm/i915/fbdev: Add intel_fbdev_get_vaddr()
Message-ID: <202412042119.5ErpNlAU-lkp@intel.com>
References: <20241203092836.426422-2-jfalempe@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203092836.426422-2-jfalempe@redhat.com>

Hi Jocelyn,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44cff6c5b0b17a78bc0b30372bcd816cf6dd282a]

url:    https://github.com/intel-lab-lkp/linux/commits/Jocelyn-Falempe/drm-i915-fbdev-Add-intel_fbdev_get_vaddr/20241203-173213
base:   44cff6c5b0b17a78bc0b30372bcd816cf6dd282a
patch link:    https://lore.kernel.org/r/20241203092836.426422-2-jfalempe%40redhat.com
patch subject: [PATCH v2 1/5] drm/i915/fbdev: Add intel_fbdev_get_vaddr()
config: i386-randconfig-062-20241204 (https://download.01.org/0day-ci/archive/20241204/202412042119.5ErpNlAU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412042119.5ErpNlAU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412042119.5ErpNlAU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void * @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse:     expected void *
   drivers/gpu/drm/i915/display/intel_fb_pin.c:333:34: sparse:     got void [noderef] __iomem *

vim +333 drivers/gpu/drm/i915/display/intel_fb_pin.c

   330	
   331	void *intel_fb_get_vaddr(struct i915_vma *vma)
   332	{
 > 333		return i915_vma_get_iomap(vma);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
