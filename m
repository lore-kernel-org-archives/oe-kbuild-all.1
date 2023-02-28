Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C97E1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Feb 2023 04:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677558140; x=1709094140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+vebKsSZkRFS3U20Qw6AZVx7gGOz4iS5oFwRLU97tVY=;
  b=lIFh9toCpWCUv9yjeD3S7ZgiPjqG0DyYPjT+zvWsWdnMqK/oMtWYB5+k
   hY/4qLphd9l7LM96vErw5ihkb9JzYjO4ud3o6aNmHfpd6KrC9ko7KAvQq
   bxGTpJxBeE4kTngvSVLxOaSMSOyvhEKrUVQd34NQaUuNuSiKOSIKa3GMf
   zVm3DaALC8hAJogpVpZ3bsJ1t077vpoqk7/GTGaxGU0IXte7ARjsDj8zU
   cfo44Ya0WEO6JU7RvKU0ZisV7W5xE2TgzpGfQ3fWeUMi1S/0PPqevpH2a
   7ZVzuC3iZmXK9DL2Mp5pgHKeATbMaQezuUnoKtsDs3geIcWymMB+110dM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322293380"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="322293380"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 20:22:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="738003245"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="738003245"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Feb 2023 20:22:18 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWrVJ-000559-1H;
	Tue, 28 Feb 2023 04:22:17 +0000
Date: Tue, 28 Feb 2023 12:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <lucas.tanure@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/1] irqchip/gic-v3: Add RK3588 GICR and GITS no share
 workaround
Message-ID: <202302281247.ToOTaBnA-lkp@intel.com>
References: <20230227151847.207922-2-lucas.tanure@collabora.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227151847.207922-2-lucas.tanure@collabora.com>

Hi Lucas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on tip/irq/core soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/irqchip-gic-v3-Add-RK3588-GICR-and-GITS-no-share-workaround/20230227-232013
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20230227151847.207922-2-lucas.tanure%40collabora.com
patch subject: [RFC 1/1] irqchip/gic-v3: Add RK3588 GICR and GITS no share workaround
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302281247.ToOTaBnA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/50d0372c72a4515dd495f751fa7cd299effab96f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lucas-Tanure/irqchip-gic-v3-Add-RK3588-GICR-and-GITS-no-share-workaround/20230227-232013
        git checkout 50d0372c72a4515dd495f751fa7cd299effab96f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281247.ToOTaBnA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/irqchip/irq-gic-v3-its.c: In function 'its_setup_baser':
>> drivers/irqchip/irq-gic-v3-its.c:2363:5: warning: "CONFIG_ROCKCHIP_NO_SHARE" is not defined, evaluates to 0 [-Wundef]
    2363 | #if CONFIG_ROCKCHIP_NO_SHARE
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3-its.c: In function 'its_cpu_init_lpis':
   drivers/irqchip/irq-gic-v3-its.c:3110:5: warning: "CONFIG_ROCKCHIP_NO_SHARE" is not defined, evaluates to 0 [-Wundef]
    3110 | #if CONFIG_ROCKCHIP_NO_SHARE
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3-its.c:3140:5: warning: "CONFIG_ROCKCHIP_NO_SHARE" is not defined, evaluates to 0 [-Wundef]
    3140 | #if CONFIG_ROCKCHIP_NO_SHARE
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-gic-v3-its.c:3070:26: warning: unused variable 'its' [-Wunused-variable]
    3070 |         struct its_node *its;
         |                          ^~~
   drivers/irqchip/irq-gic-v3-its.c: In function 'its_probe_one':
   drivers/irqchip/irq-gic-v3-its.c:5136:5: warning: "CONFIG_ROCKCHIP_NO_SHARE" is not defined, evaluates to 0 [-Wundef]
    5136 | #if CONFIG_ROCKCHIP_NO_SHARE
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_ROCKCHIP_NO_SHARE +2363 drivers/irqchip/irq-gic-v3-its.c

  2294	
  2295	static int its_setup_baser(struct its_node *its, struct its_baser *baser,
  2296				   u64 cache, u64 shr, u32 order, bool indirect)
  2297	{
  2298		u64 val = its_read_baser(its, baser);
  2299		u64 esz = GITS_BASER_ENTRY_SIZE(val);
  2300		u64 type = GITS_BASER_TYPE(val);
  2301		u64 baser_phys, tmp;
  2302		u32 alloc_pages, psz;
  2303		struct page *page;
  2304		void *base;
  2305	
  2306		psz = baser->psz;
  2307		alloc_pages = (PAGE_ORDER_TO_SIZE(order) / psz);
  2308		if (alloc_pages > GITS_BASER_PAGES_MAX) {
  2309			pr_warn("ITS@%pa: %s too large, reduce ITS pages %u->%u\n",
  2310				&its->phys_base, its_base_type_string[type],
  2311				alloc_pages, GITS_BASER_PAGES_MAX);
  2312			alloc_pages = GITS_BASER_PAGES_MAX;
  2313			order = get_order(GITS_BASER_PAGES_MAX * psz);
  2314		}
  2315	
  2316		page = alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, order);
  2317		if (!page)
  2318			return -ENOMEM;
  2319	
  2320		base = (void *)page_address(page);
  2321		baser_phys = virt_to_phys(base);
  2322	
  2323		/* Check if the physical address of the memory is above 48bits */
  2324		if (IS_ENABLED(CONFIG_ARM64_64K_PAGES) && (baser_phys >> 48)) {
  2325	
  2326			/* 52bit PA is supported only when PageSize=64K */
  2327			if (psz != SZ_64K) {
  2328				pr_err("ITS: no 52bit PA support when psz=%d\n", psz);
  2329				free_pages((unsigned long)base, order);
  2330				return -ENXIO;
  2331			}
  2332	
  2333			/* Convert 52bit PA to 48bit field */
  2334			baser_phys = GITS_BASER_PHYS_52_to_48(baser_phys);
  2335		}
  2336	
  2337	retry_baser:
  2338		val = (baser_phys					 |
  2339			(type << GITS_BASER_TYPE_SHIFT)			 |
  2340			((esz - 1) << GITS_BASER_ENTRY_SIZE_SHIFT)	 |
  2341			((alloc_pages - 1) << GITS_BASER_PAGES_SHIFT)	 |
  2342			cache						 |
  2343			shr						 |
  2344			GITS_BASER_VALID);
  2345	
  2346		val |=	indirect ? GITS_BASER_INDIRECT : 0x0;
  2347	
  2348		switch (psz) {
  2349		case SZ_4K:
  2350			val |= GITS_BASER_PAGE_SIZE_4K;
  2351			break;
  2352		case SZ_16K:
  2353			val |= GITS_BASER_PAGE_SIZE_16K;
  2354			break;
  2355		case SZ_64K:
  2356			val |= GITS_BASER_PAGE_SIZE_64K;
  2357			break;
  2358		}
  2359	
  2360		its_write_baser(its, baser, val);
  2361		tmp = baser->val;
  2362	
> 2363	#if CONFIG_ROCKCHIP_NO_SHARE
  2364		if (its->flags & ITS_FLAGS_WORKAROUND_ROCKCHIP_NOSHARE) {
  2365			if (tmp & GITS_BASER_SHAREABILITY_MASK)
  2366				tmp &= ~GITS_BASER_SHAREABILITY_MASK;
  2367			else
  2368				gic_flush_dcache_to_poc(base, PAGE_ORDER_TO_SIZE(order));
  2369		}
  2370	#endif
  2371	
  2372		if ((val ^ tmp) & GITS_BASER_SHAREABILITY_MASK) {
  2373			/*
  2374			 * Shareability didn't stick. Just use
  2375			 * whatever the read reported, which is likely
  2376			 * to be the only thing this redistributor
  2377			 * supports. If that's zero, make it
  2378			 * non-cacheable as well.
  2379			 */
  2380			shr = tmp & GITS_BASER_SHAREABILITY_MASK;
  2381			if (!shr) {
  2382				cache = GITS_BASER_nC;
  2383				gic_flush_dcache_to_poc(base, PAGE_ORDER_TO_SIZE(order));
  2384			}
  2385			goto retry_baser;
  2386		}
  2387	
  2388		if (val != tmp) {
  2389			pr_err("ITS@%pa: %s doesn't stick: %llx %llx\n",
  2390			       &its->phys_base, its_base_type_string[type],
  2391			       val, tmp);
  2392			free_pages((unsigned long)base, order);
  2393			return -ENXIO;
  2394		}
  2395	
  2396		baser->order = order;
  2397		baser->base = base;
  2398		baser->psz = psz;
  2399		tmp = indirect ? GITS_LVL1_ENTRY_SIZE : esz;
  2400	
  2401		pr_info("ITS@%pa: allocated %d %s @%lx (%s, esz %d, psz %dK, shr %d)\n",
  2402			&its->phys_base, (int)(PAGE_ORDER_TO_SIZE(order) / (int)tmp),
  2403			its_base_type_string[type],
  2404			(unsigned long)virt_to_phys(base),
  2405			indirect ? "indirect" : "flat", (int)esz,
  2406			psz / SZ_1K, (int)shr >> GITS_BASER_SHAREABILITY_SHIFT);
  2407	
  2408		return 0;
  2409	}
  2410	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
