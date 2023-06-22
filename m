Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0E6200A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 17:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687456507; x=1718992507;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TmGU7UM7mZjsQGrcPvnOTQ4O/RMRSyMy8ji3IIOD+7U=;
  b=GdMIY13f8NqL/uKfvgYa50hvAmsVFqLqkRhdGittXHtIhVoIH0/Cuqc6
   nITeDEt2MYpUXmX8MbhtBuOdDMHqWOiqtwixjRY1Sjfl3zCSNy0BnhXkr
   HknSMW1W7lBSA2nby0ByV7XpmKxJkvZ1jioMx1d+gtX+u/OtklEy/4BhL
   WIfnbCFTc/Qvk9G+hSi28bO93uJj+9x91jSrwyD6zj2K+yIwYk2O9Lwvz
   ugKPdFaIfbVBSpJ8l99au36tsvS3MNN3K4oj4Ul1+x/XMN/cWcNKbKJEQ
   bKnIWvibu0Dvcm5jnVevovFFraBjB3jMZ1Z7+89N4JDTb0pzGpRprjJX1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="446940510"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="446940510"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 10:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839157387"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; 
   d="scan'208";a="839157387"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 10:54:45 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCOW4-0007it-2n;
	Thu, 22 Jun 2023 17:54:44 +0000
Date: Fri, 23 Jun 2023 01:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: Yunxiang Li <Yunxiang.Li@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] drm/ttm: fix bulk_move corruption when adding a entry
Message-ID: <202306230155.OG2qYXRZ-lkp@intel.com>
References: <20230622141902.28718-3-Yunxiang.Li@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622141902.28718-3-Yunxiang.Li@amd.com>

Hi Yunxiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes linus/master v6.4-rc7 next-20230622]
[cannot apply to drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunxiang-Li/drm-ttm-fix-bulk_move-corruption-when-adding-a-entry/20230622-222504
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230622141902.28718-3-Yunxiang.Li%40amd.com
patch subject: [PATCH v2] drm/ttm: fix bulk_move corruption when adding a entry
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230623/202306230155.OG2qYXRZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230155.OG2qYXRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230155.OG2qYXRZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from include/linux/io.h:10,
                    from include/linux/iosys-map.h:10,
                    from drivers/gpu/drm/ttm/ttm_resource.c:25:
   drivers/gpu/drm/ttm/ttm_resource.c: In function 'ttm_lru_bulk_move_del':
>> drivers/gpu/drm/ttm/ttm_resource.c:117:40: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
     117 |                      pos->first == res && pos->last == res)) {
         |                      ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^


vim +117 drivers/gpu/drm/ttm/ttm_resource.c

   109	
   110	/* Remove the resource from a bulk_move range */
   111	static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
   112					  struct ttm_resource *res)
   113	{
   114		struct ttm_lru_bulk_move_pos *pos = ttm_lru_bulk_move_pos(bulk, res);
   115	
   116		if (unlikely(WARN_ON(!pos->first || !pos->last) ||
 > 117			     pos->first == res && pos->last == res)) {
   118			pos->first = NULL;
   119			pos->last = NULL;
   120		} else if (pos->first == res) {
   121			pos->first = list_next_entry(res, lru);
   122		} else if (pos->last == res) {
   123			pos->last = list_prev_entry(res, lru);
   124		} else {
   125			list_move(&res->lru, &pos->last->lru);
   126		}
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
