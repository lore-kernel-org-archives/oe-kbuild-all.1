Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA425776
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 01:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543295; cv=none; b=gUkLwmOXt7QKryhZCTiPKUkIukdJWKvyIMkTn7AD54t7K6QnuCRXzFr0+gTsyKl2zyVRoNBATD90EMfaDFw0Lnqmy6mLmU341yTpHzMCs2kQNC9jvxXxZ1OgT3kory/iLevBv9kUhtT/GIhdA0NUI8thYLQhxemLewPBwsTHlFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543295; c=relaxed/simple;
	bh=4XSMMS1eeGyHBNaLG51HnrHRA0t4j+iZDkR9GNMbR+c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aFkaYPoH3tDzu9Yb7GqjtlLk8CSXWTNQm9sjyYYqCzUb/DQTESIqNT7sRdnvQjUDSWfO+4J7Txc+1ODEM8M2h1DbsLkeGwQSFqHZWJnyiva8TqNhIcbKZhs0q+ie/LrPPgVXakssC1bT2cof0soUbOKrZgJnEcK4UFq/u6jRv2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5J8pnck; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5J8pnck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745543294; x=1777079294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4XSMMS1eeGyHBNaLG51HnrHRA0t4j+iZDkR9GNMbR+c=;
  b=j5J8pnckplFZPp9XSggx0rKsEBA5YAcqRkPv3+RAHJbB2J+g0SL+CSOe
   1HerT0QKUEePBohDgULPFhBawByBkUFLfccy0FlqO2fUubwI6Dgs0zyOH
   sa+OfhOAsPIL0xGQlVu8klbNJe3TPncfPfTsSr4texVjT4BCiqsdQTONp
   wlHyQLgNwv4eKeuwfg0y9yKmsfqiSSzYqkhQd8VoHvaL/Qk51E3Gu/Kxo
   kDIcVH+myj3HtN9aAmoVNOo2PqwALV7zZ8s16JnbDV7qgp07FSDz2255/
   n+hRwZ6L8WY6ryQOmqBiU0hv9u4/zb44s2CUQhRLknOW3vRyMMEem8LNV
   A==;
X-CSE-ConnectionGUID: lupTdNTbR0imraUpeBhuOg==
X-CSE-MsgGUID: WLwz1aiQSGi3dPeMViHshQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="69690926"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="69690926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 18:08:13 -0700
X-CSE-ConnectionGUID: RKdB4gkwR2ap8aZ/3ly6oQ==
X-CSE-MsgGUID: XP21sQzWTzK8c05mtKmSrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="132689801"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Apr 2025 18:08:12 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u87Y1-0004hZ-2n;
	Fri, 25 Apr 2025 01:08:09 +0000
Date: Fri, 25 Apr 2025 09:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2167/2167] block/blk-io-hierarchy/iodump.c:561:7:
 warning: no previous prototype for '__bio_stage_hierarchy_start'
Message-ID: <202504250828.wJjuSU89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6f8a0f52903845ede4602b637dd1323aef3592
commit: 67e0c6872f92397d82e9a938623105573f590fc3 [2167/2167] blk-io-hierarchy: support hierarchy stats for bio lifetime
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250425/202504250828.wJjuSU89-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250828.wJjuSU89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250828.wJjuSU89-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> block/blk-io-hierarchy/iodump.c:561:7: warning: no previous prototype for '__bio_stage_hierarchy_start' [-Wmissing-prototypes]
     561 | void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
         |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/__bio_stage_hierarchy_start +561 block/blk-io-hierarchy/iodump.c

1bf8f90fb90c60 Yu Kuai 2024-11-27  560  
1bf8f90fb90c60 Yu Kuai 2024-11-27 @561  void *__bio_stage_hierarchy_start(struct bio_stage_dump_data *bstage_ddata,
1bf8f90fb90c60 Yu Kuai 2024-11-27  562  				 loff_t *pos)
1bf8f90fb90c60 Yu Kuai 2024-11-27  563  {
1bf8f90fb90c60 Yu Kuai 2024-11-27  564  	struct pos_data *pdata = &bstage_ddata->pdata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  565  	struct rq_dump_data *rq_ddata = &bstage_ddata->rq_ddata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  566  
1bf8f90fb90c60 Yu Kuai 2024-11-27  567  retry:
1bf8f90fb90c60 Yu Kuai 2024-11-27  568  	if (stage_is_bio(pdata->stage)) {
1bf8f90fb90c60 Yu Kuai 2024-11-27  569  		struct list_head *list;
1bf8f90fb90c60 Yu Kuai 2024-11-27  570  		struct bio_dump_data *bio_ddata =
1bf8f90fb90c60 Yu Kuai 2024-11-27  571  			get_bio_stage_ddata(rq_ddata->q, pdata->stage);
1bf8f90fb90c60 Yu Kuai 2024-11-27  572  
1bf8f90fb90c60 Yu Kuai 2024-11-27  573  		if (!bio_ddata) {
1bf8f90fb90c60 Yu Kuai 2024-11-27  574  			bio_stage_start_next_stage(bstage_ddata, pos);
1bf8f90fb90c60 Yu Kuai 2024-11-27  575  			goto retry;
1bf8f90fb90c60 Yu Kuai 2024-11-27  576  		}
1bf8f90fb90c60 Yu Kuai 2024-11-27  577  
1bf8f90fb90c60 Yu Kuai 2024-11-27  578  		spin_lock_irq(&bio_ddata->lock);
1bf8f90fb90c60 Yu Kuai 2024-11-27  579  		list = seq_list_start(&bio_ddata->head, pdata->count);
1bf8f90fb90c60 Yu Kuai 2024-11-27  580  		if (list)
1bf8f90fb90c60 Yu Kuai 2024-11-27  581  			return list;
1bf8f90fb90c60 Yu Kuai 2024-11-27  582  
1bf8f90fb90c60 Yu Kuai 2024-11-27  583  		spin_unlock_irq(&bio_ddata->lock);
1bf8f90fb90c60 Yu Kuai 2024-11-27  584  		bio_stage_start_next_stage(bstage_ddata, pos);
1bf8f90fb90c60 Yu Kuai 2024-11-27  585  		goto retry;
1bf8f90fb90c60 Yu Kuai 2024-11-27  586  	}
1bf8f90fb90c60 Yu Kuai 2024-11-27  587  
1bf8f90fb90c60 Yu Kuai 2024-11-27  588  	if (pdata->stage == STAGE_BIO &&
1bf8f90fb90c60 Yu Kuai 2024-11-27  589  	    __rq_hierarchy_start(rq_ddata, pdata->count))
1bf8f90fb90c60 Yu Kuai 2024-11-27  590  		return bstage_ddata;
1bf8f90fb90c60 Yu Kuai 2024-11-27  591  
1bf8f90fb90c60 Yu Kuai 2024-11-27  592  	return NULL;
1bf8f90fb90c60 Yu Kuai 2024-11-27  593  }
1bf8f90fb90c60 Yu Kuai 2024-11-27  594  

:::::: The code at line 561 was first introduced by commit
:::::: 1bf8f90fb90c600d9f372e6be4ef251cc8905f04 block-io-hierarchy: core hierarchy stats and iodump implementation

:::::: TO: Yu Kuai <yukuai3@huawei.com>
:::::: CC: Yu Kuai <yukuai3@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
