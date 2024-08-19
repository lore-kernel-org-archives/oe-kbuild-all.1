Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6516314AD0D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 05:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043867; cv=none; b=HGv/17mXJM89ADYAp/Lsdaryj/jyZ+Tcuz+fU63WOkQ84HhHbkztkQvUHQ8eSA/q6J/guO8Z52AMPkp9LAw47vO66Ws1Yr1VzkvS6DNypcLo8UcfN4ggD6jdvWTAj12foVD6G3vyt0M0VpdhQ/tBTOVTpN5a+I7Cz9cbQCFZpzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043867; c=relaxed/simple;
	bh=2Od4TgqwQxJBfikVt7UqnsrmfMwczr+ZaNHCzCe163s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sxqZK4WvFVJXdI68izKvslUz7C4oHLk2EZmPcSA+yPte7RpZp+xTYjJTbnhXtTAPmTKxj35GdJTQJV74wtnBxOeRCrzGFYU0Eu8kbqqy3Vbe5VnhlXclfhu60qb0ugVzbWDSsTDuqdUv6YgKQU5dUFnkxpGUK9cAT4FcMWkvfJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxgEXCby; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxgEXCby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724043865; x=1755579865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Od4TgqwQxJBfikVt7UqnsrmfMwczr+ZaNHCzCe163s=;
  b=PxgEXCby/+3aHMNcjanER1tMDw/dQhFA+/uWW0BXUpK0YMyB1Edu93dJ
   mo75Rd9eMh1WY6tjwbde01QpTT57tWn2YOFC4J09f5vSrTsHgfLd0Nx/Y
   Rhf/V8iJAe2UD23dZN6ATKGPya833OCXqnXWnejJMxKBDGFds6AutbZnj
   lB0fV57twsxCXXaTOBB4SsRf12ayvenMVmgxkrTLUS4okgso5HAdgL2IG
   ICJMzoZhLUTXIX60mHqaw1UM1Axxm19BbYI1SJfDWmlF4I5kQxIQXjIgj
   o0rw6kRmtoqrZc06wHggB7SQEg1/Fi+I9Sfu8k2dnCSeOgb1StxPmAgs2
   Q==;
X-CSE-ConnectionGUID: EePxhBOQTQGDytMBrlIvqw==
X-CSE-MsgGUID: UC8BT5VwQ/OVmF5SqZKrdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="32837027"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="32837027"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2024 22:04:24 -0700
X-CSE-ConnectionGUID: qvu2kUPUSyOVC2B5CHp+AA==
X-CSE-MsgGUID: 6FZrfzVzQ7erqaEDWN0Z4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="97737234"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Aug 2024 22:04:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfuZ2-0008eE-1d;
	Mon, 19 Aug 2024 05:04:20 +0000
Date: Mon, 19 Aug 2024 13:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-41c 66/93] drivers/gpu/drm/omapdrm/dss/dsi.c:762:9:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202408191329.dQyagUlJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-41c
head:   0002c11a78f7c2b3adb014d0034e9e525257fed7
commit: b782d087702043ab6ec6d1b0e61626f8b79b8ca9 [66/93] dyndbg: move flags field to a new structure
config: powerpc64-randconfig-r121-20240818 (https://download.01.org/0day-ci/archive/20240819/202408191329.dQyagUlJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce: (https://download.01.org/0day-ci/archive/20240819/202408191329.dQyagUlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408191329.dQyagUlJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here
>> drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/omapdrm/dss/dsi.c:762:9: sparse:   also defined here

vim +762 drivers/gpu/drm/omapdrm/dss/dsi.c

3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  759  
7093d6cd1fb39e drivers/gpu/drm/omapdrm/dss/dsi.c Laurent Pinchart 2018-02-13  760  static inline int dsi_if_enable(struct dsi_data *dsi, bool enable)
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  761  {
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28 @762  	DSSDBG("dsi_if_enable(%d)\n", enable);
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  763  
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  764  	enable = enable ? 1 : 0;
7093d6cd1fb39e drivers/gpu/drm/omapdrm/dss/dsi.c Laurent Pinchart 2018-02-13  765  	REG_FLD_MOD(dsi, DSI_CTRL, enable, 0, 0); /* IF_EN */
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  766  
7093d6cd1fb39e drivers/gpu/drm/omapdrm/dss/dsi.c Laurent Pinchart 2018-02-13  767  	if (!wait_for_bit_change(dsi, DSI_CTRL, 0, enable)) {
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  768  		DSSERR("Failed to set dsi_if_enable to %d\n", enable);
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  769  		return -EIO;
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  770  	}
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  771  
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  772  	return 0;
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  773  }
3de7a1dc0c9d29 drivers/video/omap2/dss/dsi.c     Tomi Valkeinen   2009-10-28  774  

:::::: The code at line 762 was first introduced by commit
:::::: 3de7a1dc0c9d29b138713ecb85df4b6ca3af2ef3 OMAP: DSS2: DSI driver

:::::: TO: Tomi Valkeinen <tomi.valkeinen@nokia.com>
:::::: CC: Tomi Valkeinen <tomi.valkeinen@nokia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
