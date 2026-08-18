Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436913EEAE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 18:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787078538; cv=none; b=Y9091AcnI7BVWkWaNVgp7ry84dyfXT69OR8brS14vjAZrXvdSiC3fWrxeWCfrFvCfNDwbm7cmcg793lw2cQcNOU7060GLK7KU+I/JMcqAYVr1DxyP1sF1PWXql0iLNif9ymqzXHSe4xyHoB6zk8deRjP1VWczIGRbI95sXXEDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787078538; c=relaxed/simple;
	bh=kCI4HzlE4csMV5/J20fJVz+MZ7ok14+Nl8TfAToX3a8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RqAnd81a45VekhRLK1egeZGFaR8JxRJJTzI/9dgzdN93zNu+unNI514/Tynkmg/7Of5kfyMDkqjKTdqxpoz1Cm2HZe4TidrgrrjRI3NQEudd0jZzoTBZuOQoblPiOsbLIn8uZV4MCL7BC9BEWsaP6EW/qt1LQUiNNFVrgiNBw08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hb/wISoz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hb/wISoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787078536; x=1818614536;
  h=date:from:to:cc:subject:message-id;
  bh=kCI4HzlE4csMV5/J20fJVz+MZ7ok14+Nl8TfAToX3a8=;
  b=hb/wISozXfR1D8SUMj47pg7uMV3BBYHB/iiCoN9j1Z5M6y9QPp0TJsh0
   AyU3R6Rf899GkQj/iN7J8EQCNDAXwem1CbfNBMqYYdtQLuQquztczxu/P
   sY6T6xl7FHfO+0FpYpKYP9EO2WCIMWgZYXqpUeDTb3utE71X2sOAeIFzM
   dhxbJKnj3FCdind6+xpE2WIc+B9R1I4Alzvk1gVK3Pa+ESVlkkEndueFY
   QJmZyp/YQllrD0s0cL4F54wmP61Ay/IThzePteMHZ4+OlAAOOJba+Z+Ac
   3OvLDud4OQa5aoan7o6iC8XF6xZkR/d2Qq4OJMs0h34Xvf7PaVSsAHhDY
   w==;
X-CSE-ConnectionGUID: XsHUZB8ETmGQ9YV8gRe6pA==
X-CSE-MsgGUID: 6vjrLWFFSfi6v6q/iAruHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="87497746"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87497746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 11:42:16 -0700
X-CSE-ConnectionGUID: hv8Ye0WFTEGkALtEkUSldg==
X-CSE-MsgGUID: BLAnOc3uQXOpcK2MvkXF8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="259116865"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Aug 2026 11:42:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwOlH-00000000eVe-2DsS;
	Tue, 18 Aug 2026 18:42:11 +0000
Date: Wed, 19 Aug 2026 02:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Prike Liang <Prike.Liang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Michael Chen <michael.chen@amd.com>
Subject: [linux-next:master 12134/15982]
 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:158 mes_userq_map() warn:
 inconsistent indenting
Message-ID: <202608190252.8XCa0HqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e6664f2b33db9b6811eb4cec109f06cb2b4f458d
commit: d0827dda8fa7a1b398d7cf41e4c88c314691dcbc [12134/15982] drm/amdgpu/mes: refactor the amdgpu_mes_alloc/free_proc|gang()
config: x86_64-randconfig-161-20260810 (https://download.01.org/0day-ci/archive/20260819/202608190252.8XCa0HqR-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608190252.8XCa0HqR-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/mes_userqueue.c:158 mes_userq_map() warn: inconsistent indenting

vim +158 drivers/gpu/drm/amd/amdgpu/mes_userqueue.c

   113	
   114	static int mes_userq_map(struct amdgpu_usermode_queue *queue)
   115	{
   116		struct amdgpu_userq_mgr *uq_mgr = queue->userq_mgr;
   117		struct amdgpu_device *adev = uq_mgr->adev;
   118		struct amdgpu_userq_obj *ctx = &queue->fw_obj;
   119		struct amdgpu_mqd_prop *userq_props = queue->userq_prop;
   120		struct mes_add_queue_input queue_input;
   121		struct amdgpu_mes *mes = &adev->mes;
   122		int r;
   123	
   124		memset(&queue_input, 0x0, sizeof(struct mes_add_queue_input));
   125	
   126		queue_input.process_va_start = 0;
   127		queue_input.process_va_end = adev->vm_manager.max_pfn - 1;
   128	
   129		/* set process quantum to 10 ms and gang quantum to 1 ms as default */
   130		queue_input.process_quantum = 100000;
   131		queue_input.gang_quantum = 10000;
   132		queue_input.paging = false;
   133	
   134		queue_input.process_context_addr = uq_mgr->proc_ctx_obj.gpu_addr;
   135		queue_input.gang_context_addr = ctx->gpu_addr;
   136		queue_input.inprocess_gang_priority = AMDGPU_MES_PRIORITY_LEVEL_NORMAL;
   137		queue_input.gang_global_priority_level = convert_to_mes_priority(queue->priority);
   138	
   139		queue_input.process_id = queue->vm->pasid;
   140		queue_input.queue_type = queue->queue_type;
   141		queue_input.mqd_addr = queue->mqd.gpu_addr;
   142		queue_input.wptr_addr = userq_props->wptr_gpu_addr;
   143		queue_input.queue_size = userq_props->queue_size >> 2;
   144		queue_input.doorbell_offset = userq_props->doorbell_index;
   145		queue_input.page_table_base_addr = amdgpu_gmc_pd_addr(queue->vm->root.bo);
   146		queue_input.wptr_mc_addr = queue->wptr_obj.gpu_addr;
   147	
   148		if (mes->use_rs64mem) {
   149			 if (!uq_mgr->proc_ctx_allocated) {
   150				r = amdgpu_mes_alloc_proc_ctx_index(mes, &uq_mgr->proc_ctx_array_index);
   151				if (r) {
   152					DRM_ERROR("Failed to allocate userq process index err:%d\n", r);
   153					return r;
   154				}
   155				uq_mgr->proc_ctx_allocated = true;
   156			}
   157	
 > 158			r = amdgpu_mes_alloc_gang_ctx_index(mes, &queue->gang_ctx_array_index);
   159			if (r) {
   160				DRM_ERROR("Failed to allocate userq gang index err:%d\n", r);
   161				return r;
   162			}
   163			queue_input.process_context_array_index = uq_mgr->proc_ctx_array_index;
   164			queue_input.gang_context_array_index = queue->gang_ctx_array_index;
   165		}
   166		amdgpu_mes_lock(&adev->mes);
   167		r = adev->mes.funcs->add_hw_queue(&adev->mes, &queue_input);
   168		amdgpu_mes_unlock(&adev->mes);
   169		if (r) {
   170			DRM_ERROR("Failed to map queue in HW, err (%d)\n", r);
   171			return r;
   172		}
   173	
   174		DRM_DEBUG_DRIVER("Queue (doorbell:%d) mapped successfully\n", userq_props->doorbell_index);
   175		return 0;
   176	}
   177	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
