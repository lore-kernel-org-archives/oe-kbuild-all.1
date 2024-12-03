Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E80F1EBA12
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230195; cv=none; b=pumBIbje0ag3vFt1QetEOf5n7DDs3Dur1Cw//DyFJKcqdPj+oC/aMkhm/mwGIBKWoJNQtbnF9j/OSuxnjtSG0RUqIe5IZ0KtsoqKLfrMtBjO/B4GsAOWHkfurzUlU2ld4ia89fWxtshkjrU/GlWfHOfXwS+l1CxiSNMAxunwHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230195; c=relaxed/simple;
	bh=7UZu0ziaZaBDwTOYrANrsEY3wFjtqhGGSt/teQPoGVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HpMAxVeAVDBdsd7mFTuqdvpbHZutoYUAe823S2fgCh5G7sm0RUrZwzUJe8/bN8HqryVB1nej6dbWf4V2AOChIbUDF1hTqaUTGCoM2KWGNBOEPOm1PYpIAsNu+ad4NS0fKjP5mpWzKgAk99J8AUzJyG3PsVmhYIoHM2No2twgKc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JO3IJu3N; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JO3IJu3N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733230193; x=1764766193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7UZu0ziaZaBDwTOYrANrsEY3wFjtqhGGSt/teQPoGVg=;
  b=JO3IJu3NdBy2BuhdqYdHpyq7MPy+ial4YZL8l3rBxGgpanvJd6zhofoz
   30V4a0XsJmsgH5Vj6byCwli/fmsowImC4UVVBwWb79CBZp+1a+ujPeq6+
   RaIaC4x+7YzDkYB6biH9/anfa3euT/4eXUPxddXSLZjOU0pHkM2zMnQVt
   zQmB81bEfEbHS5S1JmKMephZTjYkwWvKTvXFCT04/8QgmJoezbENDUIuy
   7du6TZQZIkFJvQ3/DiaHiyDQzJaBChRPpen+dBfaSHRomrpW8tlWQ4mS9
   +Pmyqkzzx07R3c/YEmB/ngNq61ktDbQe1Ng+J2nWxZFewsfYcoJQaM1J4
   w==;
X-CSE-ConnectionGUID: cdghVOXsR0i204LMhTwlsg==
X-CSE-MsgGUID: tXejeurPTGG24auAqcplYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32798036"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="32798036"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 04:49:52 -0800
X-CSE-ConnectionGUID: tsn7L6yfTpev1KLzZupTHw==
X-CSE-MsgGUID: 7nop7ZgoSS2J4DMPV14Waw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="98511196"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Dec 2024 04:49:51 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tISLd-0000fn-0d;
	Tue, 03 Dec 2024 12:49:49 +0000
Date: Tue, 3 Dec 2024 20:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jiakun Shuai <shuaijiakun1288@phytium.com.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2516/2516] drivers/gpu/drm/ast/ast_mm.c:91:39:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412032029.eVzOP3UR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f030ffc8e0c6dac3503bebddbf49cc339003fcdb
commit: 968ee436e4d0ce09994f74015dc163ef280ccc1e [2516/2516] drm/ast: Fixed display error for ps23xx when using ast bmc card
config: x86_64-randconfig-121-20241203 (https://download.01.org/0day-ci/archive/20241203/202412032029.eVzOP3UR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412032029.eVzOP3UR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412032029.eVzOP3UR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/ast/ast_mm.c:91:39: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/ast/ast_mm.c:91:39: sparse:     expected void *addr
   drivers/gpu/drm/ast/ast_mm.c:91:39: sparse:     got void [noderef] __iomem *

vim +91 drivers/gpu/drm/ast/ast_mm.c

    76	
    77	static int ast_driver_io_mem_reserve(struct ttm_bo_device *bdev,
    78										struct ttm_resource *mem)
    79	{
    80		struct drm_vram_mm *vmm = drm_vram_mm_of_bdev(bdev);
    81		size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
    82	
    83		switch (mem->mem_type) {
    84		case TTM_PL_SYSTEM:     /* nothing to do */
    85				break;
    86		case TTM_PL_VRAM:
    87				mem->bus.offset = (mem->start << PAGE_SHIFT) + vmm->vram_base;
    88				mem->bus.is_iomem = true;
    89	
    90				mem->placement = TTM_PL_FLAG_UNCACHED;
  > 91				mem->bus.addr = ioremap(mem->bus.offset, bus_size);
    92	
    93				if (!mem->bus.addr)
    94					return -ENOMEM;
    95	
    96				break;
    97		default:
    98				return -EINVAL;
    99		}
   100	
   101		return 0;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
