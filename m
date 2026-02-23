Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4768F81AA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Feb 2026 01:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771809837; cv=none; b=uEySvVv83EwLosRdMtXIAJ//+9FOlHl5Pfjp4cdQsRQ6hugE/5mmNrFBDDcJVHviuW0QIaEGNw7v5ZNZbs3s/PpNoFzwKzUW98F6T7nc8rRMmYt9qN8vYkaL/vU3NI0SGEXhynihYaFA6NZxnTRKlG6GbyBZooYwlsHmqQz+ciQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771809837; c=relaxed/simple;
	bh=EgJURIhKNndGrfoIol+JLsqI3/4F+vm1j8huA3pcpLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EGTYRetl6LsGsw6osbw4LJPNSyacLGByY+x0fHMypLMYlcrwpZItbMe9aELGcnw4Z0250rc+ZvgR79CI8h8P7AopD2dsOnCLLuLSJfWyHj1WPpA3IG1eiJmVHamzhhdHdyEkAMYY06TeKg6VsR5o6JlVfaVMSFQJQeey1f08l+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W5mqAZ5m; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W5mqAZ5m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771809834; x=1803345834;
  h=date:from:to:cc:subject:message-id;
  bh=EgJURIhKNndGrfoIol+JLsqI3/4F+vm1j8huA3pcpLQ=;
  b=W5mqAZ5muqV189dm4ephzl5xFFy6O8/LqmOL/YOVPAP/93eccTy5HfMF
   byf9byUwxX7YXEZHQ3ZWuQfDlmXbJbdT+SBEDeQSFdcZ/fGRtyy+dKdJ+
   AEYhh4nbGKzqJLZQmOIOB17NiT4k61KicA4CkzLLtEA9UEwDqafMktu7R
   oUPHyworEzTG/yIuUgZUIjtWQYXL9i7/tjVegcK4cRGkOtStJBMCaLM4s
   VaVQLxADjYxLZnuzsmM/fivoJDBtLiICnkDvDgbKgZAK2wPvfOSvpAs3A
   JCHW85R9gPW5HihF+CEaVqu5+TB9Ym0VTjx96Vjx9tHhqGW07D7+JA7n/
   Q==;
X-CSE-ConnectionGUID: +NKD01ZPSjmYnR/pb/20SA==
X-CSE-MsgGUID: De35FcXGRTKsteli6b7oMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72981315"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72981315"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 17:23:54 -0800
X-CSE-ConnectionGUID: /epcqCYSRZWx8IsNRwvh7A==
X-CSE-MsgGUID: SZIOylvHTHGJ/OoQLpBkoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="219532766"
Received: from lkp-server01.sh.intel.com (HELO c63097897875) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Feb 2026 17:23:52 -0800
Received: from kbuild by c63097897875 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuKft-000000000Ev-3WIb;
	Mon, 23 Feb 2026 01:23:49 +0000
Date: Mon, 23 Feb 2026 09:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@kernel.org>
Subject: fs/crypto/bio.c:67:17: sparse: sparse: cast to restricted
 blk_status_t
Message-ID: <202602230947.uNRsPyBn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
commit: bc26e2efa2c5bb9289fa894834446840dea0bc31 fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
date:   6 weeks ago
config: arm64-randconfig-r134-20260223 (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project d8f778935a5bf8a173a3c1d886fd736a4ef6cf05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260223/202602230947.uNRsPyBn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602230947.uNRsPyBn-lkp@intel.com/

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
