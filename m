Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D937106E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 17:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642335; cv=none; b=oO3lcrAFuDVMNqC4BknBgBdsRziOng0s3fBlRwvQ0/2rtT5PZPyDwltQ6ylrjQHqdOg7WZ9dZ/FFbgFUyqCyo5Fil6ryPB55GG1HI8Dtmnz5/gMQRjx1EeSE6JXEHcHDRAIv3qC5DdDRa47FJ6qKyZ91okBJ7/hqwR+3vgXYsdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642335; c=relaxed/simple;
	bh=qs1YLE93kvzOI8FIh3L/jt7P4lLGv/EQf3UggoPSuGY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n1gFGjUv3ve85j7StP91kojJElHt+GGMBJTKVE4CwFiuT/KnLz7/be0kohroQO8hrngQQxTRN19Rzwf0C7fxEkcfqhsXBr54zaR4lVYmZTmcOwonC4HWsT0bA89s8JTT87JK7x/MWxVww0crhmO35ylJ5GHRMtG8ysj0fVL5Jcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3RYMvup; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3RYMvup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786642333; x=1818178333;
  h=date:from:to:cc:subject:message-id;
  bh=qs1YLE93kvzOI8FIh3L/jt7P4lLGv/EQf3UggoPSuGY=;
  b=E3RYMvupC1MjEtHRUBxwZT3eCo5PlkzqMmAXu+Hr/5oyQ9H4hGU2xEyv
   ALGQsktLhex7gXPEGr8HEm+Dts6lCELeGp7v3UsZPpSYCTOgKHNAcdIRT
   tjvA99V4+kPATwyNqEAeowlNIjAPwbdzc2ZhPVpdz9AmA8xy0v5oVK9zp
   mfcfdjFsF5tHF6udZ5+VxlKxc9HugTRr5bghlGJ4Yc435QU0O9+5cXj/p
   xBxz++9YgGIYCsnXqgkQphY1/V9sWiWONJ9hIou/ra+Hd5zW0qgkKOz1d
   54SUN+du/n57P70BDlb/Svw+tdtXRQVT204Y9uZnEDL1Mylr5jvyXUibZ
   g==;
X-CSE-ConnectionGUID: PiVF1fLKSRGOY9lx/XZyOw==
X-CSE-MsgGUID: DKDdYKmOShiNLJtuxTWgYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87247640"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87247640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 10:32:12 -0700
X-CSE-ConnectionGUID: BFtjY+siQdSMHvf8u5JXZg==
X-CSE-MsgGUID: wR3RJxR9TJKKRzAcwu+yNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="264581952"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Aug 2026 10:32:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuZHl-00000000W2C-0aRT;
	Thu, 13 Aug 2026 17:32:09 +0000
Date: Fri, 14 Aug 2026 01:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1]
 drivers/gpu/drm/xe/xe_pxp_submit.c:46:45: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202608140159.uypsNqpe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   24c37396da197463e1ff2bc69bb789e34dacad53
commit: 4767008f9bff6399fe093c6ce4d7688e333ed671 [0/1] UPSTREAM: drm/xe/pxp: Allocate PXP execution resources
config: i386-randconfig-062-20260813 (https://download.01.org/0day-ci/archive/20260814/202608140159.uypsNqpe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140159.uypsNqpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140159.uypsNqpe-lkp@intel.com/

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
