Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D53D128378
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 19:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706036797; cv=none; b=RyygzHwQVFAi30AsLnuIp+rVjVhfHP6Bjtc2lZPX3ayEV0ImglKqu1w1Tbi6GgdU1CvII6rHmUtrFNo+wT8CjWhlsWP4Vr1uUbB0wJl7axAOvbENk7llzvQ12e4VuzhUH8YTNGG6c77UGHf3o56sfUWI5SJHUel+QM5W22Y+OWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706036797; c=relaxed/simple;
	bh=HFBOk57knuG9E482LtyFXQ+V7FLL0URyc6c0kSzGLxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UC+2sc0QOVkQ82RP8Z7OPNk0lAJF4POWiOU8+noKRozY4oP5kuCElqVWgb1GJdzkkFAh6XA06DoULHwdMlwNCreL8JL7Y0nV13FvNZwCejStrylKSi87Ckm6V7FUZpC0dOG1UHnCUEXb7VDRxSSTBFoPZLOQLGbQN935Hx4Ln0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT8ktji9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT8ktji9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706036796; x=1737572796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HFBOk57knuG9E482LtyFXQ+V7FLL0URyc6c0kSzGLxg=;
  b=BT8ktji9UIzkYUoxiB1SeeZfil2dYyVvZHgRhzvJjxCFEUuZZCOQX4iN
   TPWkYw2zRTAdzkjjaUVC4RKecN0qLiDF8Kn4/GT3H0SsS77Nt3za2celw
   WB0+Ye7lPJCQfBjIBaSWq2EU0N5MIkUEl+qQ8waqoXCxtVFlxWWzCppup
   UrSlhLHFXjspwmPbn9GU/01LDmgBpsvDAyxRj/xrlybL+VkpPMfNKd167
   nnCi3XNep1Wb89YossG9BbHjiLFIHHynySlk07lSk3oiGFcYp4poFRBk/
   QDl+YNOdnyJwrZI4xKAdIw7KV8kV7QxZ+6PPmNgq/tju619haDVuIr8zC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1507569"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1507569"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 11:06:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="735670335"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="735670335"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jan 2024 11:06:33 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSM6Q-0007c3-1k;
	Tue, 23 Jan 2024 19:06:30 +0000
Date: Wed, 24 Jan 2024 03:05:57 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 73/73] xfs_super.c:undefined reference to
 `xfs_zone_gc_stop'
Message-ID: <202401240343.niLLN9YA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   a636d92a908d42463557fd856bc52ddf62c5693c
commit: a636d92a908d42463557fd856bc52ddf62c5693c [73/73] xfs: add proactive gc and write throtteling
config: loongarch-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240124/202401240343.niLLN9YA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401240343.niLLN9YA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401240343.niLLN9YA-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/xfs_mount.o: in function `xfs_unmountfs':
   xfs_mount.c:(.text+0xd7c): undefined reference to `xfs_zone_gc_stop'
   loongarch64-linux-ld: fs/xfs/xfs_mount.o: in function `.L267':
   xfs_mount.c:(.text+0x161c): undefined reference to `xfs_zone_gc_start'
   loongarch64-linux-ld: fs/xfs/xfs_super.o: in function `.L805':
>> xfs_super.c:(.text+0x2bcc): undefined reference to `xfs_zone_gc_stop'
   loongarch64-linux-ld: fs/xfs/xfs_super.o: in function `.L803':
   xfs_super.c:(.text+0x2c9c): undefined reference to `xfs_zone_gc_start'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
