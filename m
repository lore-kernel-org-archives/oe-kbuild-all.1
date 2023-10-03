Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B47CCA71
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 06:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696316209; x=1727852209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJUJfSBeHfH8q2LbaOhrOVXQnxpGsEHA6w8OMkQuzdM=;
  b=c9UQneNY0E0mjL+CUFC8glVJr9JV6kDtjdtdUYYKe3zEWeMt6jrmuB51
   z116szuZCVuLERZRNpU1Yp/H1Lz4xzZXRzFvxVKkRLRcCizqJWxo0G95M
   dS9xS4TW6fG3yRJlzWVjr55H027gtQRrxEgFyFRBGYpSTmlZkoSMoNoDa
   05FMLVCdCfhNTF5GMVnZXlwfIwF5xaa3zte1ZUd4np4tkgbwJQf5V+BAN
   aU7YOdM6ctUhulAWUXiWdtqPz3De0eoMZP4sHhL/9hUp1Co2C1y3k2nO1
   9uw+oUeFKgpTSnZzvm5AM9YrVVH+DBiEv/Cd98fAAnCpRGcr5F9asYwp0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="367858740"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="367858740"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2023 23:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="841231869"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200"; 
   d="scan'208";a="841231869"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2023 23:56:47 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnZKm-0006r7-1X;
	Tue, 03 Oct 2023 06:56:44 +0000
Date: Tue, 3 Oct 2023 14:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slab-remove-slab-v1r0 7/14] mm/kasan/quarantine.c:145:23:
 warning: unused variable 'flags'
Message-ID: <202310031433.kyisgGOt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slab-remove-slab-v1r0
head:   227c2d309e94ff014379c57ecadff7df03a1e349
commit: 175f421def9a7765457d1434f9df37303ff1ed9f [7/14] KASAN: remove code paths guarded by CONFIG_SLAB
config: x86_64-randconfig-006-20231003 (https://download.01.org/0day-ci/archive/20231003/202310031433.kyisgGOt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310031433.kyisgGOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310031433.kyisgGOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/quarantine.c: In function 'qlink_free':
>> mm/kasan/quarantine.c:145:23: warning: unused variable 'flags' [-Wunused-variable]
     145 |         unsigned long flags;
         |                       ^~~~~


vim +/flags +145 mm/kasan/quarantine.c

55834c59098d0c5 Alexander Potapenko 2016-05-20  140  
55834c59098d0c5 Alexander Potapenko 2016-05-20  141  static void qlink_free(struct qlist_node *qlink, struct kmem_cache *cache)
55834c59098d0c5 Alexander Potapenko 2016-05-20  142  {
55834c59098d0c5 Alexander Potapenko 2016-05-20  143  	void *object = qlink_to_object(qlink, cache);
26dca996ea7b1ac Andrey Konovalov    2022-01-14  144  	struct kasan_free_meta *meta = kasan_get_free_meta(cache, object);
55834c59098d0c5 Alexander Potapenko 2016-05-20 @145  	unsigned long flags;
55834c59098d0c5 Alexander Potapenko 2016-05-20  146  
26dca996ea7b1ac Andrey Konovalov    2022-01-14  147  	/*
26dca996ea7b1ac Andrey Konovalov    2022-01-14  148  	 * If init_on_free is enabled and KASAN's free metadata is stored in
26dca996ea7b1ac Andrey Konovalov    2022-01-14  149  	 * the object, zero the metadata. Otherwise, the object's memory will
26dca996ea7b1ac Andrey Konovalov    2022-01-14  150  	 * not be properly zeroed, as KASAN saves the metadata after the slab
26dca996ea7b1ac Andrey Konovalov    2022-01-14  151  	 * allocator zeroes the object.
26dca996ea7b1ac Andrey Konovalov    2022-01-14  152  	 */
26dca996ea7b1ac Andrey Konovalov    2022-01-14  153  	if (slab_want_init_on_free(cache) &&
26dca996ea7b1ac Andrey Konovalov    2022-01-14  154  	    cache->kasan_info.free_meta_offset == 0)
26dca996ea7b1ac Andrey Konovalov    2022-01-14  155  		memzero_explicit(meta, sizeof(*meta));
26dca996ea7b1ac Andrey Konovalov    2022-01-14  156  
97593cad003c668 Andrey Konovalov    2020-12-22  157  	/*
f0953a1bbaca71e Ingo Molnar         2021-05-06  158  	 * As the object now gets freed from the quarantine, assume that its
97593cad003c668 Andrey Konovalov    2020-12-22  159  	 * free track is no longer valid.
97593cad003c668 Andrey Konovalov    2020-12-22  160  	 */
06bc4cf6cdde690 Andrey Konovalov    2022-05-12  161  	*(u8 *)kasan_mem_to_shadow(object) = KASAN_SLAB_FREE;
97593cad003c668 Andrey Konovalov    2020-12-22  162  
55834c59098d0c5 Alexander Potapenko 2016-05-20  163  	___cache_free(cache, object, _THIS_IP_);
55834c59098d0c5 Alexander Potapenko 2016-05-20  164  }
55834c59098d0c5 Alexander Potapenko 2016-05-20  165  

:::::: The code at line 145 was first introduced by commit
:::::: 55834c59098d0c5a97b0f3247e55832b67facdcf mm: kasan: initial memory quarantine implementation

:::::: TO: Alexander Potapenko <glider@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
