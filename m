Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1F369961
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 15:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317684; cv=none; b=SMwjnWKSYMvrXGKwu1J0r1zkNkF+Jb5Kt06ZxLIFr0k89zTgocA1NaFWyXyX2DR7eYt965kQHixxSJbdhR8rrbQtFff9cY6StFzkTgL1Mo7lMe/XJ+A5//slBHFl0kqDaoWw3fq9Td3fsz7z0ozG3UKhKAvjsXGsEndGWqc1qks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317684; c=relaxed/simple;
	bh=5hBIdtKUBO15ozkbW9O6Q2PUJD6wMONorr19X3qkoUs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eZHerQR8yZCt/Fq3RbbPvjWcnV58E/GRSnLXWzair5S/Hqmzg6igB4xp0Dwd+E80VN2+cfQ48SFIU3uQvjhCjwU4yz57vuObbIBYxhboJrC6o+YbygDl0Z8PrlcVuPek8h7RXIJ0yfIxCCJhPhJBtZs6xiwDtivy362DTdS7ny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhcrJIm0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhcrJIm0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768317682; x=1799853682;
  h=date:from:to:cc:subject:message-id;
  bh=5hBIdtKUBO15ozkbW9O6Q2PUJD6wMONorr19X3qkoUs=;
  b=EhcrJIm01joB5xMdCvFYJ/7FQ0kJEo+c6N54eLNiRThnttvapLjuLzXu
   7b9X+5w8UZxeouXotRY8tjwZ6lpLbjhTuWJRr4Z9Q0weH36GFcArjaxIg
   wPIp70NHmDDH/EUaZAMQTnMH/6kAdHUFfzwK6LbzcYjwk8wqHp6J05MrS
   EUUXhCHM0v1k5/nFECzlUlPNYfLpT43+h1dRSlPY61l1OiyKCGuErGyHq
   g+aiDf4wroV/jUE18LWTaJ7gZKYDGPGtK0UY+PQmGdubp4f+tLUQgvLj+
   wcbWPRlyP7B68U8JkZBkotzaYdp6tDGAsX0YpI8R3z6wenn+m9UpPNHnA
   g==;
X-CSE-ConnectionGUID: VhTiD/0FSj+8TxnUw0RibQ==
X-CSE-MsgGUID: GEC6sZluSe66qp3ktZkUPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="72185395"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="72185395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 07:21:20 -0800
X-CSE-ConnectionGUID: dK5CfsSrSOOOTJMcUUWhAg==
X-CSE-MsgGUID: Duu093azSFqAbduAuwlnwA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 07:21:19 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfgCq-00000000Ezg-29kK;
	Tue, 13 Jan 2026 15:21:16 +0000
Date: Tue, 13 Jan 2026 23:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Song Liu <song@kernel.org>
Subject: drivers/md/md-linear.c:216:19: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202601132340.SXTnCe4J-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: 127186cfb184eaccdfe948e6da66940cfa03efc5 md: reintroduce md-linear
date:   1 year ago
config: sparc64-randconfig-r134-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132340.SXTnCe4J-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132340.SXTnCe4J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132340.SXTnCe4J-lkp@intel.com/

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
