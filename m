Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA7374729
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886125; cv=none; b=VTlfDSrDZKRgCQnBUV6Z1+y5bgbYe17u2rFMhpWW6WMvdcwmnYLD1T2EFyESnhYxUz+r531IuzsTXhhe4NPFVESVjTEGeh9nnRLRSlOS1YoRDasb4VKDi0rsfWGh01Xd+JhMt4AmpYjeXOSI6vHG9mNH5DEwdXYTinLXf/DiGWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886125; c=relaxed/simple;
	bh=x0Iyvf7odpKD0BXPZQNHEcpSGVvBTFGOGCCxbGGKLJk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3yqBkvJEMGLqmTdkQta67Q5bkzTZjQnHBqRjDSeb9W8qSGH9d3hVR4MyMHFVpuPZ8FFBlfIIx2O+3J/967aVv1pYnSAN2ohX53+eJrqpA6UZmclK5bNjD3egKa8vGtmKXhcSCzexx/Y1OlP/4qNhwK6GVBrPFEZfFJiZ6EFNdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er7ecspl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er7ecspl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774886124; x=1806422124;
  h=date:from:to:cc:subject:message-id;
  bh=x0Iyvf7odpKD0BXPZQNHEcpSGVvBTFGOGCCxbGGKLJk=;
  b=Er7ecspl3/eq+3xnNFevrSbPGVcDlJjePVGJXVE5gH7kJxCFmj0GMAyO
   EOxLAkWODQjxOdkInWgMg2E6Lt0gataSc5CA7+onnwAMaKPy+jdzNBUWy
   wEzNnqkGFN57v4rhvYNTheKCzy9ZH1WDjI1X6Y11vlX0RlvOuqKxtK+R6
   Uq5FdlM9w68FmC05YH337yRZPQPqyLURTmuK9sUI0supRzmyFap5RX+49
   uWIbRIPAe6WYRza9aV24083iOR9l/4Wgf7SBksEWnaA0MLHyBsBLUC5ru
   DpFIiwHp9r/HA+AKZ5xSLtR+haAHhijF8i/8aoUQOthTxWztJTRmq7Xyd
   g==;
X-CSE-ConnectionGUID: Z5D9iXLkRFaB0hbNiSmKdw==
X-CSE-MsgGUID: LG4SnQPOSQmIW7O/w3zs3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86575865"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="86575865"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 08:55:21 -0700
X-CSE-ConnectionGUID: SGwJHMLhQQSMdqhMaGv+kg==
X-CSE-MsgGUID: HxGBoVdgQoamdhDAl+0GjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="219445864"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Mar 2026 08:55:20 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7ExR-000000001Hx-3t5D;
	Mon, 30 Mar 2026 15:55:17 +0000
Date: Mon, 30 Mar 2026 23:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 9/14] kernel/futex/core.c:2004:6:
 error: redefinition of 'futex_mm_init'
Message-ID: <202603302327.6AuWGa58-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   101e17624801c8d4b8d75e5b3fa3cd59e2e040d4
commit: af3e8fc9a4f5ce48fcd84e474d9f82c6a8e39568 [9/14] futex: Add robust futex unlock IP range
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260330/202603302327.6AuWGa58-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603302327.6AuWGa58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603302327.6AuWGa58-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:2004:6: error: redefinition of 'futex_mm_init'
    2004 | void futex_mm_init(struct mm_struct *mm)
         |      ^~~~~~~~~~~~~
   In file included from kernel/futex/futex.h:5,
                    from kernel/futex/core.c:49:
   include/linux/futex.h:123:20: note: previous definition of 'futex_mm_init' with type 'void(struct mm_struct *)'
     123 | static inline void futex_mm_init(struct mm_struct *mm) { }
         |                    ^~~~~~~~~~~~~


vim +/futex_mm_init +2004 kernel/futex/core.c

  2003	
> 2004	void futex_mm_init(struct mm_struct *mm)
  2005	{
  2006		futex_hash_init_mm(&mm->futex);
  2007		futex_robust_unlock_init_mm(&mm->futex);
  2008	}
  2009	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
