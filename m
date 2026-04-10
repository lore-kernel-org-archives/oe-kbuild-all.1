Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6CC3D75DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775832411; cv=none; b=gDhe6mefeYN+uvB3hODO1p85PINqedukkks4dlC8vW4L+R+beDVxPsaTtrUtCnEeZRyFGxaFUkrT5Xc8ZzCqWv2X3JiHoLiE7Lp953+T6XEkGaxJfhjt9f6MOH7976pVNRaCF11Y+jsk4gphYErVikBu8JVsZQ0/zivx3kDC7T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775832411; c=relaxed/simple;
	bh=O6uCA8QGqMiTem70Imth5ohV+iqLZXMrsctW+0qqJVc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kBVkP0hSTPEtQq47+y9LwTzIs5um1hHgK97+24tCprIPyqe44WXZBk9sS9/Qh2zkExA/xtCTMgXwmUlHyKQCtAXVxymBdyIKCK55lgSupUQxr82Xfj1a8S+Yb6YvQNncRM/unnB1lC1k581e/xEqnS4W8lyqxVcmPQTOPPDVDe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo7jrZy7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo7jrZy7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775832410; x=1807368410;
  h=date:from:to:cc:subject:message-id;
  bh=O6uCA8QGqMiTem70Imth5ohV+iqLZXMrsctW+0qqJVc=;
  b=fo7jrZy7d7x2nFOllBQQxqEDHf0Q/bc8Mfh5CPObXA96xVKatjt8MDkN
   m5MtxTDeCR32svSrGT3eP0MLXt7f1D0nJ9mqFkwe3fuu7jH38WRlK7aHl
   xoVu2xAp+JqSSRJhOvTZkC99U8fz9utvRI2xyt5f6cOjJwvFPsbQub6sm
   lg4GLM3N8Ttv0gNUbL3QJvCDhg4ZcemiLdUvxWmgatWUr2z5sui4O9QzP
   ey+Z4PUMRk5jGgNU8TsTjYR6ntRuaJKewZayEuCChh71RnKO9WKx/6vg+
   jy7KcWPfOnAsQ02A6F+jHBuiq4Np/1nOpkLvkFRgO9N/PJOK09iQIYtfu
   w==;
X-CSE-ConnectionGUID: h/DM0vsxQyCfQDher2SLDA==
X-CSE-MsgGUID: oMW30tr6QNifxWnZr2qHyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87549640"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87549640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:46:48 -0700
X-CSE-ConnectionGUID: usT08zbnRLeV8g8dvktQDA==
X-CSE-MsgGUID: gDZ5uW8yTJSlQTKjqLE91A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226381142"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Apr 2026 07:46:47 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBD88-000000003pr-3S7k;
	Fri, 10 Apr 2026 14:46:44 +0000
Date: Fri, 10 Apr 2026 22:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/arm64/kvm/pkvm.c:123:22: sparse: sparse: cast to restricted gfp_t
Message-ID: <202604102216.ejXBTPgA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   08e21ebff803243bccd5e6cd4a8253ffebf74c64
commit: 1ded80a53cb8dc6c83e47578f7eacca8772245ce [1/1] ANDROID: KVM: arm64: Allow GFP_ATOMIC for host stage-2 pool topup
config: arm64-randconfig-r133-20260408 (https://download.01.org/0day-ci/archive/20260410/202604102216.ejXBTPgA-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c80443cd37b2e2788cba67ffa180a6331e5f0791)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604102216.ejXBTPgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604102216.ejXBTPgA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kvm/pkvm.c:123:22: sparse: sparse: cast to restricted gfp_t
>> arch/arm64/kvm/pkvm.c:148:45: sparse: sparse: cast from restricted gfp_t

vim +123 arch/arm64/kvm/pkvm.c

   120	
   121	static void *__host_stage2_alloc(void *arg, unsigned long order)
   122	{
 > 123		gfp_t gfp = (gfp_t)(uintptr_t)arg;
   124		struct page *p;
   125	
   126		p = __cma_alloc(host_s2_cma, 1, 0, gfp);
   127		if (!p)
   128			return NULL;
   129	
   130		return page_to_virt(p);
   131	}
   132	
   133	static void __host_stage2_free(void *virt, void *arg, unsigned long order)
   134	{
   135		WARN_ON(!cma_release(host_s2_cma, virt_to_page(virt), 1));
   136	}
   137	
   138	int pkvm_host_stage2_topup(gfp_t gfp)
   139	{
   140		struct kvm_hyp_memcache mc;
   141		int ret = -EINVAL;
   142	
   143		if (!gfpflags_allow_blocking(gfp) && host_s2_mode != PKVM_HOST_S2_GCMA)
   144			goto err;
   145	
   146		init_hyp_memcache(&mc);
   147		ret = __topup_hyp_memcache(&mc, 3, __host_stage2_alloc, kvm_host_pa,
 > 148					   (void *)(uintptr_t)(gfp | __GFP_NOWARN), 0);
   149		if (ret && !mc.nr_pages)
   150			return ret;
   151	
   152		ret = __pkvm_topup_hyp_alloc_mgt_mc(HYP_ALLOC_MGT_HOSTS2_ID, &mc);
   153		if (ret)
   154			__free_hyp_memcache(&mc, __host_stage2_free, kvm_host_va, NULL);
   155	
   156	err:
   157		return WARN_ON_ONCE(ret);
   158	}
   159	EXPORT_SYMBOL(pkvm_host_stage2_topup);
   160	#else
   161	static void __host_stage2_free(void *virt, void *arg, unsigned long order) { WARN_ON(1); }
   162	static void __init pkvm_host_stage2_drain(void) { }
   163	#endif
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
