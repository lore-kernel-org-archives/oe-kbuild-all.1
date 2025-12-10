Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA643240604
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765381826; cv=none; b=ojZ5SKKAhI9rBXgP2QigpJww89qn6n6u3BmZc4ts55Yz32y0MZY53etyTENU8GRhrhWUmJRv5iRKE3zqiirxcuK1qOXFmZI5xVIroAATxfVnwQO+IEZ8OOBJzVnvxnV6e7PRQQsVWUL2rmkTu2lOgXgA+LUg8+p7yMis6igoJoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765381826; c=relaxed/simple;
	bh=4KdyEL4K8rl6rE97KJGiPVAZdQXBjXZkqxKQRr5P8qw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzuiTgMizdw85XHWW3gWVCTtijxt137PBVUEj46RnABK3E/OgPlIHwdGO8DcK9GJoCKZVPTc735hEZjLkOcmzWO2oFTybYTkUitP05pKHzDbHL5t6VaJVXAtkryfoZJzI6UFx0uII79kCndfA0S4oVCpwqz7Jzu3K077TDEP7C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iTLOeuNZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iTLOeuNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765381825; x=1796917825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4KdyEL4K8rl6rE97KJGiPVAZdQXBjXZkqxKQRr5P8qw=;
  b=iTLOeuNZ9TwRoPayMMlL5Yivzw/pIh6RjHJCc1dBk7ORzCaPvrEH2kVD
   LeAUGF47FBg2U+vl8eaUax1vXi4DiTiCp4rU84ArxnzqRN0Zc2IFs5V8a
   4vqZPWDQTKRUjj0tMZI/rZNB15aLzSjDxCGikvuihm1ccnX376UrOCzEa
   1fyESZW6zoKkjjMXoFREayPrJN5lCQeWudtqA0h21fz7RvKXn/Wi3APes
   gQST/v7p/TTaaiqeuijLI266q9X+ER4r01iwP9LapmjPVwcf1Aq+1H7tA
   YZIupMhabia1DTKqHieYIJ2ITnJmzxg8wBNz3/Bri8XXr8g8qaAAq8miS
   A==;
X-CSE-ConnectionGUID: OWfP/YbPTRC+iTWrdty3Ng==
X-CSE-MsgGUID: 99Ig4x5RQM+KnV8wFtGsUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67292945"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67292945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 07:50:24 -0800
X-CSE-ConnectionGUID: w9gmZ0bcTC2vzEeV4W+liA==
X-CSE-MsgGUID: 9wr50esITFiCmuxcvXV13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201656482"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Dec 2025 07:50:24 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTMSL-000000003Kd-2Rkb;
	Wed, 10 Dec 2025 15:50:21 +0000
Date: Wed, 10 Dec 2025 23:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] fs/btrfs/bio.c:139:17:
 sparse: sparse: cast to restricted blk_status_t
Message-ID: <202512102343.wgtcqDkB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   cc7f65cd38b29f29c6af5e49bcd7037d10de13e9
commit: d48e1dea3931de64c26717adc2b89743c7ab6594 [1/1] btrfs: fix error propagation of split bios
config: arm-randconfig-r122-20251210 (https://download.01.org/0day-ci/archive/20251210/202512102343.wgtcqDkB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102343.wgtcqDkB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102343.wgtcqDkB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/bio.c:139:17: sparse: sparse: cast from restricted blk_status_t
>> fs/btrfs/bio.c:139:17: sparse: sparse: cast to restricted blk_status_t
   fs/btrfs/bio.c:139:17: sparse: sparse: cast from restricted blk_status_t
>> fs/btrfs/bio.c:139:17: sparse: sparse: cast to restricted blk_status_t

vim +139 fs/btrfs/bio.c

   123	
   124	void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
   125	{
   126		bbio->bio.bi_status = status;
   127		if (bbio->bio.bi_pool == &btrfs_clone_bioset) {
   128			struct btrfs_bio *orig_bbio = bbio->private;
   129	
   130			btrfs_cleanup_bio(bbio);
   131			bbio = orig_bbio;
   132		}
   133	
   134		/*
   135		 * At this point, bbio always points to the original btrfs_bio. Save
   136		 * the first error in it.
   137		 */
   138		if (status != BLK_STS_OK)
 > 139			cmpxchg(&bbio->status, BLK_STS_OK, status);
   140	
   141		if (atomic_dec_and_test(&bbio->pending_ios)) {
   142			/* Load split bio's error which might be set above. */
   143			if (status == BLK_STS_OK)
   144				bbio->bio.bi_status = READ_ONCE(bbio->status);
   145			__btrfs_bio_end_io(bbio);
   146		}
   147	}
   148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
