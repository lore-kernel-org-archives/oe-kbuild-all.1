Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3521804A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CFnh28MS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697313398; x=1728849398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q1u7zCfpd7VVpyx3uEXm/AMtfOCuqBENiRA9L2YdPRE=;
  b=CFnh28MSZzR58QSjmA6LC7UgkjlHEPWfN9ewdgebuNOv1K7z/sI85T/5
   UWRhsY3plq/hILw68s+F5oDaGkgXsRPKo4Phw4r/owEgzLDp+sXs++ijY
   5ie3iQFyIMU6DdvRIaxefAUggeX0CsWarGKf7bA0l6IQEJ0OzDKNRUKQJ
   O2VqkgyWDpyWwFWZYGObr+zGqnFeyHI/jCVSOCk+Xgi7AS+4nXCh2krxL
   oXmdS0JWBLsnvP5sBnGR9G2HTwkDBSH+UDTdgbvTRJTj0UYktwsnaxHpi
   CoDDiQXvq3W+40wrUmQjitgj1VanSVNtMkRgXKo+nZ48l0rGQxHos0lFI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="370417127"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="370417127"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 12:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871529323"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="871529323"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 12:56:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrkkT-0006ap-1v;
	Sat, 14 Oct 2023 19:56:33 +0000
Date: Sun, 15 Oct 2023 03:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 25/29] dev.c:undefined reference to
 `__get_user_bad'
Message-ID: <202310150320.CBg7zTbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   af314f8dfffbe0852967cf253beb94878c5d4846
commit: 4019ce76834a6111ffae8d11f085b2d8db6a6de9 [25/29] fuse: implement ioctls to map backing files to inodes
config: arm-randconfig-004-20231015 (https://download.01.org/0day-ci/archive/20231015/202310150320.CBg7zTbT-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150320.CBg7zTbT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150320.CBg7zTbT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
>> dev.c:(.text+0x3a2): undefined reference to `__get_user_bad'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
