Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94904D26E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 13:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXCasZx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701005023; x=1732541023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=09oceiijNl4bYMdFwBGyoVtWj9VeoERB+IZ9Sta2da8=;
  b=YXCasZx1gDPOafIBfWg8qA9h7UXuriQWLrDYbW1E3NSk1C/XCLbtTEO4
   4ZSPVdRoKe5tUmYbERvVynlqYtpkJruXU/4fTfjVTg0dZEP0PDu7PY93I
   8cmRaUiuc89rvXbS9c1hnCL43PZjJ2doKmMgKQA8awS2SifKdIBwMez6V
   ckCyJwWIKgvzTdezdlvBDFY9OKe9UUy+JXYvGWp4aPIyhBC+TPThQvR5H
   VO7SrlFXTkduszhsls1n3Jm5uLXzNgmWQWLhBXnoP8FQUXovIV2dzfvOk
   JRYjk6mFag4+MpuR136+0a6t91j2n6XMV9tQEoeSyDqa+H4eWS6Ue1c0z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="395390912"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="395390912"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 05:23:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="885740129"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="885740129"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2023 05:23:41 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7F6p-0005Bu-02;
	Sun, 26 Nov 2023 13:23:39 +0000
Date: Sun, 26 Nov 2023 21:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:371
 dpu_encoder_helper_wait_for_irq() warn: unsigned 'irq_idx' is never less
 than zero.
Message-ID: <202311262012.AEAPW3dQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   090472ed9c922e699dc61dd601a9b376a64f4390
commit: 5a9d50150c2cd2dcc72729c14a0035b234c0a4cc drm/msm/dpu: shift IRQ indices by 1
date:   7 weeks ago
config: powerpc-randconfig-r081-20231126 (https://download.01.org/0day-ci/archive/20231126/202311262012.AEAPW3dQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311262012.AEAPW3dQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311262012.AEAPW3dQ-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:371 dpu_encoder_helper_wait_for_irq() warn: unsigned 'irq_idx' is never less than zero.

vim +/irq_idx +371 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c

25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  345  
fba33cae6aa3ea Jordan Crouse     2018-07-26  346  static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
667e9985ee24ca Dmitry Baryshkov  2021-05-16  347  		u32 irq_idx, struct dpu_encoder_wait_info *info);
fba33cae6aa3ea Jordan Crouse     2018-07-26  348  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  349  int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
5a9d50150c2cd2 Dmitry Baryshkov  2023-08-02  350  		unsigned int irq_idx,
e75e45c25b66ae Dmitry Baryshkov  2023-08-02  351  		void (*func)(void *arg),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  352  		struct dpu_encoder_wait_info *wait_info)
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  353  {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  354  	u32 irq_status;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  355  	int ret;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  356  
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  357  	if (!wait_info) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  358  		DPU_ERROR("invalid params\n");
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  359  		return -EINVAL;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  360  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  361  	/* note: do master / slave checking outside */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  362  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  363  	/* return EWOULDBLOCK since we know the wait isn't necessary */
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  364  	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
6893199183f836 Dmitry Baryshkov  2023-08-02  365  		DRM_ERROR("encoder is disabled id=%u, callback=%ps, IRQ=[%d, %d]\n",
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  366  			  DRMID(phys_enc->parent), func,
6893199183f836 Dmitry Baryshkov  2023-08-02  367  			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  368  		return -EWOULDBLOCK;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  369  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  370  
6893199183f836 Dmitry Baryshkov  2023-08-02 @371  	if (irq_idx < 0) {
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  372  		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  373  			      DRMID(phys_enc->parent), func);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  374  		return 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  375  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  376  
6893199183f836 Dmitry Baryshkov  2023-08-02  377  	DRM_DEBUG_KMS("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, pending_cnt=%d\n",
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  378  		      DRMID(phys_enc->parent), func,
6893199183f836 Dmitry Baryshkov  2023-08-02  379  		      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), phys_enc->hw_pp->idx - PINGPONG_0,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  380  		      atomic_read(wait_info->atomic_cnt));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  381  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  382  	ret = dpu_encoder_helper_wait_event_timeout(
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  383  			DRMID(phys_enc->parent),
6893199183f836 Dmitry Baryshkov  2023-08-02  384  			irq_idx,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  385  			wait_info);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  386  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  387  	if (ret <= 0) {
6893199183f836 Dmitry Baryshkov  2023-08-02  388  		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq_idx);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  389  		if (irq_status) {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  390  			unsigned long flags;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  391  
6893199183f836 Dmitry Baryshkov  2023-08-02  392  			DRM_DEBUG_KMS("IRQ=[%d, %d] not triggered id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
6893199183f836 Dmitry Baryshkov  2023-08-02  393  				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  394  				      DRMID(phys_enc->parent), func,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  395  				      phys_enc->hw_pp->idx - PINGPONG_0,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  396  				      atomic_read(wait_info->atomic_cnt));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  397  			local_irq_save(flags);
e75e45c25b66ae Dmitry Baryshkov  2023-08-02  398  			func(phys_enc);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  399  			local_irq_restore(flags);
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  400  			ret = 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  401  		} else {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  402  			ret = -ETIMEDOUT;
6893199183f836 Dmitry Baryshkov  2023-08-02  403  			DRM_DEBUG_KMS("IRQ=[%d, %d] timeout id=%u, callback=%ps, pp=%d, atomic_cnt=%d\n",
6893199183f836 Dmitry Baryshkov  2023-08-02  404  				      DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
1e7ac595fa46ea Dmitry Baryshkov  2022-02-17  405  				      DRMID(phys_enc->parent), func,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  406  				      phys_enc->hw_pp->idx - PINGPONG_0,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  407  				      atomic_read(wait_info->atomic_cnt));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  408  		}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  409  	} else {
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  410  		ret = 0;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  411  		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
6be6ece92050fe Dmitry Baryshkov  2023-08-02  412  			func, DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  413  			phys_enc->hw_pp->idx - PINGPONG_0,
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  414  			atomic_read(wait_info->atomic_cnt));
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  415  	}
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  416  
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  417  	return ret;
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  418  }
25fdd5933e4c0f Jeykumar Sankaran 2018-06-27  419  

:::::: The code at line 371 was first introduced by commit
:::::: 6893199183f836e1ff452082f0f9d068364b2f17 drm/msm/dpu: stop using raw IRQ indices in the kernel output

:::::: TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
:::::: CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
