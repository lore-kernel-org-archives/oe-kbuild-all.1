Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BA51714A2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723727565; cv=none; b=kVocc+unAk8gpA8+oDz0XIoImFdAWaclBicoB0shfXIT8ZrSriJKTJs/djz8pasEkmBQxPE/WDiTEKbfrZxCk/KWVKuJJedMj160xTlyjlbBNeeptcto2rqGh+ZbMC17dB1/D6e88K7Km/oCjoY1Rpn7FkkZOHF8KvyMaSx1q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723727565; c=relaxed/simple;
	bh=46vkk3/GEmzlLJTZuuueVzHcJEsH3s7uhKXvhQPhdD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoYywCzepOJrNpwry+hPWYoJfC87RWBN5KwIvWvgENHIIM7m6n6HBhCyqttuDfY+CzCnJA1t9GEa7t+o1/K8N+hFohGz3lHEC0iX/47FvKOQDc0WCUOdtNWuVU3B8tvakQNtWCn+TOhsHwOYK9eRUKnjnbgV3WAx229mCGILd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQxMK5kn; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQxMK5kn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723727563; x=1755263563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=46vkk3/GEmzlLJTZuuueVzHcJEsH3s7uhKXvhQPhdD8=;
  b=WQxMK5knt985N2z6nnpUc5G7GepG56PbMWrwAdUQHH4Q0eXMaOE9o3AR
   0zUyfb6Evzonshm+YRfBHKAEERl12LJzk8XbAHuPETpb3c6xjUX4Ud1kw
   WNO1dw2WkfzHdsdwXiFG9nRHBIa3i6XmqZxy6u0Mv+G8hgYhpNKaqpWFz
   6S1B0wWuYkE0VW7v/mZ/qh33CDMDGduXNj9ZWlZ0WN0QENyEGtZAiuVU+
   UyX+MGk2ts3k5VzWsp5ysQuC6bf5m3SDS2JTmZXK9FWQ09fe73Q5NpfTj
   dH2uwYSxRwfiSIQ3QTAsLo6fXwrmFBSzeF0ZIDXfiVWP4djmE/8/yv8Dq
   A==;
X-CSE-ConnectionGUID: xKZneiKWTwGKG9pkbADRzw==
X-CSE-MsgGUID: hYNKkGicTJaVWUXkWQmB/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33371265"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="33371265"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2024 06:12:43 -0700
X-CSE-ConnectionGUID: 6h94mWytR12BPMeTpUghfg==
X-CSE-MsgGUID: B4lbTTjxTayZwTeU2GF9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; 
   d="scan'208";a="59624832"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2024 06:12:20 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seaH3-0003cC-1f;
	Thu, 15 Aug 2024 13:12:17 +0000
Date: Thu, 15 Aug 2024 21:11:55 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jeff Layton <jlayton@kernel.org>
Subject: [linux-next:master 4148/4951] fs/fcntl.c:111:13: sparse: sparse:
 Using plain integer as NULL pointer
Message-ID: <202408152155.21zGGsA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edd1ec2e3a9f5de7fb267a3af73e4f00e7e052b7
commit: 0e8540d012189259261c75360d2725a2107761e7 [4148/4951] file: reclaim 24 bytes from f_owner
config: hexagon-randconfig-r123-20240814 (https://download.01.org/0day-ci/archive/20240815/202408152155.21zGGsA0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce: (https://download.01.org/0day-ci/archive/20240815/202408152155.21zGGsA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408152155.21zGGsA0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fcntl.c:111:13: sparse: sparse: Using plain integer as NULL pointer
   fs/fcntl.c:488:47: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct flock [noderef] __user *user @@     got struct flock * @@
   fs/fcntl.c:488:47: sparse:     expected struct flock [noderef] __user *user
   fs/fcntl.c:488:47: sparse:     got struct flock *
   fs/fcntl.c:502:51: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct flock [noderef] __user *user @@     got struct flock * @@
   fs/fcntl.c:502:51: sparse:     expected struct flock [noderef] __user *user
   fs/fcntl.c:502:51: sparse:     got struct flock *
   fs/fcntl.c:1068:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1068:9: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1068:9: sparse:    struct fasync_struct *
   fs/fcntl.c:1146:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1146:22: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1146:22: sparse:    struct fasync_struct *
   fs/fcntl.c:1157:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fcntl.c:1157:33: sparse:    struct fasync_struct [noderef] __rcu *
   fs/fcntl.c:1157:33: sparse:    struct fasync_struct *
   fs/fcntl.c:306:9: sparse: sparse: context imbalance in 'f_getown_ex' - different lock contexts for basic block

vim +111 fs/fcntl.c

    91	
    92	/*
    93	 * Allocate an file->f_owner struct if it doesn't exist, handling racing
    94	 * allocations correctly.
    95	 */
    96	int file_f_owner_allocate(struct file *file)
    97	{
    98		struct fown_struct *f_owner;
    99	
   100		f_owner = file_f_owner(file);
   101		if (f_owner)
   102			return 0;
   103	
   104		f_owner = kzalloc(sizeof(struct fown_struct), GFP_KERNEL);
   105		if (!f_owner)
   106			return -ENOMEM;
   107	
   108		rwlock_init(&f_owner->lock);
   109		f_owner->file = file;
   110		/* If someone else raced us, drop our allocation. */
 > 111		if (unlikely(cmpxchg(&file->f_owner, NULL, f_owner)))
   112			kfree(f_owner);
   113		return 0;
   114	}
   115	EXPORT_SYMBOL(file_f_owner_allocate);
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
