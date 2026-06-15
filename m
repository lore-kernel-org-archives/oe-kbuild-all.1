Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2698118FDBE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 17:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544981; cv=none; b=m/mfSiFqkEiNKpFINQuGBClomFzxEXO1W09ChxZb4PZNmdJAvnwnCgsLXbDZd8+mvg8Qb2XopqEey5ndBVC8FDJan7Fz+ipjeqxCIMBY3C6vIPAod+e0e20t235iINx+xA4g02H4FjaZtNoYfQXPZQkL77YQ8WbhZoHvX1YWFB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544981; c=relaxed/simple;
	bh=U5y+l5zq3dLEtb0hga9bQLSdeH7BmsfKCKK7fZo4v/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Sedra+HAKdoeDpS0U0rx0QkxZKG36jXYhWJdpyb1yDaUiSGPS0IiNn3JCihBvamTp3QyP0IqiM2wA0EbuQJKtMPrLiJ33ao6FAgJXaMbbtQJCDScnjhjc7/xbpS6BZe6NJV714Nuc87wOD6k8PmUTG9fY/lGU4Jz6xqctJalNMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=atY1xds2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="atY1xds2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781544979; x=1813080979;
  h=date:from:to:cc:subject:message-id;
  bh=U5y+l5zq3dLEtb0hga9bQLSdeH7BmsfKCKK7fZo4v/8=;
  b=atY1xds2IAF2FYuoENb/F/8yO5dMPZ0inVvVzFdIBT7A0VDGvTCoJlvn
   anQ6OqiXA8UBFkqRHrubdlbDDkoLqZXvKYsti1VJgVYAYnFKnEJRYdkGP
   1gsMH3bDaIPs29D/pBdd2+oTnnI55iGLaK3MEI8OZLGJcjgI1MkfDK4FV
   z21H0EnVwCDRqFDaThMsl9ApBHN5d6/V0uK1250OzdfCNV7/2NRCqK0Y7
   lM7+B7Ju2TwhNLiGTx80nVsCcKCIhxrRijCReGZJJ0wg6OgG2UpN5+tH0
   sWA8LgEcehrg5oLb+xtKNChZukbPpdGoD11+g7Q3tEcnWOimWHlTbxDaM
   w==;
X-CSE-ConnectionGUID: /nkuFVayQJCeONk30/qyZQ==
X-CSE-MsgGUID: b7wv7589RTaYREV6GTJK0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99869764"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; 
   d="scan'208";a="99869764"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 10:36:19 -0700
X-CSE-ConnectionGUID: f+vnVRbpRKyzc/kSEkfE4w==
X-CSE-MsgGUID: R1ykBEvmQ7OR6VZGySRxrw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jun 2026 10:36:17 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZBEM-00000000SC6-1kEu;
	Mon, 15 Jun 2026 17:36:14 +0000
Date: Tue, 16 Jun 2026 01:36:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Hao Li <hao.li@linux.dev>,
 Suren Baghdasaryan <surenb@google.com>
Subject: [linux-next:master 13818/14024] mm/slub.c:5550:28: warning:
 passing argument 1 of '__do_kmalloc_node' makes pointer from integer without
 a cast
Message-ID: <202606160125.fzducPRb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   700f8f17ac2c84f94b7cf4420f306a23a5ddfd24
commit: ce190ed0166041cfab281967d46fe208f793a864 [13818/14024] mm/slab: introduce kmalloc_flags()
config: arm-randconfig-002-20260615 (https://download.01.org/0day-ci/archive/20260616/202606160125.fzducPRb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606160125.fzducPRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606160125.fzducPRb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c: In function '__kmalloc_flags_noprof':
>> mm/slub.c:5550:28: warning: passing argument 1 of '__do_kmalloc_node' makes pointer from integer without a cast [-Wint-conversion]
      return __do_kmalloc_node(size, NULL, flags, node,
                               ^~~~
   mm/slub.c:5338:39: note: expected 'struct kmem_cache * (*)[14]' but argument is of type 'size_t' {aka 'unsigned int'}
    void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
                            ~~~~~~~~~~~~~~^
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:369,
                    from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/arm/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from mm/slub.c:15:
>> include/linux/stddef.h:8:14: warning: passing argument 2 of '__do_kmalloc_node' makes integer from pointer without a cast [-Wint-conversion]
    #define NULL ((void *)0)
                 ^~~~~~~~~~~
   mm/slub.c:5550:34: note: in expansion of macro 'NULL'
      return __do_kmalloc_node(size, NULL, flags, node,
                                     ^~~~
   mm/slub.c:5338:48: note: expected 'gfp_t' {aka 'unsigned int'} but argument is of type 'void *'
    void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
                                             ~~~~~~^~~~~
   mm/slub.c:5550:47: error: incompatible type for argument 4 of '__do_kmalloc_node'
      return __do_kmalloc_node(size, NULL, flags, node,
                                                  ^~~~
   mm/slub.c:5339:20: note: expected 'kmalloc_token_t' {aka 'struct <anonymous>'} but argument is of type 'int'
       kmalloc_token_t token, struct slab_alloc_context *ac)
       ~~~~~~~~~~~~~~~~^~~~~
   In file included from arch/arm/include/asm/pgtable-nommu.h:13,
                    from arch/arm/include/asm/pgtable.h:16,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from mm/slub.c:15:
   include/linux/slab.h:512:34: error: incompatible type for argument 5 of '__do_kmalloc_node'
    #define PASS_TOKEN_PARAM(_token) (_token)
                                     ^~~~~~~~
   mm/slub.c:5551:5: note: in expansion of macro 'PASS_TOKEN_PARAM'
        PASS_TOKEN_PARAM(token), &ac);
        ^~~~~~~~~~~~~~~~
   mm/slub.c:5339:54: note: expected 'struct slab_alloc_context *' but argument is of type 'kmalloc_token_t' {aka 'struct <anonymous>'}
       kmalloc_token_t token, struct slab_alloc_context *ac)
                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   mm/slub.c:5550:10: error: too many arguments to function '__do_kmalloc_node'
      return __do_kmalloc_node(size, NULL, flags, node,
             ^~~~~~~~~~~~~~~~~
   mm/slub.c:5338:7: note: declared here
    void *__do_kmalloc_node(kmem_buckets *b, gfp_t flags, int node,
          ^~~~~~~~~~~~~~~~~
   mm/slub.c:5556:1: warning: control reaches end of non-void function [-Wreturn-type]
    }
    ^


vim +/__do_kmalloc_node +5550 mm/slub.c

  5534	
  5535	/*
  5536	 * The only version of kmalloc_node() that takes alloc_flags and thus can
  5537	 * determine on its own whether to handle the allocation via kmalloc_nolock() or
  5538	 * normally
  5539	 */
  5540	void *__kmalloc_flags_noprof(DECL_TOKEN_PARAMS(size, token), gfp_t flags,
  5541				     unsigned int alloc_flags, int node)
  5542	{
  5543		struct slab_alloc_context ac = {
  5544			.caller_addr = _RET_IP_,
  5545			.orig_size = size,
  5546			.alloc_flags = alloc_flags,
  5547		};
  5548	
  5549		if (alloc_flags_allow_spinning(alloc_flags)) {
> 5550			return __do_kmalloc_node(size, NULL, flags, node,
  5551					PASS_TOKEN_PARAM(token), &ac);
  5552		} else {
  5553			return __kmalloc_nolock_noprof(PASS_TOKEN_PARAMS(size, token),
  5554						       flags, node, &ac);
  5555		}
  5556	}
  5557	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
