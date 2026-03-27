Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A83D75C2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604784; cv=none; b=sza+glCD3QyXbBagak0A1dLUNUMjCVqS2STbtBIY993agk34m9zlp6mj6vX7wNkGvq5a1/183zRYCO297elqJinG1h81PQksYK71KXTFpdGlTkkk/puJ4CHG5QM7lRS3VFxDYMz7rDrXtV767NFDxgWEt0fBI17zvN2dLaWhnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604784; c=relaxed/simple;
	bh=ez/GxxWfz7fcfKfx0UrkVg2Rv3Z9+XqzEQ8/tvDvWzw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y9Rf7Kt1hPyOh4Fif6L1Xg48x7cyjdR6nL/7Sv7eHDA1pnzXoO7XjfWlSyW1twAsRVHuouJObFQYh2D4VMQn5emSs58u/QYBzanRF/IT0lPeQ6/3+t7Tr+Wb/2rf/1Ud4iE6jrpQpUcN3P/4Of1WCFjWnaRLtTIGvOZ6vu2axUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXfcGKiI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXfcGKiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604782; x=1806140782;
  h=date:from:to:cc:subject:message-id;
  bh=ez/GxxWfz7fcfKfx0UrkVg2Rv3Z9+XqzEQ8/tvDvWzw=;
  b=RXfcGKiI3kMHNJygbj8kAAH79pVsnGIJLSZhMa/JRM4fT0fjpOMhWMuA
   IqXErNySUVsfDudsb+qcGPag/Vp7Z7u1t0UnZEnu7PjFO5TbVcv67CEgK
   uvQYPYWVg0mC2PS7EyltqIQsqxbVeBxgz5xmjB2rUcLbDKn+0HOaEckNY
   FDthoPKOwitX5V8yTe7+AotL7rJA6w8UWTDQMZkM5wOx/28YQdKNy/fOL
   2CK4WKzigVP2lgWDkgkpB8BgyvlNcmQipPTdRAW35US3VIbDrcGt/CyCF
   lN0/VaHnC5/H73d8BqGPEU7Po8+BohfdssO2fXp0UxQOR9FEjJ5aP13nD
   g==;
X-CSE-ConnectionGUID: YQ7Wc9e+SyC5os5ICpDM7w==
X-CSE-MsgGUID: rb/kSCA/SY2SGX7/1bNjXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="101135217"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="101135217"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:46:21 -0700
X-CSE-ConnectionGUID: ErGwbpDJTTKSHv8zTsgbdw==
X-CSE-MsgGUID: oTZR3NtATguEX5Is9b9t/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="222393274"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2026 02:46:20 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w63li-00000000A85-0SK2;
	Fri, 27 Mar 2026 09:46:18 +0000
Date: Fri, 27 Mar 2026 17:46:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 25/27] ERROR: modpost:
 "torture_sched_setaffinity" [kernel/locking/locktorture.ko] undefined!
Message-ID: <202603271720.pkB1CgQm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/paulmckrcu/linux dev
head:   bc9d500f1f9bb52f09c7b085c08fd0319ad756d3
commit: c34dc928341480ede82702b6ee0e594b06e9c07f [25/27] fixup! torture: Add a hazptrtorture.c stress test
config: i386-randconfig-003-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271720.pkB1CgQm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271720.pkB1CgQm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603271720.pkB1CgQm-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "torture_sched_setaffinity" [kernel/locking/locktorture.ko] undefined!
>> ERROR: modpost: "torture_sched_setaffinity" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
