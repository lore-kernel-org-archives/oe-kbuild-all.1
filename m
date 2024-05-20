Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C30213666D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716211826; cv=none; b=ZiPvYk6190GXP5aQ4OG44DoCM+KERuSVBG6djjL5pogMemohk283ny2kmg6672Hqls4WqKGhKyFALFSe+FlvPpeHZFH8MrBRAq2I8RcMM+eazyZfGsqI+6HL8OcQ3u6qbY/O4ab3NN+cXdjQxeEu2WYryZY0SfBTrgRsFMAa12U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716211826; c=relaxed/simple;
	bh=MoAvfmczJHFbeDRLuB+8X/BROCnXqQrzYyoE+ofvRMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvgeaHBetIxCM15pfQi7O4Qs2Lpvj+6eVMyOMxQQDsk9w+UDwZGX3d6/Dm1LquCeR2fcPC4+0BbjVWtPR1hkk0sGwMs/2KsYw3TpZ630ajI0M+A8PNRfB3N2pbt/Ek/FIrvHltNoa4iaqyNKxX63/Fc95pBNjUWsYc65jyb+FuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U0F6EqIi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0F6EqIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716211824; x=1747747824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MoAvfmczJHFbeDRLuB+8X/BROCnXqQrzYyoE+ofvRMA=;
  b=U0F6EqIiPX6C6dhUWZvxZnNsPX6QnGSxENL4I2giL+dQNNmZjCAZwapT
   4LWgMkM5yn4WCqgDGnKVFAUkX1TKMG2/QXeOHb4wFjZ8rKb7YPn5tqd3u
   F8/GYlHSv7am2y5QyuJ1YvBW9YAEhSS5HQP5dg676Rjljskr01LGwVyZU
   dOkeJ5X8TFqCPOXLuhb2V3Ii3gv5yN8CRqvB8SOMixk+61n1ML6+kY08U
   uewo4e9LDe0+jbMI1+amOLYykLbXI4kk145+RjZ29M2+F6gJbnQZESMS/
   ZKU2KeTSJKyTz5+ATIqMfQmTZWIpNvIwAR5gzrK79wpfqfllQoHUE2Rqk
   Q==;
X-CSE-ConnectionGUID: BxdweF4kTfCesJ96S0gMJQ==
X-CSE-MsgGUID: mkKd+oa9Rr+OmxwXHKTuyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12136775"
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="12136775"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 06:30:24 -0700
X-CSE-ConnectionGUID: tPtWElY6TG2h6sugtlN0KA==
X-CSE-MsgGUID: 2Pst/zrGTq+P1/Um/cSiYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,175,1712646000"; 
   d="scan'208";a="69971964"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2024 06:30:22 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s935m-0004sO-30;
	Mon, 20 May 2024 13:30:19 +0000
Date: Mon, 20 May 2024 21:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, leoliu-oc <leoliu-oc@zhaoxin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 9619/9669] kernel/dma/contiguous.c:228:13: error:
 'is_zhaoxin_kh40000' undeclared
Message-ID: <202405202102.9bImbUvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   bb74bc369fd2ab5f41a32c4ddc2e23bc76c3c550
commit: 4332dbb07181359cccca3ba757ef54e434fb1296 [9619/9669] Add kh40000_direct_dma_ops for KH-40000 platform
config: x86_64-buildonly-randconfig-002-20240520 (https://download.01.org/0day-ci/archive/20240520/202405202102.9bImbUvA-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405202102.9bImbUvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405202102.9bImbUvA-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/dma/contiguous.c: In function 'dma_contiguous_reserve':
>> kernel/dma/contiguous.c:228:13: error: 'is_zhaoxin_kh40000' undeclared (first use in this function)
     228 |         if (is_zhaoxin_kh40000)
         |             ^~~~~~~~~~~~~~~~~~
   kernel/dma/contiguous.c:228:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/is_zhaoxin_kh40000 +228 kernel/dma/contiguous.c

   208	
   209	/**
   210	 * dma_contiguous_reserve() - reserve area(s) for contiguous memory handling
   211	 * @limit: End address of the reserved memory (optional, 0 for any).
   212	 *
   213	 * This function reserves memory from early allocator. It should be
   214	 * called by arch specific code once the early allocator (memblock or bootmem)
   215	 * has been activated and all other subsystems have already allocated/reserved
   216	 * memory.
   217	 */
   218	void __init dma_contiguous_reserve(phys_addr_t limit)
   219	{
   220		phys_addr_t selected_size = 0;
   221		phys_addr_t selected_base = 0;
   222		phys_addr_t selected_limit = limit;
   223		bool fixed = false;
   224	
   225		dma_numa_cma_reserve();
   226	
   227	#if defined(CONFIG_X86_64) && defined(CONFIG_PCI)
 > 228		if (is_zhaoxin_kh40000)
   229			return;
   230	#endif
   231		pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
   232	
   233		if (size_cmdline != -1) {
   234			selected_size = size_cmdline;
   235			selected_base = base_cmdline;
   236			selected_limit = min_not_zero(limit_cmdline, limit);
   237			if (base_cmdline + size_cmdline == limit_cmdline)
   238				fixed = true;
   239		} else {
   240	#ifdef CONFIG_CMA_SIZE_SEL_MBYTES
   241			selected_size = size_bytes;
   242	#elif defined(CONFIG_CMA_SIZE_SEL_PERCENTAGE)
   243			selected_size = cma_early_percent_memory();
   244	#elif defined(CONFIG_CMA_SIZE_SEL_MIN)
   245			selected_size = min(size_bytes, cma_early_percent_memory());
   246	#elif defined(CONFIG_CMA_SIZE_SEL_MAX)
   247			selected_size = max(size_bytes, cma_early_percent_memory());
   248	#endif
   249		}
   250	
   251		if (selected_size && !dma_contiguous_default_area) {
   252			pr_debug("%s: reserving %ld MiB for global area\n", __func__,
   253				 (unsigned long)selected_size / SZ_1M);
   254	
   255			dma_contiguous_reserve_area(selected_size, selected_base,
   256						    selected_limit,
   257						    &dma_contiguous_default_area,
   258						    fixed);
   259		}
   260	}
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
