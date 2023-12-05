Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D061961FDA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAe/lNcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701787163; x=1733323163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=65Md/a0QTDH+9kuPV9zvVy/nhEzNwIYqYDkJjA9tOdQ=;
  b=LAe/lNcIApsYYBgpNPeChOViggZImu5gDf0mhPIFDbXOkIaQ26kzr0c2
   0xcpS9NHzaQO19ulnw0+T6o6ka7PGWgNbUQUPghG74V1MBA0CUMve6BJs
   eh3oSEhfrVhkAht8noZJSJHOJkDlmxO6hiQ1NSpLopnuIm35nDwps8vhc
   1VoO7j6oavbtr0zXImYkQrPx3tqeihUNML15GpEKVIVbAcW2XNBG2NjUw
   iXxgH5tBimhkeD5KDzsKHzKELqWi73CsDxDzcwWXgOemLIOAS0+ve5kWU
   oRYBEqd9axe5bbF0gxsfH1wnCr/fzoxcckpZPQoA078PUc2gs0pfO9MCk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7247134"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="7247134"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 06:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="888957133"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="888957133"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 06:39:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAWZy-0009Bi-1R;
	Tue, 05 Dec 2023 14:39:18 +0000
Date: Tue, 5 Dec 2023 22:38:19 +0800
From: kernel test robot <lkp@intel.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 3341/4884]
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202312052245.yFpBSgNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: 9a1c1339abf972477aeef4ea037e650f49c5892d [3341/4884] drm/amdkfd: Run restore_workers on freezable WQs
config: x86_64-randconfig-123-20231203 (https://download.01.org/0day-ci/archive/20231205/202312052245.yFpBSgNH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312052245.yFpBSgNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312052245.yFpBSgNH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h):
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:316:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:320:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence [noderef] __rcu *
>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:1671:9: sparse:    struct dma_fence *
--
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: note: in included file (through drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h, drivers/gpu/drm/amd/amdgpu/amdgpu.h, ...):
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:316:49: sparse: sparse: static assertion failed: "amd_sriov_msg_vf2pf_info must be 1 KB"
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:320:49: sparse: sparse: static assertion failed: "amd_sriov_msg_pf2vf_info must be 1 KB"
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence [noderef] __rcu *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence [noderef] __rcu *
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:2765:36: sparse:    struct dma_fence *

vim +2765 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

  2761	
  2762	static void replace_eviction_fence(struct dma_fence **ef,
  2763					   struct dma_fence *new_ef)
  2764	{
> 2765		struct dma_fence *old_ef = rcu_replace_pointer(*ef, new_ef, true
  2766			/* protected by process_info->lock */);
  2767	
  2768		/* If we're replacing an unsignaled eviction fence, that fence will
  2769		 * never be signaled, and if anyone is still waiting on that fence,
  2770		 * they will hang forever. This should never happen. We should only
  2771		 * replace the fence in restore_work that only gets scheduled after
  2772		 * eviction work signaled the fence.
  2773		 */
  2774		WARN_ONCE(!dma_fence_is_signaled(old_ef),
  2775			  "Replacing unsignaled eviction fence");
  2776		dma_fence_put(old_ef);
  2777	}
  2778	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
