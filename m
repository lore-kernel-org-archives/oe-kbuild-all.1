Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712BC33F5AF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782149189; cv=none; b=PqkoK5Dejdzt3Q7oyNbD3AiYs9l2QioBQuHtBB1ysqSiAHVG4Rl8T5tcnfldu77zzRfQCK4ddknNgQSOlAN/HBAivAPQeCtd57bMBxqQGDyZ+Q5mSxj4+fIcWDoULWVzcV4EW/ouJvdyKBdAUuj8PufkRBos6Rav+A01ZuxdB7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782149189; c=relaxed/simple;
	bh=dB5bErPdIrKqYsXxY8CZUiGJWJJ69kDcxdvS/0uiKn4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BK5fMVQNqCzaNjqpXsByT+9ymFEqj18XvZREyqm5u3yfkj9pPN2KxLina6ox8hH9nvA5vMh9tl63qojkxCupQz+U9UfoxEVmrW08NWkhYpON+uTUQxGWX/x7c9Gf/cbTzjE9Jfm3KAuTyL8hfF1xAAFYWo3il7PTqRWYlmMhXvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuBrGp6z; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuBrGp6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782149188; x=1813685188;
  h=date:from:to:cc:subject:message-id;
  bh=dB5bErPdIrKqYsXxY8CZUiGJWJJ69kDcxdvS/0uiKn4=;
  b=AuBrGp6zDUjIp6Dtrp+RK97AgOT+FgqTvG0/H+vp7jw6pq7kXsFenOGw
   4mf6aeZqro1EmDCRLbcezM54wWNpAhFW+eds1mufENtGbWI+plAEyEge/
   iTrzAXr4ugxdnmPohbfMH6P4mFid6KyIEQzwqfVxuR90WCWI+MG7Z5OwD
   AcnnG+4+RVo1uPVCzNx/rEI3kKOAiUa79YhcHPo1OawwINp5v1IoDD5Mt
   JH4OhWu13zHkKtIBEl9jJ8LRjEtKZLZ6agwycpZ1i+OCZi7v7tNVABYBH
   Ycvu9gdN25ZDvyaZLt6AB84th27azZpsMTjLSmCmHC8giga4oAmZ4UlSE
   Q==;
X-CSE-ConnectionGUID: DZ1EzqknSl6V6E27JPoJ0Q==
X-CSE-MsgGUID: H8FgjYJbQt2knbPY+w1sXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94384595"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="94384595"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 10:26:28 -0700
X-CSE-ConnectionGUID: jXD7dT0KQgq/6Gxi4Fc0Gg==
X-CSE-MsgGUID: vFkbHkgxQzSW+I6HgbxWkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="287409589"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 Jun 2026 10:26:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbiPf-000000001dA-25wF;
	Mon, 22 Jun 2026 17:26:23 +0000
Date: Tue, 23 Jun 2026 01:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>
Subject: fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted
 blk_status_t
Message-ID: <202606230102.bgOhUw2D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ef0c9f75a19532d7675384708fc8621e10850104
commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
date:   5 months ago
config: arm-randconfig-r121-20260622 (https://download.01.org/0day-ci/archive/20260623/202606230102.bgOhUw2D-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230102.bgOhUw2D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc26e2efa2c5 ("fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230102.bgOhUw2D-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
   fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
   fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t

vim +67 fs/crypto/bio.c

    61	
    62	static void fscrypt_zeroout_range_end_io(struct bio *bio)
    63	{
    64		struct fscrypt_zero_done *done = bio->bi_private;
    65	
    66		if (bio->bi_status)
  > 67			cmpxchg(&done->status, 0, bio->bi_status);
    68		fscrypt_zeroout_range_done(done);
    69		bio_put(bio);
    70	}
    71	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
