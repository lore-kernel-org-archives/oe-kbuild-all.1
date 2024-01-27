Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8B125A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 04:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706329047; cv=none; b=TqbqHm1i4+esx0WmiqSnxzAfqEb7JK35H4x3ikSy84hndzG0dyDdh8gKFYnZNgmKqDhf0GVsuAChuTqKm9fqCz3mLcPRZsVvi4Jv9UunjlVF/DU1yL3GQIVPEJ9//I3BdZ1MpjBEmAViEJQCqRKTEqw8KaOz8baqtiP8USLyTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706329047; c=relaxed/simple;
	bh=bJ+IV6bu0dH9Pky51V8nhF1j67paFMwhO4nSfy10Oy8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iDyKhYEvWqBQ/HdxFu/y6kXzbjWZe3Cy3X9eO5QjHtplA1+7DiuklE0bKzm/T0OatgTEpZrwmY583wF8EYVzN6hm4K4B0fszcurYAQNXx5NsxkJSjLEwHoNu5Q++upJWNp3fUNETDZlZ2PkDgYRJ5MxDbq/otYVqSVB3ql0yl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjE4DuFI; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjE4DuFI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706329045; x=1737865045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJ+IV6bu0dH9Pky51V8nhF1j67paFMwhO4nSfy10Oy8=;
  b=WjE4DuFIIpzoMZ8jkyGQx063a54mQDElC0/pofesTWbi9kHt+6cfzVBI
   wb8EeD/33bAfE3pV5GidTyyPfO4DVUXgFNcE7E7CD9slNcamDil0LXb1P
   FX1eXsWLoioTg8UVKpU4x3A74sjh9FIClCpsToNqcViBV57IjvIJJEN4S
   3z+FlYzse8de3+HoDtCTZEFAWxHBfGnDsD7mLvUwzTdRzO4tYX5X2YuJY
   PxBY7Loh4MyrqYwkg6Qyfr4F9jb+BwLkIaV8/g/lbP9Q7TXyiqbl2B/9r
   6u89m59vw4Q2QiGysFhFsYoszo0EhGtKe6KTxjK2veFu7XgULSawkMFBm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="393076389"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393076389"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 20:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="29283711"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2024 20:17:23 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTa89-0001da-1Z;
	Sat, 27 Jan 2024 04:17:21 +0000
Date: Sat, 27 Jan 2024 12:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 17239/21577]
 drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared; did you
 mean 'compat_time_t'?
Message-ID: <202401271204.lWrJHpqI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   992b5fc139d3aa14b25613b06adee4bb9c110b28
commit: b8ba22a604e4d0a3ad8e23af22f432e12b6f1a65 [17239/21577] nvme: fix compat address handling in several ioctls
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240127/202401271204.lWrJHpqI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401271204.lWrJHpqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401271204.lWrJHpqI-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_to_user_ptr':
>> drivers/nvme/host/core.c:1163:27: error: 'compat_uptr_t' undeclared (first use in this function); did you mean 'compat_time_t'?
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                           ^~~~~~~~~~~~~
         |                           compat_time_t
   drivers/nvme/host/core.c:1163:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/nvme/host/core.c:1163:41: error: expected ';' before 'ptrval'
    1163 |                 ptrval = (compat_uptr_t)ptrval;
         |                                         ^~~~~~
         |                                         ;


vim +1163 drivers/nvme/host/core.c

  1154	
  1155	/*
  1156	 * Convert integer values from ioctl structures to user pointers, silently
  1157	 * ignoring the upper bits in the compat case to match behaviour of 32-bit
  1158	 * kernels.
  1159	 */
  1160	static void __user *nvme_to_user_ptr(uintptr_t ptrval)
  1161	{
  1162		if (in_compat_syscall())
> 1163			ptrval = (compat_uptr_t)ptrval;
  1164		return (void __user *)ptrval;
  1165	}
  1166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
