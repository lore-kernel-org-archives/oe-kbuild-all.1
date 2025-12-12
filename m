Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3B71D45E8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765564822; cv=none; b=PPA/sUGDVYsVxCUOjyr4X304NgBTB98dnmrCWRNdQSH7OXkkhU8gnYXdsYcenECLCtV+zzyFLFf27H/e9vPKLw62t/JCIj388c09xIx+IhgugqzjdaRz4HbbfW94DC3DR2DGYlfPqxAidt4f15g/yZXq0KvGJCTIg7nY8kyl/8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765564822; c=relaxed/simple;
	bh=6TEgGldIH+ja8xnXsIZQycePygBOI3lXrX/sz6VbCt4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cp7M2exECuscgvNaAHrBxZoqa006j1q3pjmzlOrnpXTAD7mnDw1Ro7A2SJ5QwsLxenM9XU/DduKvimB1D/g4puRR1Q8BpKff0EKLL1w9XUT6khbM9X9KbF/1db1lvXjs3tQtPwl5SL/NJ6/wpIw7pf5IYzDDbJXzJXmipF5QEO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfQHIIWK; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfQHIIWK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765564821; x=1797100821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6TEgGldIH+ja8xnXsIZQycePygBOI3lXrX/sz6VbCt4=;
  b=EfQHIIWKl+yj1aVWjumkSl+C1VDmeDkIyDR9L/qyVHxS1G4Wk9xcUelc
   tN1bwiy/by9PA4xyWaEPAupydueQjJkCXTKv6FahiIZDQcRdmaGroCPJn
   DM83Qa2SKd46VNCzqXBSTdvGGdkl2s5jDMPX3pOQA2duF/7HMur0GA4Th
   yjs5YdzyzWe0P8xVRQXL+oWbthpF8znB9Irixy1+CTNVbE0ASSji17+Bo
   EXv0TCVblJnFoc1rdtfcnC1dn4qN65nqa7mK5IVduAafJl0vSNZIsXS64
   fHjbTT3FpQ309D3i8kZolWVUlbUB8lmLbcs+eGKQnsN58Vx96RS53mt5l
   Q==;
X-CSE-ConnectionGUID: 5rmad2AISFeZ08F5DcTuXg==
X-CSE-MsgGUID: 6ANsLGA8RRCxHr8V1Ciocg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67613905"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67613905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 10:40:20 -0800
X-CSE-ConnectionGUID: IKvSeo/hQ3yA8UFKn6FtlQ==
X-CSE-MsgGUID: at/m4U9eSY6jKB52eYuXpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="196438229"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Dec 2025 10:40:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU83s-000000006SZ-3HnV;
	Fri, 12 Dec 2025 18:40:16 +0000
Date: Sat, 13 Dec 2025 02:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Song Liu <song@kernel.org>
Subject: drivers/md/md-linear.c:216:19: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202512130230.DzsGtT49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 127186cfb184eaccdfe948e6da66940cfa03efc5 md: reintroduce md-linear
date:   11 months ago
config: arm64-randconfig-r121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130230.DzsGtT49-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130230.DzsGtT49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130230.DzsGtT49-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/md-linear.c:216:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/md-linear.c:216:19: sparse:    void [noderef] __rcu *
   drivers/md/md-linear.c:216:19: sparse:    void *
   drivers/md/md-linear.c:221:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   drivers/md/md-linear.c:221:9: sparse:    void [noderef] __rcu *
   drivers/md/md-linear.c:221:9: sparse:    void *

vim +216 drivers/md/md-linear.c

   187	
   188	static int linear_add(struct mddev *mddev, struct md_rdev *rdev)
   189	{
   190		/* Adding a drive to a linear array allows the array to grow.
   191		 * It is permitted if the new drive has a matching superblock
   192		 * already on it, with raid_disk equal to raid_disks.
   193		 * It is achieved by creating a new linear_private_data structure
   194		 * and swapping it in in-place of the current one.
   195		 * The current one is never freed until the array is stopped.
   196		 * This avoids races.
   197		 */
   198		struct linear_conf *newconf, *oldconf;
   199	
   200		if (rdev->saved_raid_disk != mddev->raid_disks)
   201			return -EINVAL;
   202	
   203		rdev->raid_disk = rdev->saved_raid_disk;
   204		rdev->saved_raid_disk = -1;
   205	
   206		newconf = linear_conf(mddev, mddev->raid_disks + 1);
   207		if (!newconf)
   208			return -ENOMEM;
   209	
   210		/* newconf->raid_disks already keeps a copy of * the increased
   211		 * value of mddev->raid_disks, WARN_ONCE() is just used to make
   212		 * sure of this. It is possible that oldconf is still referenced
   213		 * in linear_congested(), therefore kfree_rcu() is used to free
   214		 * oldconf until no one uses it anymore.
   215		 */
 > 216		oldconf = rcu_dereference_protected(mddev->private,
   217				lockdep_is_held(&mddev->reconfig_mutex));
   218		mddev->raid_disks++;
   219		WARN_ONCE(mddev->raid_disks != newconf->raid_disks,
   220			"copied raid_disks doesn't match mddev->raid_disks");
   221		rcu_assign_pointer(mddev->private, newconf);
   222		md_set_array_sectors(mddev, linear_size(mddev, 0, 0));
   223		set_capacity_and_notify(mddev->gendisk, mddev->array_sectors);
   224		kfree_rcu(oldconf, rcu);
   225		return 0;
   226	}
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
