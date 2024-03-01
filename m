Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182B62B9B9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Mar 2024 01:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709256206; cv=none; b=OUk3d/reTpdIFUJ5E0ji3ZP0lmltB29hxvllE1cY8GuoZY/I9zKZ1tCMyN4f4ArC9zujJVCd4HL+rUpXBpglxTurj9EdFU839zirnjl8lusBCZM3Jg7xl6bdPtU1hfFpFUS9WOnIuRT+Z4k8TMMjyQaEuFgoZnAw0cl0ImuXAs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709256206; c=relaxed/simple;
	bh=PK3x9qvwQAKdigg0rxRLH92bMStrJCs6HTEnAD6fklI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lM6EOZo7Dux6juPIqvky1EpG6jaCqRW7nFr4B1gimci+m5qqXXHCfRAxuqQDpbQUOQbsnFl25GrYvTiqKS1fNX0UapC72MdxB6CsgP37l4Ffye7Fj/bbvl3bMwB33O2raqbdX4NzT2YnBUkFBLgDmpzSpYUog1b02V9USJCazMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of11QqIc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of11QqIc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709256203; x=1740792203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PK3x9qvwQAKdigg0rxRLH92bMStrJCs6HTEnAD6fklI=;
  b=Of11QqIchRg2bLP9lH/q7WcSbvLUh6nbOVohaHK2VNNSDEiEDSxdc5y4
   4RAajvicbyhnouh7uOkU6GUETLKMce7NY/2L8s/vmkHtCHtmjOSSDBHc/
   SZpWJeqBV4/UgH1sguqVCv+a2Zm4+cz6fAmgT7W2OT+D2ddAOKe8rRsEm
   ynOhWi2/EJnHHLRkxFnvorY/XvzWNiCG/9Pcy9/as5iZVlvA40m3202/C
   GKJXvmFwxdJLrXsIjojyonovY60PuqXNCsD4jxOKZs2iHODlo7oLCNiaq
   9mRoEy6uDP7J5dQaxISENaWESgcfpjAlh6vs8kFkGrHFBc+Zr3FG/SLd6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3660814"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3660814"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 17:23:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7971948"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 17:23:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfrbW-000DQD-0b;
	Fri, 01 Mar 2024 01:22:53 +0000
Date: Fri, 1 Mar 2024 09:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Jianqiang Chen <jianqiang.chen@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 383/860]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:361:9: error: implicit declaration of
 function 'writel'
Message-ID: <202403010949.G9HvjrQM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   24eec56fe5bd68cae795c37c61276b4dcf218a53
commit: bdf045814d4629c0ab369b168755b12635532dc3 [383/860] drm: xlnx: Update DP subsystem with downstream version
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240301/202403010949.G9HvjrQM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010949.G9HvjrQM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010949.G9HvjrQM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_write':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:361:9: error: implicit declaration of function 'writel' [-Werror=implicit-function-declaration]
     361 |         writel(val, base + offset);
         |         ^~~~~~
   drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_read':
>> drivers/gpu/drm/xlnx/zynqmp_dp.c:366:16: error: implicit declaration of function 'readl' [-Werror=implicit-function-declaration]
     366 |         return readl(base + offset);
         |                ^~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_PANEL_SIMPLE
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_PANEL [=y] && OF [=y] && BACKLIGHT_CLASS_DEVICE [=y] && PM
   Selected by [y]:
   - DRM_XLNX_DSI [=y] && HAS_IOMEM [=y] && DRM_XLNX [=y]


vim +/writel +361 drivers/gpu/drm/xlnx/zynqmp_dp.c

   358	
   359	static void zynqmp_dp_write(void __iomem *base, int offset, u32 val)
   360	{
 > 361		writel(val, base + offset);
   362	}
   363	
   364	static u32 zynqmp_dp_read(void __iomem *base, int offset)
   365	{
 > 366		return readl(base + offset);
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
