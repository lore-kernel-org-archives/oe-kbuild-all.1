Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF31136A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Jun 2024 00:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717200395; cv=none; b=LnLKUQkj5ctr9LV14a0qUjLNUvvufo/UhA2vn9Igb0Kqlc72PftjCCTKdADgV86qvpcJjGFxy8R3EFGSJzT33/d7JMzmT4Zgzmu6JLGF1Mf45A4o7H82Gu5rRQ5OVHwoo9xlL2/YSvl6EYPWY+yCd7037Jn81zFczMeyU7dh9m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717200395; c=relaxed/simple;
	bh=yp9Zt/5vSb7ekWLGlVsUad39e1Y4nLgpzrgskORnuzA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xb/gQYTaFJqRjJkhjGx2zoQmVkJuhFmdA8o13eqhhD/KFcfRaLTR0gxk7CXSSXsqqokftysS70d6VE4gElsF1Nx2gKFvrAA0pCFMXqlJnECro/g7mhUCtum/IGiAbCUz99YBHf8Cp/NrbVVc2gRXfwkVhTWHnWSVlMEmObn8gzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNTWm2rd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNTWm2rd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717200394; x=1748736394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yp9Zt/5vSb7ekWLGlVsUad39e1Y4nLgpzrgskORnuzA=;
  b=QNTWm2rdK5ul9wmDEpnMMCkc5o8JXN69ntulah7qkMG3Xoaj1AaTxxd/
   i7CRmQlPDDq4eCDLXr7XrnvupRsvTWrNAaSLPqq+L3aZAvbf4G1KOVVR2
   pgX+8rSgVxI7yj+eb4eC4AdwHtmiYEmXMkwI1ZVT25oF3V4MAZ4nWQE8N
   ZqzTROGBDdrutQQJPdMtkIMT8lTDeSWEsvjWYWPMXxtoQ5t+hRD1of2Iq
   ylP7vjopFjR3v3jE6zW7SNwrL2YYvMcpkeycLp/78g9S7I0Qzb8u8In3y
   9rGX8GigAx5Bwg6qSzbXYgLZjyLZek8l9NGGzzjOgkRS5Ij1qvs83TQwv
   A==;
X-CSE-ConnectionGUID: /DMjvou1SbaB4+C0MO2yBw==
X-CSE-MsgGUID: xVUcPfnwRGmltr+wNe/r6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13518197"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="13518197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 17:06:33 -0700
X-CSE-ConnectionGUID: 6f5SR9yPQ2+Q4d41zJDsIg==
X-CSE-MsgGUID: XQM0Sm3YS3S1mVwVB2rZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="40856862"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 31 May 2024 17:06:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDCGU-000I1R-03;
	Sat, 01 Jun 2024 00:06:30 +0000
Date: Sat, 1 Jun 2024 08:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18743/22626] /tmp/ccJZCoWT.s:2346:
 Error: immediate out of range at operand 3 -- `bic w0,w20,5'
Message-ID: <202406010715.TcWqtXea-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   d2901c3f0ff7d121adf97d64bd2cc3789821600d
commit: bba3f529a3ac03f6c6b8cea750cd48b355548d27 [18743/22626] xen/netback: don't queue unlimited number of packages
config: arm64-randconfig-002-20240531 (https://download.01.org/0day-ci/archive/20240601/202406010715.TcWqtXea-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010715.TcWqtXea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010715.TcWqtXea-lkp@intel.com/

All errors (new ones prefixed by >>):

   /tmp/ccJZCoWT.s: Assembler messages:
>> /tmp/ccJZCoWT.s:2346: Error: immediate out of range at operand 3 -- `bic w0,w20,5'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
   Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
   Selected by [y]:
   - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
