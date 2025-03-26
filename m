Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ADD1F7914
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 21:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743025410; cv=none; b=Z185BF13wVf3cL9p68Phu8X87Xj0ehbad35licX80MAzejSrVyInSQGOXbfpPPEhQNxGpCCWZ2MG3shOUuCJtQRZg9y+WD1ZZkKrHz1Y0Ah0i+nvG+MgP2a8FqtHdkMktTEmZK8jsAa/oyvYT9S1O8brDsPsyMYzoDf+1YvSwIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743025410; c=relaxed/simple;
	bh=F+N82d6OaHgLdQfnLBFlOOx7pic+QFR4Bb8u6zsuZlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHwFRmj0bNk1GfiGTkXf2QwtzkdEpIfRADeVRNTQB5nEVClchvJuR2Vs1LhiuiYRUhf6axWAU5coqC88+6ByXioYz3E32dysjol4Qs9wYZ0BisSMPUm0cL80Xv7WxYARgun2jJi3g81WGOtQejNdPBX9GU4f21JtwknjiJAkSfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LsQoE4+e; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LsQoE4+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743025408; x=1774561408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+N82d6OaHgLdQfnLBFlOOx7pic+QFR4Bb8u6zsuZlE=;
  b=LsQoE4+eSJkv9007+QfNX0BFtvexxvWsyzlVRiZhynmrKOk5tSuPAvRv
   /EySJbQXAWWiFgBpZPfvkMarxvA1g3kPhkknTrgrK4t8GmLnWh+plPTeo
   N9Iq0KrB3WvMcg/jvDbjPYz4xOKPLury0dOuhs5zFhsEejDdV8F2Xg/EL
   TjhGCBi1MkFz6GXxnxWJQ0QZPiz5QTHjmEmmc/+ijpynCVFOXF45kW4PF
   YhKObMezEeyVM4iVM8QmZcO5yy++km23ugzw5L8nKlHJWGR9x0I1FLnE3
   qGZnTE9cT+XOr0XiZ/P+2ccRcf3ojAsuG3eb+dsBF8ZA1fMoz8jjSGBsq
   g==;
X-CSE-ConnectionGUID: HyJkVSMBTN6ao9luZwp0Rg==
X-CSE-MsgGUID: XU5K+a4MTei48Bsi4a2Fsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44460411"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="44460411"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 14:43:27 -0700
X-CSE-ConnectionGUID: 1pB709acSsSc/uvg6VsHMQ==
X-CSE-MsgGUID: iVGxFLaaSyirZBsnTmIEiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; 
   d="scan'208";a="124908358"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 26 Mar 2025 14:43:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txYWy-000665-3D;
	Wed, 26 Mar 2025 21:43:24 +0000
Date: Thu, 27 Mar 2025 05:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:incoming-android15-6.6-desktop-chromeos 501/501]
 drivers/dma-buf/heaps/cma_heap.c:368:21: error: initialization of 'struct
 dma_buf * (*)(struct dma_heap *, long unsigned int,  long unsigned int,
  long unsigned int)' from incompatible pointer type 'struct dma_buf *
 (*)(struct dma_heap *, long unsigned in...
Message-ID: <202503270529.MELEUvvf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common incoming-android15-6.6-desktop-chromeos
head:   762a13f385d861193f9d810f84780bdd56146d74
commit: 2e1af5fe2d41e093501194f1048cca6d79cb27b6 [501/501] FROMLIST: dma-buf: system_heap: Add a system-uncached heap re-using the system heap
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250327/202503270529.MELEUvvf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503270529.MELEUvvf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503270529.MELEUvvf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/heaps/cma_heap.c:368:21: error: initialization of 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  long unsigned int,  long unsigned int)' from incompatible pointer type 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  u32,  u64)' {aka 'struct dma_buf * (*)(struct dma_heap *, long unsigned int,  unsigned int,  long long unsigned int)'} [-Werror=incompatible-pointer-types]
     368 |         .allocate = cma_heap_allocate,
         |                     ^~~~~~~~~~~~~~~~~
   drivers/dma-buf/heaps/cma_heap.c:368:21: note: (near initialization for 'cma_heap_ops.allocate')
   cc1: some warnings being treated as errors


vim +368 drivers/dma-buf/heaps/cma_heap.c

b61614ec318aae0 John Stultz 2019-12-03  366  
b61614ec318aae0 John Stultz 2019-12-03  367  static const struct dma_heap_ops cma_heap_ops = {
b61614ec318aae0 John Stultz 2019-12-03 @368  	.allocate = cma_heap_allocate,
b61614ec318aae0 John Stultz 2019-12-03  369  };
b61614ec318aae0 John Stultz 2019-12-03  370  

:::::: The code at line 368 was first introduced by commit
:::::: b61614ec318aae0c77ecd2816878d851dd61d9a6 dma-buf: heaps: Add CMA heap to dmabuf heaps

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Sumit Semwal <sumit.semwal@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
