Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E612D18EB0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Apr 2026 14:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776005388; cv=none; b=YpGSJ69T8gIHRJPh16+cdk+Vxk7egsNECAmTg0hsvmF9pF406b6klQnbbfjqTCpoZFpDYzvzuL7O8jjo4PyYNNPm3QBGv58OY2ocBZXVbxbo3TboYcBzneCmvn2VPdFBtWJNVX67e5ByOzFY38/8BFe3SHEpYxICfodNuiKBjgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776005388; c=relaxed/simple;
	bh=34B2LSgcgmJuNnRiyHWgjB9HKqRdlTE+zh6wW41kDq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ijC7Tg+zCbXmwbztYikJv4jsallmdvO2auZv72FhXFBouEA/2LTM+yeboArQI/9DbJOXO8HyqATELT9NlY91AY4k0cc8DJXHsDbjW4cJZYDwn0zfqIpTEx34SwATDJRQe7B+BnqcPcYz6YyZyfBGMlT5YmXbyQuqZ1FjQbqsS2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUF9QKQg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUF9QKQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776005387; x=1807541387;
  h=date:from:to:cc:subject:message-id;
  bh=34B2LSgcgmJuNnRiyHWgjB9HKqRdlTE+zh6wW41kDq4=;
  b=AUF9QKQgdHyOMj5WAe7Nfc0d2wuBeNNt4uxMwVxV2fS1xVGSKJgBmhY8
   lbIDhxyoPKKl2Yxgj3qBmuh0GJCXN65v2+KZBI9jJFa2QFy3ySH81tZ0g
   3uI3NdPYfa3Jj7MVqj6e64i7GZlniK5dqBzGl4I57VBVvMTNhvMg9B8EY
   gboH8IHk6M4v1+AjyvSCrxpP3AP/tzYBZqSWwYLu7UcuCCOTbrW3oXvey
   fPuIILDelh0Sf7wNdnaPdL6bHwit9Qb27IvAWZC/mvRvrahb/ivttRWic
   WpLe75vwQiB3OTpjwcUkRLTNIV9792sYmWHUEGvynO3p4LUPbz4z6j17q
   w==;
X-CSE-ConnectionGUID: qRsLOI7+TAuz/4rj+CAAHw==
X-CSE-MsgGUID: hqq6bqCKTFaOiZpblft4gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="88405333"
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="88405333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 07:49:46 -0700
X-CSE-ConnectionGUID: AaGaGFe1T/GTkE9dG4/0gA==
X-CSE-MsgGUID: +A1v4tliQzaC9CM4QrZ90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,175,1770624000"; 
   d="scan'208";a="234547302"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2026 07:49:46 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBw86-000000002Gj-2Ykb;
	Sun, 12 Apr 2026 14:49:42 +0000
Date: Sun, 12 Apr 2026 22:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/30]
 drivers/gpu/drm/xe/xe_pxp_submit.c:46:45: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202604122237.IxCvVq2p-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   97d0a25056250b3e715afe4a7b06837230f6d06e
commit: 4767008f9bff6399fe093c6ce4d7688e333ed671 [0/30] UPSTREAM: drm/xe/pxp: Allocate PXP execution resources
config: x86_64-randconfig-122-20260412 (https://download.01.org/0day-ci/archive/20260412/202604122237.IxCvVq2p-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260412/202604122237.IxCvVq2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604122237.IxCvVq2p-lkp@intel.com/

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
