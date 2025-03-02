Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25002594
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740918121; cv=none; b=jzH3KLfn4rXWnyON7y+3RynVvmwXMzpil1Ty3ZcAieqtI6rJhlQgX5eG+Pys2hC9/cewulI7G/ixIGtFjXXgZnxH0oM8r2uf9TCRwRprGYP9H6c64xNQI07/nePyMz6gFXMn8LYS+ZhRiPutWXu2cCg+LASaMIdN2jf0JNg7wIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740918121; c=relaxed/simple;
	bh=Wzb+4pU9ZdQc6+4ohAFUv71ZHfQ1Fd1f9jz7upZaoq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/55/EevkrsGxWQ18bSwLZBaQG6JfikhJvepKL3wPrHQjlXXlCk5zpgV9lR0evpTfqXCWUaKFUtFEOdQaRg9RwfZrFiMQVhRodQMEHoixbLjv6GcdMRKOxqnJi3OwHFEKr8TccquzwHOeE6bQqM1mHgl4z+3xwxa/gAKB3OcY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WkdEZdNQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WkdEZdNQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740918120; x=1772454120;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wzb+4pU9ZdQc6+4ohAFUv71ZHfQ1Fd1f9jz7upZaoq8=;
  b=WkdEZdNQXVMHsU00J8ZYYeTu3XYBb9vw5FyDyasP9n5CEZMugElRnOQF
   CsW3sZH0M73YR/XcPscZk8/eRGhHj1OIt0nnII3ZtS7bSxnHxj3v/0vI5
   6y4Q8HyZ/8wyMIMjz8DlhJnJd5bET9uCV8eOR6HCFnhEW0MPi5fz7qTws
   ikulZeuFoIHwh8IilGm+jDWvGzfm6HK2KeZvk4k6QP+SkJd+bSBrrq6dA
   NPO1jmBJ1JdLdZHg9RhhM55fU3nk0P8aw4OCGr5aDP01OJ7A0NJBHCwGf
   X7o3NaWKxuDPL3Oy2Biv37nD9fdD73B5F35b+PFaq3qVBmwrGondydTIq
   g==;
X-CSE-ConnectionGUID: AHKrwXHeTeOimb/O17KcAg==
X-CSE-MsgGUID: EPCL1YzAS6y/WR60KHcQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="67169529"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="67169529"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 04:21:59 -0800
X-CSE-ConnectionGUID: qorzma/WRtaeiCrnZqDR6w==
X-CSE-MsgGUID: dmb2fraNSLS5/23ECwns9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118664369"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2025 04:21:57 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toiKB-000HJi-2m;
	Sun, 02 Mar 2025 12:21:43 +0000
Date: Sun, 2 Mar 2025 20:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7
 during dump kernel
Message-ID: <202503021908.Ed1gO0Gi-lkp@intel.com>
References: <20250301182310.6832-2-maddy@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301182310.6832-2-maddy@linux.ibm.com>

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.14-rc4 next-20250228]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-hv-24x7-Avoid-loading-hv-24x7-during-dump-kernel/20250302-022531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250301182310.6832-2-maddy%40linux.ibm.com
patch subject: [PATCH v2 2/4] powerpc/perf/hv-24x7: Avoid loading hv-24x7 during dump kernel
config: powerpc64-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021908.Ed1gO0Gi-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021908.Ed1gO0Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021908.Ed1gO0Gi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/perf/hv-24x7.c: In function 'hv_24x7_init':
>> arch/powerpc/perf/hv-24x7.c:1701:13: error: implicit declaration of function 'is_kdump_kernel' [-Wimplicit-function-declaration]
    1701 |         if (is_kdump_kernel() || is_fadump_active())
         |             ^~~~~~~~~~~~~~~


vim +/is_kdump_kernel +1701 arch/powerpc/perf/hv-24x7.c

  1693	
  1694	static int hv_24x7_init(void)
  1695	{
  1696		int r;
  1697		unsigned long hret;
  1698		unsigned int pvr = mfspr(SPRN_PVR);
  1699		struct hv_perf_caps caps;
  1700	
> 1701		if (is_kdump_kernel() || is_fadump_active())
  1702			return 0;
  1703	
  1704		if (!firmware_has_feature(FW_FEATURE_LPAR)) {
  1705			pr_debug("not a virtualized system, not enabling\n");
  1706			return -ENODEV;
  1707		}
  1708	
  1709		/* POWER8 only supports v1, while POWER9 only supports v2. */
  1710		if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
  1711		    PVR_VER(pvr) == PVR_POWER8NVL)
  1712			interface_version = 1;
  1713		else {
  1714			interface_version = 2;
  1715	
  1716			/* SMT8 in POWER9 needs to aggregate result elements. */
  1717			if (threads_per_core == 8)
  1718				aggregate_result_elements = true;
  1719		}
  1720	
  1721		hret = hv_perf_caps_get(&caps);
  1722		if (hret) {
  1723			pr_debug("could not obtain capabilities, not enabling, rc=%ld\n",
  1724					hret);
  1725			return -ENODEV;
  1726		}
  1727	
  1728		hv_page_cache = kmem_cache_create("hv-page-4096", 4096, 4096, 0, NULL);
  1729		if (!hv_page_cache)
  1730			return -ENOMEM;
  1731	
  1732		/* sampling not supported */
  1733		h_24x7_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
  1734	
  1735		r = create_events_from_catalog(&event_group.attrs,
  1736					   &event_desc_group.attrs,
  1737					   &event_long_desc_group.attrs);
  1738	
  1739		if (r)
  1740			return r;
  1741	
  1742		/* init cpuhotplug */
  1743		r = hv_24x7_cpu_hotplug_init();
  1744		if (r)
  1745			return r;
  1746	
  1747		r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
  1748		if (r)
  1749			return r;
  1750	
  1751		read_24x7_sys_info();
  1752	
  1753		return 0;
  1754	}
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
