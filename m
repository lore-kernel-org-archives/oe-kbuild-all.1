Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1B12E7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 05:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708063081; cv=none; b=l53fFe8w74fCg64R2+vkkumHk9E+J7lTyDT02pWhnwkH+CB2v6/MAD5jzwt6HmysSe+xdmNTBDnx0acXDPUDf9LWJhGNh4xUtWa0p1N0G0w+odhjZ4mIj5oF+n6Rl18yXhXTrvsOQjaq5wQD2mM+uG3jhE34abQLWdRKRXO12ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708063081; c=relaxed/simple;
	bh=To8rxNtvjOmYhFNTBOIVIfsDBjaC5/YQ+5fV2PrFl6k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aWvlhqQgUq4XxrNSHiW5wS6kwUKw4hh4NA4MMawpvqViLZ+nCgJ8rx+46o5vT+BeXThTyF/fTRhWZGZQZyvSK88Gn+G0N/7EnWvyTqrHOs+BOpHnwQFUNmWyHtZH85BIny75KWUSu8RYo0wqqafMxwzSC9/H4kioqkJdLeYNAJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0CaD3o4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0CaD3o4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708063079; x=1739599079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=To8rxNtvjOmYhFNTBOIVIfsDBjaC5/YQ+5fV2PrFl6k=;
  b=K0CaD3o4BimvJFplmejz5Z8fPiftwA7JRRxEpFnqLuaVq4+HV2wL0HUf
   WUm8sHly0e5pU+/JMYQoG35XGl0956KPASxjg3bYftskXJWPQy/lfeq9y
   tvCsu9t4EynOkw7cJJqXndGfmOMTMV8k0Q2YT1j4KuVdZ3X+XykGOTILs
   QhcHwmn9jtJN6LafjDCVIovctEIDL4tM6cXdlkivUm5zGaTOV08NOKkOn
   GBdjdhYhLDMvHUAwYu6OKY0ibCC3ceMT6nkXtwrXA/FvfH6AZzoW7VmWD
   8FShntKBPThZmsxIuijdv+8NSAjeX57KZFm7PC2kEXD/tyOYftobyXOVa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2090826"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2090826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 21:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8404611"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Feb 2024 21:57:56 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rarDp-00011W-3D;
	Fri, 16 Feb 2024 05:57:25 +0000
Date: Fri, 16 Feb 2024 13:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: [linux-next:master 6591/7658]
 drivers/gpu/drm/tests/drm_buddy_test.c:(.text.drm_test_buddy_alloc_contiguous+0xb0):
 undefined reference to `__umoddi3'
Message-ID: <202402161359.FurKTCOZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d37e1e4c52bc60578969f391fb81f947c3e83118
commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea [6591/7658] drm/tests/drm_buddy: add alloc_contiguous test
config: mips-randconfig-r001-20221018 (https://download.01.org/0day-ci/archive/20240216/202402161359.FurKTCOZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161359.FurKTCOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161359.FurKTCOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/gpu/drm/tests/drm_buddy_test.o: in function `$L24':
>> drivers/gpu/drm/tests/drm_buddy_test.c:(.text.drm_test_buddy_alloc_contiguous+0xb0): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
