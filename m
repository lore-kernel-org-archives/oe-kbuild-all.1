Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C413288D7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 17:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709918520; cv=none; b=AhBOHZKa/ilGo5492sY4/b0ezzitHMLnOlb8zs7aiaa+P/f0Th8g0Zqg/tBQA092juumWvZAMYwc2F8A7dCGDtqJVluDNg7kpAeTDhblRd8oJWOJicmelXCs58Wf/0LwFsfw/DY05sbxiI4i3tnd0nYORv/KQ18iijfgDcssSco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709918520; c=relaxed/simple;
	bh=0Mv8a3ZXoyNNg2VHkSGhQGBHcc+gRhJmGoCCa1ssFEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XYpDYC4zs8LG14RMM2+Pymt6piYvoqXXH/yLp1ekakLENbTAdNHjdERfJbg4nGZ0+4mXPdobQxCL1G57nB88gJWJTjUqP3SYQxSg0r2ZBnZ1vtnNKR2XpLvaCf+3nBWDlstVBQlH9sSn7Sg9XW3DpR6b1tsCzYsNMN+OIxAg5pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVBsHFzt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVBsHFzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709918520; x=1741454520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Mv8a3ZXoyNNg2VHkSGhQGBHcc+gRhJmGoCCa1ssFEw=;
  b=WVBsHFztNsEyd3a8ZbAdVW37eYuua5/UfL2NHm+uI+xgrvuBvCe698+p
   4i/qET1MGOfrpq3d7k7YgIQ9jbm/iRXxKX0dGEzei+FqFWqr3hm5Chexd
   TaOa73OhUPv6xACZ/iOFACb8eKwQWpdvFH3cC5KFDJCFvNtmq8LV+7ulk
   7iyebnG0eY1DmdhD/6jPFBgB0aI52ra23DTjYq9C3RqemUyedT6qrqVf3
   a4iUjHC1G8QBfv0KQm4YJ4q/7fFNy6W6Ea6X+dsU9qaP0Dazs533BuqHy
   o9b6zhmCxxPiJEDWzNgjoobl3+lbJJxbtmDJ6UjidFEu854tmLZrnjnW4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="8461788"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="8461788"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 09:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="10408474"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2024 09:21:57 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ridut-0006Yz-1X;
	Fri, 08 Mar 2024 17:21:55 +0000
Date: Sat, 9 Mar 2024 01:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 3/7] fs/binfmt_elf.c:2162:19: error:
 'struct linux_binfmt' has no member named 'min_coredump'
Message-ID: <202403090115.GeUhe5gH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e9c73e0594e0bdb3b71e4e1fbb49cf903d73c5d7
commit: f4f03e72ea6da725b2c00ac08216872566dbff49 [3/7] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-011-20240308 (https://download.01.org/0day-ci/archive/20240309/202403090115.GeUhe5gH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090115.GeUhe5gH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090115.GeUhe5gH-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2162:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2162 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2162 fs/binfmt_elf.c

  2159	
  2160	static int __init init_elf_binfmt(void)
  2161	{
> 2162		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2163		register_binfmt(&elf_format);
  2164		return 0;
  2165	}
  2166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
