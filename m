Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18B21C15
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 09:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680774468; x=1712310468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B0uIcBS0Xbvwb4p7F2zYk4Tt+NOVAXAv7FKUljZrifY=;
  b=Emx0iI6tYrk1FfZqP85trZKC6jhKfTKiZoR3hTp7J7by+BzgYn4CY3h/
   ev72D1mpzvypjZzYLQjYfmx7IP3jUai2awxx+K1GT4Ed75KvlOYigvaQl
   EAKq5a9LJ8I7N9EkSyZROZ9PC2M30X4Jj3W9/6jKyYI06bLphfb1a2NOD
   XrJIPW8/Hse7tYlPVvMhJ+buTMI+qZLCqphcw5Nqfz7oxHoAhrk3RdERG
   OKP8I+gf3d5mJUuDs0H9eMsbr1iiD/hVYGjEST8RfsYLufexQ241+0MrS
   U3dvdQ8wbe/6mfjQ9LEC8jWTbm8tlSCPOf/rE0FtdHOd2Tx4qW85lRKW0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="344427685"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="344427685"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 02:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="689605098"
X-IronPort-AV: E=Sophos;i="5.98,323,1673942400"; 
   d="scan'208";a="689605098"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2023 02:47:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkMDa-000RH8-20;
	Thu, 06 Apr 2023 09:47:46 +0000
Date: Thu, 6 Apr 2023 17:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 4/56]
 drivers/net/ethernet/google/gve/gve_main.c:1271:23: error: 'struct
 page_frag_cache' has no member named 'va'
Message-ID: <202304061759.TvhZ8Xbx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   68abe677de847ca05213a704176a7b8a14b02738
commit: c6a6836d1903ed2dae863aeffe775f91b4d2d596 [4/56] mm: Make the page_frag_cache allocator use multipage folios
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230406/202304061759.TvhZ8Xbx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=c6a6836d1903ed2dae863aeffe775f91b4d2d596
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout c6a6836d1903ed2dae863aeffe775f91b4d2d596
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304061759.TvhZ8Xbx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/google/gve/gve_main.c: In function 'gve_drain_page_cache':
>> drivers/net/ethernet/google/gve/gve_main.c:1271:23: error: 'struct page_frag_cache' has no member named 'va'
    1271 |                 if (nc->va) {
         |                       ^~
   In file included from arch/x86/include/asm/page.h:85,
                    from arch/x86/include/asm/processor.h:20,
                    from arch/x86/include/asm/timex.h:5,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/ktime.h:24,
                    from include/linux/timer.h:6,
                    from include/linux/workqueue.h:9,
                    from include/linux/bpf.h:10,
                    from drivers/net/ethernet/google/gve/gve_main.c:7:
   drivers/net/ethernet/google/gve/gve_main.c:1272:64: error: 'struct page_frag_cache' has no member named 'va'
    1272 |                         __page_frag_cache_drain(virt_to_page(nc->va),
         |                                                                ^~
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/x86/include/asm/page.h:68:45: note: in expansion of macro '__pa'
      68 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   drivers/net/ethernet/google/gve/gve_main.c:1272:49: note: in expansion of macro 'virt_to_page'
    1272 |                         __page_frag_cache_drain(virt_to_page(nc->va),
         |                                                 ^~~~~~~~~~~~
   drivers/net/ethernet/google/gve/gve_main.c:1274:27: error: 'struct page_frag_cache' has no member named 'va'
    1274 |                         nc->va = NULL;
         |                           ^~


vim +1271 drivers/net/ethernet/google/gve/gve_main.c

75eaae158b1b7d Praveen Kaligineedi 2023-03-15  1263  
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1264  static void gve_drain_page_cache(struct gve_priv *priv)
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1265  {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1266  	struct page_frag_cache *nc;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1267  	int i;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1268  
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1269  	for (i = 0; i < priv->rx_cfg.num_queues; i++) {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1270  		nc = &priv->rx[i].page_cache;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15 @1271  		if (nc->va) {
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1272  			__page_frag_cache_drain(virt_to_page(nc->va),
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1273  						nc->pagecnt_bias);
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1274  			nc->va = NULL;
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1275  		}
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1276  	}
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1277  }
39a7f4aa3e4a79 Praveen Kaligineedi 2023-03-15  1278  

:::::: The code at line 1271 was first introduced by commit
:::::: 39a7f4aa3e4a7947614cf1d5c27abba3300adb1e gve: Add XDP REDIRECT support for GQI-QPL format

:::::: TO: Praveen Kaligineedi <pkaligineedi@google.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
