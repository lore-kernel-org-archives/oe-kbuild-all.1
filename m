Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA1219309C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765590711; cv=none; b=Hwm/Mq1M+3cFHXboyB/XOJKb7eTr/KoSITd86IR9vGLepBGqf5xx2QcUHyhZH15gSlCtXgNhiI7+TJt9ee61ThtXk+YAENYDSOshX8pFzHf8gCeo2yB2RL5zZNQ4PhDqgKYeKQXOb0uCyf+ssbt6Bgtb265qCMWOqCN9vy5G6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765590711; c=relaxed/simple;
	bh=011QuEDEp/Jbm8B5VAEVViawF5UQL98WsIT1dAnE1vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVLLjpNzn5h1/FUMzSnoiF8rifKDwVegOKVJh38DWZv5VSle9G6s2/4cXjTcbjo44JgUPmUCnDTvZruqQsDM7CoRPSF02HhlOu2ip0e3e0ia5N0NT31496tZ1VJvD+em6EkGRwK1RZt58G+w/tLdtD0yz/MsaOcdmjJPRznhTXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIjsnxZy; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIjsnxZy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765590709; x=1797126709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=011QuEDEp/Jbm8B5VAEVViawF5UQL98WsIT1dAnE1vo=;
  b=OIjsnxZymmHXBeQIXCTX7HAFuOqK0zc/KlH5VX74a/RpmerjlTBvuecp
   oJ/Upiy3hQ1tmY+24WLV6xU1hicXyHLhhGBpKR8B+lZdIOmX3Wy04EOwH
   qtvHMnU+GVJRUG40kT9y7on3w0ZxzJNsR6R83GKPCXChlWUG/xbG/EdK8
   nIrbz0aK1bRbEsbD1LnPSAvpZXsWadb0B4oQL5HJYMxI7AGmfNlX/PZ5a
   2F7Qve0USbvrGC04TEaO7BzGFmLUV9Wu1QmcEJ0I/KRD17CsDo1RKhdqF
   Q2iwjuL/PPaOnjESsHbQXxvvVlFc7xdHC1Y+u8JpZdEeUR91SgO5Q1jzA
   A==;
X-CSE-ConnectionGUID: OFp82fhhQGaOtYnQGLCGbA==
X-CSE-MsgGUID: uai8TxLzQiSM4e1ZJtO0Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="93068555"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="93068555"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:51:49 -0800
X-CSE-ConnectionGUID: CJJEeKCOTqSf4DeWyfNKOg==
X-CSE-MsgGUID: fRpJx78ATlWDmjQVsMyKig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="198051992"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2025 17:51:48 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEnR-000000006uM-3xQI;
	Sat, 13 Dec 2025 01:51:45 +0000
Date: Sat, 13 Dec 2025 09:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/android/debug_kinfo.c:66:30: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202512130903.M4PxXEry-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Carlos,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   48776802cab71a77ba2ad75aae59a6f475da6efc
commit: 42d3f1efd81dce695f71ead4d3a81e94efa92eb2 [1/1] Merge 806381e1a24c ("Merge tag 'powerpc-6.17-2' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux") into android-mainline
config: arm-randconfig-r111-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130903.M4PxXEry-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130903.M4PxXEry-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130903.M4PxXEry-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_kinfo.c:66:30: sparse: sparse: Using plain integer as NULL pointer

vim +66 drivers/android/debug_kinfo.c

1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  59  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  60  static int build_info_set(const char *str, const struct kernel_param *kp)
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  61  {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  62  	struct kernel_all_info *all_info;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  63  	size_t build_info_size;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  64  	int ret = 0;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  65  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16 @66  	if (all_info_addr == 0 || all_info_size == 0) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  67  		ret = -EPERM;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  68  		goto Exit;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  69  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  70  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  71  	all_info = (struct kernel_all_info *)all_info_addr;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  72  	build_info_size = sizeof(all_info->info.build_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  73  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  74  	memcpy(&all_info->info.build_info, str, min(build_info_size - 1, strlen(str)));
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  75  	update_kernel_all_info(all_info);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  76  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  77  	if (strlen(str) > build_info_size) {
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  78  		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  79  				__func__, build_info_size, str);
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  80  		ret = -ENOMEM;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  81  	}
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  82  
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  83  Exit:
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  84  	return ret;
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  85  }
1a9c7b3e3bdd87 drivers/staging/android/debug_kinfo.c Jone Chou 2020-10-16  86  

:::::: The code at line 66 was first introduced by commit
:::::: 1a9c7b3e3bdd87a10205891806a0d880fe27230c ANDROID: staging: add debug-kinfo driver

:::::: TO: Jone Chou <jonechou@google.com>
:::::: CC: Will McVicker <willmcvicker@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
