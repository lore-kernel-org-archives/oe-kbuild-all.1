Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96B3C34
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679569946; x=1711105946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tCoFmaFTJ6z4X5B1ksmrYNk3RRt1TLljTh/VugzT2E=;
  b=gJZ/CJZES2YD1UmBEq3DLSR/MnINi5JfN4I+DQVVFnS9qArc34ke1VXI
   09tTCyjAunZ+xbovruSkwJP0bpJuHCk+MDSUiZ/fgNpb3A4VU4IdOL41J
   YxsgQ+KPDjA8cSLdNaTnmw0NStfRqqXCvzxcwHc/5VHclsgWJl474mbNB
   Lf1RzqWTIYyHhPWBsU/To4f0s72ARajKXuBWVIt4JSZxvpQpz/J3R8RRI
   0jWBrIvlRbNpO0DZ3DHSzsxSuzEmfSnBpoJKDfb+0OLY2v/g2a/x32MAh
   w2CCE0b3ZP37ybzB/ImenGBIterj7jTIhh7VKIV9P8tCTqp+0i31yMkLz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="323305280"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="323305280"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:12:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="632357548"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="632357548"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Mar 2023 04:12:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIrm-000EH8-27;
	Thu, 23 Mar 2023 11:12:22 +0000
Date: Thu, 23 Mar 2023 19:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Zi Yan <ziy@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: drivers/virtio/virtio_balloon.c:40:44: warning: left shift count is
 negative
Message-ID: <202303231958.9lByNCPW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fff5a5e7f528b2ed2c335991399a766c2cf01103
commit: 0192445cb2f7ed1cd7a95a0fc8c7645480baba25 arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
date:   6 months ago
config: sparc-randconfig-r005-20230322 (https://download.01.org/0day-ci/archive/20230323/202303231958.9lByNCPW-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0192445cb2f7ed1cd7a95a0fc8c7645480baba25
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 0192445cb2f7ed1cd7a95a0fc8c7645480baba25
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/base/regmap/ drivers/virtio/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231958.9lByNCPW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/scatterlist.h:8,
                    from include/linux/virtio.h:7,
                    from drivers/virtio/virtio_balloon.c:9:
   include/linux/mmzone.h:636:33: error: size of array 'free_area' is negative
     636 |         struct free_area        free_area[MAX_ORDER];
         |                                 ^~~~~~~~~
   In file included from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:55,
                    from include/linux/mmzone.h:8:
   drivers/virtio/virtio_balloon.c: In function 'shrink_free_pages':
>> drivers/virtio/virtio_balloon.c:40:44: warning: left shift count is negative [-Wshift-count-negative]
      40 | #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
         |                                            ^~
   include/linux/math.h:15:46: note: in definition of macro '__round_mask'
      15 | #define __round_mask(x, y) ((__typeof__(x))((y)-1))
         |                                              ^
   drivers/virtio/virtio_balloon.c:808:25: note: in expansion of macro 'round_up'
     808 |         pages_to_free = round_up(pages_to_free,
         |                         ^~~~~~~~
   drivers/virtio/virtio_balloon.c:809:34: note: in expansion of macro 'VIRTIO_BALLOON_HINT_BLOCK_PAGES'
     809 |                                  VIRTIO_BALLOON_HINT_BLOCK_PAGES);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_balloon.c:40:44: warning: left shift count is negative [-Wshift-count-negative]
      40 | #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
         |                                            ^~
   drivers/virtio/virtio_balloon.c:810:42: note: in expansion of macro 'VIRTIO_BALLOON_HINT_BLOCK_PAGES'
     810 |         blocks_to_free = pages_to_free / VIRTIO_BALLOON_HINT_BLOCK_PAGES;
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_balloon.c:40:44: warning: left shift count is negative [-Wshift-count-negative]
      40 | #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
         |                                            ^~
   drivers/virtio/virtio_balloon.c:813:31: note: in expansion of macro 'VIRTIO_BALLOON_HINT_BLOCK_PAGES'
     813 |         return blocks_freed * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_balloon.c: In function 'virtio_balloon_shrinker_count':
>> drivers/virtio/virtio_balloon.c:40:44: warning: left shift count is negative [-Wshift-count-negative]
      40 | #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
         |                                            ^~
   drivers/virtio/virtio_balloon.c:831:43: note: in expansion of macro 'VIRTIO_BALLOON_HINT_BLOCK_PAGES'
     831 |         return vb->num_free_page_blocks * VIRTIO_BALLOON_HINT_BLOCK_PAGES;
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from drivers/base/regmap/regmap-debugfs.c:9:
   include/linux/mmzone.h:636:33: error: size of array 'free_area' is negative
     636 |         struct free_area        free_area[MAX_ORDER];
         |                                 ^~~~~~~~~
   drivers/base/regmap/regmap-debugfs.c: In function 'regmap_read_debugfs':
>> drivers/base/regmap/regmap-debugfs.c:229:32: warning: left shift count is negative [-Wshift-count-negative]
     229 |         if (count > (PAGE_SIZE << (MAX_ORDER - 1)))
         |                                ^~
   drivers/base/regmap/regmap-debugfs.c:230:35: warning: left shift count is negative [-Wshift-count-negative]
     230 |                 count = PAGE_SIZE << (MAX_ORDER - 1);
         |                                   ^~
   drivers/base/regmap/regmap-debugfs.c: In function 'regmap_reg_ranges_read_file':
   drivers/base/regmap/regmap-debugfs.c:376:32: warning: left shift count is negative [-Wshift-count-negative]
     376 |         if (count > (PAGE_SIZE << (MAX_ORDER - 1)))
         |                                ^~
   drivers/base/regmap/regmap-debugfs.c:377:35: warning: left shift count is negative [-Wshift-count-negative]
     377 |                 count = PAGE_SIZE << (MAX_ORDER - 1);
         |                                   ^~


vim +40 drivers/virtio/virtio_balloon.c

5a10b7dbf904bf Raushaniya Maksudova 2014-11-10  32  
86a559787e6f5c Wei Wang             2018-08-27  33  #define VIRTIO_BALLOON_FREE_PAGE_ALLOC_FLAG (__GFP_NORETRY | __GFP_NOWARN | \
86a559787e6f5c Wei Wang             2018-08-27  34  					     __GFP_NOMEMALLOC)
86a559787e6f5c Wei Wang             2018-08-27  35  /* The order of free page blocks to report to host */
2a946fa1c8bc26 Michael S. Tsirkin   2019-11-19  36  #define VIRTIO_BALLOON_HINT_BLOCK_ORDER (MAX_ORDER - 1)
86a559787e6f5c Wei Wang             2018-08-27  37  /* The size of a free page block in bytes */
2a946fa1c8bc26 Michael S. Tsirkin   2019-11-19  38  #define VIRTIO_BALLOON_HINT_BLOCK_BYTES \
2a946fa1c8bc26 Michael S. Tsirkin   2019-11-19  39  	(1 << (VIRTIO_BALLOON_HINT_BLOCK_ORDER + PAGE_SHIFT))
63b9b80e9f5b2c Michael S. Tsirkin   2019-11-19 @40  #define VIRTIO_BALLOON_HINT_BLOCK_PAGES (1 << VIRTIO_BALLOON_HINT_BLOCK_ORDER)
86a559787e6f5c Wei Wang             2018-08-27  41  

:::::: The code at line 40 was first introduced by commit
:::::: 63b9b80e9f5b2c463d98d6e550e0d0e3ace66033 virtio_balloon: divide/multiply instead of shifts

:::::: TO: Michael S. Tsirkin <mst@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
