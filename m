Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990581A00F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Aug 2024 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940507; cv=none; b=T8BUsfkd4oTBe00U2WsAid1GTf9F94qofTsnWYTcklTSQIr7QUHxl2qK/N126WgOGzZvl7SGzPEgqFBZIvaBBj20FWK0oIDGSn+GVDj5jniXGhCvAGjVJNB2U6WKkm4etJl92UbYfCk9Sb9UMtaESEoA6RWUZeGR95PRgvCWQ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940507; c=relaxed/simple;
	bh=fHXmG+NXRInSJmNJ6gc3UmbRtoXM/kYewLlWo8ZiA7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jI6xHt/SwbBwUvdO1Eo1/v0akddhrES+iuwqIwVMng99dOXOBKJR59rscKldjYecugCFWQ4kbC5EG3oXPqKTHkJ3kMOHHoPR913v7IdVSWomsF0dtaPvNo/O3iwv9/iq+9ReanuiFsO6ceY96pE+/RckS65pItCWxKW76cs+//g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7jHy85U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7jHy85U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724940506; x=1756476506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fHXmG+NXRInSJmNJ6gc3UmbRtoXM/kYewLlWo8ZiA7E=;
  b=e7jHy85UDaIwQvYZeiT0fpbxQlhI/7cXRbM1mx1An8z7Eq2PRVph8PX8
   wWcRDrMMrEb5vqrSVcpvmPDiQwyLBMnAXjCi4wcVNl4D4/NTtgdQUSSiJ
   8ImClNhcSarCPz90aPD3Ut1lLLHu9sA1eJr2Zsya2C2BeUnK9cUb/4wKr
   ujxd3dLR96J7EQn5IvHuNjI/2TwkhfhyRjjSmwRivK4cO/gTnh3U7huSo
   foJpZF42YPhZMyVlI2R6yRtjiHrtyGB1Tv8or1W5fDpaTtX3dUO6w3CmM
   KusU9IPxv10mp1tKvBkYac7oNBWNHi8ta55q9OdN0X9qu+bTlV10WU8na
   w==;
X-CSE-ConnectionGUID: PoCWgG3dR4CbAWnsZMG1UQ==
X-CSE-MsgGUID: llzoGICHSMWWvbIB5E853A==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23334038"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23334038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 07:08:26 -0700
X-CSE-ConnectionGUID: H3KNAuYdQmyuLBeCoXTtzw==
X-CSE-MsgGUID: gCj9fVXjRnClY874Q/h51Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63577324"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Aug 2024 07:08:24 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjfoz-0000Le-2Z;
	Thu, 29 Aug 2024 14:08:21 +0000
Date: Thu, 29 Aug 2024 22:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 6694/7693] mm/slab_common.c:373: warning: Excess
 function parameter 'freeptr_offset' description in
 'kmem_cache_create_usercopy'
Message-ID: <202408292249.5oUpnCbS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b18bbfc14a38b5234e09c2adcf713e38063a7e6e
commit: 18dc9b3951080f2aefb63112b99cd6c95357a8d8 [6694/7693] mm: add kmem_cache_create_rcu()
config: microblaze-randconfig-r032-20221121 (https://download.01.org/0day-ci/archive/20240829/202408292249.5oUpnCbS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240829/202408292249.5oUpnCbS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408292249.5oUpnCbS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:373: warning: Excess function parameter 'freeptr_offset' description in 'kmem_cache_create_usercopy'


vim +373 mm/slab_common.c

   338	
   339	/**
   340	 * kmem_cache_create_usercopy - Create a cache with a region suitable
   341	 * for copying to userspace
   342	 * @name: A string which is used in /proc/slabinfo to identify this cache.
   343	 * @size: The size of objects to be created in this cache.
   344	 * @freeptr_offset: Custom offset for the free pointer in RCU caches
   345	 * @align: The required alignment for the objects.
   346	 * @flags: SLAB flags
   347	 * @useroffset: Usercopy region offset
   348	 * @usersize: Usercopy region size
   349	 * @ctor: A constructor for the objects.
   350	 *
   351	 * Cannot be called within a interrupt, but can be interrupted.
   352	 * The @ctor is run when new pages are allocated by the cache.
   353	 *
   354	 * The flags are
   355	 *
   356	 * %SLAB_POISON - Poison the slab with a known test pattern (a5a5a5a5)
   357	 * to catch references to uninitialised memory.
   358	 *
   359	 * %SLAB_RED_ZONE - Insert `Red` zones around the allocated memory to check
   360	 * for buffer overruns.
   361	 *
   362	 * %SLAB_HWCACHE_ALIGN - Align the objects in this cache to a hardware
   363	 * cacheline.  This can be beneficial if you're counting cycles as closely
   364	 * as davem.
   365	 *
   366	 * Return: a pointer to the cache on success, NULL on failure.
   367	 */
   368	struct kmem_cache *
   369	kmem_cache_create_usercopy(const char *name, unsigned int size,
   370				   unsigned int align, slab_flags_t flags,
   371				   unsigned int useroffset, unsigned int usersize,
   372				   void (*ctor)(void *))
 > 373	{
   374		return do_kmem_cache_create_usercopy(name, size, UINT_MAX, align, flags,
   375						     useroffset, usersize, ctor);
   376	}
   377	EXPORT_SYMBOL(kmem_cache_create_usercopy);
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
