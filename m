Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424C510E3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439989; cv=none; b=uwMBT/skSahXTjggdNDT/8ss30i7IEjBJM48+eDrSPayxoRfj/MYnyq/xBUH3Ospmsy3IZfoxrdBNYmoSr8cOdiZ1L1JM9RE35EGcjSdoeQxCnaMCRduDvvNLNYrfWfW5lB/KzfKV0J3LgYQRFtFBPeZcrvQiVNavFBzI/rtwKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439989; c=relaxed/simple;
	bh=jpIoooY8Ni4XXYe1ys9TzSVetUNXebPTtB7a+G/fbEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8UfV/rNpCC7DFo24f9x4dFWXMiUQJWj7ydhdnb9YQO7F0s550QmF5L0qTQlzjJR9rUkU2CHuFabT37gdWJcmZ4d/tiTt9zVESmHlRchwifCx7KLA7Ox/JXGK6q9Xu6JvOo8wWiZVN7Q6Cu8gmNgttc9DqEc5CgpDzYeX7JmC60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJFWGdgO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJFWGdgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766439987; x=1797975987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jpIoooY8Ni4XXYe1ys9TzSVetUNXebPTtB7a+G/fbEU=;
  b=DJFWGdgOOyyjaRur2QkPvkLeK0z8Q2O8M8iGhXqGMTfoqj1n5enz/SNt
   n09UHNp+V3e/Oenk/+dVEXWD5bZBh7mnowuC9CPhKDgbSpcTNGvPAIWXI
   AnFEAlTXsYa2PkoVaV9DsadP8rQGCaIfpbC468aE+o6M3/ergxb/V35UD
   s1/Qej0EVj6Xm4QJCZNU/tjYxU2qGiLGbtEDdddpq30cyPO8CgEI3R1as
   JpAukX8mxNhlh7GDrS9tm5x+900y+g0lz2R8AMBONzrR9XCeBTPeJdFqk
   yY5B3TU8woMyutF/V/Hh0v3uNv12YNvac1qePV0fp0J0eP23PMKRVJCMU
   Q==;
X-CSE-ConnectionGUID: wXveiZBUTomiVPOR7BUarA==
X-CSE-MsgGUID: wVQbEbSrQUec1RPKNY5VNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72147169"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="72147169"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:46:27 -0800
X-CSE-ConnectionGUID: YRgy7D65R5W/x0cTBeWXMg==
X-CSE-MsgGUID: DQKfIhfvRh67HbCaNxO7xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="198856422"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 22 Dec 2025 13:46:26 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnjT-000000005d2-2uc9;
	Mon, 22 Dec 2025 21:46:23 +0000
Date: Mon, 22 Dec 2025 22:45:50 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 458/458]
 fs/btrfs/block-group.c:1189:13: warning: variable 'min_allocable_bytes' set
 but not used
Message-ID: <202512222221.JoJmDyTW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   8cc11e1aa30fd981a8d5bd390a4352c37dfe543e
commit: 1bf467fdfeaee73df086f0f199609985cba93d9b [458/458] btrfs: take overcommit into account in inc_block_group_ro
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512222221.JoJmDyTW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222221.JoJmDyTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222221.JoJmDyTW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/block-group.c:14:
   fs/btrfs/sysfs.h:16:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
      16 | const char * const btrfs_feature_set_name(enum btrfs_feature_set set);
         | ^~~~~
   fs/btrfs/block-group.c: In function 'inc_block_group_ro':
>> fs/btrfs/block-group.c:1189:13: warning: variable 'min_allocable_bytes' set but not used [-Wunused-but-set-variable]
    1189 |         u64 min_allocable_bytes;
         |             ^~~~~~~~~~~~~~~~~~~


vim +/min_allocable_bytes +1189 fs/btrfs/block-group.c

e3e0520b32bc3d Josef Bacik 2019-06-20  1171  
26ce2095e03c24 Josef Bacik 2019-06-20  1172  /*
26ce2095e03c24 Josef Bacik 2019-06-20  1173   * Mark block group @cache read-only, so later write won't happen to block
26ce2095e03c24 Josef Bacik 2019-06-20  1174   * group @cache.
26ce2095e03c24 Josef Bacik 2019-06-20  1175   *
26ce2095e03c24 Josef Bacik 2019-06-20  1176   * If @force is not set, this function will only mark the block group readonly
26ce2095e03c24 Josef Bacik 2019-06-20  1177   * if we have enough free space (1M) in other metadata/system block groups.
26ce2095e03c24 Josef Bacik 2019-06-20  1178   * If @force is not set, this function will mark the block group readonly
26ce2095e03c24 Josef Bacik 2019-06-20  1179   * without checking free space.
26ce2095e03c24 Josef Bacik 2019-06-20  1180   *
26ce2095e03c24 Josef Bacik 2019-06-20  1181   * NOTE: This function doesn't care if other block groups can contain all the
26ce2095e03c24 Josef Bacik 2019-06-20  1182   * data in this block group. That check should be done by relocation routine,
26ce2095e03c24 Josef Bacik 2019-06-20  1183   * not this function.
26ce2095e03c24 Josef Bacik 2019-06-20  1184   */
e11c0406ad1bb6 Josef Bacik 2019-06-20  1185  static int inc_block_group_ro(struct btrfs_block_group_cache *cache, int force)
26ce2095e03c24 Josef Bacik 2019-06-20  1186  {
26ce2095e03c24 Josef Bacik 2019-06-20  1187  	struct btrfs_space_info *sinfo = cache->space_info;
26ce2095e03c24 Josef Bacik 2019-06-20  1188  	u64 num_bytes;
26ce2095e03c24 Josef Bacik 2019-06-20 @1189  	u64 min_allocable_bytes;
26ce2095e03c24 Josef Bacik 2019-06-20  1190  	int ret = -ENOSPC;
26ce2095e03c24 Josef Bacik 2019-06-20  1191  
26ce2095e03c24 Josef Bacik 2019-06-20  1192  	/*
26ce2095e03c24 Josef Bacik 2019-06-20  1193  	 * We need some metadata space and system metadata space for
26ce2095e03c24 Josef Bacik 2019-06-20  1194  	 * allocating chunks in some corner cases until we force to set
26ce2095e03c24 Josef Bacik 2019-06-20  1195  	 * it to be readonly.
26ce2095e03c24 Josef Bacik 2019-06-20  1196  	 */
26ce2095e03c24 Josef Bacik 2019-06-20  1197  	if ((sinfo->flags &
26ce2095e03c24 Josef Bacik 2019-06-20  1198  	     (BTRFS_BLOCK_GROUP_SYSTEM | BTRFS_BLOCK_GROUP_METADATA)) &&
26ce2095e03c24 Josef Bacik 2019-06-20  1199  	    !force)
26ce2095e03c24 Josef Bacik 2019-06-20  1200  		min_allocable_bytes = SZ_1M;
26ce2095e03c24 Josef Bacik 2019-06-20  1201  	else
26ce2095e03c24 Josef Bacik 2019-06-20  1202  		min_allocable_bytes = 0;
26ce2095e03c24 Josef Bacik 2019-06-20  1203  
26ce2095e03c24 Josef Bacik 2019-06-20  1204  	spin_lock(&sinfo->lock);
26ce2095e03c24 Josef Bacik 2019-06-20  1205  	spin_lock(&cache->lock);
26ce2095e03c24 Josef Bacik 2019-06-20  1206  
26ce2095e03c24 Josef Bacik 2019-06-20  1207  	if (cache->ro) {
26ce2095e03c24 Josef Bacik 2019-06-20  1208  		cache->ro++;
26ce2095e03c24 Josef Bacik 2019-06-20  1209  		ret = 0;
26ce2095e03c24 Josef Bacik 2019-06-20  1210  		goto out;
26ce2095e03c24 Josef Bacik 2019-06-20  1211  	}
26ce2095e03c24 Josef Bacik 2019-06-20  1212  
26ce2095e03c24 Josef Bacik 2019-06-20  1213  	num_bytes = cache->key.offset - cache->reserved - cache->pinned -
26ce2095e03c24 Josef Bacik 2019-06-20  1214  		    cache->bytes_super - btrfs_block_group_used(&cache->item);
26ce2095e03c24 Josef Bacik 2019-06-20  1215  
26ce2095e03c24 Josef Bacik 2019-06-20  1216  	/*
1bf467fdfeaee7 Josef Bacik 2020-10-14  1217  	 * Data never overcommits, even in mixed mode, so do just the straight
1bf467fdfeaee7 Josef Bacik 2020-10-14  1218  	 * check of left over space in how much we have allocated.
1bf467fdfeaee7 Josef Bacik 2020-10-14  1219  	 */
1bf467fdfeaee7 Josef Bacik 2020-10-14  1220  	if (force) {
1bf467fdfeaee7 Josef Bacik 2020-10-14  1221  		ret = 0;
1bf467fdfeaee7 Josef Bacik 2020-10-14  1222  	} else if (sinfo->flags & BTRFS_BLOCK_GROUP_DATA) {
1bf467fdfeaee7 Josef Bacik 2020-10-14  1223  		u64 sinfo_used = btrfs_space_info_used(sinfo, true);
1bf467fdfeaee7 Josef Bacik 2020-10-14  1224  
1bf467fdfeaee7 Josef Bacik 2020-10-14  1225  		/*
26ce2095e03c24 Josef Bacik 2019-06-20  1226  		 * Here we make sure if we mark this bg RO, we still have enough
1bf467fdfeaee7 Josef Bacik 2020-10-14  1227  		 * free space as buffer.
1bf467fdfeaee7 Josef Bacik 2020-10-14  1228  		 */
1bf467fdfeaee7 Josef Bacik 2020-10-14  1229  		if (sinfo_used + num_bytes <= sinfo->total_bytes)
1bf467fdfeaee7 Josef Bacik 2020-10-14  1230  			ret = 0;
1bf467fdfeaee7 Josef Bacik 2020-10-14  1231  	} else {
1bf467fdfeaee7 Josef Bacik 2020-10-14  1232  		/*
1bf467fdfeaee7 Josef Bacik 2020-10-14  1233  		 * We overcommit metadata, so we need to do the
1bf467fdfeaee7 Josef Bacik 2020-10-14  1234  		 * btrfs_can_overcommit check here, and we need to pass in
1bf467fdfeaee7 Josef Bacik 2020-10-14  1235  		 * BTRFS_RESERVE_NO_FLUSH to give ourselves the most amount of
1bf467fdfeaee7 Josef Bacik 2020-10-14  1236  		 * leeway to allow us to mark this block group as read only.
26ce2095e03c24 Josef Bacik 2019-06-20  1237  		 */
1bf467fdfeaee7 Josef Bacik 2020-10-14  1238  		if (btrfs_can_overcommit(cache->fs_info, sinfo, num_bytes,
1bf467fdfeaee7 Josef Bacik 2020-10-14  1239  					 BTRFS_RESERVE_NO_FLUSH))
1bf467fdfeaee7 Josef Bacik 2020-10-14  1240  			ret = 0;
1bf467fdfeaee7 Josef Bacik 2020-10-14  1241  	}
1bf467fdfeaee7 Josef Bacik 2020-10-14  1242  
1bf467fdfeaee7 Josef Bacik 2020-10-14  1243  	if (!ret) {
26ce2095e03c24 Josef Bacik 2019-06-20  1244  		sinfo->bytes_readonly += num_bytes;
26ce2095e03c24 Josef Bacik 2019-06-20  1245  		cache->ro++;
26ce2095e03c24 Josef Bacik 2019-06-20  1246  		list_add_tail(&cache->ro_list, &sinfo->ro_bgs);
26ce2095e03c24 Josef Bacik 2019-06-20  1247  	}
26ce2095e03c24 Josef Bacik 2019-06-20  1248  out:
26ce2095e03c24 Josef Bacik 2019-06-20  1249  	spin_unlock(&cache->lock);
26ce2095e03c24 Josef Bacik 2019-06-20  1250  	spin_unlock(&sinfo->lock);
26ce2095e03c24 Josef Bacik 2019-06-20  1251  	if (ret == -ENOSPC && btrfs_test_opt(cache->fs_info, ENOSPC_DEBUG)) {
26ce2095e03c24 Josef Bacik 2019-06-20  1252  		btrfs_info(cache->fs_info,
26ce2095e03c24 Josef Bacik 2019-06-20  1253  			"unable to make block group %llu ro",
26ce2095e03c24 Josef Bacik 2019-06-20  1254  			cache->key.objectid);
26ce2095e03c24 Josef Bacik 2019-06-20  1255  		btrfs_dump_space_info(cache->fs_info, cache->space_info, 0, 0);
26ce2095e03c24 Josef Bacik 2019-06-20  1256  	}
26ce2095e03c24 Josef Bacik 2019-06-20  1257  	return ret;
26ce2095e03c24 Josef Bacik 2019-06-20  1258  }
26ce2095e03c24 Josef Bacik 2019-06-20  1259  

:::::: The code at line 1189 was first introduced by commit
:::::: 26ce2095e03c248759951d81fdff37e2bf32601c btrfs: migrate inc/dec_block_group_ro code

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
