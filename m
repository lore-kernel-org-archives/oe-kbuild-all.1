Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAC236402E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766584564; cv=none; b=dGUTj1Ulzr5bV1gZcC4rpvQMwvPMGW1UrU/6SI8zh8Wvb/XCbRhN/9p7S97Onj2LcwyMZEe0uUYUzbqyB4nBzQxRT+sAL2on4CiqO5rmiX1JAw1hHcrSa7Z16fkpzXZj83kwEUGn8+9dBHLWrWbC09a3CcvpXVM2lODxY4i4sIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766584564; c=relaxed/simple;
	bh=TfYkXSIkIYZNvtw3DvqTLrNCG9mELC6XG1nO+QRhUh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J2+h2O4Te/IfgKymTOW90QPZinR7eTmaA4FrPZ9iz8MwXw/fNQJYTSPZMg+J0WZTlsbkTDbKyxC3a/m5Q+V3nevOwXOs1yQ82bru1ZRLWYd8CD3VaWvEn9HKa+SpD99GhcxrWV1O9HaHnPhVt4O01HMLYOb0BkMzwJRoQa7bPZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/30S51S; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/30S51S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766584562; x=1798120562;
  h=date:from:to:cc:subject:message-id;
  bh=TfYkXSIkIYZNvtw3DvqTLrNCG9mELC6XG1nO+QRhUh8=;
  b=a/30S51SUwjKC1vZyYk/SQC8Mkqc3Pfut9yOrZfrDMszuZAxALC+8Lky
   E0ZYpYD96WeMPfaCLPZ2HAceJQhT4Ago4hKjtUD68L50jpeQN01sPj2Ra
   oCrvtX9ZYCHK2K0leFaYEU1Y9cweq90XoIcVZk4/Kn8YzHdDeRPhZLn48
   ifxG/B2Z9sEb1GRb5/VAi6mMwLUFhg4a36pIym9AyNZaJ48wXYZEu1XRY
   ZG2Q92nD/c9EUv0fKNbK5bFcc0YZWXKKL0i+C5btlBzeUM1M4Afv8FnWC
   Su1PBKT7PYb6EgoYU4gjdUbhNvTvdyiM0lsjjADurDFskhzjuS4Qfke98
   g==;
X-CSE-ConnectionGUID: vszZ7qY/QSKQeWmXNE21KA==
X-CSE-MsgGUID: cnUVj3LkRaWW+YCgQjvUdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68578813"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68578813"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 05:56:01 -0800
X-CSE-ConnectionGUID: +1If9gDcQwGQEZHYcepqJg==
X-CSE-MsgGUID: Nfqva/csTQWqYmolIzianw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 24 Dec 2025 05:56:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYPLK-00000000381-0Btc;
	Wed, 24 Dec 2025 13:55:58 +0000
Date: Wed, 24 Dec 2025 21:55:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/2]
 drivers/gpu/drm/xe/xe_pxp_submit.c:46:45: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202512242100.S4OOITOI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   5685efeaa839be4b5a6883458e4a4f003b6b168b
commit: 4767008f9bff6399fe093c6ce4d7688e333ed671 [0/2] UPSTREAM: drm/xe/pxp: Allocate PXP execution resources
config: x86_64-randconfig-122-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242100.S4OOITOI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242100.S4OOITOI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242100.S4OOITOI-lkp@intel.com/

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
