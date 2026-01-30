Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100A631197B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jan 2026 07:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758189; cv=none; b=FTaIUscjz83Uq8D8JuV4USbfev6wSV3JNcltV3I819JztW3emlpfaV/02C0lnzbpxkYtE+a+HWRda4fKvn3Lo1mRgFUyS+Qqe8aUgeroUYbjgOa/5cr2IPyj5BAtnc+3O6/itakccU0VEcGpX0opzL+7ijHGCPbzhBXupZuPVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758189; c=relaxed/simple;
	bh=wv+6JR6v7TRO9yWU6E3tW7W81ehYvw3QjeKVxywUyIQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cpGfSzHU6ddSE7TGhT7zDVH3X5Z5HO+GnJNRjQhgM73Y8mpWiGoJiFjIKtBupoqMhVcs19fllea/FfMCCkbS4VgY1teUqDThnYEcn9doXzt592+N8skG/C5YY41om/GTg1mxuuk9DqRBOakB4pP/Pli4nzbXLsErjShPhIUU4gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgcFWHV9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgcFWHV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769758187; x=1801294187;
  h=date:from:to:cc:subject:message-id;
  bh=wv+6JR6v7TRO9yWU6E3tW7W81ehYvw3QjeKVxywUyIQ=;
  b=QgcFWHV9zeVyWdc/qq8vK7tQQMaRdRNQuKAh9Lwd1qMiQd0qqqhQbo7W
   o7xLi88lYi2c0sZIYRG6equQUGykrQhbBA1tWSVUxiuTPbtkZExOAWrFS
   hOqzwUjHszIvgqrz8pHZ+c9yDCxtDzpkWh2+ErlNY6m/gnBYOJHW9yZjS
   yJlJDsJZKzbfbcwiLflhnY2lmGM5rsso7f96px+R0FXeXGp2AxKO0HJDa
   I1aDEsDbDq+Bd7R+cEj50NJPHbfhd+6mQNWTamQGpfLofO31du0KYki90
   IkSsmUb7fsOlNiuc2ObcRAC3CQC9MlC0AS1WfpF06gOAn1nU/z3433cN2
   w==;
X-CSE-ConnectionGUID: hCD6ZEECSAqmeOx4Zdyorg==
X-CSE-MsgGUID: s17Fv4rDRAi0B9THwrWqSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96470740"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="96470740"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 23:29:41 -0800
X-CSE-ConnectionGUID: QXXl4SKlQF6XSVCWqJrfkw==
X-CSE-MsgGUID: rQCy8GWaSQWp+RMJCEH2OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="239519031"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 29 Jan 2026 23:29:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vliwi-00000000cJq-2y0a;
	Fri, 30 Jan 2026 07:29:36 +0000
Date: Fri, 30 Jan 2026 15:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 6/9]
 drivers/cxl/core/dax_region.c:94:26: error: implicit declaration of function
 'mhp_get_default_online_type'; did you mean 'irq_get_default_domain'?
Message-ID: <202601301541.gf0NRVQJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Gregory,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/region_rework_v3
head:   ef956221cc52b1c29b05280fcec99686d744d6b4
commit: 4fd6f53383d678673b9fd4df224a53c9da119f17 [6/9] cxl/core/region: move dax region device logic into dax_region.c
config: sparc64-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301541.gf0NRVQJ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301541.gf0NRVQJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301541.gf0NRVQJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/cxl/core/dax_region.c: In function 'devm_cxl_add_dax_region':
>> drivers/cxl/core/dax_region.c:94:26: error: implicit declaration of function 'mhp_get_default_online_type'; did you mean 'irq_get_default_domain'? [-Werror=implicit-function-declaration]
     cxlr_dax->online_type = mhp_get_default_online_type();
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
                             irq_get_default_domain
   cc1: some warnings being treated as errors


vim +94 drivers/cxl/core/dax_region.c

    82	
    83	int devm_cxl_add_dax_region(struct cxl_region *cxlr,
    84				    enum dax_driver_type dax_driver)
    85	{
    86		struct cxl_dax_region *cxlr_dax;
    87		struct device *dev;
    88		int rc;
    89	
    90		cxlr_dax = cxl_dax_region_alloc(cxlr);
    91		if (IS_ERR(cxlr_dax))
    92			return PTR_ERR(cxlr_dax);
    93	
  > 94		cxlr_dax->online_type = mhp_get_default_online_type();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
