Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6253619BD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 19:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690831742; x=1722367742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yH0LkHTg1OiUDVLSKLD2kx/knIBBJl1aikwdeVzS8y4=;
  b=WzGIeANSyRXrJEFVvpm5eZHlumzHQfbVbcSHFzbV12T8G8rSaM9+GW6C
   RpGJoDdK4PRmmmn/qiUZ5T3vcb1pL4ZH95bLUHSIDFKRhevmQuFrJENCq
   vrw3b1K07InRmz9HPY2tJtu30NfLhZOXFkt0ez24YJ7I1l4+g7aPpddqi
   aS4EtmyjbfOfskJ7qXjWc96s0O/kfDQFQtmYPjL6l5Cv3Li07GzpUUKAv
   eszhtJfbhybt9SIxzJ9vr4zS1qrniVEOLiIQ1M8zRaICeJliEZjo+nbWm
   kStaW5Ytz+D2tmzDYdlD+lx/+CaMqHWlvimneADcP9x1DbAhYZBJ69WLZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="349407095"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="349407095"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 12:28:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="852161225"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="852161225"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2023 12:28:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQYZd-0005JR-0L;
	Mon, 31 Jul 2023 19:28:57 +0000
Date: Tue, 1 Aug 2023 03:28:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/38]
 drivers/gpu/drm/ttm/ttm_resource.c:116:40: warning: suggest parentheses
 around '&&' within '||'
Message-ID: <202308010352.2xE1L85G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   773cd9557c50c765a6537392c37b2f29102f0113
commit: a6611b82de7b5db14b019aa0a1d2ad11c0b41e77 [34/38] UPSTREAM: drm/ttm: fix bulk_move corruption when adding a entry
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230801/202308010352.2xE1L85G-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010352.2xE1L85G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308010352.2xE1L85G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from include/linux/io.h:10,
                    from include/linux/iosys-map.h:10,
                    from drivers/gpu/drm/ttm/ttm_resource.c:25:
   drivers/gpu/drm/ttm/ttm_resource.c: In function 'ttm_lru_bulk_move_del':
>> drivers/gpu/drm/ttm/ttm_resource.c:116:40: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
     116 |                      pos->first == res && pos->last == res)) {
         |                      ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +116 drivers/gpu/drm/ttm/ttm_resource.c

  > 25	#include <linux/iosys-map.h>
    26	#include <linux/io-mapping.h>
    27	#include <linux/scatterlist.h>
    28	
    29	#include <drm/ttm/ttm_resource.h>
    30	#include <drm/ttm/ttm_bo_driver.h>
    31	
    32	/**
    33	 * ttm_lru_bulk_move_init - initialize a bulk move structure
    34	 * @bulk: the structure to init
    35	 *
    36	 * For now just memset the structure to zero.
    37	 */
    38	void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
    39	{
    40		memset(bulk, 0, sizeof(*bulk));
    41	}
    42	EXPORT_SYMBOL(ttm_lru_bulk_move_init);
    43	
    44	/**
    45	 * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
    46	 *
    47	 * @bulk: bulk move structure
    48	 *
    49	 * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
    50	 * resource order never changes. Should be called with &ttm_device.lru_lock held.
    51	 */
    52	void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
    53	{
    54		unsigned i, j;
    55	
    56		for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
    57			for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
    58				struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
    59				struct ttm_resource_manager *man;
    60	
    61				if (!pos->first)
    62					continue;
    63	
    64				lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
    65				dma_resv_assert_held(pos->first->bo->base.resv);
    66				dma_resv_assert_held(pos->last->bo->base.resv);
    67	
    68				man = ttm_manager_type(pos->first->bo->bdev, i);
    69				list_bulk_move_tail(&man->lru[j], &pos->first->lru,
    70						    &pos->last->lru);
    71			}
    72		}
    73	}
    74	EXPORT_SYMBOL(ttm_lru_bulk_move_tail);
    75	
    76	/* Return the bulk move pos object for this resource */
    77	static struct ttm_lru_bulk_move_pos *
    78	ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
    79	{
    80		return &bulk->pos[res->mem_type][res->bo->priority];
    81	}
    82	
    83	/* Move the resource to the tail of the bulk move range */
    84	static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
    85					       struct ttm_resource *res)
    86	{
    87		if (pos->last != res) {
    88			if (pos->first == res)
    89				pos->first = list_next_entry(res, lru);
    90			list_move(&res->lru, &pos->last->lru);
    91			pos->last = res;
    92		}
    93	}
    94	
    95	/* Add the resource to a bulk_move cursor */
    96	static void ttm_lru_bulk_move_add(struct ttm_lru_bulk_move *bulk,
    97					  struct ttm_resource *res)
    98	{
    99		struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
   100	
   101		if (!pos->first) {
   102			pos->first = res;
   103			pos->last = res;
   104		} else {
   105			ttm_lru_bulk_move_pos_tail(pos, res);
   106		}
   107	}
   108	
   109	/* Remove the resource from a bulk_move range */
   110	static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
   111					  struct ttm_resource *res)
   112	{
   113		struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
   114	
   115		if (unlikely(WARN_ON(!pos->first || !pos->last) ||
 > 116			     pos->first == res && pos->last == res)) {
   117			pos->first = NULL;
   118			pos->last = NULL;
   119		} else if (pos->first == res) {
   120			pos->first = list_next_entry(res, lru);
   121		} else if (pos->last == res) {
   122			pos->last = list_prev_entry(res, lru);
   123		} else {
   124			list_move(&res->lru, &pos->last->lru);
   125		}
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
