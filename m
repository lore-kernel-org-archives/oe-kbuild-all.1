Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8718221DB6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Nov 2025 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120675; cv=none; b=PbxT683WH8yxADgx5XMdkzYsUZ1SO/IKpI+PdsVTFxwOF9tteIWe1shT6ilfNez9S8knVtxqrCXtcOzMvOEbkLb0hfQAkHemM3LpEBNBliHABj6imTQYrgCXcfVJnvKg+jCNK5YNuqL7TzccqrW2UH0HftUYu5rEPzX2w30moJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120675; c=relaxed/simple;
	bh=C6iS0bMosv9bMtQrB6VTtO2CE57nGf0I7IUZKqbCHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZkYYt7ysqV6Yye4OapWPcsIbTyAwWSj0dphCrSdC7PS/dxqQpMze5+PBNQjcw5mgvbotbsehBn40I1IElJavsz6RJrKlOVYHUECWlAwDcGiltXZEBhyddStkDJ9MczPgK7DX2E9WmnTy3+oDK61xpopFniTR579JbQS98sKvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7cx6Wr+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7cx6Wr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763120673; x=1794656673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C6iS0bMosv9bMtQrB6VTtO2CE57nGf0I7IUZKqbCHsg=;
  b=R7cx6Wr+YNgy547ONGFQLSYmAyWZkUZqNO55RaRDdl2rX0tDTKjvGD2Q
   g/sNf1xdpu3QOFbQslA+aX84PySVJ2EPVj6kug6QBoLsdg/EdMVAl99JM
   26vBkWIwtQBqwjWov26WLInlh+no6qwytxG0SRDoX+GeQ0ggWcq/g1f70
   Ak5qq8u+o1v9Vxg5seRDrtlIk6WTDMWpP9x6KF+WtjwB1DTsTEaacNMjX
   C8HlCe7ShDkLTb8TjE4WPFGwzlQeZaTTMzAHTT8mOu9I20uVIkV4nCX43
   6RBJr37aFTa9Q1k5c69bB3SF2nsskE30JbuYKMU9bBpjpkYBwELDhkwJ3
   g==;
X-CSE-ConnectionGUID: XMqzOUdJQkSH35gFG0dWrw==
X-CSE-MsgGUID: 98tH4LR+RV6eKSQM95v54Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="76315366"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="76315366"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 03:44:33 -0800
X-CSE-ConnectionGUID: k05ZyNWSRdSWUWWN+wzi4Q==
X-CSE-MsgGUID: k5dDaxgPQPehRRpgUwtnNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="227107753"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 03:44:30 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJsE7-0006XX-35;
	Fri, 14 Nov 2025 11:44:27 +0000
Date: Fri, 14 Nov 2025 19:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
	tursulin@ursulin.net, matthew.brost@intel.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
Message-ID: <202511141921.NxnbQ4Zt-lkp@intel.com>
References: <20251113145332.16805-14-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113145332.16805-14-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251113]
[cannot apply to drm-xe/drm-xe-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3 v6.18-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v3/20251113-235209
base:   next-20251113
patch link:    https://lore.kernel.org/r/20251113145332.16805-14-christian.koenig%40amd.com
patch subject: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
config: riscv-randconfig-001-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141921.NxnbQ4Zt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141921.NxnbQ4Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141921.NxnbQ4Zt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c: In function 'amdkfd_fence_signal':
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:162:9: error: implicit declaration of function 'dma_fence_lock_irqsafe'; did you mean 'dma_fence_lock_irqsave'? [-Werror=implicit-function-declaration]
     162 |         dma_fence_lock_irqsafe(f, flags)
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         dma_fence_lock_irqsave
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:162:41: error: expected ';' before 'if'
     162 |         dma_fence_lock_irqsafe(f, flags)
         |                                         ^
         |                                         ;
     163 |         if (fence->mm) {
         |         ~~                               
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:169:1: error: expected ';' before '}' token
     169 | }
         | ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c:159:37: warning: unused variable 'fence' [-Wunused-variable]
     159 |         struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
         |                                     ^~~~~
   cc1: some warnings being treated as errors


vim +162 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c

   156	
   157	void amdkfd_fence_signal(struct dma_fence *f)
   158	{
 > 159		struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
   160		long flags;
   161	
 > 162		dma_fence_lock_irqsafe(f, flags)
   163		if (fence->mm) {
   164			mmdrop(fence->mm);
   165			fence->mm = NULL;
   166		}
   167		dma_fence_signal_locked(f);
   168		dma_fence_unlock_irqrestore(f, flags)
 > 169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
