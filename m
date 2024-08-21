Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F414C5BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 02:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724207945; cv=none; b=VpG4aoevH6MWQhtQDHvDEBYq6botC2vdJDitvBZ8f9YzrMd5ivfmoUk5HOz1l3PPtgVY8Bp0+APtVXyep/Wgz0a5x+MqXrCCgHgWKIY+NXVnvOChPkjx8rX5AFWBqGy0UvAmhpFqN9QaEmNBQjDnyFNy8EITFxN9ViOgj2QNzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724207945; c=relaxed/simple;
	bh=o4ISseEyO7iM9jJzIMIIzlauZdl0AhAIHPoku6wExBI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mDHB8vDTAZH5TH89FepDxrNRv8PUlhRzlWuxuAcdA+8x9MN8olZvIHYVRfaJsgff1CAlyGgUzqahVdC1t8VqsI1+MA2EYs3KQMo07rTWxjm0O+3+S2w+yV9AUr5AkWJ8ebCANVYv9wjAIPLk0PJJdpGTyGtU5PUgAZ66CXLTA3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7JdspkK; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7JdspkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724207943; x=1755743943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4ISseEyO7iM9jJzIMIIzlauZdl0AhAIHPoku6wExBI=;
  b=X7JdspkKSOu93pn4ePXLRVSfMtOjfypmSJCiapjqLmNmRDSseIWEV+Z7
   Cdiveb16MatDPzZcx/UTAhDKYy0KVvDCgf/HolPwXwIG9OZPoXInz/Oqi
   rOEtm/hYrzS5JSBv+L7drEfjUXl9xxmaApBmXB5g0LbkfLe7mpnKVx3Kx
   K2BQZH+G/jT60VsBuclJnTg6i/W42Pmv/eW2ZZvtjQ3T7ObOwxSu56W2b
   ozKaH/UoQOxAhvlXhEFMRpSSZmmTPz5XU2gIdBwR01S2wa/gXjRp+KLSJ
   eEEiKrVTWL21zGcMy85NTxmxrS9VaqcbW7V/Rr72bLI9W1c+mBdIbG7ys
   A==;
X-CSE-ConnectionGUID: m4sd0qryQQmr/h+fGDZwlw==
X-CSE-MsgGUID: RG+W4HkUQlGNOClb9UXk6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22411762"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="22411762"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 19:39:03 -0700
X-CSE-ConnectionGUID: TJr+gkkzR9ek6QiGFdl48Q==
X-CSE-MsgGUID: /myQ9NBiR6C2EmRq+wlYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60903814"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Aug 2024 19:39:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbFT-000AoA-2p;
	Wed, 21 Aug 2024 02:38:59 +0000
Date: Wed, 21 Aug 2024 10:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 1998/7904]
 include/linux/pm_domain.h:290:13: warning: 'genpd_enable_next_wakeup'
 defined but not used
Message-ID: <202408211028.E8OZFJDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: e6c313525bb350396320a1775677a07eebe435cd [1998/7904] FROMLIST: PM / Domains: add domain feature flag for next wakeup
config: i386-buildonly-randconfig-001-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211028.E8OZFJDN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211028.E8OZFJDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211028.E8OZFJDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/platform_device.h:13,
                    from drivers/base/platform.c:13:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1270:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1270 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1256:27: note: 'mem_section' declared here
    1256 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/base/platform.c: At top level:
   drivers/base/platform.c:1389:20: warning: no previous prototype for 'early_platform_cleanup' [-Wmissing-prototypes]
    1389 | void __weak __init early_platform_cleanup(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/base/platform.c:23:
>> include/linux/pm_domain.h:290:13: warning: 'genpd_enable_next_wakeup' defined but not used [-Wunused-function]
     290 | static void genpd_enable_next_wakeup(struct generic_pm_domain *genpd,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:6,
                    from include/linux/xarray.h:14,
                    from include/linux/radix-tree.h:19,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from drivers/base/power/clock_ops.c:9:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1270:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1270 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1256:27: note: 'mem_section' declared here
    1256 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   In file included from drivers/base/power/clock_ops.c:18:
   include/linux/pm_domain.h: At top level:
>> include/linux/pm_domain.h:290:13: warning: 'genpd_enable_next_wakeup' defined but not used [-Wunused-function]
     290 | static void genpd_enable_next_wakeup(struct generic_pm_domain *genpd,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/genpd_enable_next_wakeup +290 include/linux/pm_domain.h

   289	
 > 290	static void genpd_enable_next_wakeup(struct generic_pm_domain *genpd,
   291					     bool enable)
   292	{ }
   293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
