Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97CE17F0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Feb 2024 02:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708224529; cv=none; b=Hcahzp6bP8fTDxpMOJwB702o4tiubRYswDeH3ibPgLBd6FwoFCoFz8BAmj4SMCBKuPViNUiJoyN38xzdsg7hmb85TVmTqd955fG6QG78IHbi/zlK8lz5HuDS5gYszSPQr7qIqoAbIcXmHNUuPlwrn9UbUrAHGin8rzsI/ZqVsPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708224529; c=relaxed/simple;
	bh=5uutHTP6zvqZqM747/j7Avzq5ZNfXbMKsQgWjXB1gRE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G0qUWAeob8/kEciR3qN2bHOmACFdFy1GSjfONaFBBhLo756gWrcvdqXbdYhSfwxLlHc+lliYq8XHY+RK2jlbAUxz6uIT1G31Kv9cxnKZjNevyYI1+A8Jea08CyeGltXpRNsLmmHobbDOvv3lD8GeEKq4HyKqB4Xp3sIOXxXJJTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM6V51Xb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM6V51Xb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708224527; x=1739760527;
  h=date:from:cc:subject:message-id:mime-version;
  bh=5uutHTP6zvqZqM747/j7Avzq5ZNfXbMKsQgWjXB1gRE=;
  b=HM6V51XbQLSanJBLEUB7LdRKH9l0xjqs5OJKjQf1y/x1AHs7VsKZK9EW
   9q9eL3DmAMKc6Muupszwijoj2hsWeB23COq9gsjZoI6HqPkzeVKOUpUA+
   FYnnjeH2QmQdmB6UPrYMPNX0+iGWHucPjyvbDJVGyHtCi8WcPp9x9n/LR
   rlzTURXeZ8Fc14mQRQMtyEfmALFSNH6YW0ux5aIcTBeSRSALKQoSl0ltw
   mlIu/b7RRPzdsR8lDkVlKxzwPeWBIqmvS3KNzYKkogrYPmlN646VXuDml
   LbFym4Hv3IDoRVacjr+cOQUckrgfrXg5p293jC66I4P487Tr0eDGiD2bO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2186432"
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="2186432"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 18:48:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,167,1705392000"; 
   d="scan'208";a="34968381"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Feb 2024 18:48:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbXEQ-0002iq-0Z;
	Sun, 18 Feb 2024 02:48:42 +0000
Date: Sun, 18 Feb 2024 10:47:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [ti:ti-linux-6.1.y-wip 20/22]
 drivers/media/i2c/ov1063x_regs.h:645:33: warning: 'ov1063x_regs_bt656_10bit'
 defined but not used
Message-ID: <202402181046.EA983b7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.1.y-wip
head:   77aa27cbdca359bf0735b36ada464ec65b520943
commit: 3b1476c2e88e06a676f64652d701c59d4d91245d [20/22] media: i2c: Add Omnivision OV1063x sensor driver
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240218/202402181046.EA983b7d-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240218/202402181046.EA983b7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402181046.EA983b7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/media/i2c/ov1063x.c:32:
>> drivers/media/i2c/ov1063x_regs.h:645:33: warning: 'ov1063x_regs_bt656_10bit' defined but not used [-Wunused-const-variable=]
     645 | static const struct ov1063x_reg ov1063x_regs_bt656_10bit[] = {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/i2c/ov1063x_regs.h:639:33: warning: 'ov1063x_regs_bt656' defined but not used [-Wunused-const-variable=]
     639 | static const struct ov1063x_reg ov1063x_regs_bt656[] = {
         |                                 ^~~~~~~~~~~~~~~~~~


vim +/ov1063x_regs_bt656_10bit +645 drivers/media/i2c/ov1063x_regs.h

   638	
 > 639	static const struct ov1063x_reg ov1063x_regs_bt656[] = {
   640		{ 0x4700, 0x02 }, { 0x4302, 0x03 }, { 0x4303, 0xf8 }, { 0x4304, 0x00 },
   641		{ 0x4305, 0x08 }, { 0x4306, 0x03 }, { 0x4307, 0xf8 }, { 0x4308, 0x00 },
   642		{ 0x4309, 0x08 },
   643	};
   644	
 > 645	static const struct ov1063x_reg ov1063x_regs_bt656_10bit[] = {
   646		{ 0x4700, 0x02 }, { 0x4302, 0x03 }, { 0x4303, 0xfe }, { 0x4304, 0x00 },
   647		{ 0x4305, 0x02 }, { 0x4306, 0x03 }, { 0x4307, 0xfe }, { 0x4308, 0x00 },
   648		{ 0x4309, 0x02 },
   649	};
   650	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
