Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80702225AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 20:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710360006; cv=none; b=SFT1TOxwI4Dps++CV37Rc/9bRN0/Kb2EvkOJXGqLcLoLWDK7DVn+5Czs9p9BHs7n9IgLdlaf906wzzeKe5MtNCT1ioYn7z+abIlAlbWDfWXe5YRK9lezN4E6/laBqxXYFKWDSKL7vXOepX0ja1W2pOnnPCoJrZD/iAffEHnIrEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710360006; c=relaxed/simple;
	bh=qfRDjv2foBdfkKJwllVqS7FMT5G5mB4FxrFHqgmQLKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FbRfC5xeI9UZolU88zO9pmThFnFOsk3LL8ymmJV/9gvf0AyPZaTE/JugVt18U6zOP9NmAbnAoD5Ueumbm/u/yRmTddAawcmoABD5t4HtWlPydj7nTx+7uuB0WrOQuUAmC1gScgaMg/ofHKCKUN4vS6XPEyp7yoB2HAJy6NdH9wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bh14NqGG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bh14NqGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710360005; x=1741896005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfRDjv2foBdfkKJwllVqS7FMT5G5mB4FxrFHqgmQLKU=;
  b=Bh14NqGGMN0s1ZU7eSAA00CsbDV09vc08KkUMo1mP987oqJ9c0SfCxQV
   VQ/Opf8DqFDgDJFdwu/nbNFoVFr+7ERzXG/d/KwdvVKQSOBenC3o3dQNa
   jMMmFafuvafsl8P/gbwHpq3oIFkmIIXiCc7BGldq7j6XWK8rHnRmpx14X
   EYnTVb0NehJM0KXAYn+KVIVohfs7ddxu1imw1UALsDuNgJAsiyFS35VN4
   Yf95H/kk1zZJfp2v2fqNxznUR25yEeMQIFKYtP0WdJ9YGAeskBHeyarxI
   FUrIAs1C5OTxe5Bv9h01WtyQz828b6EOY8alhYpmfR53uW2ytAvl38cD1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="4998696"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="4998696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 13:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="12624344"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Mar 2024 13:00:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkUlc-000Cit-0O;
	Wed, 13 Mar 2024 20:00:00 +0000
Date: Thu, 14 Mar 2024 03:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 11013/30000] drivers/ide/ide-io.c:456:58:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202403140313.Qwz6h2Lt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   caa1ae20bcc64a80625a9449240580f5190ed3a0
commit: 8a6bee347626968d467aef07453c4547bc23cb64 [11013/30000] blk-mq: fix potential uaf for 'queue_hw_ctx'
config: x86_64-randconfig-122-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140313.Qwz6h2Lt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140313.Qwz6h2Lt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140313.Qwz6h2Lt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ide/ide-io.c:456:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct blk_mq_hw_ctx *hctx @@     got struct blk_mq_hw_ctx [noderef] __rcu * @@
   drivers/ide/ide-io.c:456:58: sparse:     expected struct blk_mq_hw_ctx *hctx
   drivers/ide/ide-io.c:456:58: sparse:     got struct blk_mq_hw_ctx [noderef] __rcu *

vim +456 drivers/ide/ide-io.c

5b31f855f10d00 Bartlomiej Zolnierkiewicz 2009-01-06  446  
782b86e2656762 Jens Axboe                2011-04-05  447  void ide_requeue_and_plug(ide_drive_t *drive, struct request *rq)
782b86e2656762 Jens Axboe                2011-04-05  448  {
782b86e2656762 Jens Axboe                2011-04-05  449  	struct request_queue *q = drive->queue;
782b86e2656762 Jens Axboe                2011-04-05  450  
600335205b8d16 Jens Axboe                2018-10-26  451  	/* Use 3ms as that was the old plug delay */
600335205b8d16 Jens Axboe                2018-10-26  452  	if (rq) {
600335205b8d16 Jens Axboe                2018-10-26  453  		blk_mq_requeue_request(rq, false);
600335205b8d16 Jens Axboe                2018-10-26  454  		blk_mq_delay_kick_requeue_list(q, 3);
600335205b8d16 Jens Axboe                2018-10-26  455  	} else
600335205b8d16 Jens Axboe                2018-10-26 @456  		blk_mq_delay_run_hw_queue(q->queue_hw_ctx[0], 3);
782b86e2656762 Jens Axboe                2011-04-05  457  }
782b86e2656762 Jens Axboe                2011-04-05  458  

:::::: The code at line 456 was first introduced by commit
:::::: 600335205b8d162891b5ef2e32343f5b8020efd8 ide: convert to blk-mq

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
