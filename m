Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958F3D70
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Oct 2023 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACqRAgBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698379805; x=1729915805;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L2KjxB8kCH2olE6vazjNsjguZ4bdETgWlXwk4rS4KGY=;
  b=ACqRAgBaAcIV+LbMueAJYUq854xdGvP9O0CNC/CgUlPfbLwwzaHOK5TN
   FpeU9kh63MK7MKkqkZegaCEV5+OXaSR8l0gYwZqp7NXk19izYOaiP6hA0
   iNYMbJKzeDz8NEvCztCxBMIrJIM/MwaPcyk6e4FQa53PssTjRoV/W4y1L
   zRuX4mju3k529BLXzQlUkRsvlCWP9vzoxm6JqEj0CIe76TtrpG5QkAMo7
   yMDnf0IAyceI2uHMhSsaLVFjURxvV6BEaye2tQztdLRLoaKihewrJXjNj
   3F/aSCVgV2lTTCr2epSYcD603r0wycY+YoOn8/lEsk/oyAOWek/S1XMdQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="372754855"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="372754855"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 21:10:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="735970843"
X-IronPort-AV: E=Sophos;i="6.03,255,1694761200"; 
   d="scan'208";a="735970843"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Oct 2023 21:10:04 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwEAb-000AQV-38;
	Fri, 27 Oct 2023 04:10:01 +0000
Date: Fri, 27 Oct 2023 12:09:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regmap-test-window-cache 4/4]
 drivers/base/regmap/regcache.c:408:9: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202310271258.DNraS1ku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-test-window-cache
head:   05d5da207ac28a1ab4e229098db7a60332ff19f4
commit: 05d5da207ac28a1ab4e229098db7a60332ff19f4 [4/4] regmap: Ensure range selector registers are updated after cache sync
config: x86_64-randconfig-122-20231027 (https://download.01.org/0day-ci/archive/20231027/202310271258.DNraS1ku-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231027/202310271258.DNraS1ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310271258.DNraS1ku-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regcache.c:408:9: sparse: sparse: Using plain integer as NULL pointer
>> drivers/base/regmap/regcache.c:408:9: sparse: sparse: Using plain integer as NULL pointer

vim +408 drivers/base/regmap/regcache.c

   341	
   342	/**
   343	 * regcache_sync - Sync the register cache with the hardware.
   344	 *
   345	 * @map: map to configure.
   346	 *
   347	 * Any registers that should not be synced should be marked as
   348	 * volatile.  In general drivers can choose not to use the provided
   349	 * syncing functionality if they so require.
   350	 *
   351	 * Return a negative value on failure, 0 on success.
   352	 */
   353	int regcache_sync(struct regmap *map)
   354	{
   355		int ret = 0;
   356		unsigned int i;
   357		const char *name;
   358		bool bypass;
   359		struct rb_node *node;
   360	
   361		if (WARN_ON(map->cache_type == REGCACHE_NONE))
   362			return -EINVAL;
   363	
   364		BUG_ON(!map->cache_ops);
   365	
   366		map->lock(map->lock_arg);
   367		/* Remember the initial bypass state */
   368		bypass = map->cache_bypass;
   369		dev_dbg(map->dev, "Syncing %s cache\n",
   370			map->cache_ops->name);
   371		name = map->cache_ops->name;
   372		trace_regcache_sync(map, name, "start");
   373	
   374		if (!map->cache_dirty)
   375			goto out;
   376	
   377		/* Apply any patch first */
   378		map->cache_bypass = true;
   379		for (i = 0; i < map->patch_regs; i++) {
   380			ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
   381			if (ret != 0) {
   382				dev_err(map->dev, "Failed to write %x = %x: %d\n",
   383					map->patch[i].reg, map->patch[i].def, ret);
   384				goto out;
   385			}
   386		}
   387		map->cache_bypass = false;
   388	
   389		if (map->cache_ops->sync)
   390			ret = map->cache_ops->sync(map, 0, map->max_register);
   391		else
   392			ret = regcache_default_sync(map, 0, map->max_register);
   393	
   394		if (ret == 0)
   395			map->cache_dirty = false;
   396	
   397	out:
   398		/* Restore the bypass state */
   399		map->cache_bypass = bypass;
   400		map->no_sync_defaults = false;
   401	
   402		/*
   403		 * If we did any paging with cache bypassed and a cached
   404		 * paging register then the register and cache state might
   405		 * have gone out of sync, force writes of all the paging
   406		 * registers.
   407		 */
 > 408		rb_for_each(node, 0, &map->range_tree, rbtree_all) {
   409			struct regmap_range_node *this =
   410				rb_entry(node, struct regmap_range_node, node);
   411	
   412			/* If there's nothing in the cache there's nothing to sync */
   413			ret = regcache_read(map, this->selector_reg, &i);
   414			if (ret != 0)
   415				continue;
   416	
   417			ret = _regmap_write(map, this->selector_reg, i);
   418			if (ret != 0) {
   419				dev_err(map->dev, "Failed to write %x = %x: %d\n",
   420					this->selector_reg, i, ret);
   421				break;
   422			}
   423		}
   424	
   425		map->unlock(map->lock_arg);
   426	
   427		regmap_async_complete(map);
   428	
   429		trace_regcache_sync(map, name, "stop");
   430	
   431		return ret;
   432	}
   433	EXPORT_SYMBOL_GPL(regcache_sync);
   434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
