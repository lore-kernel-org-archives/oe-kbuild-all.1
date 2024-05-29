Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C270115B15F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 03:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716952884; cv=none; b=uQeJLjcW6FQeotUVRR+t3tYno+x2Zt+WRJpJlVcUrNlwj/tIqfAZAmdhh09YPGwubOzc9gLmGYovwUXwEojYYGbi9DReLeefI40Fpn4YRiK0uvq/CuH7mqX+L3RoMh6b1NBvOVpWbDNmcDGtxwm42oPX2DT2DZUeXvNQUxulnII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716952884; c=relaxed/simple;
	bh=g23ZrvgjmJJU6r959a0DMuLbszB/n4fCv1YWFQV/Ntc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hloKMGXA0Zf8wDlgvfgCNdAzPdbo0D9eJYufFTqwrZ8AAiCDneBPjwfGvOpxzmsOSc+YbyYJ4f2k6X+7TZxx91GovO4G5NhUZ2jZyscMnO01NihiHkL6ds4PInIu/UwNZF7J/0UCPkWXMJnz2D+Vs3932Wb15Rl0vzwuiocxNSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvzx8AqW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvzx8AqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716952883; x=1748488883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g23ZrvgjmJJU6r959a0DMuLbszB/n4fCv1YWFQV/Ntc=;
  b=Qvzx8AqWRLSmv8e3dO7II6Hu6M5McjSCSfC+ZxJ+tnC/SZ/RUwK573ia
   +xCmxHaYoi1Cj/E2kbUh4Ft/GKxVa9j5T6y5RH2T0uMsPLJt6r44z2Xeq
   GPHYTWhvU3DAKygsVi+Zr1hv9NyMj618tj1SR9+CM1YQgHwvyVqc7cDRG
   N9vImaZB0lan/B+jOdMM0mYEDghpnx4wB4uBLBs2+VvG3ylZE7XE/Rl1v
   4wdxNHm200UR/ujE3g0p/1XzuE19LLAaTPduYbHBR6UJMYNMegWMm2Eat
   T9Ki7qghVRCxlNXrrGqyPh6QAF12vUGwwiggU592XMHog0Hf42/8+MQSG
   w==;
X-CSE-ConnectionGUID: JTXAqInYR5ekyqfGDc377w==
X-CSE-MsgGUID: C+429ulKQymPmPLPnaR/rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13559562"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13559562"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 20:21:22 -0700
X-CSE-ConnectionGUID: uQuJ+l9nTwCQbvvNIrArsQ==
X-CSE-MsgGUID: gdmt2sCVQXOz4ALasY1hFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39717468"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 May 2024 20:21:19 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC9sK-000D4F-2m;
	Wed, 29 May 2024 03:21:16 +0000
Date: Wed, 29 May 2024 11:20:51 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7251/7755] ld: cpuset.c:undefined reference to
 `get_iowait_time'
Message-ID: <202405291124.VzZQp3Hh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   724ee3c4545840fd6d1af9474de10a9404f4d6c5
commit: 4366f3277270b446deb234bf30fdcfedbc749282 [7251/7755] cpustat: make get_iowait_time external
config: x86_64-buildonly-randconfig-003-20240529 (https://download.01.org/0day-ci/archive/20240529/202405291124.VzZQp3Hh-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291124.VzZQp3Hh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291124.VzZQp3Hh-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `cpuset_cgroup_stat_show_comm.constprop.0':
   cpuset.c:(.text+0x4419b6): undefined reference to `get_idle_time'
>> ld: cpuset.c:(.text+0x4419c6): undefined reference to `get_iowait_time'
   ld: cpuset.c:(.text+0x441fb5): undefined reference to `get_idle_time'
   ld: cpuset.c:(.text+0x441fc5): undefined reference to `get_iowait_time'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
