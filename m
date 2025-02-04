Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F2C212D83
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 19:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698171; cv=none; b=QDescdkmhwB7zo7duVTw2tvDUJ5VDwevyCUBW5B64FJGs+1v1Z541WzznItIYjgv7WeF7Ckokjw5Fzqf/LLaSi5SMhSW1ft5JHvnYWmqMJwWVb3NCGTSzBUhAdzMRJB/7zIaoEPqGoQwV+ZLfPu8dDIqk8w+GcFQJlgHyqBeZo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698171; c=relaxed/simple;
	bh=OcRqcGs6dKFHR+0eNogtaeztXKW++wmAU8qcT5RFT1I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e7Fxy0Jt8xcYvMXhYfHjXFpoNl4kL09b8p2SO7Fycac5vEmGSBxH4GjrzoDonMJvDmwi8QiorgR1ShlofSPTq4H+PauVjdAMIbZUSWu2WYF88H/NBM+ru6933+O7qfFSuFxHacPbYBvu7pEiQf3rmX9BvdI/nyKhEyeuu7+kGWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lvwLrlCh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lvwLrlCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738698169; x=1770234169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcRqcGs6dKFHR+0eNogtaeztXKW++wmAU8qcT5RFT1I=;
  b=lvwLrlChlJCCS+MZsNRvCZl7b2eDQCvsigooj1hPEyk1N2FRvafv+LAw
   evC9Qm1LUf3Dpa3KUGyiy7AyeApivRBmp4affZagg+qeWbNOKFCdV4UJ0
   qv7fDKkyc/HyjrzwlkheExiGmVeJMGOyyjdEpx5tj7sDLxr7M9C+A9VTg
   RCnp6S3pCuAjKERF/NOmcjeqbmS4m1eM5/DDC12Ei+BewxF6E38/ssFfd
   E5dqYtxtM3vfxy3YgwikP8etolZCvUOIZWih7mAJc2UGu1b+czivwaLWh
   8CeXhZwECZoaQEE7JV4T+U7JFCuQoeLBOL55ar6+3HiPxNw3OWTQcYrp4
   Q==;
X-CSE-ConnectionGUID: AHbLL1OeS+amnZhEqz6KNQ==
X-CSE-MsgGUID: 3U0AitWTQDCoBvnLM6tPqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38453121"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38453121"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:42:48 -0800
X-CSE-ConnectionGUID: aEiTdb7aSHSfdy/SDS4mFg==
X-CSE-MsgGUID: /doQznAhQ1GgNSUy2ytvCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="111231187"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Feb 2025 11:42:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfOon-000svW-0f;
	Tue, 04 Feb 2025 19:42:45 +0000
Date: Wed, 5 Feb 2025 03:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	John Harrison <John.C.Harrison@intel.com>
Subject: [linux-next:master 1216/1375]
 drivers/gpu/drm/xe/xe_pxp_submit.c:46:45: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202502050322.VUBMyUHc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
commit: dcdd6b84d9acaa0794c29de7024cfdb20cfd7b92 [1216/1375] drm/xe/pxp: Allocate PXP execution resources
config: powerpc-randconfig-r131-20250205 (https://download.01.org/0day-ci/archive/20250205/202502050322.VUBMyUHc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250205/202502050322.VUBMyUHc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502050322.VUBMyUHc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_pxp_submit.c:46:45: sparse: sparse: Using plain integer as NULL pointer

vim +46 drivers/gpu/drm/xe/xe_pxp_submit.c

    17	
    18	/*
    19	 * The VCS is used for kernel-owned GGTT submissions to issue key termination.
    20	 * Terminations are serialized, so we only need a single queue and a single
    21	 * batch.
    22	 */
    23	static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
    24	{
    25		struct xe_gt *gt = pxp->gt;
    26		struct xe_device *xe = pxp->xe;
    27		struct xe_tile *tile = gt_to_tile(gt);
    28		struct xe_hw_engine *hwe;
    29		struct xe_exec_queue *q;
    30		struct xe_bo *bo;
    31		int err;
    32	
    33		hwe = xe_gt_hw_engine(gt, XE_ENGINE_CLASS_VIDEO_DECODE, 0, true);
    34		if (!hwe)
    35			return -ENODEV;
    36	
    37		q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
    38					 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
    39		if (IS_ERR(q))
    40			return PTR_ERR(q);
    41	
    42		/*
    43		 * Each termination is 16 DWORDS, so 4K is enough to contain a
    44		 * termination for each sessions.
    45		 */
  > 46		bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
    47					  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);
    48		if (IS_ERR(bo)) {
    49			err = PTR_ERR(bo);
    50			goto out_queue;
    51		}
    52	
    53		pxp->vcs_exec.q = q;
    54		pxp->vcs_exec.bo = bo;
    55	
    56		return 0;
    57	
    58	out_queue:
    59		xe_exec_queue_put(q);
    60		return err;
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
