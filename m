Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8C0190072
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 11:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736595708; cv=none; b=ua5BYeqokFcH7bW7xwOetH4Paum2U/mgbD0r0u1QM206bdfOdFCrorjiWO9fJkdM++E9qVz+KOTa3cJ5Ml74nmTQ8om/4UvT+PVbecJB438YqS4Enj1pY53vPvP5rW5POyjGUpUkb6phiQegD35SfEqu8mS4qItjsfIn4aLUoRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736595708; c=relaxed/simple;
	bh=kpTdDuh3MJpcoC0hYViYwGL9goAThPxJBrnYUuGGV/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nr3kQfYgrsTJkAxiVI3IMH2AVV0v8bgChcrhRZTpT2ob5HoCJ0eWSJRGKmNJZN8uMdR8u+1aQJnoxO9sIorUx4ufG6XQMl2MhwWF8T3+SFxR5Im/zIOJeAzHfRqzi+rS88BLBKEYsQy9MYtz+n0Q9JCfaHV+YhxlTCmupvOt0t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYo73NPx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYo73NPx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736595708; x=1768131708;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kpTdDuh3MJpcoC0hYViYwGL9goAThPxJBrnYUuGGV/o=;
  b=aYo73NPx95Tt2yAUSdL7gTHMQ9Gne0Cgp63hmdkaDjbj7lG5S7aARPHX
   guWr0IWkojIk0UmVvRSNUI/byrRBx2cJZklfmCv9SRhFONpSv3To16cL/
   TOUA8krY9yvsnFvxGQrHHBA6zWcwJyrDrV6PSvJ/zK9+dno93i1pYSSfs
   CuJaB/PcPcRs2sfcSgCG3SvJv4vDLo+VKck+hQGKCTVofbYHpWuO0pgoE
   nhVriQ03qZmSjTRVrJnwDD2iMQ/sNJTljyvMWoB0MkwBExnUQwwdfV2oM
   bhDl6/v5USczufw+tQ2p4ki3OkykwoZ5HYQ5lMMMKxe8o7UE7s9Mz2oBG
   w==;
X-CSE-ConnectionGUID: atZWl1WFSJeG383zb/XdnA==
X-CSE-MsgGUID: 8WUXW+F1Tj+cpuPReHLOqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47876716"
X-IronPort-AV: E=Sophos;i="6.12,307,1728975600"; 
   d="scan'208";a="47876716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 03:41:46 -0800
X-CSE-ConnectionGUID: gncxJD1ZRG2Sv60LQlcSKw==
X-CSE-MsgGUID: Lhc/Z98qQw6NCPhWHY/ikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104492304"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2025 03:41:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWZs4-000Kat-19;
	Sat, 11 Jan 2025 11:41:40 +0000
Date: Sat, 11 Jan 2025 19:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, lyude@redhat.com, harry.wentland@amd.com,
	imre.deak@intel.com, ville.syrjala@linux.intel.com,
	Wayne Lin <Wayne.Lin@amd.com>, Harry Wentland <hwentlan@amd.com>
Subject: Re: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at
 specific LCT from RAD
Message-ID: <202501111927.qHX3ZcBP-lkp@intel.com>
References: <20250110023618.66401-3-Wayne.Lin@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110023618.66401-3-Wayne.Lin@amd.com>

Hi Wayne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-dp_mst-Fix-drm-RAD-print/20250110-103837
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250110023618.66401-3-Wayne.Lin%40amd.com
patch subject: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at specific LCT from RAD
config: x86_64-randconfig-121-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111927.qHX3ZcBP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111927.qHX3ZcBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111927.qHX3ZcBP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected unsigned char [usertype] *rad @@     got unsigned char const [usertype] *rad @@
   drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse:     expected unsigned char [usertype] *rad
   drivers/gpu/drm/display/drm_dp_mst_topology.c:201:81: sparse:     got unsigned char const [usertype] *rad
   drivers/gpu/drm/display/drm_dp_mst_topology.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +201 drivers/gpu/drm/display/drm_dp_mst_topology.c

   193	
   194	static int
   195	drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
   196	{
   197		int i;
   198		u8 unpacked_rad[16] = {};
   199	
   200		for (i = 0; i < lct; i++)
 > 201			unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
   202	
   203		/* TODO: Eventually add something to printk so we can format the rad
   204		 * like this: 1.2.3
   205		 */
   206		return snprintf(out, len, "%*phC", lct, unpacked_rad);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
