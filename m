Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11F0213253
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 17:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736529401; cv=none; b=uU78gxfFsKIXmEzSTYmhwb0FdcUyNIgGXQ1tAY1bDchJOWQ9d1XVdxgKyhGohn9zREN84ARl+d23KRhY55+rZCiMOHQGYmSZvR5v+3S5Yw8KNns/vSZ52QRImswIk5guDu59s+Oect6WL9FJgyZAzOSUdQRbzgu87a0D2iBJkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736529401; c=relaxed/simple;
	bh=4sc4Q3utZ59FHLVAPU1CnfEzi3gzJeLsZ/jXsWc2Kao=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYG1RUtsgDDVq1po894+iJlHDZ1JZsi+PTmTLlHylifeMUUwaEpmRdBt1LtJak/lykViSp8Vc3KU0/3H2BvYK9yU73pRv5iGwFLEQINMKGKMgik6aDh8JHODu8UXn91tJbiWnKck0SHZG3rSzVxWeC7F5iWZhwTtxWBGHJQQGRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZrKaNWN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZrKaNWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736529399; x=1768065399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4sc4Q3utZ59FHLVAPU1CnfEzi3gzJeLsZ/jXsWc2Kao=;
  b=kZrKaNWNVDU4tOLez5uTvB/TjuBprGJ9xYjzmmToiNWkuOgIwJAeHRYZ
   rWrQKvucOr5Y7GaWQ6LztIy//iyoQQ3PkPoxfqVrOVfSnhb5H/nVKxFj2
   yyqhP6mjYr47Kh/QhWmoUxLxNxLhTdHugEEDPS8WUhM6S/2ZVITIHcrSs
   3gSbYpZJIuyKX4Ujcon7wH8z+iUFiZC982/791u/jNpftbHacOl+35MN9
   1uxYdlI4pHfjzXUdWtum0AnTokn/3ht6KqdVNfHq5KvP4dJM9Dh8YC1Vs
   HABXsRcso0U/teXapHFIa5NGPWXR8EZwfuk6ICMxCO0iXRoIqZPVInfzz
   g==;
X-CSE-ConnectionGUID: 2JPm1NYeQ3mbhrc3emgecQ==
X-CSE-MsgGUID: QnWHsetlSKaEsEw09aFYVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47403962"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="47403962"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 09:16:39 -0800
X-CSE-ConnectionGUID: o/fUUCHOTKaNVWlxua4Q7g==
X-CSE-MsgGUID: 0wYJ+xxeRhuexD/IzXY0WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="108795260"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Jan 2025 09:16:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWIcd-000JWl-1y;
	Fri, 10 Jan 2025 17:16:35 +0000
Date: Sat, 11 Jan 2025 01:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1] kernel/bpf/cgroup.o: warning:
 objtool: __cgroup_bpf_detach()+0x7ce: unreachable instruction
Message-ID: <202501110153.wv9v7M1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   c6c375c99eb5a2435e39f3c3a3416a838cfd1637
commit: 3527e3cbb84d8868c4d4e91ba55915f96d39ec3d [0/1] bpf: Fix KASAN use-after-free Read in compute_effective_progs
config: x86_64-buildonly-randconfig-003-20250110 (https://download.01.org/0day-ci/archive/20250111/202501110153.wv9v7M1h-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110153.wv9v7M1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110153.wv9v7M1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/cgroup.o: warning: objtool: __cgroup_bpf_detach()+0x7ce: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
