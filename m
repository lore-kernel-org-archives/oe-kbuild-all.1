Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2126FD97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 03:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772077061; cv=none; b=Hgx82C/zIHIEPs/AiNKthLUnbaesg/GBm4JSrAmgbzwT4H47UYk0zMl7hBZdNIe3jtplTJwpthShGOsde5eRrAteVu+OUAEJeMFmyucRmE92udiNdugtlvMOb03HiO74jdUAHLn8+RKtQtfTKif/V8LN9BX14J5jDXUTgCMiabc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772077061; c=relaxed/simple;
	bh=qqPGPhJkX2kbJ6uTUI47rauCTueG0KwxkglwTThHmQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kHvxN3ab37ohovox6qt3+9YK/SwnHPPb8DnKzhglgWF0hV3HYdq9JmEssNqeplTRverQ6Y6zSJEI8tTZZ4OPPh/o1Vd9STeYpHO/ycK46EkChKRsZ4E0IYp+wScRRbXyrGGYQ4u/+43J2d4zRSX/xnU4sGU63l87+fQEFDpiPsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HxCmG9ov; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HxCmG9ov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772077060; x=1803613060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qqPGPhJkX2kbJ6uTUI47rauCTueG0KwxkglwTThHmQE=;
  b=HxCmG9ovV5b3vuN2vIdEbbfidz95HLlC7BvVTIBy0k7YE5w8BMf0oden
   zmpOIApSIsU6LR945c9j525Dol9YyMy9pE1pzSmoemsYBYY0L+nTmxxVy
   hrBmnDC8pAQxCbAbV1FWovGlEUjR5rwkH1DeUyAZcCrUZ7rC469+ns4fy
   PtBRYczj5IFTrYUZTqEZHtWzhuvbn7i55+KMhbVAw30FWX2VimS1zd4ed
   PTESvx02Yikx2kmw/QmKUBjPLv3dWtkqVMU7IFNAhdPrvdVwYvdRsXWw4
   sHOGQTqq20fYlnLSNnuOSg5l70KP1vniqCgjWsg2mhX4Swo/V/QJRtLnX
   w==;
X-CSE-ConnectionGUID: 95rkh501T2GMA2GNJdRyDA==
X-CSE-MsgGUID: V9Xfj0iTRJetHi3OY4ce8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="98600639"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="98600639"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 19:37:39 -0800
X-CSE-ConnectionGUID: TjA33Z9+TW+n6/rMAXuCEg==
X-CSE-MsgGUID: d+gt4Y36SxaCC75d8I0IGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="214685382"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Feb 2026 19:37:37 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvSBe-0000000080j-0Iqp;
	Thu, 26 Feb 2026 03:37:17 +0000
Date: Thu, 26 Feb 2026 11:36:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian =?utf-8?Q?K=C3=B6nig"?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>
Subject: [linux-next:master 1169/2193]
 drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202602261159.qUe6cVxU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   877552aa875839314afad7154b5a561889e87ea9
commit: f4cc3ab824d6772a48ca9d9c74ac623b3309985d [1169/2193] dma-buf: protected fence ops by RCU v8
config: x86_64-randconfig-121-20260224 (https://download.01.org/0day-ci/archive/20260226/202602261159.qUe6cVxU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261159.qUe6cVxU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261159.qUe6cVxU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/i915_driver.c: note: in included file:
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   include/linux/acpi.h:69:18: sparse: sparse: Expected ) in function call
   include/linux/acpi.h:69:18: sparse: sparse: got ,
   drivers/gpu/drm/i915/i915_driver.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, drivers/gpu/drm/i915/i915_pmu.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/gpu/drm/i915/i915_driver.c: note: in included file (through drivers/gpu/drm/i915/i915_vma.h, drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h, ...):
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   drivers/gpu/drm/i915/i915_driver.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/gt/intel_rps.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, drivers/gpu/drm/i915/i915_pmu.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/gpu/drm/i915/gt/intel_rps.c: note: in included file (through drivers/gpu/drm/i915/i915_vma.h, drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h, ...):
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   drivers/gpu/drm/i915/gt/intel_rps.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h, drivers/gpu/drm/i915/i915_drv.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, drivers/gpu/drm/i915/i915_pmu.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/i915_vma.h, drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h, ...):
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   drivers/gpu/drm/i915/gem/i915_gem_busy.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, drivers/gpu/drm/i915/i915_pmu.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through drivers/gpu/drm/i915/i915_vma.h, drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h, ...):
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   drivers/gpu/drm/i915/gem/i915_gem_wait.c: note: in included file (through drivers/gpu/drm/i915/gt/intel_engine.h):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
--
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through include/linux/security.h, include/linux/perf_event.h, drivers/gpu/drm/i915/i915_pmu.h, ...):
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   include/linux/bpf.h:2302:16: sparse: sparse: Expected ) in function call
   include/linux/bpf.h:2302:16: sparse: sparse: got __VA_OPT__
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_vma.h, drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h, ...):
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   include/linux/io-mapping.h:209:17: sparse: sparse: Expected ) in function call
   include/linux/io-mapping.h:209:17: sparse: sparse: got ,
   drivers/gpu/drm/i915/i915_request.c: note: in included file (through drivers/gpu/drm/i915/i915_active.h, drivers/gpu/drm/i915/gt/intel_context.h, ...):
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *
>> drivers/gpu/drm/i915/i915_request.h:369:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const [noderef] __rcu *
   drivers/gpu/drm/i915/i915_request.h:369:27: sparse:    struct dma_fence_ops const *

vim +369 drivers/gpu/drm/i915/i915_request.h

04769652c8c7ad drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-07-20  366  
b52992c06c9020 drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-10-28  367  static inline bool dma_fence_is_i915(const struct dma_fence *fence)
04769652c8c7ad drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-07-20  368  {
04769652c8c7ad drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-07-20 @369  	return fence->ops == &i915_fence_ops;
04769652c8c7ad drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-07-20  370  }
04769652c8c7ad drivers/gpu/drm/i915/i915_gem_request.h Chris Wilson 2016-07-20  371  

:::::: The code at line 369 was first introduced by commit
:::::: 04769652c8c7ad4779a4b943dcf889a2020226f4 drm/i915: Derive GEM requests from dma-fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
