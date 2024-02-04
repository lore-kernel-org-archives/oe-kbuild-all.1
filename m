Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBF2EDE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 02:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707013538; cv=none; b=Cm4RH4VVkWtWe8rdoeJy8IzQqw7NezrKivAe8XhR+DoBD6TerUFdHNwkf4uUhnvT1sRhq3hDOXBI7tBFlaeXV+wDaJONK2sLBurR6g3Gyo8QPea56zu0qHWHBkCnNzNz6XE0S+VHOga9m6UDrZ21WXGEUAdFDA4tsP6V9Ai4sgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707013538; c=relaxed/simple;
	bh=YMGnBQoUChquz1At44euXttEXZFi46v4XoB4JDwjdps=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLvC5Xn1IStBPj5LIBYni4NpkWEEc/+NduCRxX3VwczTbNvBMp3SakTlLH5UDzxyDl0U9p5LZYZcrjrDN/NuEZgX1wYBz/Gw7ZtalI5z+EFTp1NHfwg1+I8NMT/haGQ+dxLRw9JTZlbus6xJQ6b+qWbStG9m86IWdgxm26dAoNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDjnbpVi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDjnbpVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707013536; x=1738549536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YMGnBQoUChquz1At44euXttEXZFi46v4XoB4JDwjdps=;
  b=HDjnbpVi66u5/6trj4BEIZFMtBseY4tgPvlbAvizMh9cEunOGvckG3hc
   hIV/RI6xX5tlOcDNxJ2usKJ875dr9m+iWU3Wo1u3dKE0/QlGh1yEnuBbn
   MkuOQwTgCiST4MDeHjQuXoLNwWr8Nu4ox+d/ZEKUkRuRO+DlMOU1OxiAo
   ZpWa8DXSHNUfh4NUWBp3QsBr3CYjG561nxPNsH8ndAVFQq9+9zaest4/3
   AP4S3sPu2rkgFO67jxgKAAJ01hA5e75YiQGTU7YNkXcnDF1CO6aUjGcA/
   BGpfa83ayhhLP6YnVuPq+EdqRUllbUXeVR8hJ8zD/o5YUCZvHAmoFIjj6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="10948362"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="10948362"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 18:25:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="908957138"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="908957138"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2024 18:25:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWSCJ-0005ti-2t;
	Sun, 04 Feb 2024 02:25:31 +0000
Date: Sun, 4 Feb 2024 10:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/170-atcphy 5/12] drivers/phy/apple/dptx.c:63:21:
 error: implicit declaration of function 'readl'
Message-ID: <202402041026.CPlQgVvR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Janne,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/170-atcphy
head:   4931e8edc0670b6acf66c1b83702c7521722ff1c
commit: 3ba9173a776695e19481d515c3c1135ca6d718d5 [5/12] phy: apple: Add DP TX phy driver
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240204/202402041026.CPlQgVvR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041026.CPlQgVvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041026.CPlQgVvR-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/phy/apple/dptx.c: In function 'mask32':
>> drivers/phy/apple/dptx.c:63:21: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
      63 |         u32 value = readl(reg);
         |                     ^~~~~
>> drivers/phy/apple/dptx.c:66:9: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
      66 |         writel(value, reg);
         |         ^~~~~~
   drivers/phy/apple/dptx.c: At top level:
   drivers/phy/apple/dptx.c:318:5: warning: no previous prototype for 'dptx_phy_set_link_rate' [-Wmissing-prototypes]
     318 | int dptx_phy_set_link_rate(struct apple_dptx_phy *phy, u32 link_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   drivers/phy/apple/dptx.c: In function 'dptx_phy_set_link_rate':
   drivers/phy/apple/dptx.c:320:19: warning: variable 'sts_1014' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |                   ^~~~~~~~
   drivers/phy/apple/dptx.c:320:9: warning: variable 'sts_1008' set but not used [-Wunused-but-set-variable]
     320 |     u32 sts_1008, sts_1014, val_100c, val_20b0, val_20b4;
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/readl +63 drivers/phy/apple/dptx.c

    59	
    60	
    61	static inline void mask32(void __iomem *reg, u32 mask, u32 set)
    62	{
  > 63		u32 value = readl(reg);
    64		value &= ~mask;
    65		value |= set;
  > 66		writel(value, reg);
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
