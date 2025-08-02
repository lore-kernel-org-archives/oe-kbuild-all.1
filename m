Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39518D
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 08:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754124350; cv=none; b=g0T6PuZ/WfC21TBuJRfyj1LZoXSsOS+OIgA5XGzDOieQRhalqd28pLnwiraAdMiCM0ILuHwbxNmXe6zRREacFp+nbJktSdDaampiF6BYHZ5Y1k97ZzOVhCTxxqogxCaSBVVTFuxVROZ1xAOWh3VZNP8RX6PyIG8fJchSqggnuzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754124350; c=relaxed/simple;
	bh=DkfEDAhsfRSajx3Acj2RYb1TfhHl84HxwYhK/xFFEFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9MNOiuhZcjzqiI/XlgxJ0jh/Y5QVrky16ypmbomNp44rJGxeJw0Fp6atpCKRR66DtBIPW3K3EqHwixsQCw1lEJOHIVwPDs30BJxyPY/Xt/yUNneeaq5U3idthagjLXNHOt361lwfIhhpP9UQ5oOxrX8PuLtQRx2rGOy27cRt2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hmof2rGl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hmof2rGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754124349; x=1785660349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkfEDAhsfRSajx3Acj2RYb1TfhHl84HxwYhK/xFFEFs=;
  b=Hmof2rGl7ieqkXRwQaHLlfJbaf3CVVQLsOBFzOcauLLaiP8btgBzyR2m
   S6KyvzNROvfs1OfMMYEcus4C1Forx++Un7s4amUUDNkss5N+9JV+DVMcx
   TW4MUsUI1wfjqjZ7TbSfbvzLEjw2IZyecO83fNBaNNR9j+6i8hgAdTjC1
   ysXKsf4KsE+1rfZFM4YXiPe5JypAmL/Cc4cC94/ju4uPTSfd6Nt2dvYHn
   UgmBcmb1NhfWcJSjclTixGf03BSMAdSV476EolIJZoBTfLBwAqmwFAfWc
   6I0J60pwLzrcCQ8SthogX9q9drQnqqbS4/QqlHzFu5NwVLtj/8HkKklxy
   A==;
X-CSE-ConnectionGUID: mrdHTG9rQbKAkFtkvCuKYw==
X-CSE-MsgGUID: bmQn/lu6Q4u+hLTv5yMlSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="59082610"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="59082610"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 01:45:48 -0700
X-CSE-ConnectionGUID: gsxRme5WQ0acj/6GHP2nQQ==
X-CSE-MsgGUID: 9oVbEzEGSoWSKfyIwEfpuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="187437325"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2025 01:45:47 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui7s9-0005Gi-0B;
	Sat, 02 Aug 2025 08:45:45 +0000
Date: Sat, 2 Aug 2025 16:45:34 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 45/60]
 drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has
 no member named 'runtime_status'
Message-ID: <202508021624.TVxdIrA4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: fbb0210d25fde20027f86a6ca9eee75630b5ac2b [45/60] HACK: check if DSS is runtime-active when touching regs
config: csky-randconfig-001-20250802 (https://download.01.org/0day-ci/archive/20250802/202508021624.TVxdIrA4-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508021624.TVxdIrA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508021624.TVxdIrA4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/bug.h:18,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:7:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
>> drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     516 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c:517:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     517 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/tidss/tidss_dispc.c:518:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     518 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +516 drivers/gpu/drm/tidss/tidss_dispc.c

   513	
   514	static void CH(struct dispc_device *dispc)
   515	{
 > 516		WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
   517			(dispc->dev->power.runtime_status != RPM_RESUMING) &&
   518			(dispc->dev->power.runtime_status != RPM_SUSPENDING));
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
