Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA32405EC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765396736; cv=none; b=L6G3RW/b4qn+MBe3LJnQycs7F9hr+OzqVJWsWlbiyz8yFDhypj8cuy2owUSUMx666BYk1kguO+5q625HU20P0pJrNLgmmLTSzatkzyPYiERZfVZJj/mSxY6uMY2SCiAT3aGSv05fMqqou+3h7O97i4UF2Vb27LrQwXtW2wX4pYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765396736; c=relaxed/simple;
	bh=Vo32QQ+egmx9nD63JULHh4W+TDV6PsOakiNy05Qa11Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyw9vQNM9lHPOLLRZW7POXdmWo0ldhDwNrAPLlxSoh41RlnPKfWBf05Wjc14UrF2euiYihWsNRXW5Y2gKev0AGRWfq4I2aYYa3IJH4AosUJoKRCSZHrfUZGv8ZWUWutV8q04jZq9RmL+anpkn7xbQa2HWo17zNpUEE6Bcrc8J2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYp7ji7Q; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYp7ji7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765396735; x=1796932735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vo32QQ+egmx9nD63JULHh4W+TDV6PsOakiNy05Qa11Y=;
  b=NYp7ji7QMTNoQ9Gw8r4TtGzJtNyH6HYTdz7sc1XNByrdsVNzTeIumC7l
   7EDRkClPeOEQ/rx1slpZT2nBrQA59Jxko7uVmSFqQIKroyoRn2pkD9IS/
   KgMSTAC6v91LttVnD3nhbuY/pYRLOv4BdZIq9ZzRff1rfixfhG29Z3r07
   i2r8txfmANpImct0sP6D0MuNoBlMkKLFJ4lhOW3tjjPcDnh97ntze22z1
   D4mn7CYFBQ2BzJm2EY2ck6+HkvAD5CPuPtpPwjaL7yfsBQH0FzFrIhfjg
   l9jikOSo7ELHiGb8pond1fCAZKxvtE6KgmC4gn8moJ3+2Vs5W5HvIhQFW
   Q==;
X-CSE-ConnectionGUID: TAEExffhRNeMW1XyO/CRSw==
X-CSE-MsgGUID: XxMFwKmvQd2EeIlMZYtUew==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="69961601"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="69961601"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 11:58:54 -0800
X-CSE-ConnectionGUID: gcNPZCBwSWWf9qVRqGD0dA==
X-CSE-MsgGUID: 3+/kRDEAQHiIrIzOjAQdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="200767548"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Dec 2025 11:58:51 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQKm-000000003i5-0ihu;
	Wed, 10 Dec 2025 19:58:48 +0000
Date: Thu, 11 Dec 2025 03:58:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
	apopple@nvidia.com, airlied@gmail.com,
	Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	dakr@kernel.org, "Mrozek, Michal" <michal.mrozek@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH v3 21/22] drm/pagemap, drm/xe: Support destination
 migration over interconnect
Message-ID: <202512110318.3hUYvXqi-lkp@intel.com>
References: <20251210110742.107575-22-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210110742.107575-22-thomas.hellstrom@linux.intel.com>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-tip/drm-tip]
[cannot apply to drm-xe/drm-xe-next drm-misc/drm-misc-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes linus/master daeinki-drm-exynos/exynos-drm-next v6.18 next-20251210]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-xe-svm-Fix-a-debug-printout/20251210-191243
base:   https://gitlab.freedesktop.org/drm/tip.git drm-tip
patch link:    https://lore.kernel.org/r/20251210110742.107575-22-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 21/22] drm/pagemap, drm/xe: Support destination migration over interconnect
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20251211/202512110318.3hUYvXqi-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110318.3hUYvXqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110318.3hUYvXqi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitfield.h:10,
                    from drivers/gpu/drm/xe/xe_migrate.c:8:
   drivers/gpu/drm/xe/xe_migrate.c: In function 'build_pt_update_batch_sram':
>> drivers/gpu/drm/xe/xe_migrate.c:2052:62: error: 'XE_INTERCONNECT_P2P' undeclared (first use in this function); did you mean 'XE_INTERCONNECT_VRAM'?
    2052 |                                        sram_addr[i].proto == XE_INTERCONNECT_P2P);
         |                                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/xe/xe_assert.h:112:9: note: in expansion of macro '__xe_assert_msg'
     112 |         __xe_assert_msg(__xe, condition,                                                        \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:148:9: note: in expansion of macro 'xe_assert_msg'
     148 |         xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,                  \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:144:41: note: in expansion of macro 'xe_tile_assert_msg'
     144 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
         |                                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:2050:25: note: in expansion of macro 'xe_tile_assert'
    2050 |                         xe_tile_assert(m->tile, sram_addr[i].proto ==
         |                         ^~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:2052:62: note: each undeclared identifier is reported only once for each function it appears in
    2052 |                                        sram_addr[i].proto == XE_INTERCONNECT_P2P);
         |                                                              ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   drivers/gpu/drm/xe/xe_assert.h:112:9: note: in expansion of macro '__xe_assert_msg'
     112 |         __xe_assert_msg(__xe, condition,                                                        \
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:148:9: note: in expansion of macro 'xe_assert_msg'
     148 |         xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,                  \
         |         ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_assert.h:144:41: note: in expansion of macro 'xe_tile_assert_msg'
     144 | #define xe_tile_assert(tile, condition) xe_tile_assert_msg((tile), condition, "")
         |                                         ^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:2050:25: note: in expansion of macro 'xe_tile_assert'
    2050 |                         xe_tile_assert(m->tile, sram_addr[i].proto ==
         |                         ^~~~~~~~~~~~~~


vim +2052 drivers/gpu/drm/xe/xe_migrate.c

  2019	
  2020	static void build_pt_update_batch_sram(struct xe_migrate *m,
  2021					       struct xe_bb *bb, u32 pt_offset,
  2022					       struct drm_pagemap_addr *sram_addr,
  2023					       u32 size, int level)
  2024	{
  2025		u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
  2026		u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
  2027		u32 ptes;
  2028		int i = 0;
  2029	
  2030		xe_tile_assert(m->tile, PAGE_ALIGNED(size));
  2031	
  2032		ptes = DIV_ROUND_UP(size, gpu_page_size);
  2033		while (ptes) {
  2034			u32 chunk = min(MAX_PTE_PER_SDI, ptes);
  2035	
  2036			if (!level)
  2037				chunk = ALIGN_DOWN(chunk, PAGE_SIZE / XE_PAGE_SIZE);
  2038	
  2039			bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
  2040			bb->cs[bb->len++] = pt_offset;
  2041			bb->cs[bb->len++] = 0;
  2042	
  2043			pt_offset += chunk * 8;
  2044			ptes -= chunk;
  2045	
  2046			while (chunk--) {
  2047				u64 addr = sram_addr[i].addr;
  2048				u64 pte;
  2049	
  2050				xe_tile_assert(m->tile, sram_addr[i].proto ==
  2051					       DRM_INTERCONNECT_SYSTEM ||
> 2052					       sram_addr[i].proto == XE_INTERCONNECT_P2P);
  2053				xe_tile_assert(m->tile, addr);
  2054				xe_tile_assert(m->tile, PAGE_ALIGNED(addr));
  2055	
  2056	again:
  2057				pte = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
  2058									addr, pat_index,
  2059									level, false, 0);
  2060				bb->cs[bb->len++] = lower_32_bits(pte);
  2061				bb->cs[bb->len++] = upper_32_bits(pte);
  2062	
  2063				if (gpu_page_size < PAGE_SIZE) {
  2064					addr += XE_PAGE_SIZE;
  2065					if (!PAGE_ALIGNED(addr)) {
  2066						chunk--;
  2067						goto again;
  2068					}
  2069					i++;
  2070				} else {
  2071					i += gpu_page_size / PAGE_SIZE;
  2072				}
  2073			}
  2074		}
  2075	}
  2076	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
