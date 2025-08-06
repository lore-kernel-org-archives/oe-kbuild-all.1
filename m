Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9C41FDD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476432; cv=none; b=vF3Nv/+XvAcB6+nJgTmzkAdWeNwA8ER9/Uc3Ugu3RT0spsLJ9BiyQKBCfmDgVp2RuXuA/pG8qmSoDmSGg7zbIZOXS4OC9qtxnkV5kbjA1AgHSLbO6OlWUzAd9xHnar9PL2qO0FhOlUVXBTEFBFzuU/8DUpnsXvjkEslfD83cEZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476432; c=relaxed/simple;
	bh=iQUdtUr1tBjEmUQdqXR6nZ4qOO686FNhpnCiELZhBxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ue3GtLKHOmaUsPQWGynayuUiJkZQoaR+Yzq6Hd+o8usjExDNapnAbC0rRt0GEMG8TXKuMpBUap1D53OcgB9WIadSrcYqofH4cWxH9SuInZk0NYYoUqkLFuhwD7dCgiUpm/0BDdXKiXMIYRGHpBlmSc8oXH8FqVZ8cWXbvVE8rOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Peb/o64t; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Peb/o64t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754476431; x=1786012431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQUdtUr1tBjEmUQdqXR6nZ4qOO686FNhpnCiELZhBxo=;
  b=Peb/o64tw/hlnt0ebj/yJuMk4pIFvRAFcUSPH36BSji5psJW8bdMBcS8
   IjfoejIpyd0klUgsLofmsJKNlQ45uoj8ALYxDsvpNcNjM+jolgShqKd90
   pvT1/bQ2gdbXLxlu+L6fzpPx/yXvcpvxPPgNm34+ie+XY9ZYyXIQzmKh/
   vqZctNH1BvzLihmj0Zbj/alB1vETEsYcUSLAELS68XE0C5MIFPL6cUa73
   k6jJJ/bWWTQ2EKSQdR5k6L/bVOL8npuVE8KgXYo7NxruDOYAKLQCJ9b/5
   h8rRPn8dFVdOrQPKppovCaumIsaiUfcl9Tis1dz5F2GMkXeOqybtwfgVR
   Q==;
X-CSE-ConnectionGUID: ply4pgF/TpyTPdlsGvJYFA==
X-CSE-MsgGUID: Q+kNKe5TSUyd+PuMh6mWuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67056083"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67056083"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 03:33:50 -0700
X-CSE-ConnectionGUID: 2vXArbLrQeaNlqr6xdGP2g==
X-CSE-MsgGUID: b1d5dWYKQoe3PMb8spqL5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="165510795"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa010.fm.intel.com with ESMTP; 06 Aug 2025 03:33:49 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujbSt-0002Bv-1J;
	Wed, 06 Aug 2025 10:33:47 +0000
Date: Wed, 6 Aug 2025 12:33:14 +0200
From: kernel test robot <lkp@intel.com>
To: Keith Busch <kbusch@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kbusch:kbusch/nvme-virt-boundaries 13/17] block/blk-mq-dma.c:18:39:
 error: 'struct bio' has no member named 'bi_integrity'
Message-ID: <202508061200.u0crhNro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git kbusch/nvme-virt-boundaries
head:   6586a1a5cd6772594c5afbc077979c8e370ae265
commit: 20aeb67ff13e29203779874125598410a09baf56 [13/17] blk-mq-dma: add support for mapping integrity metadata
config: powerpc-adder875_defconfig (https://download.01.org/0day-ci/archive/20250806/202508061200.u0crhNro-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061200.u0crhNro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061200.u0crhNro-lkp@intel.com/

All errors (new ones prefixed by >>):

   block/blk-mq-dma.c: In function '__blk_map_iter_next':
>> block/blk-mq-dma.c:18:39: error: 'struct bio' has no member named 'bi_integrity'
      18 |                 iter->iter = iter->bio->bi_integrity->bip_iter;
         |                                       ^~
   block/blk-mq-dma.c:19:39: error: 'struct bio' has no member named 'bi_integrity'
      19 |                 iter->bvec = iter->bio->bi_integrity->bip_vec;
         |                                       ^~


vim +18 block/blk-mq-dma.c

     8	
     9	static bool __blk_map_iter_next(struct blk_map_iter *iter)
    10	{
    11		if (iter->iter.bi_size)
    12			return true;
    13		if (!iter->bio || !iter->bio->bi_next)
    14			return false;
    15	
    16		iter->bio = iter->bio->bi_next;
    17		if (iter->is_integrity) {
  > 18			iter->iter = iter->bio->bi_integrity->bip_iter;
    19			iter->bvec = iter->bio->bi_integrity->bip_vec;
    20		} else {
    21			iter->iter = iter->bio->bi_iter;
    22			iter->bvec = iter->bio->bi_io_vec;
    23		}
    24		return true;
    25	}
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
