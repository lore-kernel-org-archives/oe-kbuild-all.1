Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826332475CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 03:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913020; cv=none; b=Jo9mrMQWsI9KRhE8+PilqqFiRd5NGBxuQKSKoYAH7BdXlvWhjvRRprEjb0TE3hH62QD5ntN9grDsxNfD0uLYTQsf6pi64Yw9+T8grHi5vCW1WLzbWJyDh/F/QJmcwwfmeEV93UBK5Ihy6p8OlToQkrIZmNnsWJSl2/TENRMfj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913020; c=relaxed/simple;
	bh=gmMredP5AABiOCjZhFrHFJHnR8ABHqZHn8OqFfjvvxQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cJtjnU7dCoicwJg4oRafcxVoC/2mPrIQ/p0ffmUuslV8PG9qV79/1Bv0cdAA9osL25OpV8nGDqLYeDbbJWI7QO38zHnE5HB5K3C+js7kORB6C1HnZA2ZY5ilgum823jO1YaxBPlq4uk7DUsvXFeDzAFlFnJ4oZhezRKdGUbAsvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpLcu67D; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpLcu67D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783913017; x=1815449017;
  h=date:from:to:cc:subject:message-id;
  bh=gmMredP5AABiOCjZhFrHFJHnR8ABHqZHn8OqFfjvvxQ=;
  b=FpLcu67DF5fWegqKRrVaZOJYjYsunsIpFZupIm8L7WnDOBIdRmAGDqEl
   OWXQ467YQdOt3vuvz8CVtq0NbYVeiXJ9eYM6CdLsfQ2QC0rc267oTu2/e
   8sxOko3qsS17vz5URZWDl1BZZBIr3UY4JzI2yUS5/v9GvR/uRAhxMgCsT
   0P2gb2TCxQQWLpCrKyO0/bd0m1H7u/pDfqLppRgzQuGJEHDPYvWsqKbDp
   /Yi+r730NrrMzH31OBggt/akYFCSRGLWcA5Sa1IWn1DlCQ0fmXmuOqevk
   ZEJ2LQ95gcIXJLl+UBFpH18jrcjGaaLpdMw3G9jq3BFG+mYNnSca+Dldv
   A==;
X-CSE-ConnectionGUID: WJabC9zjQNScCxZ8SW3BeA==
X-CSE-MsgGUID: D7gKU+S8TcmRJ/d+5dZk9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87061642"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="87061642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 20:23:37 -0700
X-CSE-ConnectionGUID: NrfiTD3JRO6MeQMvBoqZ0Q==
X-CSE-MsgGUID: 1RvBsVbfSky2ynP7xJjDFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255502050"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 12 Jul 2026 20:23:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj7GX-00000000LKY-0y2y;
	Mon, 13 Jul 2026 03:23:33 +0000
Date: Mon, 13 Jul 2026 11:22:48 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 13/59]
 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h:34:10: fatal error: asm/rdtsc.h: No
 such file or directory
Message-ID: <202607131025.rxRhc4j9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: c3dc36aed8f38e5c49a07af4003fbdcead35c5e4 [13/59] x86/tsc: Split out rdtsc*()
config: arm64-randconfig-003-20260713 (https://download.01.org/0day-ci/archive/20260713/202607131025.rxRhc4j9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607131025.rxRhc4j9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607131025.rxRhc4j9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c:35:
>> drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h:34:10: fatal error: asm/rdtsc.h: No such file or directory
      34 | #include <asm/rdtsc.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +34 drivers/gpu/drm/vmwgfx/vmwgfx_mksstat.h

    32	
    33	#include <asm/page.h>
  > 34	#include <asm/rdtsc.h>
    35	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
