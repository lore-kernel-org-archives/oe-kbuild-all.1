Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26C33B782
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695136042; x=1726672042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dtT0oFhB5duMg83dgXxGRXV6gJKHo1E1VeyiOh8aRlw=;
  b=VtN3RF3mdNl3H8gnUm+SQSW9j2b4CzmA1bepZnrBXNIKGo/s0QOZxP3n
   7E1nbHg0s9hGq11ms4tn5O7kuDK4TbIvwp4jC7chnF5BUq5rtlLEKbmZk
   /fo4zOFQbXz1GXRfatmQ//dhH2ZBaNlXw6F29/fuDxsCguEo4+64bYTBm
   PMJf4+rcnYMXkrfcF8a243lOeT9ze5bT35f8cR/aEqyVCryORSlGaKnxs
   /006uFUoNwkxzeDZGf7hF9Ay40j8dNRXHUAw9jU5Gf3vn/MHYDqjA2R27
   /g2U5xQC2AbRkaOOAZc7+fYjDTU7hgi+MLcH2rDCdmMA1FFf5UYj+/otG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379870856"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="379870856"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 08:07:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816470767"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="816470767"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Sep 2023 08:07:21 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qicJr-0007VU-02;
	Tue, 19 Sep 2023 15:07:19 +0000
Date: Tue, 19 Sep 2023 23:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [skeggsb-nouveau:00.02-gsp-rm 80/87] disp.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202309192341.J54gH2ro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/skeggsb/nouveau 00.02-gsp-rm
head:   3897e2d444b49105470ddf8b6beed3f183bc4886
commit: 3ccd0e26d264fca52a7735e1fbd72fac239f4136 [80/87] drm/nouveau/disp/r535: initial support
config: arm-randconfig-003-20230918 (https://download.01.org/0day-ci/archive/20230919/202309192341.J54gH2ro-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192341.J54gH2ro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192341.J54gH2ro-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o: in function `nv50_sor_dp_watermark_sst':
>> disp.c:(.text+0x3254): undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: disp.c:(.text+0x3356): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: disp.c:(.text+0x336c): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: disp.c:(.text+0x3386): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: disp.c:(.text+0x33ea): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: drivers/gpu/drm/nouveau/dispnv50/disp.o:disp.c:(.text+0x33fa): more undefined references to `__aeabi_uldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
