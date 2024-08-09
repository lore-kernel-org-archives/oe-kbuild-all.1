Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94481607A0
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Aug 2024 19:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723231678; cv=none; b=RIGlvUiWxCEVxDE4f1HRFNvNDMl5xiwoDoLvB1gzHbwnMe0VJDgwQNG/2PulYnC6D/DyTLGi1ITjBTQklrxuhgbkiT9pwcTmcxb1BhIn3MWJrdcAfb31sLelGgRDIb4XXNyL+nZ7I4jaBJCY7TwrgCcn5nk8sot8l0nxzBhkGiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723231678; c=relaxed/simple;
	bh=Ls7XOXAPS099t8GZXbfCNpHpWB1JGYfdO1/0inxF+f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qBM0H5qb7abl1GHCBNvBWE4bCTsmQU/uvxthgdDRopWQtu3w0xHWjtBYfvPcNI8i03hfK2kcyOx9Jg4p/JT4FmaGLQ5PQo8DgzvW1DOb8XxAd1tpas5sQ/ADzigk4g/v7Pip/9uym3IHHx5HE8CU7cASHwhphcGeMfxX0qJ2+wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVH/rS2P; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVH/rS2P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723231677; x=1754767677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ls7XOXAPS099t8GZXbfCNpHpWB1JGYfdO1/0inxF+f8=;
  b=FVH/rS2P+XJ516e0pXwAAEDxx8chPsjcyWUG1eXzQ5uUuWwygp0/h6nr
   ire1kRHn9y3yUy8HCAP6Se0HjnHHUXn27JbXFJgiNphwqKtmQyZQd/B8S
   FfsGZLfp563199yOPHJdw4ztGwH8jvHQxUEbyAMnNvxi3sigAoBJumO0D
   2MqXDovW8f82vdBfdFgxwsEwnMLnsXe+d0JD29fm4pIIJ/peRNlRHKCrv
   3+7tF7VANUZw06vb/0uOE+n/dAv6zHzgWJrMvA9lbgGAlayYtyI1kz+ZE
   V7xzvpb3xp+0/YC4iJK//0/iRK4i3JND+eyHb6uIDxCoy2IfCNg6T0DRo
   Q==;
X-CSE-ConnectionGUID: kst0Vu/ASKOsYtFVpvypBw==
X-CSE-MsgGUID: EGEGeX7ZRa6CJBPitbg+WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="25285677"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="25285677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 12:27:56 -0700
X-CSE-ConnectionGUID: MCkQ7YtfT0m9mbjy4ky4Vg==
X-CSE-MsgGUID: 5WN7oURIRIWsI/pahvfH1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="61794146"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 09 Aug 2024 12:27:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scVHE-0009CV-2E;
	Fri, 09 Aug 2024 19:27:52 +0000
Date: Sat, 10 Aug 2024 03:26:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v6.11-rc2/alloc-per-call-site 5/5] mm/slub.c:4143:40:
 error: 'struct task_struct' has no member named 'alloc_tag'
Message-ID: <202408100352.r3AE0XNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.11-rc2/alloc-per-call-site
head:   d6fc9b7195894f3cdbef0bb406efa3b376b6c0f7
commit: d6fc9b7195894f3cdbef0bb406efa3b376b6c0f7 [5/5] slab: Allocate and use per-call-site caches
config: arm-randconfig-001-20240810 (https://download.01.org/0day-ci/archive/20240810/202408100352.r3AE0XNi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100352.r3AE0XNi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100352.r3AE0XNi-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'choose_slab':
>> mm/slub.c:4143:40: error: 'struct task_struct' has no member named 'alloc_tag'
    4143 |         struct alloc_tag *tag = current->alloc_tag;
         |                                        ^~


vim +4143 mm/slub.c

  4137	
  4138	static __always_inline
  4139	struct kmem_cache *choose_slab(size_t size, kmem_buckets *b, gfp_t flags,
  4140				       unsigned long caller)
  4141	{
  4142	#ifdef CONFIG_SLAB_PER_SITE
> 4143		struct alloc_tag *tag = current->alloc_tag;
  4144	
  4145		if (!b && tag && tag->meta.sized &&
  4146		    kmalloc_type(flags, caller) == KMALLOC_NORMAL &&
  4147		    (flags & GFP_ATOMIC) != GFP_ATOMIC) {
  4148			void *p = READ_ONCE(tag->meta.cache);
  4149	
  4150			if (!p && slab_state >= UP) {
  4151				alloc_tag_site_init(&tag->ct, true);
  4152				p = READ_ONCE(tag->meta.cache);
  4153			}
  4154	
  4155			if (tag->meta.sized < SIZE_MAX) {
  4156				if (p)
  4157					return p;
  4158				/* Otherwise continue with default buckets. */
  4159			} else {
  4160				b = p;
  4161			}
  4162		}
  4163	#endif
  4164		return kmalloc_slab(size, b, flags, caller);
  4165	}
  4166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
