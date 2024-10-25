Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78451217F27
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729896637; cv=none; b=ESJTIqwReof3qlqreViP9GlvoUKjNw88YBGGfKLehXQkJ3DkmUYSUsyJfI2zuKKYr3YyijJ0bP22+Jhkj3sdXv43Muo67NNu6SkF/0ECZucu9uUF7g0/4FKN9H7sGXi4HZ0JPtVE08gIIGpuDnLcztAHrovjQ2rke+vYTrP97E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729896637; c=relaxed/simple;
	bh=R7btrIJJt37n6VRln+9PJ+r4v+iQIA+LoAW9JCrmEzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQ2Q+XAfvDvLF9vFRYyFDy9YOkYn8onpvY/0hY8buli/K0qdEYbRr7I2IpxEcU8w8/T/Dp8uKqT2Svx09+TKQABzSEmaPQydEbbvv8xNTVqrrluzRCOQB3G6MQ76a4nvuUaKxGUESRZQ/TzCowclShg9Q3TejeHpaaQn5YJi7vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iz0jyMk3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iz0jyMk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729896636; x=1761432636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R7btrIJJt37n6VRln+9PJ+r4v+iQIA+LoAW9JCrmEzA=;
  b=Iz0jyMk3cgIu++KUqSOPn4AJ9VpAYt5oeF0vWljbvCS4Tlclp3PeF2GT
   jOqNm7xpZWk6c/NQXSRHGeJQ5uYNncJxsrQHWQSBNviF5imvgq1IZUr4y
   ED4NOeCYAzqB2yzP+hbtmTBDYoAMyKNg65zDVmLg7zH0DkYen2rwORnI6
   HQefacCXC5Cqruq8/2PEkL90XKSolyxHG3KsGpNieayHDMmFBrsQuVhqR
   JUqk538/rbRf7Hj3Q+MXrhzLSYlCGeUx3Pm3e1yrEhYMVk4JFdJD0vXFA
   JBStVHP1OPcOhrPktD3LJ07jtvmEiZv7x5jAi/JX5gJ1Zfibdnq+mGin4
   g==;
X-CSE-ConnectionGUID: ve8pOwaATyOXuyE38A8NSw==
X-CSE-MsgGUID: J1eGnwiHQpaVicB1LSZGgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29443335"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29443335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 15:50:35 -0700
X-CSE-ConnectionGUID: WmNRZJijRjiLn0JaN/s8vw==
X-CSE-MsgGUID: sVbEAOkFRMmatfN0a6oz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,233,1725346800"; 
   d="scan'208";a="80957507"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 15:50:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4T8a-000Z08-06;
	Fri, 25 Oct 2024 22:50:32 +0000
Date: Sat, 26 Oct 2024 06:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 32/45] xfs_aops.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202410260634.VcCPPA78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   ce5019907f61fb75342d40fefc17058ac45b76c3
commit: 579e1d3d43db665e6d4e6c24418cf9d2e1f4384d [32/45] xfs: support zoned RT devices
config: arm-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260634.VcCPPA78-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260634.VcCPPA78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260634.VcCPPA78-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: fs/xfs/xfs_aops.o: in function `xfs_end_bio':
>> xfs_aops.c:(.text+0x170): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: fs/xfs/xfs_file.o: in function `xfs_dio_zoned_submit_io':
>> xfs_file.c:(.text+0x84a): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
