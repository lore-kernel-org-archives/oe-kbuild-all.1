Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7A4266B8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916894; cv=none; b=ZZLE/h+NWHaGpv0DbXz6umgSx+RNQJS6xGyBqIKtXLuiOMqFEZGNxRjUOX7wYAiZs3sT7Mg5UsTNlin63np88NTwdsRkipTVNKXqnFhxvlMPVdFc09L41NJEriN/ognq/MW4Q1FSqd9Z8Caurj/IETh/Yy3wz8eVam+Mpqz0EQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916894; c=relaxed/simple;
	bh=o4A7F7tA+UREQOAPNPgi+92cCGSqQ+0L5qprLBOpJRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=B+a6TJoKYdIU48pOQjVSdxSP5LV0EVUNBqEgurfd+BsbXyoeaFs5jJ/G7jcQ0nRsM7kjlCHv4/X346ZB2IAgzmLoemblgGIzSKoKCLV/RZARY2YW+cQcb5/kLIYnmzLEHEWppFjSdbEtXuYqT4caQHDgLMWboHYKiX2L6SAGgeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwOz0xZ5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwOz0xZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768916893; x=1800452893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4A7F7tA+UREQOAPNPgi+92cCGSqQ+0L5qprLBOpJRU=;
  b=ZwOz0xZ5XO70qZ3MFsFVfckj2CcAYZa3ptJw9deLm4UYPbMz8ziEXmma
   DjRcQeFsEIEuvYJ08kMeLZocg5cvVOEohHvj+e5tbvOAgHlVBESYpdm1O
   fzDhOneIO0GPj2q6kr0kpAGvRoRiC3sehaaFAgEvrBYLIAn7gma0vEbVP
   Q0zpdL8pgmukhNvrOYHAS5bbhdgK+VdTIpH9igfPr2Wuh3EzV0xU1l8kT
   EUmdZPnZSenxAL9wFCsacqKym4BlkNi4Ywjy5C3acLa7trFO+n3WUAPQW
   JzRget1ECsIt106pkoFVRucwX2jCdz0MXI44lI9j9rsxKIslfbSoI+371
   A==;
X-CSE-ConnectionGUID: oBAlW6nATpOmvwi4PaGljQ==
X-CSE-MsgGUID: d6nb+n9vS56Jvxx4oTyftg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70096172"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="70096172"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 05:48:12 -0800
X-CSE-ConnectionGUID: or034q3ITI6k5+loNMXITA==
X-CSE-MsgGUID: rabcPR1jQ+CKCGiA446TwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="211131186"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Jan 2026 05:48:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viC5Y-00000000P2l-0v6O;
	Tue, 20 Jan 2026 13:48:08 +0000
Date: Tue, 20 Jan 2026 21:47:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202601202148.ZjO032pH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 276e8beb2a0c390fdac8f11bb58d9fdf95a6d538 drm/amdgpu/userq: add force completion helpers
date:   5 months ago
config: sh-randconfig-r133-20260120 (https://download.01.org/0day-ci/archive/20260120/202601202148.ZjO032pH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601202148.ZjO032pH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601202148.ZjO032pH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:434:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse:    struct dma_fence [noderef] __rcu *
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13: sparse:    struct dma_fence *

vim +429 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

   418	
   419	static void
   420	amdgpu_userq_fence_driver_set_error(struct amdgpu_userq_fence *fence,
   421					    int error)
   422	{
   423		struct amdgpu_userq_fence_driver *fence_drv = fence->fence_drv;
   424		unsigned long flags;
   425		struct dma_fence *f;
   426	
   427		spin_lock_irqsave(&fence_drv->fence_list_lock, flags);
   428	
 > 429		f = rcu_dereference_protected(&fence->base,
   430					      lockdep_is_held(&fence_drv->fence_list_lock));
   431		if (f && !dma_fence_is_signaled_locked(f))
   432			dma_fence_set_error(f, error);
   433		spin_unlock_irqrestore(&fence_drv->fence_list_lock, flags);
   434	}
   435	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
