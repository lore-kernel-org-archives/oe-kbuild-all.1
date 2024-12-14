Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E61F1AB52F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 19:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734203743; cv=none; b=BHG0mnVRl0QciHx8z9xwH2wBcDXBejXh4a9QtyVtvo5KL20BR3oX59jglU+rQY4HCWHAHPOepSDUJOHaXM8TH4bFceRGq5brkiKw0/uXANL55fR8DDVwtDFAd8FwYnYdLUTI44lItWGpurSv2/Rxldy0v1ZU7JufMK7ibX9jQUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734203743; c=relaxed/simple;
	bh=PfCsQxFVSuuLZTQB+U8dkSIAGMs/ed7Nv4p02C/i5VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vA6N2qq61RxlE6DcRldBzn7PmKhrV6fkhrgJW1DPGKOZtVW3Xq4Dk6w8qa+IL2d+DgTisGS64nkfHOmdndCMHuzqWeiv6UTePTRnqCR+uBPEoB8LbMNHA+qGtNhrsjpqJRF0qVsJX33f1LxE6A/K4WBfCM1hVYbkUGC1S73SCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/LGavR7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/LGavR7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734203742; x=1765739742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PfCsQxFVSuuLZTQB+U8dkSIAGMs/ed7Nv4p02C/i5VQ=;
  b=l/LGavR78je3zrT5KQo38HUFexPPyFAx1f4dquYd4c6klw5o8jyuxPFQ
   lu1M+dMjKqQzFlbSzAn6NT6hy4VV8jRPm8OkHss1hJF+9J8VkHAbhjTW5
   Lb0r09Pd34oTyHnYjkyofhfSKDkOxs37VMWZOKKqXgFFia3pqNY09puXj
   3n5h8HB36keM8UajofxzaRW3FWKC4QABs5TVdNZsLvoCDHzjPQVUN/6hF
   DBNwS3JeMRF/c355uBtHZyVgb3a6b2YWt6kCvaRen4x0W/qIjCqw1B2Lj
   x5n79/W21QQhq8XuqlMSgBt3HkZLG7OMT9iujic3vm1k49usp8cKTcvXE
   w==;
X-CSE-ConnectionGUID: 9zUzs162Q96ArIa2zoWUCA==
X-CSE-MsgGUID: IDSeXnUWQ5qtTBh2KR2Qqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38415506"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="38415506"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 11:15:41 -0800
X-CSE-ConnectionGUID: 2bxQ8+TLQB6yVN6g4Ie2ag==
X-CSE-MsgGUID: pqjQuujmRVmxZ4yfs/sCfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="96896364"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Dec 2024 11:15:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMXc2-000DAV-1D;
	Sat, 14 Dec 2024 19:15:38 +0000
Date: Sun, 15 Dec 2024 03:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: Fuad Tabba <tabba@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 06/14] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
Message-ID: <202412150337.y5jw6832-lkp@intel.com>
References: <20241213164811.2006197-7-tabba@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213164811.2006197-7-tabba@google.com>

Hi Fuad,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fac04efc5c793dccbd07e2d59af9f90b7fc0dca4]

url:    https://github.com/intel-lab-lkp/linux/commits/Fuad-Tabba/mm-Consolidate-freeing-of-typed-folios-on-final-folio_put/20241214-005109
base:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
patch link:    https://lore.kernel.org/r/20241213164811.2006197-7-tabba%40google.com
patch subject: [RFC PATCH v4 06/14] KVM: guest_memfd: Handle final folio_put() of guestmem pages
config: i386-buildonly-randconfig-005-20241215 (https://download.01.org/0day-ci/archive/20241215/202412150337.y5jw6832-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150337.y5jw6832-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150337.y5jw6832-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/swap.o: in function `kvm_slot_gmem_register_callback':
>> include/linux/kvm_host.h:2621: multiple definition of `kvm_slot_gmem_register_callback'; arch/x86/events/intel/core.o:include/linux/kvm_host.h:2621: first defined here


vim +2621 include/linux/kvm_host.h

  2566	
  2567	#ifdef CONFIG_KVM_GMEM_MAPPABLE
  2568	bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end);
  2569	int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
  2570	int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start, gfn_t end);
  2571	int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot, gfn_t start,
  2572				       gfn_t end);
  2573	int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot, gfn_t start,
  2574					 gfn_t end);
  2575	bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
  2576	bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot, gfn_t gfn);
  2577	int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn);
  2578	void kvm_gmem_handle_folio_put(struct folio *folio);
  2579	#else
  2580	static inline bool kvm_gmem_is_mappable(struct kvm *kvm, gfn_t gfn, gfn_t end)
  2581	{
  2582		WARN_ON_ONCE(1);
  2583		return false;
  2584	}
  2585	static inline int kvm_gmem_set_mappable(struct kvm *kvm, gfn_t start, gfn_t end)
  2586	{
  2587		WARN_ON_ONCE(1);
  2588		return -EINVAL;
  2589	}
  2590	static inline int kvm_gmem_clear_mappable(struct kvm *kvm, gfn_t start,
  2591						  gfn_t end)
  2592	{
  2593		WARN_ON_ONCE(1);
  2594		return -EINVAL;
  2595	}
  2596	static inline int kvm_slot_gmem_set_mappable(struct kvm_memory_slot *slot,
  2597						     gfn_t start, gfn_t end)
  2598	{
  2599		WARN_ON_ONCE(1);
  2600		return -EINVAL;
  2601	}
  2602	static inline int kvm_slot_gmem_clear_mappable(struct kvm_memory_slot *slot,
  2603						       gfn_t start, gfn_t end)
  2604	{
  2605		WARN_ON_ONCE(1);
  2606		return -EINVAL;
  2607	}
  2608	static inline bool kvm_slot_gmem_is_mappable(struct kvm_memory_slot *slot,
  2609						     gfn_t gfn)
  2610	{
  2611		WARN_ON_ONCE(1);
  2612		return false;
  2613	}
  2614	static inline bool kvm_slot_gmem_is_guest_mappable(struct kvm_memory_slot *slot,
  2615							   gfn_t gfn)
  2616	{
  2617		WARN_ON_ONCE(1);
  2618		return false;
  2619	}
  2620	int kvm_slot_gmem_register_callback(struct kvm_memory_slot *slot, gfn_t gfn)
> 2621	{
  2622		WARN_ON_ONCE(1);
  2623		return -EINVAL;
  2624	}
  2625	static inline void kvm_gmem_handle_folio_put(struct folio *folio)
  2626	{
  2627		WARN_ON_ONCE(1);
  2628	}
  2629	#endif /* CONFIG_KVM_GMEM_MAPPABLE */
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
