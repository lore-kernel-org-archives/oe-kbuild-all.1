Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5032238B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731890322; cv=none; b=aRi/ywne9hsfLgNJneuvi7LnFtROSGV46BSmk/8+fhFpcGTyULWSFz0dDy8+dNYNw+inSj98oEUuIJLaI75s5UmPBbpb+i4yLjweEUfGGMiK0J0vqJtZIQGdHYjrYZTyxFBCEyHQbXwtWCUdVoz3EDO5I4FcrFjislRBeOsgrmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731890322; c=relaxed/simple;
	bh=7YOspJrcXhXWbUzeovrUeVUOBCQBmidhbh/5V7XsVz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0RtJzMY1EwBKjgb7NEcocNrYMH0ZcAUbH7sqX16Hqzv+7jUGAeZ0Lm2LHcEJGuFKqK6YZWDd27ZGVL96V5zueH+n8lr4zZjgAWZ4L7uoDjb0BcP5IKxV+jfGOPp+fqgCV+Vf0iDeVa/xJ/SSk/gczcVFXpGiCP4RC6O8ZPEbi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zt7kQ3q0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zt7kQ3q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731890320; x=1763426320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7YOspJrcXhXWbUzeovrUeVUOBCQBmidhbh/5V7XsVz0=;
  b=Zt7kQ3q0z3yJg6EVefFCDXe9+0q/ahJmUIRZ0xX981+7G4jR1aS+GxRY
   vomORJ76E7MUAL2RNAh5a+v/VnnvUKPZF/acroULYSHtkJdkCYgOUt0qh
   7vjr6YOZpifgdvPMsIhePBR+hSBEfrPxZJTS8sqrYvg/d5tNph0x1NdMB
   tYEa2+yd44b08789dniGKlXxl6Y1cPc7o2mmYeJmf8ddfPziDmUt6IoP/
   q6KfQ9DFa1H0xhnjAl0IunKtPHM3KVZCyQYYZG56jLx6TT7JbW/k4LLWe
   sRYtNcK27Rtp7qcgB/1mEo+U0z1kO8mnAST8i9QB3M81Mr7n4FkXjF6iJ
   A==;
X-CSE-ConnectionGUID: Hr+D05zTT7q7SLG1CjMO0Q==
X-CSE-MsgGUID: 5RjhyCEhQIKsW89Migt27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31980599"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31980599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:38:40 -0800
X-CSE-ConnectionGUID: NdgjXZ+QQAylg7kerQyvwQ==
X-CSE-MsgGUID: +xXnK5gXRGSBxXfkrpEGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88834966"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Nov 2024 16:38:37 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCpmk-00029f-2D;
	Mon, 18 Nov 2024 00:38:34 +0000
Date: Mon, 18 Nov 2024 08:37:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liu Shixin <liushixin2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] mm/page_alloc.c:4110:9: error: call to
 undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202411180822.NY0ZU27i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   7c547c6bbe6b6a9cedf63d7cdadb2529404df633
commit: fd855715f24e3eeadaa56de5fde21c55a14aeea0 [1474/1474] mm/mem_reliable: Fallback to dpool if reliable memory is not enough
config: arm64-randconfig-003-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180822.NY0ZU27i-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180822.NY0ZU27i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411180822.NY0ZU27i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:4110:9: error: call to undeclared function 'dynamic_pool_should_alloc'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
                  ^
   1 error generated.


vim +/dynamic_pool_should_alloc +4110 mm/page_alloc.c

  4101	
  4102	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4103	{
  4104		if (!reliable_allow_fb_enabled())
  4105			return false;
  4106	
  4107		if (!(gfp_mask & GFP_RELIABLE))
  4108			return false;
  4109	
> 4110		return dynamic_pool_should_alloc(gfp_mask & ~GFP_RELIABLE, order);
  4111	}
  4112	#else
  4113	static inline struct zone *mem_reliable_fallback_zone(gfp_t gfp_mask,
  4114							      struct alloc_context *ac)
  4115	{
  4116		return NULL;
  4117	}
  4118	static inline void mem_reliable_fallback_slowpath(gfp_t gfp_mask,
  4119							  struct alloc_context *ac) {}
  4120	static inline bool mem_reliable_fallback_dpool(gfp_t gfp_mask, unsigned int order)
  4121	{
  4122		return false;
  4123	}
  4124	#endif
  4125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
