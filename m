Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B71EF09B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Apr 2026 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112490; cv=none; b=i50CkfSY5DhKRmAqtWhLbLrP2yHSjVV7fdnvS9xA17RjoZzTssi5zAZnS1M7RQdHEe/Xe8swioEqfkTlO8X/AfJkpSgtj2rsqGsI6oyOy8T0bdToYABh0O+ELYU5mG7ysNNRSt/+3IvpSxwq09nTDXgi7Yz7xII7kEDwTE3AL4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112490; c=relaxed/simple;
	bh=g3m0e5//UYk6YePbm0Vm4jDCJKfrdGjZfuqYvP8B6+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Em4VUGWVx4MrWTgs7tHcCEO0QeUyXa4l8LufD7DjwoLfxmLb5VCW6RQnGnZkH7cldXKLIW/9RDsDYIXvy29h8PQn7Wztvb7Aotl1uIgyGQjBZcDeEXemADXgV/VVU8ORd4mQjC3OxoEb8SjElTvfO/scLrOYNfIMTyg7xqH736g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIqeJow2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIqeJow2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777112487; x=1808648487;
  h=date:from:to:cc:subject:message-id;
  bh=g3m0e5//UYk6YePbm0Vm4jDCJKfrdGjZfuqYvP8B6+A=;
  b=hIqeJow2GpzKdKDhFyK6X2ezc380l8/rlf5igrHfuDCupSPPlJskXRCs
   b+9FAxfNe5BqIx89pPyQDKOSnQfJHRupoe6bJT7deQt3onSSaleQw5EjM
   kUhof8gESUois9dstAsK+YbaXEKRpw6R9vNQ4JY4+AVKDJCLplgXNXibo
   h3f2vzCy5FzuNpay5NhXu9eYLmjBb/kuC1FSO4zy8h7mBlW21I+EGz75O
   SNRqryKPlNtKCh7JxejL/v1gqiRlEhC7LfaJoC0W2kptndu0Y/ukB57c7
   pgor93xBEiIcnN5BhSi7tfUywY9JWWBBjZJicqpRS2r4OrJ5/Z3stmHtG
   Q==;
X-CSE-ConnectionGUID: K1uh85wOQouhyanVf6D+qw==
X-CSE-MsgGUID: Q2ATKJa+SoqhGPjNqAMGug==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="88776389"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="88776389"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 03:21:27 -0700
X-CSE-ConnectionGUID: nlQ1ENioS0mALC6+i2Ig5w==
X-CSE-MsgGUID: kck7GVqrRICJNk3yr/EA1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="256484132"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2026 03:21:25 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGa8Z-000000006dV-04Dj;
	Sat, 25 Apr 2026 10:21:23 +0000
Date: Sat, 25 Apr 2026 18:20:31 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:undefined
 reference to `xe_configfs_init'
Message-ID: <202604251839.mm6FSyrB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27d128c1cff64c3b8012cc56dd5a1391bb4f1821
commit: 16280ded45fba1216d1d4c6acfc20c2d5b45ef50 drm/xe: Add configfs to enable survivability mode
date:   1 year, 1 month ago
config: arm64-randconfig-r071-20260425 (https://download.01.org/0day-ci/archive/20260425/202604251839.mm6FSyrB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260425/202604251839.mm6FSyrB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604251839.mm6FSyrB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x10): undefined reference to `xe_configfs_init'
>> aarch64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.rodata+0x18): undefined reference to `xe_configfs_exit'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
