Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004EF3CE497
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780327646; cv=none; b=PZO9BlvtpqQLPTeChctBTHZiptOkH16KBwF7U0EbwvHkYwFdjRHwXHK5vMJQlq8UFBUnzX8LGVAEqac7Drsk+kawYVlWftAxvN8Ieh1GExB/4V0AgkNeyz/+zVnmbZfbvg5Cu6zvdGrzCHk9Y9iy61rgLwnvtmXtcmQz0cr3fLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780327646; c=relaxed/simple;
	bh=Rdt+JPlT25Ju/hav4FloyDROwxRXSY30OMzn5LYJQ/8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cp1CtO5OGOCuzeBGjWObM0IvVz/pl2h77zLtCEDFVd6lO6dbyhqrytJ0a7iYO8SJ76WAuSTYJYebtN7wpwNGLA7DDic9rCZDZpltHVBhL6dRx41UfShOOJvyp0Hr+JMsUcT5YRhPfV4exsZ4CX7wQ2cwv6X8dRwQlEX08Bux1jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FSEKHjD+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSEKHjD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780327638; x=1811863638;
  h=date:from:to:cc:subject:message-id;
  bh=Rdt+JPlT25Ju/hav4FloyDROwxRXSY30OMzn5LYJQ/8=;
  b=FSEKHjD+mLm6EeBvzNzJzhJHPh+KuR3a3TPEFlF3m2D+oFrmGajVkk6+
   FTnyKc5xnRyI4Ka2eNynm1qSDsu159Rt67/3eo9FlBkNk/oyMqaFLkt8n
   HErc7dOT5wKj6gz9f1rsXZTQ9yDp8qje32Icky+BTlDtmNy4ijyS4OWmy
   z5o4SCdSHZM7TVGuWvzsx/fnJPwCLDQa43GCJXDVaDUZsBfyGuJTHxq6r
   lQCiV/17JfgjkXmCbqlXQbMv0JaLKjHMNR3jSJaupBl5W/VxelCudye58
   lxS2lmoQ0KOViI5rS5JPSjqotKN685r2MY39tbnqUPv3NFf3qwf7s/ZuD
   w==;
X-CSE-ConnectionGUID: PHLk8XbcT3SbqQV65i1nBg==
X-CSE-MsgGUID: Ksviwff6Tz+T4DK3Wd6TLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="103757329"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="103757329"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 08:27:10 -0700
X-CSE-ConnectionGUID: I3fIdk1eQnCNGHSlPx3IJg==
X-CSE-MsgGUID: OqF/ZUgcTTuvTqWXEug+2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="243728937"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Jun 2026 08:27:08 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU4Xi-00000000AiQ-0898;
	Mon, 01 Jun 2026 15:27:06 +0000
Date: Mon, 01 Jun 2026 23:26:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
 Eric Biggers <ebiggers@kernel.org>
Subject: [axboe:for-7.0/block 19/138]
 block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted
 blk_status_t
Message-ID: <202606012339.rZAl6Xq8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.0/block
head:   72f4d6fca699a1e35b39c5e5dacac2926d254135
commit: b37fbce460ad60b0c4449c1c7566cf24f3016713 [19/138] blk-crypto: optimize bio splitting in blk_crypto_fallback_encrypt_bio
config: powerpc64-randconfig-r111-20260601 (https://download.01.org/0day-ci/archive/20260601/202606012339.rZAl6Xq8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606012339.rZAl6Xq8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606012339.rZAl6Xq8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
>> block/blk-crypto-fallback.c:154:17: sparse: sparse: cast from restricted blk_status_t
   block/blk-crypto-fallback.c:154:17: sparse: sparse: cast to restricted blk_status_t

vim +154 block/blk-crypto-fallback.c

   143	
   144	static void blk_crypto_fallback_encrypt_endio(struct bio *enc_bio)
   145	{
   146		struct bio *src_bio = enc_bio->bi_private;
   147		int i;
   148	
   149		for (i = 0; i < enc_bio->bi_vcnt; i++)
   150			mempool_free(enc_bio->bi_io_vec[i].bv_page,
   151				     blk_crypto_bounce_page_pool);
   152	
   153		if (enc_bio->bi_status)
 > 154			cmpxchg(&src_bio->bi_status, 0, enc_bio->bi_status);
   155	
   156		bio_put(enc_bio);
   157		bio_endio(src_bio);
   158	}
   159	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
