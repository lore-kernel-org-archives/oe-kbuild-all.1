Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3763F6C50
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547501; cv=none; b=JWR+jTk9nc0p8eGgePPVBVqJqarVlab1PKqYhuCo12AvUetQx4zM3v07Cj7tJEu4HeW7RjTT7i9olf6fNLGgAWd48nIOxHSrwjGkoIRLuhb7/CUAEiH3cS3Xp05ErvibsYwhHv0USXFr0V7CHzwbHxwqtm1GRJCmzflGBBXMoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547501; c=relaxed/simple;
	bh=ewv8ji4epaaYd5+RiDLju/RuZe10hIQf8mpiRQPHGAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OvKWns2d9FFG7KdNXri4tkPDoURbxtfjbwQlVNQgOPdRHbLvGpayLz78+WZGveHCjtBRrgCzUCWuvP/iVD29H11Ehl+svbTNdcS69rDWErjcIW3yUq2MkYt/Bl/hdonmQEnq/+90LAA0fYiUBYbo7nxFgq+Ts/Jpf+WA/8GtMN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l2sZj44Y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2sZj44Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783547500; x=1815083500;
  h=date:from:to:cc:subject:message-id;
  bh=ewv8ji4epaaYd5+RiDLju/RuZe10hIQf8mpiRQPHGAE=;
  b=l2sZj44YRaWY8/t7YSHEKwqkc8NfZVi6GA2gFnzkDUurAySo9G+v4HKM
   GoIFMUe0CezdL38BfQC9rbUxL45rwYHCEGS4WoczchQ/KhR6NmrTCy88d
   ainktg9Mr5iFNAmRr8WE46s0EtZaj6y3QXr/UosS7rYJhW78HpTPHHo06
   V2U+D2G56BcOY+4qUB0IjVaUQeYuYQfRNrcvw9NLsj4cFIOiif3T+Sugp
   h87fiASZCrHBanxVxj+HGm5Ks6L4c3g7aiiKax6rghZCsudX+/r/fnbXY
   n3s9+zcPd5Ra2ZKuqsnaPAkfBCc7BdJVJMlMMbHlXhrc0O+8PB9AYDAGk
   A==;
X-CSE-ConnectionGUID: HQyDZixNTbCZ0XCu+lpIRw==
X-CSE-MsgGUID: +b203xZLQa+Ii3/mQv7FEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84320167"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84320167"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 14:51:38 -0700
X-CSE-ConnectionGUID: YAx8H4XhSoqN4W7kRg7fHg==
X-CSE-MsgGUID: o/tFEMFnQlW9N1ODFAJ7pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="251750196"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 08 Jul 2026 14:51:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whaB3-00000000GvD-1ewQ;
	Wed, 08 Jul 2026 21:51:33 +0000
Date: Thu, 09 Jul 2026 05:50:58 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v2 1/29] Warning: fs/proc/proc_sysctl.c:1568
 function parameter 'fields' not described in
 '__register_sysctl_table_internal'
Message-ID: <202607090528.JXFaLYAZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v2
head:   0fcca653c9166d508d6a901c3a0b8f786af3dcb8
commit: 521e244d88bb8c47d551f2954fd22cae2dbac323 [1/29] sysctl: add typed field descriptors
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260709/202607090528.JXFaLYAZ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090528.JXFaLYAZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090528.JXFaLYAZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/proc/proc_sysctl.c:1568 function parameter 'fields' not described in '__register_sysctl_table_internal'
>> Warning: fs/proc/proc_sysctl.c:1568 function parameter 'ctx' not described in '__register_sysctl_table_internal'
>> Warning: fs/proc/proc_sysctl.c:1568 expecting prototype for __register_sysctl_table(). Prototype was for __register_sysctl_table_internal() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
