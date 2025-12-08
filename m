Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA28EADC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 16:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765211627; cv=none; b=sQW1DQ2KRHNMyBlQL654R2elXRFmvvAvKVVq2kJBKF/FsWuDmeWxuGm2VmgjSgMf7xE6AhRfEtQ7XDXaD+aT5B2mkt4LPB0gUT20lOj3OZeHbJMZ3HNiQjmVSFG3PUg14We56+n/2xBs3w8HXGvgVAidQhm/OdBFY3tT+xRgkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765211627; c=relaxed/simple;
	bh=lLSjMRSOb/UHU75RBw95Jw5NUFfcnxIzjQ2mJAx+njI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rJu/ISXbr8J6GXV0KF9c1RRBd+ed9zuHu5ELBzvMg0HJW8Q3Z4orlGLiA6f+kgrSbyBodYY99jQ2nC3lIR8wcS4SgXQezeKF01urmUmPU5R1YZ8n37yo1TEX+/XcuwGIfC17RGtgpYkwM3q9O7NAoKJQWZl4I9EZYcPYaRacOnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yz3/3Dwq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yz3/3Dwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765211626; x=1796747626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lLSjMRSOb/UHU75RBw95Jw5NUFfcnxIzjQ2mJAx+njI=;
  b=Yz3/3DwqJ3GEw02xC7rRaA8MhN1861ehi/D8HyZpo+bI58cKNW96mK6R
   BSfhNYPjGm5y2OXIyT8A0C19mRMAj2tsBzV02GmPBNSnImt4kkFYByRSy
   pFy/C9l9Szeh20U0jqDqjxE84V4KNldbioUTAc41Qob/m7zVRSVkHn9YV
   rx2paWblmmyxhr+MdNbMTYCFczyBnZk65kv6BNja6OnVdlq1+r04a2HzB
   XBrLwq4z8tfHFg4XJKWFAqJKHEmeU4BGme5g+gtfAjt+LAt3xVH2pVo1g
   eOfXPewo+709taGpDBqnt5BrOuMicI0RH1/Xdqz6nvtFv4Y/cqyugbfWf
   A==;
X-CSE-ConnectionGUID: bBTNcEJZQEWQJPXTs/QJSw==
X-CSE-MsgGUID: UiB+Ea9qQia7gnjiW9vnKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67235255"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="67235255"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 08:33:45 -0800
X-CSE-ConnectionGUID: MBJjuzjRTd+VePIushE2UQ==
X-CSE-MsgGUID: /Ecs/EtJS42Yf7hJZuXrGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="200424711"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Dec 2025 08:33:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSeBC-000000000ch-2MBH;
	Mon, 08 Dec 2025 16:33:42 +0000
Date: Tue, 9 Dec 2025 00:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3485/3485] lib/../mm/internal.h:1522:55: warning:
 diagnostic behavior may be improved by adding the 'format(printf, 2, 0)'
 attribute to the declaration of 'shrinker_debugfs_name_alloc'
Message-ID: <202512090019.r12ZqVrM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: 5d638f251ef64f68766caaeaf41fbe159807b392 [3485/3485] mm: shrinker: add infrastructure for dynamically allocating shrinker
config: arm64-randconfig-004-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090019.r12ZqVrM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 000e46219ba1ee53fc42d35e00c314c2807e8b14)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090019.r12ZqVrM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090019.r12ZqVrM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/vsprintf.c:50:
>> lib/../mm/internal.h:1522:55: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of 'shrinker_debugfs_name_alloc' [-Wmissing-format-attribute]
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         | __attribute__((format(printf, 2, 0))) 
    1520 |                                               const char *fmt, va_list ap)
    1521 | {
    1522 |         shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                                                              ^
   lib/../mm/internal.h:1519:19: note: 'shrinker_debugfs_name_alloc' declared here
    1519 | static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
         |                   ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_SUPPORTS_SCHED_SOFT_QUOTA
   Depends on [n]: CGROUPS [=n]
   Selected by [y]:
   - ARM64 [=y]


vim +1522 lib/../mm/internal.h

  1513	
  1514	/* shrinker related functions */
  1515	unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
  1516				  int priority);
  1517	
  1518	#ifdef CONFIG_SHRINKER_DEBUG
  1519	static inline int shrinker_debugfs_name_alloc(struct shrinker *shrinker,
  1520						      const char *fmt, va_list ap)
  1521	{
> 1522		shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
  1523	
  1524		return shrinker->name ? 0 : -ENOMEM;
  1525	}
  1526	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
