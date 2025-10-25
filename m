Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6CBBA3D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761355482; cv=none; b=c9taifpAXseA8rUAj1LRAJ9Uf9Uhbv1yrHAO23NA035G2Zvjxg+e0+eML/AwX3oBhZjxtcZBvi++YZ6fVmiHUDndujrDRvD8/IeYlwOWVGmOjXA3aJpWi5rxT+zge75olQnObSbXnLbXLA2kjrWdWaQOy+iSV36v60se4KwyVlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761355482; c=relaxed/simple;
	bh=fytU8tlszGgmAG+kPqj4fV0nEPzg/wdifyHqcSQID9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg9CWAwA4LJRID9ODSkJ8o0+d6rLl7HbGRqPqrAzuxKQ4CK9hPQEyXbkp+MoVyXZE+0vZZu/pfd6bCcHXQC4wZ3CcOUJ45/SiSE0ZtbjCUU5U+lPM2p6PrTwYy/DY7B9V8Ys+Kx3wT8OwGtkJ3k/NpyMdE7O+FzVk3cjEfga9iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jif7B4+x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jif7B4+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761355480; x=1792891480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fytU8tlszGgmAG+kPqj4fV0nEPzg/wdifyHqcSQID9E=;
  b=Jif7B4+xSDTOHhu/n5lWoj8etx+Ljqk1Rfx6Y8fjzBmQ0hPQ1usS5yF5
   5Pwpl8occz8CLw7DIjxmd8SQAqE4sf3MPrNv0wAq77N1jumiwEs/dYYlx
   dIka1qjOCOK69KTkacJKPJxC5/OIs1rbc28fjDfWSLdrk2PCnHNS8hnFN
   ftQIJHF2atKyB1kD1OE1y0Os07Dz58CdIr46tIPISZGEV+DeRypwCGuU8
   ZXh3bZsxRifGC/hRko9tXMBq5XevkDXZBl3OaCU5TnzIGL2W+eQArkAZP
   BW4bvA1wVqU3LN1ce0GpcFGrXRk4WABXZNpLyyjuH4Jegwek4USBzFU5I
   Q==;
X-CSE-ConnectionGUID: wLAJuX3+Sfe8uwacLOSRaQ==
X-CSE-MsgGUID: aAFVY6iET0SoHtHzvmmQ8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63237828"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63237828"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 18:24:39 -0700
X-CSE-ConnectionGUID: ZlVDuy5LQby6ocrjtzJKMg==
X-CSE-MsgGUID: P9D4xzioRMKD5H2bURQLig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="189690766"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2025 18:24:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCT1G-000F2L-2H;
	Sat, 25 Oct 2025 01:24:34 +0000
Date: Sat, 25 Oct 2025 09:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI
 interface
Message-ID: <202510250945.hB9LcnfV-lkp@intel.com>
References: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-st7571-split-v1-6-d3092b98130f@gmail.com>

Hi Marcus,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7e73cefd2bede5408d1aeb6145261b62d85d23be]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcus-Folkesson/drm-sitronix-st7571-i2c-rename-struct-drm_device-in-st7571_device/20251024-192347
base:   7e73cefd2bede5408d1aeb6145261b62d85d23be
patch link:    https://lore.kernel.org/r/20251024-st7571-split-v1-6-d3092b98130f%40gmail.com
patch subject: [PATCH 6/6] drm/sitronix/st7571-spi: add support for SPI interface
config: i386-randconfig-014-20251025 (https://download.01.org/0day-ci/archive/20251025/202510250945.hB9LcnfV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250945.hB9LcnfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250945.hB9LcnfV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module st7571-spi uses symbol st7567_config from namespace DRM_ST7571, but does not import it.
>> ERROR: modpost: module st7571-spi uses symbol st7571_config from namespace DRM_ST7571, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
