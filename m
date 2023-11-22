Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FAC1381
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ma2WkDCZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700614441; x=1732150441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gg7JF3SyMC/ahkvlHL9i2ksslj/ccHWMbfDQhhJbOus=;
  b=ma2WkDCZ30J433MdIeSBskBqfwALhSEwYRE7LUdzRbB9T9/wBSypddfs
   y/FfYjVDYBm24bI1j496Yja8srb7s4H1mdut8Y2V9mcW+CvdWSVy5S/2x
   8Gr88rAKVrbTJTjnD7nIkkHmeaXdEZ9UuV92JcK1SW6ll0NVlv8yukdjI
   pPPPONpJ2Z5DevxE8H0GN8KFN7raW8bEJZehUefqA9cPFVRwvBBDV8HG3
   uNZRVXpkhWsHEFXdqkwUUOqxv4G3tWvRk3N4kO7LzZHAIjMVuzOMzCMHK
   oPSBlwMu1kXRnKKnWt2liUvzoJpBrjKVPnLVi+R39Mkw15Z9tLRhw6kjU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="458450333"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="458450333"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 16:53:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="940253082"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="940253082"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 21 Nov 2023 16:53:57 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5bV5-0008Sw-0D;
	Wed, 22 Nov 2023 00:53:55 +0000
Date: Wed, 22 Nov 2023 08:53:39 +0800
From: kernel test robot <lkp@intel.com>
To: fdmanana@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 7/8] btrfs: use a dedicated data structure for chunk maps
Message-ID: <202311220850.3ooyrasY-lkp@intel.com>
References: <777320fd09dfc68a89180723bf5d7368dab06299.1700573314.git.fdmanana@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <777320fd09dfc68a89180723bf5d7368dab06299.1700573314.git.fdmanana@suse.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.7-rc2 next-20231121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-fix-off-by-one-when-checking-chunk-map-includes-logical-address/20231121-214139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/777320fd09dfc68a89180723bf5d7368dab06299.1700573314.git.fdmanana%40suse.com
patch subject: [PATCH 7/8] btrfs: use a dedicated data structure for chunk maps
config: i386-randconfig-061-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220850.3ooyrasY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311220850.3ooyrasY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311220850.3ooyrasY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/zoned.c:1293:12: warning: declaration of 'struct map_lookup' will not be visible outside of this function [-Wvisibility]
                                   struct map_lookup *map)
                                          ^
>> fs/btrfs/zoned.c:1296:35: error: incomplete definition of type 'struct map_lookup'
           struct btrfs_device *device = map->stripes[zone_idx].dev;
                                         ~~~^
   fs/btrfs/zoned.c:1293:12: note: forward declaration of 'struct map_lookup'
                                   struct map_lookup *map)
                                          ^
   fs/btrfs/zoned.c:1302:22: error: incomplete definition of type 'struct map_lookup'
           info->physical = map->stripes[zone_idx].physical;
                            ~~~^
   fs/btrfs/zoned.c:1293:12: note: forward declaration of 'struct map_lookup'
                                   struct map_lookup *map)
                                          ^
   fs/btrfs/zoned.c:1396:18: warning: declaration of 'struct map_lookup' will not be visible outside of this function [-Wvisibility]
                                         struct map_lookup *map,
                                                ^
   fs/btrfs/zoned.c:1402:10: error: incomplete definition of type 'struct map_lookup'
           if ((map->type & BTRFS_BLOCK_GROUP_DATA) && !fs_info->stripe_root) {
                ~~~^
   fs/btrfs/zoned.c:1396:18: note: forward declaration of 'struct map_lookup'
                                         struct map_lookup *map,
                                                ^
   fs/btrfs/zoned.c:1438:13: warning: declaration of 'struct map_lookup' will not be visible outside of this function [-Wvisibility]
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1445:10: error: incomplete definition of type 'struct map_lookup'
           if ((map->type & BTRFS_BLOCK_GROUP_DATA) && !fs_info->stripe_root) {
                ~~~^
   fs/btrfs/zoned.c:1438:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1447:36: error: incomplete definition of type 'struct map_lookup'
                             btrfs_bg_type_to_raid_name(map->type));
                                                        ~~~^
   fs/btrfs/messages.h:46:40: note: expanded from macro 'btrfs_err'
           btrfs_printk(fs_info, KERN_ERR fmt, ##args)
                                                 ^~~~
   fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
           _btrfs_printk(fs_info, fmt, ##args)
                                         ^~~~
   fs/btrfs/zoned.c:1438:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1451:21: error: incomplete definition of type 'struct map_lookup'
           for (i = 0; i < map->num_stripes; i++) {
                           ~~~^
   fs/btrfs/zoned.c:1438:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1460:37: error: incomplete definition of type 'struct map_lookup'
                                     btrfs_bg_type_to_raid_name(map->type));
                                                                ~~~^
   fs/btrfs/messages.h:46:40: note: expanded from macro 'btrfs_err'
           btrfs_printk(fs_info, KERN_ERR fmt, ##args)
                                                 ^~~~
   fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
           _btrfs_printk(fs_info, fmt, ##args)
                                         ^~~~
   fs/btrfs/zoned.c:1438:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1486:13: warning: declaration of 'struct map_lookup' will not be visible outside of this function [-Wvisibility]
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1492:10: error: incomplete definition of type 'struct map_lookup'
           if ((map->type & BTRFS_BLOCK_GROUP_DATA) && !fs_info->stripe_root) {
                ~~~^
   fs/btrfs/zoned.c:1486:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1494:36: error: incomplete definition of type 'struct map_lookup'
                             btrfs_bg_type_to_raid_name(map->type));
                                                        ~~~^
   fs/btrfs/messages.h:46:40: note: expanded from macro 'btrfs_err'
           btrfs_printk(fs_info, KERN_ERR fmt, ##args)
                                                 ^~~~
   fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
           _btrfs_printk(fs_info, fmt, ##args)
                                         ^~~~
   fs/btrfs/zoned.c:1486:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1498:25: error: incomplete definition of type 'struct map_lookup'
           for (int i = 0; i < map->num_stripes; i++) {
                               ~~~^
   fs/btrfs/zoned.c:1486:13: note: forward declaration of 'struct map_lookup'
                                           struct map_lookup *map,
                                                  ^
   fs/btrfs/zoned.c:1518:14: warning: declaration of 'struct map_lookup' will not be visible outside of this function [-Wvisibility]
                                            struct map_lookup *map,
                                                   ^
   fs/btrfs/zoned.c:1524:10: error: incomplete definition of type 'struct map_lookup'
           if ((map->type & BTRFS_BLOCK_GROUP_DATA) && !fs_info->stripe_root) {
                ~~~^
   fs/btrfs/zoned.c:1518:14: note: forward declaration of 'struct map_lookup'
                                            struct map_lookup *map,
                                                   ^
   fs/btrfs/zoned.c:1526:36: error: incomplete definition of type 'struct map_lookup'
                             btrfs_bg_type_to_raid_name(map->type));
                                                        ~~~^
   fs/btrfs/messages.h:46:40: note: expanded from macro 'btrfs_err'
           btrfs_printk(fs_info, KERN_ERR fmt, ##args)
                                                 ^~~~
   fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
           _btrfs_printk(fs_info, fmt, ##args)
                                         ^~~~
   fs/btrfs/zoned.c:1518:14: note: forward declaration of 'struct map_lookup'
                                            struct map_lookup *map,
                                                   ^
   fs/btrfs/zoned.c:1530:25: error: incomplete definition of type 'struct map_lookup'
           for (int i = 0; i < map->num_stripes; i++) {
                               ~~~^
   fs/btrfs/zoned.c:1518:14: note: forward declaration of 'struct map_lookup'
                                            struct map_lookup *map,
                                                   ^
   fs/btrfs/zoned.c:1543:15: error: incomplete definition of type 'struct map_lookup'
                   if ((i % map->sub_stripes) == 0) {
                            ~~~^
   fs/btrfs/zoned.c:1518:14: note: forward declaration of 'struct map_lookup'
                                            struct map_lookup *map,
                                                   ^
>> fs/btrfs/zoned.c:1555:26: error: incompatible pointer types initializing 'struct extent_map_tree *' with an expression of type 'struct rb_root_cached *' [-Werror,-Wincompatible-pointer-types]
           struct extent_map_tree *em_tree = &fs_info->mapping_tree;
                                   ^         ~~~~~~~~~~~~~~~~~~~~~~
>> fs/btrfs/zoned.c:1600:65: error: incompatible pointer types passing 'struct btrfs_chunk_map *' to parameter of type 'struct map_lookup *' [-Werror,-Wincompatible-pointer-types]
                   ret = btrfs_load_zone_info(fs_info, i, &zone_info[i], active, map);
                                                                                 ^~~
   fs/btrfs/zoned.c:1293:24: note: passing argument to parameter 'map' here
                                   struct map_lookup *map)
                                                      ^
   fs/btrfs/zoned.c:1634:43: error: incompatible pointer types passing 'struct btrfs_chunk_map *' to parameter of type 'struct map_lookup *' [-Werror,-Wincompatible-pointer-types]
                   ret = btrfs_load_block_group_dup(cache, map, zone_info, active);
                                                           ^~~
   fs/btrfs/zoned.c:1396:30: note: passing argument to parameter 'map' here
                                         struct map_lookup *map,
                                                            ^
   fs/btrfs/zoned.c:1639:45: error: incompatible pointer types passing 'struct btrfs_chunk_map *' to parameter of type 'struct map_lookup *' [-Werror,-Wincompatible-pointer-types]
                   ret = btrfs_load_block_group_raid1(cache, map, zone_info, active);
                                                             ^~~
   fs/btrfs/zoned.c:1438:25: note: passing argument to parameter 'map' here
                                           struct map_lookup *map,
                                                              ^
   fs/btrfs/zoned.c:1642:45: error: incompatible pointer types passing 'struct btrfs_chunk_map *' to parameter of type 'struct map_lookup *' [-Werror,-Wincompatible-pointer-types]
                   ret = btrfs_load_block_group_raid0(cache, map, zone_info, active);
                                                             ^~~
   fs/btrfs/zoned.c:1486:25: note: passing argument to parameter 'map' here
                                           struct map_lookup *map,
                                                              ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.


vim +1296 fs/btrfs/zoned.c

15c12fcc50a1b12 Christoph Hellwig 2023-06-05  1290  
09a46725cc84165 Christoph Hellwig 2023-06-05  1291  static int btrfs_load_zone_info(struct btrfs_fs_info *fs_info, int zone_idx,
09a46725cc84165 Christoph Hellwig 2023-06-05  1292  				struct zone_info *info, unsigned long *active,
09a46725cc84165 Christoph Hellwig 2023-06-05 @1293  				struct map_lookup *map)
09a46725cc84165 Christoph Hellwig 2023-06-05  1294  {
09a46725cc84165 Christoph Hellwig 2023-06-05  1295  	struct btrfs_dev_replace *dev_replace = &fs_info->dev_replace;
09a46725cc84165 Christoph Hellwig 2023-06-05 @1296  	struct btrfs_device *device = map->stripes[zone_idx].dev;
09a46725cc84165 Christoph Hellwig 2023-06-05  1297  	int dev_replace_is_ongoing = 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1298  	unsigned int nofs_flag;
09a46725cc84165 Christoph Hellwig 2023-06-05  1299  	struct blk_zone zone;
09a46725cc84165 Christoph Hellwig 2023-06-05  1300  	int ret;
09a46725cc84165 Christoph Hellwig 2023-06-05  1301  
09a46725cc84165 Christoph Hellwig 2023-06-05  1302  	info->physical = map->stripes[zone_idx].physical;
09a46725cc84165 Christoph Hellwig 2023-06-05  1303  
09a46725cc84165 Christoph Hellwig 2023-06-05  1304  	if (!device->bdev) {
09a46725cc84165 Christoph Hellwig 2023-06-05  1305  		info->alloc_offset = WP_MISSING_DEV;
09a46725cc84165 Christoph Hellwig 2023-06-05  1306  		return 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1307  	}
09a46725cc84165 Christoph Hellwig 2023-06-05  1308  
09a46725cc84165 Christoph Hellwig 2023-06-05  1309  	/* Consider a zone as active if we can allow any number of active zones. */
09a46725cc84165 Christoph Hellwig 2023-06-05  1310  	if (!device->zone_info->max_active_zones)
09a46725cc84165 Christoph Hellwig 2023-06-05  1311  		__set_bit(zone_idx, active);
09a46725cc84165 Christoph Hellwig 2023-06-05  1312  
09a46725cc84165 Christoph Hellwig 2023-06-05  1313  	if (!btrfs_dev_is_sequential(device, info->physical)) {
09a46725cc84165 Christoph Hellwig 2023-06-05  1314  		info->alloc_offset = WP_CONVENTIONAL;
09a46725cc84165 Christoph Hellwig 2023-06-05  1315  		return 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1316  	}
09a46725cc84165 Christoph Hellwig 2023-06-05  1317  
09a46725cc84165 Christoph Hellwig 2023-06-05  1318  	/* This zone will be used for allocation, so mark this zone non-empty. */
09a46725cc84165 Christoph Hellwig 2023-06-05  1319  	btrfs_dev_clear_zone_empty(device, info->physical);
09a46725cc84165 Christoph Hellwig 2023-06-05  1320  
09a46725cc84165 Christoph Hellwig 2023-06-05  1321  	down_read(&dev_replace->rwsem);
09a46725cc84165 Christoph Hellwig 2023-06-05  1322  	dev_replace_is_ongoing = btrfs_dev_replace_is_ongoing(dev_replace);
09a46725cc84165 Christoph Hellwig 2023-06-05  1323  	if (dev_replace_is_ongoing && dev_replace->tgtdev != NULL)
09a46725cc84165 Christoph Hellwig 2023-06-05  1324  		btrfs_dev_clear_zone_empty(dev_replace->tgtdev, info->physical);
09a46725cc84165 Christoph Hellwig 2023-06-05  1325  	up_read(&dev_replace->rwsem);
09a46725cc84165 Christoph Hellwig 2023-06-05  1326  
09a46725cc84165 Christoph Hellwig 2023-06-05  1327  	/*
09a46725cc84165 Christoph Hellwig 2023-06-05  1328  	 * The group is mapped to a sequential zone. Get the zone write pointer
09a46725cc84165 Christoph Hellwig 2023-06-05  1329  	 * to determine the allocation offset within the zone.
09a46725cc84165 Christoph Hellwig 2023-06-05  1330  	 */
09a46725cc84165 Christoph Hellwig 2023-06-05  1331  	WARN_ON(!IS_ALIGNED(info->physical, fs_info->zone_size));
09a46725cc84165 Christoph Hellwig 2023-06-05  1332  	nofs_flag = memalloc_nofs_save();
09a46725cc84165 Christoph Hellwig 2023-06-05  1333  	ret = btrfs_get_dev_zone(device, info->physical, &zone);
09a46725cc84165 Christoph Hellwig 2023-06-05  1334  	memalloc_nofs_restore(nofs_flag);
09a46725cc84165 Christoph Hellwig 2023-06-05  1335  	if (ret) {
09a46725cc84165 Christoph Hellwig 2023-06-05  1336  		if (ret != -EIO && ret != -EOPNOTSUPP)
09a46725cc84165 Christoph Hellwig 2023-06-05  1337  			return ret;
09a46725cc84165 Christoph Hellwig 2023-06-05  1338  		info->alloc_offset = WP_MISSING_DEV;
09a46725cc84165 Christoph Hellwig 2023-06-05  1339  		return 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1340  	}
09a46725cc84165 Christoph Hellwig 2023-06-05  1341  
09a46725cc84165 Christoph Hellwig 2023-06-05  1342  	if (zone.type == BLK_ZONE_TYPE_CONVENTIONAL) {
09a46725cc84165 Christoph Hellwig 2023-06-05  1343  		btrfs_err_in_rcu(fs_info,
09a46725cc84165 Christoph Hellwig 2023-06-05  1344  		"zoned: unexpected conventional zone %llu on device %s (devid %llu)",
09a46725cc84165 Christoph Hellwig 2023-06-05  1345  			zone.start << SECTOR_SHIFT, rcu_str_deref(device->name),
09a46725cc84165 Christoph Hellwig 2023-06-05  1346  			device->devid);
09a46725cc84165 Christoph Hellwig 2023-06-05  1347  		return -EIO;
09a46725cc84165 Christoph Hellwig 2023-06-05  1348  	}
09a46725cc84165 Christoph Hellwig 2023-06-05  1349  
09a46725cc84165 Christoph Hellwig 2023-06-05  1350  	info->capacity = (zone.capacity << SECTOR_SHIFT);
09a46725cc84165 Christoph Hellwig 2023-06-05  1351  
09a46725cc84165 Christoph Hellwig 2023-06-05  1352  	switch (zone.cond) {
09a46725cc84165 Christoph Hellwig 2023-06-05  1353  	case BLK_ZONE_COND_OFFLINE:
09a46725cc84165 Christoph Hellwig 2023-06-05  1354  	case BLK_ZONE_COND_READONLY:
09a46725cc84165 Christoph Hellwig 2023-06-05  1355  		btrfs_err(fs_info,
09a46725cc84165 Christoph Hellwig 2023-06-05  1356  		"zoned: offline/readonly zone %llu on device %s (devid %llu)",
09a46725cc84165 Christoph Hellwig 2023-06-05  1357  			  (info->physical >> device->zone_info->zone_size_shift),
09a46725cc84165 Christoph Hellwig 2023-06-05  1358  			  rcu_str_deref(device->name), device->devid);
09a46725cc84165 Christoph Hellwig 2023-06-05  1359  		info->alloc_offset = WP_MISSING_DEV;
09a46725cc84165 Christoph Hellwig 2023-06-05  1360  		break;
09a46725cc84165 Christoph Hellwig 2023-06-05  1361  	case BLK_ZONE_COND_EMPTY:
09a46725cc84165 Christoph Hellwig 2023-06-05  1362  		info->alloc_offset = 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1363  		break;
09a46725cc84165 Christoph Hellwig 2023-06-05  1364  	case BLK_ZONE_COND_FULL:
09a46725cc84165 Christoph Hellwig 2023-06-05  1365  		info->alloc_offset = info->capacity;
09a46725cc84165 Christoph Hellwig 2023-06-05  1366  		break;
09a46725cc84165 Christoph Hellwig 2023-06-05  1367  	default:
09a46725cc84165 Christoph Hellwig 2023-06-05  1368  		/* Partially used zone. */
09a46725cc84165 Christoph Hellwig 2023-06-05  1369  		info->alloc_offset = ((zone.wp - zone.start) << SECTOR_SHIFT);
09a46725cc84165 Christoph Hellwig 2023-06-05  1370  		__set_bit(zone_idx, active);
09a46725cc84165 Christoph Hellwig 2023-06-05  1371  		break;
09a46725cc84165 Christoph Hellwig 2023-06-05  1372  	}
09a46725cc84165 Christoph Hellwig 2023-06-05  1373  
09a46725cc84165 Christoph Hellwig 2023-06-05  1374  	return 0;
09a46725cc84165 Christoph Hellwig 2023-06-05  1375  }
09a46725cc84165 Christoph Hellwig 2023-06-05  1376  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
