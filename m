Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613AC6D39
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 03:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4DVTv3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701833310; x=1733369310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f1yxP3usVQGb9VeJHC66S0Lj6Vz7a5WOi1iI4OKDJtY=;
  b=d4DVTv3GCKhrx6hi6vaRq7nkK53nuiZV71MSDoLxPiKy6qwoxfPMh7EH
   0yA4Y+eknscdmGlUO0nGR5BqKzpoQcAESVXwRw7E4MJFzLdWd9VYtVaXC
   kH2/6SsgpT2yz9rBzjy1ApL4t5G9hd5Kcd/I7OegbKpb5EJ/CqFnyiZJF
   UDPT6O9/sWd0xuZCjGkduzNmP1tA734tvs30Z/ZnOt3ksHxCTRE6SnWSS
   kEcFR10T0SQxzUQciIHKV7i283SKdXqajt+l0FZBNIhtMqv5C9rdNNTgr
   4ip7Z514po7dm0auGH9ouwgO0PiL6ko0j71knSkJr73EcT0qJFpXU+UWp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="374183160"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="374183160"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1018431547"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1018431547"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 05 Dec 2023 19:28:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAiaI-000AAU-2K;
	Wed, 06 Dec 2023 03:28:26 +0000
Date: Wed, 6 Dec 2023 11:27:31 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fuse-backing-fd 11/16] ld.lld: error: undefined symbol:
 fuse_backing_put
Message-ID: <202312061132.kcTV2TUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   908a2beb53709f4b2f65a280af474b8d05962d18
commit: 65d384ef1fca428aab66dffbbd7aa445f181675a [11/16] fuse: introduce FUSE_PASSTHROUGH capability
config: arm64-randconfig-r053-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061132.kcTV2TUX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061132.kcTV2TUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061132.kcTV2TUX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fuse_backing_put
   >>> referenced by inode.c
   >>>               fs/fuse/inode.o:(fuse_free_inode) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
