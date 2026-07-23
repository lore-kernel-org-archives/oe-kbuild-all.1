Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53D4963C2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jul 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784809013; cv=none; b=pt2t1s23aoriSumyqL40pB37a9WMgd+dj07uk0mRni7ZiEXQM3y1i9zZlc9rzc0kXfOEyg/EXFLz5bCoT7dgJplFegHxaJJ9RJXk/H49OtiBYTipnMm143gmk5N/xwWHEfLBSSinPUUP2EdFYH8v0tgHzZdwpqEwPAe7lA4AEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784809013; c=relaxed/simple;
	bh=wOP9gTYSOW8dklSbB3XxE2Q4UmsRa99boJFph2c4XdU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TT2gQOm9NjTgxZwoNUyugLW1Kexmc4YnlXgKaLJ/7oEjKzye45g/3eowIWnDVrKwqa6x4ZmbuPYTGmCdHdwsx9VDqY9WhZtkTqy1jYwrBg59Ct5nP9EHJH5TB/jnluoy2y4uKzDsV+HOI8Xw+Xd6eXq9/6sAUrpZ7XxhUa515uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A54f149y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A54f149y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784809008; x=1816345008;
  h=date:from:to:cc:subject:message-id;
  bh=wOP9gTYSOW8dklSbB3XxE2Q4UmsRa99boJFph2c4XdU=;
  b=A54f149yZtsdnC5JDQvQ4WaBjIsO3aY8Zcw1Cwp43FNaL38qV4aUuAeY
   q+OiDShNQ1OogkEFlLc2vjIkLP70ux5GgAGkAeY/Oix7ILBZfxBYg01Jv
   4FXvdGpDUNdo68JZNuugnNcIeWfTISJYBo5aaNL6IwdrlyWlWR4WZ/2d/
   CdyZ/QP66TY4S/qH8w1SZ+jxRSjCBYmEWIp7zZnZ0fH8K+R1zrNworU1D
   mqKkDbsOZe062x17cjRqvLR5Uo9FGXRpesjp9GINYWVgUzm3A14cAbGh1
   Zj7eT2mbpBh5usN9hxT9S/BOvSuXnyoYQec4A8IIZ8YmmmGVNBqT02Ejf
   Q==;
X-CSE-ConnectionGUID: /eYvdBsiS1CNz3d82myAFg==
X-CSE-MsgGUID: VXS8t8BHQ86lFZyi+usY4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96050859"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="96050859"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 05:16:44 -0700
X-CSE-ConnectionGUID: 84E5XwwXQbC4HftWpaVn0w==
X-CSE-MsgGUID: LQb4PjxbS5yrrFPlJ+EWAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; 
   d="scan'208";a="260361292"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jul 2026 05:16:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmsLw-000000000lf-29si;
	Thu, 23 Jul 2026 12:16:40 +0000
Date: Thu, 23 Jul 2026 14:15:43 +0200
From: kernel test robot <lkp@intel.com>
To: Quanyang Wang <quanyang.wang@windriver.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 49/1004] kismet: WARNING: unmet direct
 dependencies detected for DRM_BRIDGE_CONNECTOR when selected by
 DRM_XLNX_MIXER
Message-ID: <202607231403.BMghuzga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3128e0f044012bb39c8e24551d72e4a72e0808f0
commit: f916aa987299ac3ab866dca79da73769e49e7d36 [49/1004] drm: xlnx: select bridge-connector for mixer driver
config: alpha-kismet-CONFIG_DRM_BRIDGE_CONNECTOR-CONFIG_DRM_XLNX_MIXER-0-0 (https://download.01.org/0day-ci/archive/20260723/202607231403.BMghuzga-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260723/202607231403.BMghuzga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607231403.BMghuzga-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR when selected by DRM_XLNX_MIXER
   WARNING: unmet direct dependencies detected for DRM_BRIDGE_CONNECTOR
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=n]
     Selected by [y]:
     - DRM_XLNX_MIXER [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XLNX [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
