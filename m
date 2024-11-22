Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B001DF27B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281331; cv=none; b=kTUBY7HvT603X8D0djue12TAcreh/im3SW0IOMgzdU3+r4ywjwXitBgyLRmzHbebkCt7E8oHI62RT69ViNbWuSAGd8YWXwl2gy5yMypjELvuellFKgGG9FXTg/X99qaLiHrpfODbyhuVxIaHXgfbDSbC6EEIse5i3slBY02qp/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281331; c=relaxed/simple;
	bh=fSIRfZRLJNsbO0R4nwu9Lft90JCQPoW5tQsEqeBkQEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btLtob74VCwE5J+Nh74u7sf0ncsjgBp/Ly1Tu4LzreRtk0Fxh70uu7xfAj2OOoyxru2Z6PnrDRW5I9Cy8aMJZp5Xz5Gzu2ZO+u4CpRkPuOh5ehZ1WaheaNIp4JjzuN01hz0u1/S+Nx3Z91WHHLxyo+WX8b162pE/jJxpfe36HbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SqG0CRXQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SqG0CRXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732281329; x=1763817329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fSIRfZRLJNsbO0R4nwu9Lft90JCQPoW5tQsEqeBkQEw=;
  b=SqG0CRXQ1SyMcBNtRUgwq60JcD4jN4GVQU7i2QMYZF7KdJRN8xXF8YtQ
   kBbYwxAJ6JM90fuLNXzltQ0CywBORVsVnvit6kYhoXd9Aa39B/lMx/ZLQ
   gvh0Yk87/GrhmY0WdDdxpklUqCI47Qc/Qrfkxx1iPrdqehZylGg1MY9Ja
   7GKnHOuPFefBlDIKb/lrKnqH45EdBUr7L1hyWuqk4bPZ/33z3p8/+LyQh
   z5qDE6SaApO18GxI3gRy4KAMwBPlOpEYFaUcLamFgXf2+g5VODa38X0I9
   ois8C1+lw/Uj7BGCH0n1ROYYxpG+CyFNjlOhu6u2G+tEkXKX0NJPHmV96
   w==;
X-CSE-ConnectionGUID: ogLOgmfBR66kE8uHoEoc2w==
X-CSE-MsgGUID: 9ARNq8VpQSi/nSD7PTwJyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20025233"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="20025233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 05:15:29 -0800
X-CSE-ConnectionGUID: B4BQYYr5RtqKAts6ElghxQ==
X-CSE-MsgGUID: VfhUeOKwTHSRR2Z3kogrSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="113851125"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 05:15:27 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tETVN-0003vT-2t;
	Fri, 22 Nov 2024 13:15:25 +0000
Date: Fri, 22 Nov 2024 21:15:07 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/b4-sysfs-const-bin_attr-cb 29/161]
 drivers/mtd/spi-nor/sysfs.c:107:27: error: initialization of 'struct
 bin_attribute **' from incompatible pointer type 'const struct bin_attribute
 * const*'
Message-ID: <202411222138.F6dQ2aVz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/b4-sysfs-const-bin_attr-cb
head:   4c594559fc90f22903c98c95389c0c3d4c8151b4
commit: bf68ea73c14091cb782938f595dcb401b879e3c8 [29/161] mtd
config: x86_64-randconfig-161-20241122 (https://download.01.org/0day-ci/archive/20241122/202411222138.F6dQ2aVz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222138.F6dQ2aVz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222138.F6dQ2aVz-lkp@intel.com/

Note: the thomas-weissschuh/b4/b4-sysfs-const-bin_attr-cb HEAD 4c594559fc90f22903c98c95389c0c3d4c8151b4 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sysfs.c:107:27: error: initialization of 'struct bin_attribute **' from incompatible pointer type 'const struct bin_attribute * const*' [-Werror=incompatible-pointer-types]
     107 |         .bin_attrs      = spi_nor_sysfs_bin_entries,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/sysfs.c:107:27: note: (near initialization for 'spi_nor_sysfs_group.<anonymous>.bin_attrs')
   cc1: some warnings being treated as errors


vim +107 drivers/mtd/spi-nor/sysfs.c

36ac0228626585 Michael Walle 2021-05-03  101  
36ac0228626585 Michael Walle 2021-05-03  102  static const struct attribute_group spi_nor_sysfs_group = {
36ac0228626585 Michael Walle 2021-05-03  103  	.name		= "spi-nor",
7d388551b6888f Michael Walle 2022-08-11  104  	.is_visible	= spi_nor_sysfs_is_visible,
36ac0228626585 Michael Walle 2021-05-03  105  	.is_bin_visible	= spi_nor_sysfs_is_bin_visible,
36ac0228626585 Michael Walle 2021-05-03  106  	.attrs		= spi_nor_sysfs_entries,
36ac0228626585 Michael Walle 2021-05-03 @107  	.bin_attrs	= spi_nor_sysfs_bin_entries,
36ac0228626585 Michael Walle 2021-05-03  108  };
36ac0228626585 Michael Walle 2021-05-03  109  

:::::: The code at line 107 was first introduced by commit
:::::: 36ac0228626585ba718186b9db2e5986a198152c mtd: spi-nor: add initial sysfs support

:::::: TO: Michael Walle <michael@walle.cc>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
