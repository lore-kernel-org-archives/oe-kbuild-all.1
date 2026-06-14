Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD36B3033D6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781470374; cv=none; b=MCHaugXsELWfXU5Q8OIJ0y2cqbHiZSL1oI81qvyGrV4Oq1Ze+pJgr2x4m8Cndmwm27JgmprXS+8MTC4PR3pBSmLUFE26tVX3GBCaHxJBrdXFAuck0oQ+GaV8l4Nj01MDKq8RQU5JtpktYbECBr45SELWcNyzvGhpfujDVItXoMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781470374; c=relaxed/simple;
	bh=yWMSTBbTEembVBmhxA/I4gim82y07nbo90uKplhTA+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ob22yWaz8XKtnXjG0mhTL4k0kru0FLiNyEwlgx0cLdXIfbFSR3ef03waKgqEA40qyPzV6p8QL3YJWNjXxWX1PT00+rWN1nbA3/elnkvuoBf0Zun2ilzrT7qmak8aL1/yxrMGKRaQ8pyKPxmX6JJOHvGUEXxd4dVRRbLHqEgtd4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxgVpSr8; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxgVpSr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781470373; x=1813006373;
  h=date:from:to:cc:subject:message-id;
  bh=yWMSTBbTEembVBmhxA/I4gim82y07nbo90uKplhTA+U=;
  b=lxgVpSr8cUnXtQw0hYdhpsLIX8Dqp+92sGH5HWzICqCith4Y0QY8yDfy
   7jEdYhEVSaa1BdZgLV1uFck/iKPd5TIVGtcVVmJ/6Pe8ob7kvNFyXXnz/
   7bO8PlaVfQC9BbndfE3O7crEoeaYK4xY2QANz+cACsvscv3We0LU/bn7B
   Dqupx+61VIMq/gD9fXA2SAdc6U9eDPl4Vfv/qYeJAi5VB0S83PKYpMoum
   hvcxMnSatwZjW6skLH51a9YtOCEQNO9Db381XNSVT9qJizB17QQXxjO99
   kclE5HFQqb39RKHn6X8j0/pYYbwPKLfn73XSQl9GONNMBWhOEYDEHcd6i
   w==;
X-CSE-ConnectionGUID: htUyZA7OTsuQ99qCkNiK/A==
X-CSE-MsgGUID: Sso7XRZrTLSx7MhI0lgUqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82279557"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="82279557"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 13:52:53 -0700
X-CSE-ConnectionGUID: Y6DtRx1oQyqjupfNcLLtJQ==
X-CSE-MsgGUID: nRsXe2nYSe6AN+xK9TnTig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="277499037"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2026 13:52:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYrp2-00000000RCO-0nYf;
	Sun, 14 Jun 2026 20:52:48 +0000
Date: Mon, 15 Jun 2026 04:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>
Subject: fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted
 blk_status_t
Message-ID: <202606150438.l4FitJCH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
date:   5 months ago
config: nios2-randconfig-r132-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150438.l4FitJCH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150438.l4FitJCH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bc26e2efa2c5 ("fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150438.l4FitJCH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted blk_status_t

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
