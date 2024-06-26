Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FE139D1B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 04:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719376365; cv=none; b=bN2zzS9IUKK9fpUeqCdaMsxpe14gz2xqzKY6UqqMyVmw0gOrtiCcu84rWES9wzDDf/laGs/Rn523SgqoJjrOSY9usTk9IP5omO4N2KfXiUbMBzXUB7A5eZ6E4u0jzFanjWa3esvoPz2bgwCfzXZJBQQ27UlYQLMgL4mhYmj1bTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719376365; c=relaxed/simple;
	bh=rGaijj4fGIZ99wesLcuzSEG+F8HG0lkYHGmm+0ojkLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLmPNje+bXyEs50qd+uNC6idvlpBXVWtRteT6kGainwSFFrfYv9KHb7AqMwxCDD7+QuyEH75DhLXa3/AQfyV03eOaw9YkGFnVGB1BiVYNh5c3Cv4RxGT91+XJ4w4WxRDD30uq7LTvipghaafMc2fppGLSl975sgwjykL6SRm5Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqDojrjv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqDojrjv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719376363; x=1750912363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rGaijj4fGIZ99wesLcuzSEG+F8HG0lkYHGmm+0ojkLw=;
  b=gqDojrjv/YEj4UAfuoKFigCEaCddnzolc7MFxrnrWnCUrV/1Yc1MaKDL
   adFzDC1iEaOfDfC5yxMzpHaO7+50I8fNGjvBJ9ngzv+MOZ0OPh+rJLM3M
   iSivAWzFWjhlPlI0PcuPZuE+MVkUAxjVHR0XUfAZ7W5XShASHgci8tmL5
   kCj7DwwlGqayaaUOlGP59nCCpSLQYE4Mb1dJPeilSAvKxIQhPC2ED2VXF
   x5HNopDxJa21HMkznamqReUmlET+nx9euzPkMoV7Yxpc7Uil5dnUuZLic
   4D7Oys0m2k/U78tWz2gwXQBzwATT7XbJIo3obNOnFtK+r/B1tlJo0Qtqr
   A==;
X-CSE-ConnectionGUID: jS4TCotvTw+dmqgFbHo2yA==
X-CSE-MsgGUID: 98smPQaRSkuTvhsjqSW4CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27047201"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="27047201"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 21:32:43 -0700
X-CSE-ConnectionGUID: GmK1jl0MQ2aKAjk2DhoTrw==
X-CSE-MsgGUID: xcyU2GuQTJ6ubBc/FDgjHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="44308320"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jun 2024 21:32:42 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMKKl-000Ez6-0y;
	Wed, 26 Jun 2024 04:32:39 +0000
Date: Wed, 26 Jun 2024 12:32:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] drm/mipi-dsi: Add OF notifier handler
Message-ID: <202406261223.XH7ibzUW-lkp@intel.com>
References: <20240625100818.3478242-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625100818.3478242-1-wenst@chromium.org>

Hi Chen-Yu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/drm-mipi-dsi-Add-OF-notifier-handler/20240626-014423
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240625100818.3478242-1-wenst%40chromium.org
patch subject: [PATCH] drm/mipi-dsi: Add OF notifier handler
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240626/202406261223.XH7ibzUW-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261223.XH7ibzUW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261223.XH7ibzUW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from drivers/gpu/drm/drm_mipi_dsi.c:28:
   drivers/gpu/drm/drm_mipi_dsi.c: In function 'mipi_dsi_bus_init':
>> drivers/gpu/drm/drm_mipi_dsi.c:1770:56: error: 'mipi_dsi_of_notifier' undeclared (first use in this function)
    1770 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/gpu/drm/drm_mipi_dsi.c:1770:56: note: each undeclared identifier is reported only once for each function it appears in
    1770 |                 WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
         |                                                        ^~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +/mipi_dsi_of_notifier +1770 drivers/gpu/drm/drm_mipi_dsi.c

  1766	
  1767	static int __init mipi_dsi_bus_init(void)
  1768	{
  1769		if (IS_ENABLED(CONFIG_OF_DYNAMIC))
> 1770			WARN_ON(of_reconfig_notifier_register(&mipi_dsi_of_notifier));
  1771		return bus_register(&mipi_dsi_bus_type);
  1772	}
  1773	postcore_initcall(mipi_dsi_bus_init);
  1774	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
