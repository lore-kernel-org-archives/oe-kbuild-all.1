Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93AB328B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 10:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723889678; cv=none; b=ePLhEojpKLPDszTw8cHPCHyc3oUfAVVH0IKj/X5K7vRyQ2Z5Tu8K+Brtopyvqt42/SzMOMdzcr97nRPNUA9XlCjFMc5v24la5RyjfzNxHVGdDHwuOzqW01ncPiDmGAvGIlY/CggsGAxXlUyOX1EtP1elhVv+f+jNu2Aok30MQP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723889678; c=relaxed/simple;
	bh=qn363W5Vxq2cwBv149RyNnUUhY+ADXHMAUkKKo3FvGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsO6v721mfbKOdfMTL6PIhcC8RR5gwpgRk/6cyA2uHUPEbW/ZBkdUj+MvrRFEUq8iFdGJncyVnon+vZTI4zgipE8UyY1qIdwQ2OimzLicHCl9zvlbCtuDdJWZ8vadOGBCDX0tk1YbenlgOrqYOmdvSDAqN5W5Z7MVFSkqxr3Gzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHHgBxl6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHHgBxl6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723889677; x=1755425677;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qn363W5Vxq2cwBv149RyNnUUhY+ADXHMAUkKKo3FvGY=;
  b=hHHgBxl6lZHXO9scB4p3gV9UVRlj0bwAv4+u75ALO42ck0Y9z4z4FZuh
   TH9J0wNx7k6NlbC9UdI6HjGPWzYfXDN4Si5gzqTxMV40gprvoQVj9rvdq
   59NMPEOSJvzYEr6DUR7jBuh47EmSOxVLlxP+3TDX3zoV0sEfiU24Uw8NB
   6mxePZUyVGniwiCKAFnucKKYxfKPz7v+Qr5wbIiU86qE0lwj9s7q+mjSu
   T+Mbnhq+c6XHdbexUX8P1P92NQyYLkvuh0rWLCHPVd8xZkBjdvrK2mDW8
   AbwWEoTYv6s0knZRCtVhC+6HopjcmiOulM2Canmj4P51PC28qG4e1SwLZ
   Q==;
X-CSE-ConnectionGUID: wJ9FI7poQTKp454PmLONPg==
X-CSE-MsgGUID: ka0z+sQUSh+gkEA1qcRBIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22352441"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="22352441"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 03:14:36 -0700
X-CSE-ConnectionGUID: rG9m58IYR3ulX2M5Cg016g==
X-CSE-MsgGUID: fYKMSDfgSDWpf+HHlwhyYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="60074409"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2024 03:14:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfGS6-0007LW-1I;
	Sat, 17 Aug 2024 10:14:30 +0000
Date: Sat, 17 Aug 2024 18:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
	airlied@gmail.com, jfalempe@redhat.com, javierm@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
Message-ID: <202408171746.ju5Kg2D3-lkp@intel.com>
References: <20240816125408.310253-84-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816125408.310253-84-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 70d6d55dea574b7b78ccf714699cc5d8d62fcc2c]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/drm-fbdev-helper-Move-color-mode-lookup-into-4CC-format-helper/20240816-210651
base:   70d6d55dea574b7b78ccf714699cc5d8d62fcc2c
patch link:    https://lore.kernel.org/r/20240816125408.310253-84-tzimmermann%40suse.de
patch subject: [PATCH 83/86] drm/{i915,xe}: Run DRM default client setup
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408171746.ju5Kg2D3-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171746.ju5Kg2D3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171746.ju5Kg2D3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_device.c:20:10: fatal error: intel_fbdev.h: No such file or directory
      20 | #include "intel_fbdev.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/gpu/drm/xe/xe_device.c

    19	
  > 20	#include "intel_fbdev.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
