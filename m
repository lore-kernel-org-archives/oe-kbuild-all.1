Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE60615A1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Dec 2023 08:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTrBSoWC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703405095; x=1734941095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+V+QFk3XTQdUp5BZW6vOgx3msoGMsM7/1ncWdz7BUs=;
  b=kTrBSoWC0IKjQPLuWhjxcXRNnsaK307KTCcjKaCw1yvw+Zd7uaXFCV5q
   kf92NhXaFhiO/svTDz+UIJT/uTug9UgbrIyax6EDv+DCAUNwBaJvarfBQ
   zJ1/3dpUiBeUEoRSWfmaYHszl6Igm05f94d2aMl4GK90P9ueNf/Xc4uEI
   IPHVSvMDLzk+OA3QInMA2vZ2WaYwjKKIoB8m6Szb8G0v9KZTFGaHTveBk
   u32EB4WJphtBsbtXFesxFsmLF5MqjXNOWr+OU18ivj1wNfvVjBLmTaqkV
   0cntVb4tPbszRecUGKGt8I9wBtQYNigyqOx+hA1i+vntCGXdFMsxVHqlm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="3043877"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="3043877"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2023 00:04:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10933"; a="727279127"
X-IronPort-AV: E=Sophos;i="6.04,300,1695711600"; 
   d="scan'208";a="727279127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 24 Dec 2023 00:04:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHJSR-000Bzf-0h;
	Sun, 24 Dec 2023 08:04:17 +0000
Date: Sun, 24 Dec 2023 15:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Subject: drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu'
 expects argument of type 'long long unsigned int', but argument 3 has type
 'resource_size_t' {aka 'unsigned int'}
Message-ID: <202312241523.F6YQjyeJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tejas,

FYI, the error/warning still remains.

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git new
head:   f30cae3de3b138849010f4e54d8800eb1cc080b9
commit: a8eff4f048bf2238bd686112c64bd6b6c5d99646 drm/xe: Add sysfs entry to report per tile memory size
date:   10 weeks ago
config: microblaze-allyesconfig (https://download.01.org/0day-ci/archive/20231224/202312241523.F6YQjyeJ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231224/202312241523.F6YQjyeJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312241523.F6YQjyeJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_tile_sysfs.c: In function 'physical_vram_size_bytes_show':
>> drivers/gpu/drm/xe/xe_tile_sysfs.c:29:36: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsigned int'} [-Wformat=]
      29 |         return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
         |                                 ~~~^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    |                   |
         |                                    |                   resource_size_t {aka unsigned int}
         |                                    long long unsigned int
         |                                 %u


vim +29 drivers/gpu/drm/xe/xe_tile_sysfs.c

    22	
    23	static ssize_t
    24	physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
    25				      char *buf)
    26	{
    27		struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
    28	
  > 29		return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
    30	}
    31	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
