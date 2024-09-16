Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27D1DFE4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 14:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726496360; cv=none; b=QPBKNO4U65D6tisWKiBNdaGYzGci5USo1N/uYKrDAh+qhkzZddY5Ae0v+WVTjztJZlY9EoMsZuQizyMyqT7CWoV/TPNTlTHEPTPfRJ0FhxC9vJq03ttibdnA9Vr9oM7lYgu4g+x00jnUYqIHCCiIGJhjpXbmn+Kr6VFbwQe5CMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726496360; c=relaxed/simple;
	bh=2m8LFuf9NFqw1hkjJpoCmFIxnFKkqeF6hEP/9jnWeY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozBDb9VrB80DQ8VqvY+8+sJEqI5IyxWbsRchKURAsfHDNo0DDseyIUzpLHJReA/Mr4uUiG/8QaMVuPA9VJ+VVW7zyDtN8RQhelFHDnHF1/yKc/AmS7vLXoCIbU0Yf7aMaAMwCOdTRqFzTff3ytlgR4y9ukbIaWwQrbrJ4gQIKjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S538xdeY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S538xdeY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726496358; x=1758032358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2m8LFuf9NFqw1hkjJpoCmFIxnFKkqeF6hEP/9jnWeY0=;
  b=S538xdeYTw64GhSTR5wCxfxm7HcjgM3klqK1VQwO7ZQXzUspRmL705Zi
   ndyiwXInkAovfnWWWs8M1bLmzbmI1CrnUp0cE6ZtTGHOM+4edWULs8i3a
   UHzbOl/cHihUgnG0GeBFCSy3eCYB6pDp4PxmG4nZeixcMCuMQbfx77e9b
   waK0bdG4quBYDnANIQ23S7SVrkr56Buqwqib/X0/ELsYIDIICuwlr835w
   SmiHYda3UxId3IskYFpKquCrtuR/rnDvC7mXdThwEk74P1Lz3k1qVmaEa
   DYns9hNJfI0egBISB1oPeZo6iYGU/sY1WkmPNfGJ5U/U76pgpmgLAq9Qm
   w==;
X-CSE-ConnectionGUID: pyPtYwT/Rmq5RQDrqIO7Sg==
X-CSE-MsgGUID: eIL2if5hRFaPyZran7fMDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="29109359"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="29109359"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 07:19:10 -0700
X-CSE-ConnectionGUID: i3gHsT6OR7a6d7JfjwMvig==
X-CSE-MsgGUID: TyMgE8VdTESqJLFDN3bHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68847448"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Sep 2024 07:19:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqCZG-000A8Y-1l;
	Mon, 16 Sep 2024 14:19:06 +0000
Date: Mon, 16 Sep 2024 22:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17157/23714]
 drivers/md/bcache/request.c:1333:27: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202409162232.mD47BzHq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: cb004e127a5500466043986dbc4cc43ec63d849e [17157/23714] Add traffic policy for low cache available.
config: x86_64-randconfig-123-20240915 (https://download.01.org/0day-ci/archive/20240916/202409162232.mD47BzHq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409162232.mD47BzHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409162232.mD47BzHq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/md/bcache/request.c: note: in included file (through drivers/md/bcache/bcache.h):
   include/uapi/linux/bcache.h:294:38: sparse: sparse: array of flexible structures
   drivers/md/bcache/request.c: note: in included file (through drivers/md/bcache/bcache.h):
   drivers/md/bcache/bset.h:231:36: sparse: sparse: array of flexible structures
>> drivers/md/bcache/request.c:1333:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] <asn:1> *to @@     got struct get_bcache_status * @@
   drivers/md/bcache/request.c:1333:27: sparse:     expected void [noderef] <asn:1> *to
   drivers/md/bcache/request.c:1333:27: sparse:     got struct get_bcache_status *
>> drivers/md/bcache/request.c:1346:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] <asn:1> *from @@     got struct set_bcache_status * @@
   drivers/md/bcache/request.c:1346:33: sparse:     expected void const [noderef] <asn:1> *from
   drivers/md/bcache/request.c:1346:33: sparse:     got struct set_bcache_status *

vim +1333 drivers/md/bcache/request.c

  1315	
  1316	static int bcache_get_write_status(struct cached_dev *dc, unsigned long arg)
  1317	{
  1318		struct get_bcache_status a;
  1319		uint64_t cache_sectors;
  1320		struct cache_set *c = dc->disk.c;
  1321	
  1322		if (c == NULL)
  1323			return -ENODEV;
  1324	
  1325		a.writeback_sector_size_per_sec = dc->writeback_sector_size_per_sec;
  1326		a.writeback_io_num_per_sec = dc->writeback_io_num_per_sec;
  1327		a.front_io_num_per_sec = dc->front_io_num_per_sec;
  1328		cache_sectors = c->nbuckets * c->sb.bucket_size -
  1329			atomic_long_read(&c->flash_dev_dirty_sectors);
  1330		a.dirty_rate = div64_u64(bcache_dev_sectors_dirty(&dc->disk) * 100,
  1331			cache_sectors);
  1332		a.available = 100 - c->gc_stats.in_use;
> 1333		if (copy_to_user((struct get_bcache_status *)arg, &a,
  1334			sizeof(struct get_bcache_status)))
  1335			return -EFAULT;
  1336		return 0;
  1337	}
  1338	
  1339	static int bcache_set_write_status(struct cached_dev *dc, unsigned long arg)
  1340	{
  1341		struct set_bcache_status a;
  1342		struct cache_set *c = dc->disk.c;
  1343	
  1344		if (c == NULL)
  1345			return -ENODEV;
> 1346		if (copy_from_user(&a, (struct set_bcache_status *)arg,
  1347			sizeof(struct set_bcache_status)))
  1348			return -EFAULT;
  1349	
  1350		if (c->traffic_policy_start != a.traffic_policy_start)
  1351			pr_info("%s traffic policy %s", dc->disk.disk->disk_name,
  1352			       (a.traffic_policy_start == true) ? "enable" : "disable");
  1353		if (c->force_write_through != a.force_write_through)
  1354			pr_info("%s force write through %s", dc->disk.disk->disk_name,
  1355			       (a.force_write_through == true) ? "enable" : "disable");
  1356		if (a.trigger_gc) {
  1357			pr_info("trigger %s gc", dc->disk.disk->disk_name);
  1358			atomic_set(&c->sectors_to_gc, -1);
  1359			wake_up_gc(c);
  1360		}
  1361		if ((a.cutoff_writeback_sync >= MIN_CUTOFF_WRITEBACK_SYNC) &&
  1362			(a.cutoff_writeback_sync <= MAX_CUTOFF_WRITEBACK_SYNC)) {
  1363			c->cutoff_writeback_sync = a.cutoff_writeback_sync;
  1364		}
  1365	
  1366		dc->max_sector_size = a.write_token_sector_size;
  1367		dc->max_io_num = a.write_token_io_num;
  1368		c->traffic_policy_start = a.traffic_policy_start;
  1369		c->force_write_through = a.force_write_through;
  1370		c->gc_sectors = a.gc_sectors;
  1371		dc->writeback_state = a.writeback_state;
  1372		return 0;
  1373	}
  1374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
