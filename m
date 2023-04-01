Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506BF179
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Apr 2023 08:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680337895; x=1711873895;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1h5g7lU/+VMyAmo3yWUOgRP8MIJfBBvKVPdmW/EaXMQ=;
  b=ibfkq9Qgsx2oeYkuZadjZX8bdrV0XBs6/7ma4iCk26uN2JoV2M6c7pKv
   UbbI5UJ+MSHKv9SnvdPOeKY6qMOfbsOfyvE6G26HTSjogciY1HqEq5iIr
   VZ/rZMqFQ3URwHZMDBAcsDAsMuafOA3RHEZKlD7kvyUjWfuMjdYWrZaS1
   uyP39JapwJ1EDNJRMy7bkc89zTEn2vdJbIwu1PWfVYfF9uIOHCJeKzEc/
   CZPjy3WZF7I77DjYuO6sNdpTO8+zg93qk0YB/0y78w3OmgM3Wa5bKIDoE
   c046eDcLNB0P7MS5CQf/BnbnWfdMFKkiQtzy1KpQcQWwv3H/1jhRvkPeZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="339127097"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="339127097"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 01:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="749918105"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="749918105"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2023 01:31:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piWds-000MdZ-0h;
	Sat, 01 Apr 2023 08:31:20 +0000
Date: Sat, 1 Apr 2023 16:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: fei.yang@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-gfx] [PATCH 5/7] drm/i915: use pat_index instead of
 cache_level
Message-ID: <202304011644.SLrCMzsj-lkp@intel.com>
References: <20230401063830.438127-6-fei.yang@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401063830.438127-6-fei.yang@intel.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/fei-yang-intel-com/drm-i915-mtl-Define-MOCS-and-PAT-tables-for-MTL/20230401-143821
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230401063830.438127-6-fei.yang%40intel.com
patch subject: [Intel-gfx] [PATCH 5/7] drm/i915: use pat_index instead of cache_level
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230401/202304011644.SLrCMzsj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/d9194c791797413afb07acd51882b81f6f742f44
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review fei-yang-intel-com/drm-i915-mtl-Define-MOCS-and-PAT-tables-for-MTL/20230401-143821
        git checkout d9194c791797413afb07acd51882b81f6f742f44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304011644.SLrCMzsj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/i915/gt/gen8_ppgtt.c:25: warning: Function parameter or member 'addr' not described in 'gen8_pde_encode'
   drivers/gpu/drm/i915/gt/gen8_ppgtt.c:25: warning: Function parameter or member 'level' not described in 'gen8_pde_encode'
>> drivers/gpu/drm/i915/gt/gen8_ppgtt.c:25: warning: expecting prototype for For pre(). Prototype was for gen8_pde_encode() instead


vim +25 drivers/gpu/drm/i915/gt/gen8_ppgtt.c

2c86e55d2ab55b Matthew Auld  2020-01-07  17  
d9194c79179741 Fei Yang      2023-03-31  18  /**
d9194c79179741 Fei Yang      2023-03-31  19   * For pre-gen12 platforms pat_index is the same as enum i915_cache_level,
d9194c79179741 Fei Yang      2023-03-31  20   * so the code here is still valid. See translation table defined by
d9194c79179741 Fei Yang      2023-03-31  21   * LEGACY_CACHELEVEL
d9194c79179741 Fei Yang      2023-03-31  22   */
2c86e55d2ab55b Matthew Auld  2020-01-07  23  static u64 gen8_pde_encode(const dma_addr_t addr,
2c86e55d2ab55b Matthew Auld  2020-01-07  24  			   const enum i915_cache_level level)
2c86e55d2ab55b Matthew Auld  2020-01-07 @25  {
5f97816762722c Michael Cheng 2021-12-06  26  	u64 pde = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
2c86e55d2ab55b Matthew Auld  2020-01-07  27  
2c86e55d2ab55b Matthew Auld  2020-01-07  28  	if (level != I915_CACHE_NONE)
2c86e55d2ab55b Matthew Auld  2020-01-07  29  		pde |= PPAT_CACHED_PDE;
2c86e55d2ab55b Matthew Auld  2020-01-07  30  	else
2c86e55d2ab55b Matthew Auld  2020-01-07  31  		pde |= PPAT_UNCACHED;
2c86e55d2ab55b Matthew Auld  2020-01-07  32  
2c86e55d2ab55b Matthew Auld  2020-01-07  33  	return pde;
2c86e55d2ab55b Matthew Auld  2020-01-07  34  }
2c86e55d2ab55b Matthew Auld  2020-01-07  35  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
