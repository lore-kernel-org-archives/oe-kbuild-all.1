Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B476111A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 17:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689789226; x=1721325226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HLv2l/SdtOHjqTNhrd4UwOOCyJazZRxGueIOAVXnTnU=;
  b=bwKq6CvkAXQ1BkyD5cV6tFjTy0TX+6CMQyLIuIy07Az1WunEOdUiiX5w
   plEw4TvdK5KaHxeGmH6ah+Mf/ZFWg9ta5pmB7dUZjcEn0BSuTuBLMn0/V
   +UKba9VPEHzPmtrRzdC1HRlq1FVpRYX8pLLqll/7NfdGV1f8a3i/BS2v5
   gNmGSdNmR4m+Szquhqc63jWknHXNg+yQnEjnKVqrlYOKEo6HU6l3RuBQp
   76cvzHDNaqIAb1x588ZZOFoCVLaPceuMafJTipN8yQo0XBfsN5vRqvat2
   3+rZ31gV3bUH0tnaCDeE0nQaDXmrsgG5lkwJo7Y8+K+kRxn4njyYPtxjX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356495191"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356495191"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 10:53:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="897987517"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="897987517"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 19 Jul 2023 10:53:26 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMBMV-0005Lh-0U;
	Wed, 19 Jul 2023 17:53:20 +0000
Date: Thu, 20 Jul 2023 01:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jay Patel <jaypatel@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3] mm/slub: Optimize slub memory usage
Message-ID: <202307200152.UMul1j8f-lkp@intel.com>
References: <20230719102104.1954891-1-jaypatel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719102104.1954891-1-jaypatel@linux.ibm.com>

Hi Jay,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Jay-Patel/mm-slub-Optimize-slub-memory-usage/20230719-182356
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230719102104.1954891-1-jaypatel%40linux.ibm.com
patch subject: [RFC PATCH v3] mm/slub: Optimize slub memory usage
config: alpha-randconfig-r012-20230718 (https://download.01.org/0day-ci/archive/20230720/202307200152.UMul1j8f-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200152.UMul1j8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200152.UMul1j8f-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'calculate_order':
>> mm/slub.c:4164:33: error: 'PAGE_SIZE_4K' undeclared (first use in this function); did you mean 'PAGE_SIZE'?
    4164 |         page_frac = ((PAGE_SIZE/PAGE_SIZE_4K) == 1) ? 0 : PAGE_SIZE/PAGE_SIZE_4K;
         |                                 ^~~~~~~~~~~~
         |                                 PAGE_SIZE
   mm/slub.c:4164:33: note: each undeclared identifier is reported only once for each function it appears in


vim +4164 mm/slub.c

  4128	
  4129	static inline int calculate_order(unsigned int size)
  4130	{
  4131		unsigned int order;
  4132		unsigned int min_objects;
  4133		unsigned int max_objects;
  4134		unsigned int nr_cpus;
  4135		unsigned int page_frac;
  4136	
  4137		/*
  4138		 * Attempt to find best configuration for a slab. This
  4139		 * works by first attempting to generate a layout with
  4140		 * the best configuration and backing off gradually.
  4141		 *
  4142		 * First we increase the acceptable waste in a slab. Then
  4143		 * we reduce the minimum objects required in a slab.
  4144		 */
  4145		min_objects = slub_min_objects;
  4146		if (!min_objects) {
  4147			/*
  4148			 * Some architectures will only update present cpus when
  4149			 * onlining them, so don't trust the number if it's just 1. But
  4150			 * we also don't want to use nr_cpu_ids always, as on some other
  4151			 * architectures, there can be many possible cpus, but never
  4152			 * onlined. Here we compromise between trying to avoid too high
  4153			 * order on systems that appear larger than they are, and too
  4154			 * low order on systems that appear smaller than they are.
  4155			 */
  4156			nr_cpus = num_present_cpus();
  4157			if (nr_cpus <= 1)
  4158				nr_cpus = nr_cpu_ids;
  4159			min_objects = 4 * (fls(nr_cpus) + 1);
  4160		}
  4161		max_objects = order_objects(slub_max_order, size);
  4162		min_objects = min(min_objects, max_objects);
  4163	
> 4164		page_frac = ((PAGE_SIZE/PAGE_SIZE_4K) == 1) ? 0 : PAGE_SIZE/PAGE_SIZE_4K;
  4165	
  4166		while (min_objects >= 1) {
  4167			unsigned int fraction;
  4168	
  4169			fraction = 16 + page_frac;
  4170			while (fraction >= 4) {
  4171				order = calc_slab_order(size, min_objects,
  4172						slub_max_order, fraction);
  4173				if (order <= slub_max_order)
  4174					return order;
  4175				fraction /= 2;
  4176			}
  4177			min_objects--;
  4178		}
  4179	
  4180		/*
  4181		 * Doh this slab cannot be placed using slub_max_order.
  4182		 */
  4183		order = calc_slab_order(size, 1, MAX_ORDER, 1);
  4184		if (order <= MAX_ORDER)
  4185			return order;
  4186		return -ENOSYS;
  4187	}
  4188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
