Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7716DC28
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 May 2026 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780259832; cv=none; b=XB82rxxmmzbd16VBOYMCLq9GWD1JqbUyq3G8LyuJcHLi/9Ps3sENP7ICEdOYoLixr3WDXcVqPu2TqJ5Zp2RX2KWaHkgZbEHIO/ISSwEg3LtBy9lCO4qqA9qj+/cttYgevAuszjaJ+aUr7AhwHnVfKeZeWNc1OHK4JSLp6BQ6poQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780259832; c=relaxed/simple;
	bh=5uFhQeNCt7oqzw6XUvtKdgv2xOQaFTn+ZdNw+IhkDjI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SAv0M4j4mCt6762GpvO3nN9QAZ9a4NqSSrmQ3xz+NyDz4imemmityyINNM8k2Sk79L/gifCj0FLrJ6bVEYQvVubz0K2RSdtj8B11Vt8bi9iVfUm7NCvfMxS8o0BU0c0fMKsxlU9cNaVC00Dr1Cp9VNqYguTyXZLI8JdEaCkYEjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfCJNrfc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfCJNrfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780259830; x=1811795830;
  h=date:from:to:cc:subject:message-id;
  bh=5uFhQeNCt7oqzw6XUvtKdgv2xOQaFTn+ZdNw+IhkDjI=;
  b=mfCJNrfc3qI4BCV85DgmYwTKz/brTqOOxjVioOv8XEh1+/L6mIjj5Joc
   Gw2VowjMJvBoUqGpMQxnawARsBZuCfyQ994iYw/MgF96VY3HxRHuTMIGf
   sLtaQgFwxs0VTC/a0S4FyxHKgTgFYgRqgiM/K/NLV4JjabwWMTryIfkFZ
   wsEw0GaYcIalVLYDNu06/YK/rtEg3vEwobSll8d0Y6T9hoguFgsowjDmK
   E4EjMWQCv6mvJ8j9cNBMn0uLS+yVTSIqZtB6UYIRjWT057XdN2Lq1B+Bs
   W0Cykg5kWogGXtrSK+7OoukJLTg8i45AEfOw47Zh1Rc9G2B8vHkNlNPmj
   w==;
X-CSE-ConnectionGUID: Gy/8PrB0TtiZ62qbrUeTsg==
X-CSE-MsgGUID: ufRQ6CiNSF2xJslHveABQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80752934"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="80752934"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 13:37:10 -0700
X-CSE-ConnectionGUID: NRDfsFVOT3KPwGZZM3AwFg==
X-CSE-MsgGUID: 2DyiRpm+TC6ZFd6Lnodo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="273674664"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 May 2026 13:37:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTmu9-000000009jK-2bIG;
	Sun, 31 May 2026 20:37:05 +0000
Date: Mon, 01 Jun 2026 04:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:block-error-injection 6/7] block/blk.h:791:38:
 error: 'struct gendisk' has no member named 'error_injection_list'
Message-ID: <202606010412.CF0Qbqyp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git block-error-injection
head:   f7d922716d709e96c39fc2a0ebc67eac84deb06d
commit: d547b55ba615b8179facda07eb9c62d717ee6aff [6/7] block: add error injection
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260601/202606010412.CF0Qbqyp-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606010412.CF0Qbqyp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606010412.CF0Qbqyp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from block/bdev.c:32:
   block/blk.h: In function 'blk_error_inject':
>> block/blk.h:791:38: error: 'struct gendisk' has no member named 'error_injection_list'
     791 |         if (!list_empty_careful(&disk->error_injection_list))
         |                                      ^~
--
   In file included from block/blk-core.c:47:
   block/blk.h: In function 'blk_error_inject':
>> block/blk.h:791:38: error: 'struct gendisk' has no member named 'error_injection_list'
     791 |         if (!list_empty_careful(&disk->error_injection_list))
         |                                      ^~
   block/blk-core.c: In function 'may_fail_bio':
   block/blk-core.c:574:45: error: 'BD_MAKE_IT_FAIL' undeclared (first use in this function)
     574 |         return bdev_test_flag(bio->bi_bdev, BD_MAKE_IT_FAIL) ||
         |                                             ^~~~~~~~~~~~~~~
   block/blk-core.c:574:45: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from block/partitions/check.h:5,
                    from block/partitions/core.c:15:
   block/partitions/../blk.h: In function 'blk_error_inject':
>> block/partitions/../blk.h:791:38: error: 'struct gendisk' has no member named 'error_injection_list'
     791 |         if (!list_empty_careful(&disk->error_injection_list))
         |                                      ^~


vim +791 block/blk.h

   785	
   786	bool __blk_error_inject(struct bio *bio);
   787	static inline bool blk_error_inject(struct bio *bio)
   788	{
   789		struct gendisk *disk = bio->bi_bdev->bd_disk;
   790	
 > 791		if (!list_empty_careful(&disk->error_injection_list))
   792			return __blk_error_inject(bio);
   793		return false;
   794	}
   795	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
