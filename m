Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6836F341AD0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 13:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770471286; cv=none; b=pHa13f3oubJKeDWUOrNMshIhR2Kg+q52mllMjIyi65z8v3jCrutx6ArfgcGbCYObcPu24gcj//zv03JqKbCPWw0rJPCxdZWQ6lglSzsmmvtQTK0YZqjOUSfIBsH6TJGYVchxBNLNkyKCDPPxtRdSn6PFweAzzJI8bqU6ahL+VdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770471286; c=relaxed/simple;
	bh=DsGXXdE+KT9IkyZUqxENh80lMjDbvNSRQ1QYXwNK7u4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EO8ZU9c91HuPvHsuoYNNBzwHoUpJT1x0lXKmrOw2d94lKu61tCI67bekaXsJnpOgobqslTkR9CK5GC/xOxcZZlDrsQmry5UIq++KNvK4n2h9fP680uhHrWmu8fTidRQKZzbxTYqQ1tirP5W39MH8MiPFw/G9fS9GT+T/SwchHR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mbiz3AHg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mbiz3AHg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770471287; x=1802007287;
  h=date:from:to:cc:subject:message-id;
  bh=DsGXXdE+KT9IkyZUqxENh80lMjDbvNSRQ1QYXwNK7u4=;
  b=Mbiz3AHgxFdZ/qfWz8NgkqJAtaKKx/naYNpd+RoeI4PP8iIeSEEj2+r5
   fApR3I2GNNuwcUzWy0QG/5wff2wNHvRag3ubJv2YwkxFQcpqBVQdjKjRV
   YK4qhDR3AKtC5URQrBhcs6dqDSuAk9aka0iRUJJg3Zin2ZcSXxNMX0cKs
   3RIP0QCmU5CeM5DU9toLlWbgpoYhjBahL2YpuPBOVZsL4rXVQnGGhMJAv
   IoG+1LfD8Vdyog+Aj0lfXcm+aFB/WVwAvExJC5cHomoFV4eVnNwNoBvOJ
   PIOb2/+Kp/euXdA/JXNP7BRv/oRF8kt0GvRhuTUNv53xfGKNqKmKnbdOb
   Q==;
X-CSE-ConnectionGUID: gjOZnJwGRZagvI4fSYTrAQ==
X-CSE-MsgGUID: DrZynA3BQzCFL3L9/CtXNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71839736"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71839736"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 05:34:46 -0800
X-CSE-ConnectionGUID: zFm1r/3HR6Kpb/vuj9NwRg==
X-CSE-MsgGUID: 5TpSBaYXQEO1btjqtMzunw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="210920359"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2026 05:34:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voiSQ-00000000lfe-1lxU;
	Sat, 07 Feb 2026 13:34:42 +0000
Date: Sat, 07 Feb 2026 21:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/ufshcd.h:25:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202602072150.SeL85llU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: 324b653e2a6a43fc6a3352536376a47e18452d22 [1/1] ANDROID: scsi: ufs: add complete init vendor hook
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072150.SeL85llU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072150.SeL85llU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072150.SeL85llU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ufs/core/ufshcd.c: note: in included file:
>> include/trace/hooks/ufshcd.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +25 include/trace/hooks/ufshcd.h

    15	
    16	DECLARE_HOOK(android_vh_ufs_fill_prdt,
    17		TP_PROTO(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
    18			 unsigned int segments, int *err),
    19		TP_ARGS(hba, lrbp, segments, err));
    20	
    21	DECLARE_RESTRICTED_HOOK(android_rvh_ufs_reprogram_all_keys,
    22				TP_PROTO(struct ufs_hba *hba, int *err),
    23				TP_ARGS(hba, err), 1);
    24	
  > 25	DECLARE_RESTRICTED_HOOK(android_rvh_ufs_complete_init,
    26				TP_PROTO(struct ufs_hba *hba),
    27				TP_ARGS(hba), 1);
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
