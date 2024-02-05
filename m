Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706B7BE66
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 22:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707172249; cv=none; b=q02APjLE14G2aJvAIfjJjePBG+gFsgaA2V2SqZzT1+t0oqzdi0MXHLzzs2oSRy1rT9Kcrr48PPfP5IH7jQH44IQFJHuwuG5JTRoRk09mkIJ4b/s+sXnLXdmy1OgG6pFwpxfDwqDg9Jpw6Qxb+2PbwfUxiClamWAvKxETcN85MaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707172249; c=relaxed/simple;
	bh=ItL5clzogLcUEoal1DpoE1yLgSGvFAJRtB5wBQhjnZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5v35ZKeBG7QGX+nJRpuBsg+HyaFPnKGxDm5ZW/RTqg26eqC70MVqsMCk1760695Nyg+iyzkKDwyYSq8atiL0u2/f8z8aCPsrDWC0PxhJUysvbiEXJP/noiAD0S5HPiIkaDK2SQw5p4QBjFyzSpQCq6KJUF8j+BCbu4qaci7zCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUsTs1fu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUsTs1fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707172247; x=1738708247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ItL5clzogLcUEoal1DpoE1yLgSGvFAJRtB5wBQhjnZs=;
  b=iUsTs1fuMaac9t0lE+93839WBkMMFOA7ACyGv0/IM8of2hyCHkB0d72S
   cNfW1sppN3FnqChq7XOZecTBgxLYVo3wuk5j8yj6swPlFFGsa+s3rDj/r
   wwKJv7zgdb3RGA3f8wcvTWlbK3lgI2R2wcWkQx2/62uNA42JHqBe1oP+M
   SCnME3E2+nYlReWg9GJgohuFpbSk5r4iT1AzbqSZZNuAfyPzEKzLyWVeq
   yzOxzi070tTPOde784ZLw32YI7Ir3w+j+6MOBM3saWMM9G426LNchwMaH
   xUb4H5aQjniZ0GRb8SVEQM4/S80BbtaMcCp6j0LSTP2ertZfLSrsccpT/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="526102"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="526102"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 14:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="1113286"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Feb 2024 14:30:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX7U9-0000rk-0f;
	Mon, 05 Feb 2024 22:30:41 +0000
Date: Tue, 6 Feb 2024 06:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: [drm-xe:drm-xe-next 1/4] drivers/gpu/drm/xe/xe_bo.c:1635:9: error:
 implicit declaration of function 'drmm_release_action'; did you mean
 'devm_release_action'?
Message-ID: <202402060635.9vgI8A76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   897c5b367db8affee69823c7e639caf33187bdf2
commit: 30b71bce350e4ab5e495697838b1fb8478970140 [1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240206/202402060635.9vgI8A76-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060635.9vgI8A76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060635.9vgI8A76-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_bo.c: In function 'xe_managed_bo_reinit_in_vram':
>> drivers/gpu/drm/xe/xe_bo.c:1635:9: error: implicit declaration of function 'drmm_release_action'; did you mean 'devm_release_action'? [-Werror=implicit-function-declaration]
    1635 |         drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
         |         ^~~~~~~~~~~~~~~~~~~
         |         devm_release_action
   cc1: some warnings being treated as errors


vim +1635 drivers/gpu/drm/xe/xe_bo.c

  1608	
  1609	/**
  1610	 * xe_managed_bo_reinit_in_vram
  1611	 * @xe: xe device
  1612	 * @tile: Tile where the new buffer will be created
  1613	 * @src: Managed buffer object allocated in system memory
  1614	 *
  1615	 * Replace a managed src buffer object allocated in system memory with a new
  1616	 * one allocated in vram, copying the data between them.
  1617	 * Buffer object in VRAM is not going to have the same GGTT address, the caller
  1618	 * is responsible for making sure that any old references to it are updated.
  1619	 *
  1620	 * Returns 0 for success, negative error code otherwise.
  1621	 */
  1622	int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src)
  1623	{
  1624		struct xe_bo *bo;
  1625	
  1626		xe_assert(xe, IS_DGFX(xe));
  1627		xe_assert(xe, !(*src)->vmap.is_iomem);
  1628	
  1629		bo = xe_managed_bo_create_from_data(xe, tile, (*src)->vmap.vaddr, (*src)->size,
  1630						    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
  1631						    XE_BO_CREATE_GGTT_BIT);
  1632		if (IS_ERR(bo))
  1633			return PTR_ERR(bo);
  1634	
> 1635		drmm_release_action(&xe->drm, __xe_bo_unpin_map_no_vm, *src);
  1636		*src = bo;
  1637	
  1638		return 0;
  1639	}
  1640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
