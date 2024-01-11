Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273F817C6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 03:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNKh/kO9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704943635; x=1736479635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5HT2qz12qQe1Q0lVOCrsOAqJVcTbzZzGrU8mYYoEzok=;
  b=KNKh/kO9TZWgF7lSFfKp0dYUZmSRuRSMLTdBpsAT8sNs2sSStYM5r7MK
   CbS1jdcDzjbxOGc2amnG5Jns9z28qFUBPCF1IZdvxUyJwK8soyM3Z7mwp
   peImNxHR7PJ4jIDMgA5So3D405khn0YTNvvn9K6qp0lH3nP80dAMvsIqI
   c4zILQTPx2l0JpQJx5bt3IuYu1dcxdOKcxwK9Jx1dfWxbUIpEgi2b7B7y
   q1jIbnTt45H7fCqqnBgGmzwtBlFKUTcXoiSI7U5ENcXVjmmiQrpDjQfSX
   YkLToHTFvWbLQBG3ZoKrV07kOsHrBgL2nl2VQC7rxqGml8K4Ba1SeWpjY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="402498926"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="402498926"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 19:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="955592130"
X-IronPort-AV: E=Sophos;i="6.04,185,1695711600"; 
   d="scan'208";a="955592130"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Jan 2024 19:27:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNlii-0007lm-2t;
	Thu, 11 Jan 2024 03:27:05 +0000
Date: Thu, 11 Jan 2024 11:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 68/69] ld.lld: error: undefined symbol:
 xfs_zoned_reserved_extents
Message-ID: <202401111125.LQdV56Zj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   6cbaa154b781048e31781d9982968f2949ee7059
commit: 73364c28e1ed20ded818eca16763e4cd31e7c8ee [68/69] xfs: fix reserved GC blocks handling
config: i386-randconfig-016-20240111 (https://download.01.org/0day-ci/archive/20240111/202401111125.LQdV56Zj-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111125.LQdV56Zj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111125.LQdV56Zj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_zoned_reserved_extents
   >>> referenced by xfs_ioctl.c:2102 (fs/xfs/xfs_ioctl.c:2102)
   >>>               fs/xfs/xfs_ioctl.o:(xfs_file_ioctl) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
