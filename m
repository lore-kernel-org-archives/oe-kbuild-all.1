Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03C137F725
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208583; cv=none; b=e/kDaQMt0+JYdLLY3T2Nfa5RUi7WKMi8lTQgI1Sir6NFGUCWiyA+YfHKrsifNWEHLWF/i/at1Hy6JW/KzUkbydkorqAZyqGTLtw/TtG3KPWVEXY1ndI0Au3GuUmv3QYUcIkv54yMouAxvE2btNlGVXG3ZxM2rP9kaYniSj1dFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208583; c=relaxed/simple;
	bh=EQOazW5CD336bmfGtyc+neUA/IDSngYm/OPsDtn+eGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=UgoHMcOGQI8Tz1esoZqpW3AmxPSFCNQ78XoofbPfbuByCAhd9ClYC5QKlJosRk5XpUUAv+ORfViShvuK/oAFRf6kh/fVlOxnVKc6jXANFwpD2bBW6dUGFo2DW2KOKkKChMDCG9E4kMjtwfGkiuofEjSBvTXqZmF0TGRYqZBGLzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nnugiDMC; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nnugiDMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781208582; x=1812744582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EQOazW5CD336bmfGtyc+neUA/IDSngYm/OPsDtn+eGk=;
  b=nnugiDMCth2d1oHZ9iMTTRXQxgp8toTxIsxX/G8lrMJaYdvwj8aBkaGa
   G2/Ug4E+GVAMqtsy/5wgH+ijPD25OlSp2kHYdw2Td6vF2UunRe6VVeDWx
   fDwmiVXIZqyFpufHHjlozpfwCm1Bb0FszBAjZri7IL5BhD+iSI3bWOW99
   9SYo7cKbyRdH5QFw0b5KGMmXtaObI5gabbKJUIqeV0XjPjZyi19bD3Afz
   xAmfYlTgJ/TQWP/zVuPvLQrpjnWLCJeEUTYW3k8I9LI+vxb2j7fS8VMUd
   lRdLwVqwnfyzfaLhKYmvNYkBe3Y8QanYGP74pfzB9I/A3SZ6LinTv4B50
   g==;
X-CSE-ConnectionGUID: nO6sK0L6SPyvP5MWDM9Fow==
X-CSE-MsgGUID: xXyu/i2CT3qAmK/YIc3Dcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99612861"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99612861"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:09:39 -0700
X-CSE-ConnectionGUID: HfY326KoStuWooDYXm37SQ==
X-CSE-MsgGUID: zFtrrdUYR5+lMTClFWWYGQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 13:09:38 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXliZ-00000000NoX-3ZFh;
	Thu, 11 Jun 2026 20:09:35 +0000
Date: Fri, 12 Jun 2026 04:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:429:13:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202606120408.aeuScIKt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 276e8beb2a0c390fdac8f11bb58d9fdf95a6d538 drm/amdgpu/userq: add force completion helpers
date:   9 months ago
config: i386-randconfig-062-20260610 (https://download.01.org/0day-ci/archive/20260612/202606120408.aeuScIKt-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120408.aeuScIKt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 276e8beb2a0c ("drm/amdgpu/userq: add force completion helpers")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120408.aeuScIKt-lkp@intel.com/

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
