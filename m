Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B3679C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 06:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690353716; x=1721889716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRws+LhPgLf4gWepav2JzlLc0+72beeaIHyEF0Qagyw=;
  b=f3xf/V50HdUzPVVyM5TvirjvD41OxaoGDjLMxUrr+ZxUQr1B595cYxPU
   Xl5VifgsY56GNjEFzy7Fcp89ZbQvqQBFNpJkqkvuCfIrv3T1nSVGocl7T
   4gNat4BqTtkc3QFs1O8jmWsEgg6iKb26JLp1tZfOrXHrKGqaTzQtWQKPJ
   y+Z5HaL5s57UqX4MheWFYoisjZkE6X9fi1rhxObInK11hRQcBSRLo7cEz
   zFmwJ+BcIGwNq0pneIRjLQnwRyB08IC6ZByAE1K4zM2I1r5oxEk2UiTxx
   oQEr3Tm69LaC8+Sn9+ouS+pTaCpeHpWt1aGReocQnDyoOJQN9bL10DaGQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="366818309"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="366818309"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 23:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972984954"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="972984954"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 23:41:53 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOYDZ-0000kA-0I;
	Wed, 26 Jul 2023 06:41:53 +0000
Date: Wed, 26 Jul 2023 14:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.4 263/279]
 drivers/gpu/drm/ttm/ttm_resource.c:117:40: warning: suggest parentheses
 around '&&' within '||'
Message-ID: <202307261450.9Kc8YUcL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.4
head:   524dda216652bc1de6890a429067657332a248c5
commit: 7e61c7a56d022270499434b7dd82f6299d124edc [263/279] drm/ttm: fix bulk_move corruption when adding a entry
config: sparc-randconfig-r013-20230725 (https://download.01.org/0day-ci/archive/20230726/202307261450.9Kc8YUcL-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261450.9Kc8YUcL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261450.9Kc8YUcL-lkp@intel.com/

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
   include/linux/compiler.h:32:55: note: in definition of macro '__branch_check__'
      32 |                         ______r = __builtin_expect(!!(x), expect);      \
         |                                                       ^
   drivers/gpu/drm/ttm/ttm_resource.c:116:13: note: in expansion of macro 'unlikely'
     116 |         if (unlikely(WARN_ON(!pos->first || !pos->last) ||
         |             ^~~~~~~~
>> drivers/gpu/drm/ttm/ttm_resource.c:117:40: warning: suggest parentheses around '&&' within '||' [-Wparentheses]
     117 |                      pos->first == res && pos->last == res)) {
         |                      ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:34:54: note: in definition of macro '__branch_check__'
      34 |                                              expect, is_constant);      \
         |                                                      ^~~~~~~~~~~
   drivers/gpu/drm/ttm/ttm_resource.c:116:13: note: in expansion of macro 'unlikely'
     116 |         if (unlikely(WARN_ON(!pos->first || !pos->last) ||
         |             ^~~~~~~~


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
