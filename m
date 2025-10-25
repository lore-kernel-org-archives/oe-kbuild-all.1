Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDBF21A421
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 06:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761372093; cv=none; b=cbwfQelZ7Rr+oAoyXxVka8afkJWxwJqVV/FbD4Rd4ToK0xRo6WHlSrrY1qVrxlGeAJmMd+h2T7Ay1Uco4lj9m0frecEbzMz0Ty4PXNTiw+n8gCKwbSvLTHZeGjDuryDYbZhUsqaRAcr4lMaT+xGm9ocYJzQIUhLOtUIwxNzeo5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761372093; c=relaxed/simple;
	bh=P/7//dg99LOZgqThStlbpAY1rbGl1KUD23+ZqFD1WDU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ka9ZKmkQ7HBUkSfWsYMDdsvh1751mqUeWttrQeMisfkegkjG3zpyDYrQluFmilG99we4puIP/SZcu1csDrZ9nMVrhQvF7dSm32SCar3YFzb2hSOjdc/n1R6FP3cERMuyou+mv9kGRXkPTEHa04zX/aX/I5NXR/p1CSci7TRhf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nHCX1th/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nHCX1th/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761372091; x=1792908091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/7//dg99LOZgqThStlbpAY1rbGl1KUD23+ZqFD1WDU=;
  b=nHCX1th/Eczd3m1nGUygJwOe6YnOJeCLIr2TbKuScw4JnB9aqZUIMScR
   f9aqdbY1bglOb1MrfMCiQmH9QyKZx4vzJDjneB4qW/S5h0rKh7pn52CSd
   S7VUUgrPj29H8ywVUE+nDw6wEdbDxm/9Avil7EjubFKGOxgbmHG8Pm7lf
   ktww+lkoYYiXcc98EMnuIYjZVVRrmwTOI6vEc/WGgbcPoSylGwV5UqAq+
   PQ2CYeZnkgI+lLa2l8KefioR3al7ZNhLUg9lnx4q8TJZmDqGz50nPggWi
   dW13E046N7F2A/V/4x3nCsgvnqkOhcCu0xu+5gWJWC5Jhg/CEWP0xn18O
   A==;
X-CSE-ConnectionGUID: VgSazjBASVa9PjAwxkYydA==
X-CSE-MsgGUID: W709xKcXRqmd92H7Xcnm9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67188488"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="67188488"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 23:01:30 -0700
X-CSE-ConnectionGUID: DM/6F1tCR6KGpyOetv6XXw==
X-CSE-MsgGUID: 0/Pz8d5cR0KkmA321vy4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="184497107"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Oct 2025 23:01:29 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCXLD-000F8P-0W;
	Sat, 25 Oct 2025 06:01:27 +0000
Date: Sat, 25 Oct 2025 14:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:fscrypt-experiments 16/18] fs/crypto/bio.c:67:17: sparse:
 sparse: cast from restricted blk_status_t
Message-ID: <202510251352.llsx8wlU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git fscrypt-experiments
head:   63e6e582c47faea828c145626b6de5e49d6de506
commit: 685d169318db83002e50fd9713d662ec1a3c96ab [16/18] fscrypt: keep multiple bios in flight in fscrypt_zeroout_range_inline_crypt
config: alpha-randconfig-r113-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251352.llsx8wlU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251352.llsx8wlU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510251352.llsx8wlU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
>> fs/crypto/bio.c:67:17: sparse: sparse: cast from restricted blk_status_t
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
