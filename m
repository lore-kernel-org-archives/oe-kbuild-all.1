Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268732DEA68
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765653558; cv=none; b=nxKWr+rviVMHZ36xzbRzdEvISUGTg2knmwuEbUCXqROehfDOuA3SOtNDQWHGzLpMfNxqN1kC6KNIc3YIN3xz8uKCWmUN90rlaRx9lpWPi3+7pq0bZF7fwdn41Jiyx8JYOCtbkZFipOvOeoOBqLBUexsTYGuyjcKFuupK1RHnaow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765653558; c=relaxed/simple;
	bh=PlyjhKCtC3F9sxkr3sfmDE6xcyeGqKYjXJyy7D/04nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDSyevwobZdbEva0H4nh41XmSODHvxs0vjkVWEmALS6aeV/m9FcpRyvPaq80kwrJAX4rBrmoM7yUJlG+WXOLCJ65F7CBHztGIHGDdjGgSjxvJGff+YLtwFVKanAYl1OYHMaS+g+qinSN+jnLeVTuDQb/n/LhM/tJR/JZWXy8Unc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XFjuJVH0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XFjuJVH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765653556; x=1797189556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlyjhKCtC3F9sxkr3sfmDE6xcyeGqKYjXJyy7D/04nQ=;
  b=XFjuJVH0tB+MrnQrIJB5e+N2zoIoEXPZozSw2Vr1l101TX0LM+S17t6t
   5z1xIRyfaPFUYu/9aBXfw5PpIA0MHPM2NudOI6tpQpONzht7k8g1Aytpj
   6ziLZIYH3u1LXk3usB+RIK29twcvhN3qUjSzsIPlX476vYdwA/T3dcP9s
   69RtG2pCYPItq0MIwk2H7f0oab4XYotMMl3Ot/oeZLwPvCXHCJAus4fVF
   /2zIUwnriwHMgyzffHrlLEhsQiTm+rzN6IScWb0n07YxbWmxhsA+DerFK
   2Pb7rBpMD/5LGakkteGI+EZELJeK4Ffm+iJZlFfYHBmB3RbXTzIfJnPDS
   w==;
X-CSE-ConnectionGUID: yt5j7AfoR4KD6hVJiCE6Zg==
X-CSE-MsgGUID: gY0b6J+3SkG/1aZhzuJEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71469371"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71469371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:19:15 -0800
X-CSE-ConnectionGUID: 17xNYd7kS9ePkbcbxzCYvQ==
X-CSE-MsgGUID: H/1Bii0/RJWVxjZ5KDkq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197418744"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Dec 2025 11:19:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUV95-0000000086L-2icw;
	Sat, 13 Dec 2025 19:19:11 +0000
Date: Sun, 14 Dec 2025 03:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 drivers/base/regmap/regcache.c:408:9: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202512140307.ZS5wUK5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 1985fab7f8520e4629c09eba8d40ebf57a862851 [2/2] regmap: Ensure range selector registers are updated after cache sync
config: i386-randconfig-r122-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140307.ZS5wUK5v-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140307.ZS5wUK5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140307.ZS5wUK5v-lkp@intel.com/

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
