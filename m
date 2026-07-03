Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AF6313543
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jul 2026 04:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783053965; cv=none; b=fS4sSmv7QpgzLSlAKvKXWn/STAeAkxmJqQkpQkJ0y7HzlluDbqIsSD2l8ho/vdHEdzLrN00MnhBgH3r5xABY1FpHOrvDlXZSaYdaV6hww2DcY4oM3/PhkKbQ5SANlHj5AooZ1uxSzkkLvH/wJHN4kr9tlsrqeKYuocIy3nj74QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783053965; c=relaxed/simple;
	bh=nXBl2E+gkaigyN0A23x/eQAs0UmgW3EgyyDGLioOXic=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vdi28P2p0GvIyk8SNKsLkX3rv7r6uRAqWkHzprxqNNHpICpxF8SdGeeZWcKLOcGJzMIgE9G0aeyQHVqvc6tNyEF4yqj13T7Di71Xsowx2rSva4SR4zshg/RHhmZaR9V9YLq+olDAkTUC1x18G19Zyaq0jaX4/Vnf0hgROzfclwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KptA5Csr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KptA5Csr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783053955; x=1814589955;
  h=date:from:to:cc:subject:message-id;
  bh=nXBl2E+gkaigyN0A23x/eQAs0UmgW3EgyyDGLioOXic=;
  b=KptA5CsrrnmPL/STCVXd8aaGPe0MO9zCRynZeWh4KFw64aPBK4BxNSSk
   hGJiuTqUhbByfxNFd/Gf5DAtmGEBi+6TXcmN0Y9xYC5f6KQsxT3pfibBo
   OLlbvenWdX5izcxkSjWnaQN/VO1dZSQrQldpyJq7EfE5ZvEE0hBJEJ0id
   jmX9DWCNKAgU8Gudg48ANuzawg0aXrx8gsEDfkQmwNsD7qicvWHzx+eBc
   13oMmYJvTnkwUGO7Tmf3MoAV9Xp8N4GI9cf6bKiUV63xs0+afgo8ZmRAv
   QV56JyoStrUs7yiqvj5xDy2fP8LO+sJ5od3QyG+jwOEI0mUJbr53HU8Pv
   A==;
X-CSE-ConnectionGUID: waYFAyd6SbuRmqJ56ZoClw==
X-CSE-MsgGUID: GvN1vaCHTkKjWD6pBmXtSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71325559"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71325559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 21:45:51 -0700
X-CSE-ConnectionGUID: NYCZBWL8RZGBKsMTDss2zg==
X-CSE-MsgGUID: gaOSPwu2SL2BhYQEuJNzuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248567285"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 02 Jul 2026 21:45:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfVme-00000000Bfj-0JUA;
	Fri, 03 Jul 2026 04:45:48 +0000
Date: Fri, 03 Jul 2026 12:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-riscv64 0/1]
 fs/incfs/main.c:15:25: sparse: sparse: symbol 'incfs_fs_type' was not
 declared. Should it be static?
Message-ID: <202607031223.E8kM1NFq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-riscv64
head:   9468bbec962e3f0fc30ebc511ea7f30789240293
commit: 84cf0402d4ab98f85c4a366b78bb12efd230efc7 [0/1] ANDROID: incfs: Use new mount APIs
config: x86_64-randconfig-123 (https://download.01.org/0day-ci/archive/20260703/202607031223.E8kM1NFq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607031223.E8kM1NFq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607031223.E8kM1NFq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/incfs/main.c:15:25: sparse: sparse: symbol 'incfs_fs_type' was not declared. Should it be static?

vim +/incfs_fs_type +15 fs/incfs/main.c

    14	
  > 15	struct file_system_type incfs_fs_type = {
    16		.owner			= THIS_MODULE,
    17		.name			= INCFS_NAME,
    18		.init_fs_context	= incfs_init_fs_context,
    19		.parameters		= incfs_param_specs,
    20		.kill_sb		= incfs_kill_sb,
    21		.fs_flags		= 0
    22	};
    23	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
