Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F42116E9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152013; cv=none; b=J8vyENeKhVM6J0reCkoTkdAhAr5mrHRfwx5OUbhRfQ5+NRBvvuLSos7YbEImZw4JSrQl7BbNN7YN47J6V88wl2R6laTRMDQVNvcC2GBNgKoPo3Tol5fb+KiMruy5WzGrPnGXsvSCkfwrj2gInnkIGhKcZBeiPUsZ+LuYgkuWq24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152013; c=relaxed/simple;
	bh=iXL2kCm5NViKdtufCRu/Ta74VEC9mPtUXfIElLzT9hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHtu1m+X7pjBRGRZ6mWASoSTXIJjWbz81lWLwO4FFZkyU1Q6a0kYR0E2CTLYDiEUGv6lUR/sAsuqJsJSrY36oK0D+Sw16opQv0KCMazxfMy3g/SH4D+o10uEHVd3vm6w/rP2Z2GVG0v+hD5KPNFq5StmUJi0o+u1xfBrLLTrJoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ef3Dq9u3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ef3Dq9u3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750152012; x=1781688012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iXL2kCm5NViKdtufCRu/Ta74VEC9mPtUXfIElLzT9hI=;
  b=Ef3Dq9u3P4LXl/IEPtGUMbrahVcttJ5d/uVLH1p1glXUQ0f9PGUcErUw
   3yapXa4m/pBN+McWNQGn0oYjNxROhUuz9TVDXCFCR271knitl8wlsZnN7
   T/hlZvYyDCRXzmd9HYlw5ikIe+x7pECS6PypWNNC9Bkz1usv959mTU63k
   gkP/u618KKd+DMEySAnybzwCSrPm4VJsDPNW9XSut+oVKckC3yFQzf4HJ
   EvbuhM9/GVal38Ij22jaRKuUCwxwYak2qiKRKNI9v9SBTjGMZ1jCji2hw
   5TjmJw5HbW6DIr5rwQ0Sw6b2SlSxoujzDQuLYV3bDboJ4H7ZMcRbyYQxP
   A==;
X-CSE-ConnectionGUID: uxTVQoR/TV2ywsNFtrwn+g==
X-CSE-MsgGUID: OqWUG10aRjisPXMHBrkCdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63350620"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63350620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:20:11 -0700
X-CSE-ConnectionGUID: qOf4IegpTemgMMdPQ3NxDQ==
X-CSE-MsgGUID: NB9VozNCTjSblNZp68QEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153917683"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Jun 2025 02:20:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRSUB-000Foq-2b;
	Tue, 17 Jun 2025 09:20:07 +0000
Date: Tue, 17 Jun 2025 17:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 5/8] pm: runtime: Introduce
 pm_runtime_get_if_not_suspended()
Message-ID: <202506171624.6rjwnug7-lkp@intel.com>
References: <20250616203149.2649118-6-praan@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616203149.2649118-6-praan@google.com>

Hi Pranjal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v6.16-rc2 next-20250617]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-arm-smmu-v3-Refactor-arm_smmu_setup_irqs/20250617-043418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250616203149.2649118-6-praan%40google.com
patch subject: [RFC PATCH v3 5/8] pm: runtime: Introduce pm_runtime_get_if_not_suspended()
config: i386-buildonly-randconfig-004-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171624.6rjwnug7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171624.6rjwnug7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171624.6rjwnug7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-pm.h:6,
                    from block/blk-mq.c:39:
>> include/linux/pm_runtime.h:287:12: warning: 'pm_runtime_get_if_not_suspended' defined but not used [-Wunused-function]
     287 | static int pm_runtime_get_if_not_suspended(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/pm_runtime_get_if_not_suspended +287 include/linux/pm_runtime.h

   262	
   263	static inline int __pm_runtime_idle(struct device *dev, int rpmflags)
   264	{
   265		return -ENOSYS;
   266	}
   267	static inline int __pm_runtime_suspend(struct device *dev, int rpmflags)
   268	{
   269		return -ENOSYS;
   270	}
   271	static inline int __pm_runtime_resume(struct device *dev, int rpmflags)
   272	{
   273		return 1;
   274	}
   275	static inline int pm_schedule_suspend(struct device *dev, unsigned int delay)
   276	{
   277		return -ENOSYS;
   278	}
   279	static inline int pm_runtime_get_if_in_use(struct device *dev)
   280	{
   281		return -EINVAL;
   282	}
   283	static inline int pm_runtime_get_if_active(struct device *dev)
   284	{
   285		return -EINVAL;
   286	}
 > 287	static int pm_runtime_get_if_not_suspended(struct device *dev)
   288	{
   289		return -EINVAL;
   290	}
   291	static inline int __pm_runtime_set_status(struct device *dev,
   292						    unsigned int status) { return 0; }
   293	static inline int pm_runtime_barrier(struct device *dev) { return 0; }
   294	static inline bool pm_runtime_block_if_disabled(struct device *dev) { return true; }
   295	static inline void pm_runtime_unblock(struct device *dev) {}
   296	static inline void pm_runtime_enable(struct device *dev) {}
   297	static inline void __pm_runtime_disable(struct device *dev, bool c) {}
   298	static inline bool pm_runtime_blocked(struct device *dev) { return true; }
   299	static inline void pm_runtime_allow(struct device *dev) {}
   300	static inline void pm_runtime_forbid(struct device *dev) {}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
