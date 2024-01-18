Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692B62E65A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 20:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609473; cv=none; b=lKXiuaMW8VlhCs43DN3NGDaAyXMYF6YpZjxY8W1ddQXD9wZPfajeeETx4M6xP2neoGymh93Knn3y0pBK3PK3HKJSqXWUDKUMfrnJpTvs7jDgQPjwLZGCKlx0evFchR3ETufz6HKPMHcl6oCkq24hVT0u1F5KGatLzZnUGuIwFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609473; c=relaxed/simple;
	bh=G7UVXBe1MHbjrnRyj9WIoO0uJnFTCNpd+P5PqhXIcOY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OtZSmjEOgPgSJw+9ekEdgqcbJ9BKqKSCWLVtLkJ000hfWDk86DWMV/f2Agu/8wK0jk+BxcGxKjy54DZ3nXb27sThJJ9C0771uSyzlWT8pDUfoWAh73mqdFslql9IfWELFYUalCBv6/sdu7wM1nMJWEau1Cf7X/OI6rHvW0S9e8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1twm1nb; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1twm1nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609471; x=1737145471;
  h=date:from:cc:subject:message-id:mime-version;
  bh=G7UVXBe1MHbjrnRyj9WIoO0uJnFTCNpd+P5PqhXIcOY=;
  b=h1twm1nbzg2QBr5MSJi/BNhuDmyy39hYF/FBBqrusiMEy+S+5J2kX+3i
   eaihWAB11DUUBuEZ9BJbB82enCwdI6ts3UVMre+OVXJDnRFfLDB93U8MB
   Zt3f17vyYd8p/6mZzYF8SmoaCT6+TTp+5yPfZF3c+hq5Xl4v0ua1XigZP
   ZKd497gswXVpSR5TrAadakgtk8vQHD6HpFLN3AoAWN8GPSwt2TBBo11U4
   a3re47N1eI72b/XkoK7GHWylmgyZs10Sn842jH1AnEeh1RbPy5YO9fkC3
   BzvDfSe5bhQsnNT1N46donCylzh3BU5wvwJ7Ox9k7QLnnlMrwxS6+eFTC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400227905"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="400227905"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:24:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855118067"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="855118067"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2024 12:24:30 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQYw7-0003J0-2W
	for oe-kbuild-all@lists.linux.dev;
	Thu, 18 Jan 2024 20:24:27 +0000
Date: Fri, 19 Jan 2024 04:24:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 1074/6555]
 drivers/gpu/drm/drm_syncobj.c:134:6: sparse: sparse: symbol
 'drm_syncobj_remove_callback' was not declared. Should it be static?
Message-ID: <202401190442.Sv07zLbc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 8e82fa1ed837aefa829a82894a950e7abc393536 [1074/6555] UPSTREAM: drm/syncobj: Drop add/remove_callback from driver interface
config: i386-randconfig-061-20240118 (https://download.01.org/0day-ci/archive/20240119/202401190442.Sv07zLbc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190442.Sv07zLbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190442.Sv07zLbc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/drm_syncobj.c:134:6: sparse: sparse: symbol 'drm_syncobj_remove_callback' was not declared. Should it be static?
   drivers/gpu/drm/drm_syncobj.c:125:6: warning: no previous prototype for 'drm_syncobj_add_callback' [-Wmissing-prototypes]
     125 | void drm_syncobj_add_callback(struct drm_syncobj *syncobj,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_syncobj.c:134:6: warning: no previous prototype for 'drm_syncobj_remove_callback' [-Wmissing-prototypes]
     134 | void drm_syncobj_remove_callback(struct drm_syncobj *syncobj,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

vim +/drm_syncobj_remove_callback +134 drivers/gpu/drm/drm_syncobj.c

9c19fb10a5893d Jason Ekstrand 2017-08-28  133  
9c19fb10a5893d Jason Ekstrand 2017-08-28 @134  void drm_syncobj_remove_callback(struct drm_syncobj *syncobj,
9c19fb10a5893d Jason Ekstrand 2017-08-28  135  				 struct drm_syncobj_cb *cb)
9c19fb10a5893d Jason Ekstrand 2017-08-28  136  {
9c19fb10a5893d Jason Ekstrand 2017-08-28  137  	spin_lock(&syncobj->lock);
9c19fb10a5893d Jason Ekstrand 2017-08-28  138  	list_del_init(&cb->node);
9c19fb10a5893d Jason Ekstrand 2017-08-28  139  	spin_unlock(&syncobj->lock);
9c19fb10a5893d Jason Ekstrand 2017-08-28  140  }
9c19fb10a5893d Jason Ekstrand 2017-08-28  141  

:::::: The code at line 134 was first introduced by commit
:::::: 9c19fb10a5893d6501df4d0fb93d954d5fc1d91b drm/syncobj: Add a callback mechanism for replace_fence (v3)

:::::: TO: Jason Ekstrand <jason@jlekstrand.net>
:::::: CC: Dave Airlie <airlied@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
