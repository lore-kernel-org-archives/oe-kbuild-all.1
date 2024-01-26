Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEB71DDF5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 16:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286769; cv=none; b=S3FzrKQia2+kVcKoAYWhtICSyVJcONGczxlwbBm/EkFP6DuZFUDP5i9zcPFJvQoA1wMUGrLz4rMr++QBgLucsO0RoZOxhYsM0J6Afm68r9HZwRwRieuNSZ8xaFoXOIHzEATQHgNzbT4SLnZXSPRmqTdXGVJ9rDQJqYu1pmtYeL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286769; c=relaxed/simple;
	bh=eJWk3fFub04xK51/rn7SeHfyQjruS6IHE7dk4PVkLvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a8oQPClRylPFJCmtGpXJV44a7W5fSgMOXIsDtL6bjOYO39oy1rdgmI07U8H3OgAeYypxRRttYnXy9H6WLh8zjZ9rv3BhyKjFIZTjlpBDyg+uI2NrixUyc7i1Hoh9uf7sn43j4lDmRJBYFRz81QIKGjzh2Am1UW3yeWXv/XKstE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/YOVMHo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/YOVMHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706286767; x=1737822767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eJWk3fFub04xK51/rn7SeHfyQjruS6IHE7dk4PVkLvc=;
  b=k/YOVMHoWelcXUshVBpi79tuGur1bwVopFsDy73vCvOGlIEiH+REhOoc
   +BlMVgwXtRUbgI4xzHmIHrbgBULRiwOp3IKxDem+VxVPEaPk8taKoikql
   S63FaiTYOxJ1Dujh6G/slHqeY3irhLnxFzgPoZWnm+HBeQtGTlZi9iId3
   alzh6E0b4CkrA4Wt41q7hmEWs7DnowSmt8HZ0cSpR6rHwngt9wRX+Z6+K
   rONhTGqkYBAXlnK9h1EDdsL89kqPr9P8yMSC+9SYb7TbR2qrXxLxVqlBM
   65+H8AYTMqwWfv3wiViM071SAcEUiUqTqaP6uGQA0KfbSX9O12gYjrYKF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2396947"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2396947"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 08:32:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="29138250"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jan 2024 08:32:45 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTP8F-0001Ba-0O;
	Fri, 26 Jan 2024 16:32:43 +0000
Date: Sat, 27 Jan 2024 00:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 118/275] ld.lld: error: undefined
 symbol: xfs_rmapbt_mem_ops
Message-ID: <202401270011.e06tluco-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   370f4f5a373f371e76fdc9634867b15775947255
commit: ca944775594eb15745e8280bf3ae16761cbee82f [118/275] xfs: create a shadow rmap btree during rmap repair
config: i386-buildonly-randconfig-006-20240126 (https://download.01.org/0day-ci/archive/20240127/202401270011.e06tluco-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270011.e06tluco-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270011.e06tluco-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xfs_rmapbt_mem_ops
   >>> referenced by xfs_rmap.c
   >>>               fs/xfs/libxfs/xfs_rmap.o:(xfs_rmap_get_rec) in archive vmlinux.a
   >>> referenced by xfs_rmap.c
   >>>               fs/xfs/libxfs/xfs_rmap.o:(xfs_rmap_get_rec) in archive vmlinux.a
   >>> referenced by xfs_rmap.c
   >>>               fs/xfs/libxfs/xfs_rmap.o:(xfs_rmap_query_range_helper) in archive vmlinux.a
   >>> referenced 1 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
