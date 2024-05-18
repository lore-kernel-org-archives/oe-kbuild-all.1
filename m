Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269CF15AF1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 14:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716043957; cv=none; b=lBAGyEo8ERdHv4eVkxCni/tGVPmXRrKRiYdalYkyoV8oCDQVia3X1F0KZP+dSBWO2ttkwzrwa9jJjbU2ZCiVqh/CuijTtSIcl6QBJ/ZjdA1KzJbylFdthLJ8DdlrYyxu11ovqP99ngk80PyDglJa9I1msr8bGP5de+d7PaXBYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716043957; c=relaxed/simple;
	bh=R3D2nPiyohV6BgyznES19OdMPwuhf6bM3drXEuGTDjM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=giO/eIk6vZOk+sM05xJTOPmUPzxE+yC8iTU8a2NODCnJzMFkSfI5ckhsd6DmPcZeliKe3QmpiCZv9iFLuVLm5QYZOOlVwwOSZKtLfayBLyx3aZ0TT6Uq35IwLpNKLo/T4GGa4fr9+KXVRctJdvFaM8+0jClbRimasEYEObAW6sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFcF2NFA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFcF2NFA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716043955; x=1747579955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R3D2nPiyohV6BgyznES19OdMPwuhf6bM3drXEuGTDjM=;
  b=oFcF2NFApGV4jtpkB4/JXSmsZbW+qCnXAP3fCOueTIgDgO14ufsLjblk
   Jun9iSpSSDCjsmzX2LN7WHarDpHK81W9Gg8NYVdy5gkOu42FAEblFM+MY
   CAMEPCvcnjlP84+Jq/mkR4jkrj4IYHMzc9QbnI281r0tMR/M6mcwl4nqZ
   b5Yddxj/+aE0eZNFfcldcipKvWYvhkP1gcwiR1dyyR6ZRHvDwLmeNUCkP
   4QX47Vnec4Ia5rlTaiZcW1Z86Sm6owefVO6L07hsRonkEv65LkpNMEYL1
   axmUW8/Ub0LTLsfqGdX1llwz1VD5hl3ajOprL9eh7hXiAMmJ0jaldpF8X
   Q==;
X-CSE-ConnectionGUID: 7Sekg9ZMR+uK0rk9NMzQZQ==
X-CSE-MsgGUID: MM47XcAdR3Oc7vgT9EQ6EA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12161222"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12161222"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 07:52:35 -0700
X-CSE-ConnectionGUID: xAp8xEnxSsejMjZVcbtHpw==
X-CSE-MsgGUID: aZEmNoOQRJq9GheZZM731A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="32100951"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 18 May 2024 07:52:34 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8LQB-0002Ic-2Q;
	Sat, 18 May 2024 14:52:28 +0000
Date: Sat, 18 May 2024 22:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.9/prjc 1/2] kernel/sched/alt_core.c:97: error: unterminated
 #else
Message-ID: <202405182231.djCb4sm1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.9/prjc
head:   90e00625dbe63d991978337198b3c43a1df585c9
commit: a5cf192fb67a06d43cb21229a16b58aaf671fba6 [1/2] ZEN: sched/alt: Set default timeslice to 2ms
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240518/202405182231.djCb4sm1-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182231.djCb4sm1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182231.djCb4sm1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/alt_core.c:97: error: unterminated #else
      97 | #ifdef CONFIG_ZEN_INTERACTIVE
         | 


vim +97 kernel/sched/alt_core.c

    92	
    93	/*
    94	 * Time slice
    95	 * (default: 4 msec, units: nanoseconds)
    96	 */
  > 97	#ifdef CONFIG_ZEN_INTERACTIVE
    98	unsigned int sysctl_sched_base_slice __read_mostly	= (2 << 20);
    99	#else
   100	unsigned int sysctl_sched_base_slice __read_mostly	= (4 << 20);
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
