Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2D309EFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 13:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765634391; cv=none; b=SxQxikl9a4P9/wJUw7ALsl7lR/wsWzAT1YjVp/S5/ZroK6Zp1lmz+8qWes/8ZZT+iCEFyqmgP33D3ZahMkEGN2N+FUXpVgglG4S9BDRXyNBBX2x1l5nMgUS6SFlow1CAlm/VeyfetT56ahgrQjpT9HjMEgyuWHGRlNK1vvmLs6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765634391; c=relaxed/simple;
	bh=Jgp4iE0AE0rdRpshV6AgOO1YpgfVjs/MitT2kMmBc1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B250ddYoT+x8wCcri+rVmxgc+yARDbGW71IcKZlPvGNJap+yOv++Lb+AOX6aK40zupkUPz9l0s1Ly0NvPrNBkCElUfeAjKgRlTKtOWj5XP/d9hR8FP7y+XsST7rlqgKrBjMA7X5xZoJHLVlxmrxB9zcdGgipRAFmpYG4aWs+ASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1UpxVU/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1UpxVU/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765634390; x=1797170390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jgp4iE0AE0rdRpshV6AgOO1YpgfVjs/MitT2kMmBc1M=;
  b=Q1UpxVU/iMRObZpRa/b+E4XmSaGzS0X4zh7ZpQe2EmfzAdvYWB3nTjzK
   eeW62R3og6f2+15hfjxtiBRjb2c3RwIwpe27jm21WrwOFZr91SUy/74g1
   sdWQn4bK/QW5xOZWPyt8oxOW7ykpPy9Mmv1B/5TDbJ76MvEu/L5jhIXJB
   3sfunEQJgnXf/zarU7449yytpxjsFAE9PRyF0uz1+lO8qe4lRT7NOLKQ7
   IMUo/CuVDXvZ2s0Z6N8SgonKQPR9pSMJF9L6l4rT+9RUUdmEFYduevE1L
   Ru9CYmYal8uWxXEEfTtNEZcRvy9TvO+Yxva2FESbf65o22oMkL1QB/WCN
   A==;
X-CSE-ConnectionGUID: 4di+73aYSWyyxOjMGCwYWg==
X-CSE-MsgGUID: V+SHwMF/SSOLyl87JD6cpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67651330"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="67651330"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 05:59:48 -0800
X-CSE-ConnectionGUID: 86yQsE6vQbmcBHT1IGNbFA==
X-CSE-MsgGUID: FDJTU77cQou0pAAwGYLo0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="196600135"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 05:59:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUQ9w-000000007iJ-1FEo;
	Sat, 13 Dec 2025 13:59:44 +0000
Date: Sat, 13 Dec 2025 21:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Sandeen <sandeen@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: drivers/base/devtmpfs.c:88:30: sparse: sparse: symbol
 'devtmpfs_context_ops' was not declared. Should it be static?
Message-ID: <202512132105.4fc2SILk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d9c1cfec01cdbf24bd9322ed555713a20422115
commit: cb0e0a8bf4e1e1c8cd6d11ccaa355a23e1853566 devtmpfs: replace ->mount with ->get_tree in public instance
date:   10 months ago
config: powerpc-randconfig-r131-20251213 (https://download.01.org/0day-ci/archive/20251213/202512132105.4fc2SILk-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512132105.4fc2SILk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512132105.4fc2SILk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/devtmpfs.c:88:30: sparse: sparse: symbol 'devtmpfs_context_ops' was not declared. Should it be static?

vim +/devtmpfs_context_ops +88 drivers/base/devtmpfs.c

    86	
    87	/* Ops are filled in during init depending on underlying shmem or ramfs type */
  > 88	struct fs_context_operations devtmpfs_context_ops = {};
    89	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
