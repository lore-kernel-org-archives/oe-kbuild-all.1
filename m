Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260C828E5E5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745432918; cv=none; b=JnUOz4nqPwRPT0kjuuCgRWW6m/KeL2qtCHi6/oe9eyc9cTHQ/oLsS9FSh24GiWSUh+xDTJ5PDt1NsG2qFW4vSxledNKtzuIhFv9EiYmZ5jiTOg22pfNWOTTXnqYTMpZIoKW8OLVRiq7ysDp0hl9HjX6uEENCk6cXFB2y7fqrk9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745432918; c=relaxed/simple;
	bh=xum3k3BlOrxGa8GkxLaIJuF0bEOYhbGZkLAtgBoIxQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCubHkhIO7gdbBcTX/exa1FNx453P4Nq94cu/bvDhRSEOkAV281359b47xwishKXEhIm+dCPMvU7VFlwo0iD51kbQ4M28pf4bnYlJAjxOMkMgmY4j2ayY6NVnsJijenyzWMWikHko6GplT10yYsTMUfY/bL1fKUALwDLVgajeL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPeNMd44; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPeNMd44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745432916; x=1776968916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xum3k3BlOrxGa8GkxLaIJuF0bEOYhbGZkLAtgBoIxQQ=;
  b=OPeNMd44UyIug/PsEQx7rWPzfwKflLnCCvl+kM8HS81vQ20yf/9QbtzW
   4dRZoDHCD/Srtr0MC/Z9q54lYiPlju0ddEtXrRsIcbPP2fp89Atj9Ork9
   r35WePVrGZ3skS16R69qKMuBZckHLIShrc+NWW8Bee8VR0ObPss8SfoWg
   ADc0etWimcy2A+phj81mQtDTiietSO5V2FypPHk3M2ne07ll2EIAFNcXv
   2HFsHY8FsRHcnNIVRF9KNO0oUE3W2rcZu+35FwkvTdDHeQ74hvZzhAhUe
   WIwZEMk3bfw4KD4fnHKFwzlWJMSpzgFT9GMiFg5hwmR1zPZ5ElzMNHR1P
   Q==;
X-CSE-ConnectionGUID: E527cLvzQPW5orKWsbMZEg==
X-CSE-MsgGUID: FKodk6xHR7SxOe646YehLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47140110"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="47140110"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 11:28:35 -0700
X-CSE-ConnectionGUID: 8HTISkE0RaSkfFzvYgbE5g==
X-CSE-MsgGUID: YJOwww3zSDCN1PM2ebd25w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="163430486"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Apr 2025 11:28:34 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7epk-0003XP-1n;
	Wed, 23 Apr 2025 18:28:32 +0000
Date: Thu, 24 Apr 2025 02:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2163/2163]
 drivers/gpu/drm/phytium/phytium_gem.c:169:6: warning: no previous prototype
 for 'phytium_gem_prime_vunmap'
Message-ID: <202504240208.n1driNHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb46ff9245f25c71ce2d456156bb2fc39c400aad
commit: 792b82446538ed840a6e23b89673ce21564702bd [2163/2163] Fix gic support for Phytium S2500
config: arm64-randconfig-004-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240208.n1driNHi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240208.n1driNHi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240208.n1driNHi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/phytium/phytium_gem.c:22:5: warning: no previous prototype for 'phytium_memory_pool_alloc' [-Wmissing-prototypes]
    int phytium_memory_pool_alloc(struct phytium_display_private *priv, void **pvaddr,
        ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:37:6: warning: no previous prototype for 'phytium_memory_pool_free' [-Wmissing-prototypes]
    void phytium_memory_pool_free(struct phytium_display_private *priv, void *vaddr, uint64_t size)
         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:160:5: warning: no previous prototype for 'phytium_gem_prime_vmap' [-Wmissing-prototypes]
    int phytium_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
        ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/phytium/phytium_gem.c:169:6: warning: no previous prototype for 'phytium_gem_prime_vunmap' [-Wmissing-prototypes]
    void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
         ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/phytium/phytium_gem.c:181:5: warning: no previous prototype for 'phytium_dma_transfer' [-Wmissing-prototypes]
    int phytium_dma_transfer(struct drm_device *drm_dev, int dev_to_mem, void *addr,
        ^~~~~~~~~~~~~~~~~~~~


vim +/phytium_gem_prime_vunmap +169 drivers/gpu/drm/phytium/phytium_gem.c

b80df10f845813 lishuo 2024-01-31  168  
b80df10f845813 lishuo 2024-01-31 @169  void phytium_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
b80df10f845813 lishuo 2024-01-31  170  {
b80df10f845813 lishuo 2024-01-31  171  

:::::: The code at line 169 was first introduced by commit
:::::: b80df10f845813bb4fc2002b5386ecdfa8be5f6c DRM: Phytium display DRM driver

:::::: TO: lishuo <lishuo@phytium.com.cn>
:::::: CC: lishuo <lishuo@phytium.com.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
