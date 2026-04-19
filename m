Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B414BF97
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Apr 2026 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776581666; cv=none; b=PVS26VdOFmNB63QZqo2Kcorb7Olcwjtj3ksikt8dtVjWQ3BXmT5T6Dz+rEGHrGZEO9r1MtQSFsjinilZ6Yb8IWVP+gkXbHNtLX/Ct560OFrwroZ4RoR6mSKRBBBoqaadj5oGDoQh9keXlEqixEP6VGCTATCQ7a784WlzIcAea2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776581666; c=relaxed/simple;
	bh=Ypsj6f2te78B/v8ILXPdd91Tp+F+goOCNoJr5a4lSd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ewLhVdiOkffIXegwVXcD9bayafyNdHGdMWqbsuq1ygItjL64Wlxafhc7Sz58Y4UeqMlDoDEWlij6gaH2V3AuQsT8Ii1VnjtSr2hVLPROIXQT9+Anyd/CYfq0NI32Vgcro07/kQL+s9ljehAjjMYWbuyRilrbN+bQkNf4j1lxShU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2OyIqMe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2OyIqMe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776581664; x=1808117664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ypsj6f2te78B/v8ILXPdd91Tp+F+goOCNoJr5a4lSd0=;
  b=W2OyIqMeO57OSZhqQJfjNFeEbgVy+plHP89WODIAkGtWUDEqIxFjwgvk
   lgmuCHXgVdCeSYDVnaP2sBKQYTbCn91JCtHs6TiZ3X2vO7po0pCIwDdI+
   MMYKItOaAx/bTTKwUIX5tb1yQOetJFatE6sQvlpH6nc6M3QLyHxdAbCzt
   KexRj+rYj8d3nAzwLAjtAJnEF2Ed+px4tVfCKL8lZat9HaZ7eiQ7HjswW
   DmSTt+GVqCZCzaTfVtYfjjltqqaHcmmLAf8+fHVcYaqP52nQ74Jtrf8Rl
   IN3w4/gUMvtuznH6dkzSnaUd9LeqnHfEWTO65fjxyEKRf2/IW0vtPKjcC
   Q==;
X-CSE-ConnectionGUID: U6fKqOaKT/WGDBl2TNt3zw==
X-CSE-MsgGUID: Uggm59GeSLSuc/85nZb9fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77606907"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="77606907"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 23:54:23 -0700
X-CSE-ConnectionGUID: JvvZqWLnQIGv9YcjARZO4A==
X-CSE-MsgGUID: DwvbyOUKQQitbkRVTh8lCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="235808691"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Apr 2026 23:54:21 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEM2s-000000001nc-3Rlt;
	Sun, 19 Apr 2026 06:54:18 +0000
Date: Sun, 19 Apr 2026 14:53:49 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Infrastructure <z1.linuxinfra@amd.com>,
 "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-staging-drm-next 2413/2470]
 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:152:68: warning: '%d' directive output
 may be truncated writing between 1 and 11 bytes into a region of size 7
Message-ID: <202604191416.tGvw5ot0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   a1404287ad4cc349ce3f5d94ac81903db9e0351f
commit: 0782a01cfcb588b6789c6264e099c4e15fdfef8f [2413/2470] drm/amdgpu/jpeg: Fix sprintf buffer overflow warning in jpeg_v2_5
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20260419/202604191416.tGvw5ot0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604191416.tGvw5ot0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604191416.tGvw5ot0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c: In function 'jpeg_v2_5_sw_init':
>> drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:152:68: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 7 [-Wformat-truncation=]
     152 |                 snprintf(ring->name, sizeof(ring->name), "jpeg_dec_%d", i);
         |                                                                    ^~
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:152:58: note: directive argument in the range [-2147483641, 254]
     152 |                 snprintf(ring->name, sizeof(ring->name), "jpeg_dec_%d", i);
         |                                                          ^~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c:152:17: note: 'snprintf' output between 11 and 21 bytes into a destination of size 16
     152 |                 snprintf(ring->name, sizeof(ring->name), "jpeg_dec_%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +152 drivers/gpu/drm/amd/amdgpu/jpeg_v2_5.c

    96	
    97	/**
    98	 * jpeg_v2_5_sw_init - sw init for JPEG block
    99	 *
   100	 * @ip_block: Pointer to the amdgpu_ip_block for this hw instance.
   101	 *
   102	 * Load firmware and sw initialization
   103	 */
   104	static int jpeg_v2_5_sw_init(struct amdgpu_ip_block *ip_block)
   105	{
   106		struct amdgpu_ring *ring;
   107		int i, r;
   108		struct amdgpu_device *adev = ip_block->adev;
   109	
   110		for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
   111			if (adev->jpeg.harvest_config & (1 << i))
   112				continue;
   113	
   114			/* JPEG TRAP */
   115			r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_jpeg[i],
   116					VCN_2_0__SRCID__JPEG_DECODE, &adev->jpeg.inst[i].irq);
   117			if (r)
   118				return r;
   119	
   120			/* JPEG DJPEG POISON EVENT */
   121			r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_jpeg[i],
   122				VCN_2_6__SRCID_DJPEG0_POISON, &adev->jpeg.inst[i].ras_poison_irq);
   123			if (r)
   124				return r;
   125	
   126			/* JPEG EJPEG POISON EVENT */
   127			r = amdgpu_irq_add_id(adev, amdgpu_ih_clientid_jpeg[i],
   128				VCN_2_6__SRCID_EJPEG0_POISON, &adev->jpeg.inst[i].ras_poison_irq);
   129			if (r)
   130				return r;
   131		}
   132	
   133		r = amdgpu_jpeg_sw_init(adev);
   134		if (r)
   135			return r;
   136	
   137		r = amdgpu_jpeg_resume(adev);
   138		if (r)
   139			return r;
   140	
   141		for (i = 0; i < adev->jpeg.num_jpeg_inst; ++i) {
   142			if (adev->jpeg.harvest_config & (1 << i))
   143				continue;
   144	
   145			ring = adev->jpeg.inst[i].ring_dec;
   146			ring->use_doorbell = true;
   147			if (amdgpu_ip_version(adev, UVD_HWIP, 0) == IP_VERSION(2, 5, 0))
   148				ring->vm_hub = AMDGPU_MMHUB1(0);
   149			else
   150				ring->vm_hub = AMDGPU_MMHUB0(0);
   151			ring->doorbell_index = (adev->doorbell_index.vcn.vcn_ring0_1 << 1) + 1 + 8 * i;
 > 152			snprintf(ring->name, sizeof(ring->name), "jpeg_dec_%d", i);
   153			r = amdgpu_ring_init(adev, ring, 512, &adev->jpeg.inst[i].irq,
   154					     0, AMDGPU_RING_PRIO_DEFAULT, NULL);
   155			if (r)
   156				return r;
   157	
   158			adev->jpeg.internal.jpeg_pitch[0] = mmUVD_JPEG_PITCH_INTERNAL_OFFSET;
   159			adev->jpeg.inst[i].external.jpeg_pitch[0] = SOC15_REG_OFFSET(JPEG, i, mmUVD_JPEG_PITCH);
   160		}
   161	
   162		r = amdgpu_jpeg_ras_sw_init(adev);
   163		if (r)
   164			return r;
   165	
   166		r = amdgpu_jpeg_reg_dump_init(adev, jpeg_reg_list_2_5, ARRAY_SIZE(jpeg_reg_list_2_5));
   167		if (r)
   168			return r;
   169	
   170		adev->jpeg.supported_reset =
   171			amdgpu_get_soft_full_reset_mask(adev->jpeg.inst[0].ring_dec);
   172		if (!amdgpu_sriov_vf(adev))
   173			adev->jpeg.supported_reset |= AMDGPU_RESET_TYPE_PER_QUEUE;
   174		r = amdgpu_jpeg_sysfs_reset_mask_init(adev);
   175	
   176		return r;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
