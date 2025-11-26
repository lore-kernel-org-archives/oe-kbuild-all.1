Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9FD21B9F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Nov 2025 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764199651; cv=none; b=NAG0pbgZ24c5CN71c42EsjaY5OA4SA70pIuy3WMVFa4E/6q872DRhWaopI1546tKZTQl4Nd3dkWVgKKf6zROx+kBdIEMUK7saqRApix9f5R3AeqIM8k1eO3N6XDJMw3T02bg7WUVVdeUHOk8tQ0DXPQa56yzV+89jGMTdkxDlAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764199651; c=relaxed/simple;
	bh=f01hH3EropTNzKkSh9+q8C6M7r2B38mD5ddml2JGaaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMyZ5zWeVbAys1+CKDMVu0mf7+Di4o6ZQYRuIwoGCCcTqC97D6KYEKs7hNe8tk2YelNeTdUqscowojqePvG1ee0B3vSNqGFW8Vs0Dz3jcN04VvCjOmkwrJEAUUBgyurcryBxO4Cz3p5DYeCvMhEU5E50F6CTQvg3IYzIsSWSgiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QsXrv03l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QsXrv03l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764199650; x=1795735650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f01hH3EropTNzKkSh9+q8C6M7r2B38mD5ddml2JGaaE=;
  b=QsXrv03lnX9lKxt2ZmLBULs7rVkJjeegQc3w5FvIoTMQ49KGG4uvtlOK
   V8a6Mu5AQwfw2BN7iHkmOimJAuG4uQURf61LvIfMhfnfppemy9E56HIJR
   QBY195q1EI/u6q01RbXYOWnhhzvPSGbl6qYauehNkoy0vJp5zyB+lUGwo
   +bi+qJZ0vP5VqwmS/kQZtvERQSAXgp3tgY0MzjyzRoxeLQGLoS2O5433j
   +pAuNJzzAf116wFnkhaNpf6/xLDr3o5jCYkbh/aSnkc6GYcqd1RNplsoD
   0rDN9wWCr+Css5+NqDY/2MzsuHz3A4LGDDTwLrMzL5y2kxrHOYs1mYLUw
   w==;
X-CSE-ConnectionGUID: tfGTyxJ4RtmZQy+ZiJNOCw==
X-CSE-MsgGUID: mxlwjjQGSuKRtKux7u1KFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="88890285"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="88890285"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:27:29 -0800
X-CSE-ConnectionGUID: SfZuUXv7SD+r++8P9p/9MQ==
X-CSE-MsgGUID: QjImc8yTRUOvMO2CR2b+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192979875"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 15:27:28 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOuz-000000003Sr-3tiT;
	Wed, 26 Nov 2025 23:27:25 +0000
Date: Thu, 27 Nov 2025 07:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 05/11] block: add infra to handle dmabuf tokens
Message-ID: <202511270709.eD9unauR-lkp@intel.com>
References: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence@gmail.com>

Hi Pavel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on akpm-mm/mm-nonmm-unstable linus/master v6.18-rc7 next-20251126]
[cannot apply to linux-nvme/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Begunkov/file-add-callback-for-pre-mapping-dmabuf/20251124-065343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/51cddd97b31d80ec8842a88b9f3c9881419e8a7b.1763725387.git.asml.silence%40gmail.com
patch subject: [RFC v2 05/11] block: add infra to handle dmabuf tokens
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20251127/202511270709.eD9unauR-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270709.eD9unauR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511270709.eD9unauR-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: block/bdev.o: in function `blkdev_dma_map':
   block/bdev.c:76:(.text+0x1708): undefined reference to `blk_mq_dma_map'
   microblaze-linux-ld: block/blk-mq.o: in function `blk_mq_submit_bio':
>> block/blk-rq-qos.h:117:(.text+0x8210): undefined reference to `blk_rq_assign_dma_map'


vim +117 block/blk-rq-qos.h

e504545446e4be Jens Axboe   2018-11-15  112  
e504545446e4be Jens Axboe   2018-11-15  113  static inline void rq_qos_cleanup(struct request_queue *q, struct bio *bio)
e504545446e4be Jens Axboe   2018-11-15  114  {
370ac285f23aec Nilay Shroff 2025-08-14  115  	if (unlikely(test_bit(QUEUE_FLAG_QOS_ENABLED, &q->queue_flags)) &&
370ac285f23aec Nilay Shroff 2025-08-14  116  			q->rq_qos)
e504545446e4be Jens Axboe   2018-11-15 @117  		__rq_qos_cleanup(q->rq_qos, bio);
e504545446e4be Jens Axboe   2018-11-15  118  }
e504545446e4be Jens Axboe   2018-11-15  119  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
