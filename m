Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FA81CF8B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Mar 2024 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710698436; cv=none; b=eQ5x56BUMnXEZuBqu+glgr2OfofRj0fz9AjYyTsSvdt4laN+1uJHHMU/4+IuABTiIM3MdouKulfHt/NVGgqi1HpGHYstAsik2/UVMVyZ6DetC9MJ1SaubqGTEsyy0+3SZi/i+x/UlYMbcGLuhd53HwKNg+nsE85juKHEK4FZr6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710698436; c=relaxed/simple;
	bh=d1gJtJhLoCoMhAJmy9kBy+XsEohKOLp1ZvRQwzj7H/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSbzohIc/YCgbV8ucbRxhdawK14gN99Px2Q0HLaKRyqSV9LqzBD/h7ZEyVP/bSK5yBolAMYjwic1hp+2BKrPPqTYCxgmZ3y2J+Q4zSgfS2E0td6+kIeBFzxX2jGaIAQsnYVkKbAExU57rfjTnXHpxpyrJHYBSy42qrwIKTApdeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAYWKXX3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAYWKXX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710698434; x=1742234434;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d1gJtJhLoCoMhAJmy9kBy+XsEohKOLp1ZvRQwzj7H/Y=;
  b=UAYWKXX3SapG2zYjFFhqFMvwj2m7L+SUQrXC2i7E2XlyXDuej4SwQpa4
   dDJkOlTdivYN9eB9YbR2lyaIKyKlPK1NFSFrX4ttu+NS7BEElBCJtIDbj
   JJZerL/LQgkD250tn6qoaFcOqPYHz98I2bG+F4Md6qTWuKuJSyprqk9Js
   2q9CUjCL3jKBJaPr23cM6javr+2BMXlXQuX9WmK6g3I3pN04VC2IJODf9
   uR99ZfyIeDwQgoj44oAm0RUq+Qv/kailE+gBJawSvSV2WntUIu3tLxbVn
   5v4gnfxaHuSHxVJSENbZx14uryrrKCCFcsbF+g0irOA3R9077Wlmt6S18
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5445649"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5445649"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 11:00:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13130314"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Mar 2024 11:00:30 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rluo8-000GOb-2Q;
	Sun, 17 Mar 2024 18:00:28 +0000
Date: Mon, 18 Mar 2024 02:00:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon
Message-ID: <202403180145.fkaEWVrN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   741e9d668aa50c91e4f681511ce0e408d55dd7ce
commit: eb08104f90fc474054211244d668d3fe1d84bccb drm/xe/gsc: add support for GSC proxy interrupt
date:   8 weeks ago
config: alpha-randconfig-r054-20240317 (https://download.01.org/0day-ci/archive/20240318/202403180145.fkaEWVrN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403180145.fkaEWVrN-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_irq.c:279:3-4: Unneeded semicolon

vim +279 drivers/gpu/drm/xe/xe_irq.c

   257	
   258	static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
   259					    enum xe_engine_class class,
   260					    unsigned int instance)
   261	{
   262		struct xe_device *xe = tile_to_xe(tile);
   263	
   264		if (MEDIA_VER(xe) < 13)
   265			return tile->primary_gt;
   266	
   267		switch (class) {
   268		case XE_ENGINE_CLASS_VIDEO_DECODE:
   269		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
   270			return tile->media_gt;
   271		case XE_ENGINE_CLASS_OTHER:
   272			switch (instance) {
   273			case OTHER_MEDIA_GUC_INSTANCE:
   274			case OTHER_GSC_INSTANCE:
   275			case OTHER_GSC_HECI2_INSTANCE:
   276				return tile->media_gt;
   277			default:
   278				break;
 > 279			};
   280			fallthrough;
   281		default:
   282			return tile->primary_gt;
   283		}
   284	}
   285	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
