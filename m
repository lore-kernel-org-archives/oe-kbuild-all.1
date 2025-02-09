Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A38243384
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Feb 2025 02:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739068845; cv=none; b=Ham85eA6RAD0Yccj9TunLpieg7zRB8fufVgth61OXtCcgsPKWu6Gd4OLivX61evR0jxNtcz4hgnXOo4OfsiGMq4bELaLU+kx53TtdsxQz+T5GeDnqtOk/gNo5UFlzAqcoWPMxVe7MBd9+25Anwc2I12DZp6jJJpuCUjDsYrA0Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739068845; c=relaxed/simple;
	bh=OtoM8P5zIG2KJq3FxmAUuoo2PKkn0P0o4R+ctAWiMKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V11uUnd6E1RNzxZi0ZIzDEBH9HJJ/Z0MrWnqL+CsgBXpAExnrEg8jWYEbgLXa24WI1gdhjYTMZ1NqxM5RkGXN0R67RaT9h/VQNsh1Y7qNNRs8xu5X852idj6gRwfPZE0W3m5BrwOxz36XsRmU3VgiRPZIqgTItuzretr1y7t2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEzcW0L/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEzcW0L/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739068843; x=1770604843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtoM8P5zIG2KJq3FxmAUuoo2PKkn0P0o4R+ctAWiMKU=;
  b=iEzcW0L/dNPBA9vzyAOi77iynXWNCAlH9FXKbE51enBCGxQWFUhfXZFg
   Mx6ihwBqtWjpWtRbjd8KzjSm1VPnDMKMV1ejeN3zWxVNIuXejtato80+N
   GShNrM9TZFkc5ZQrL7aByCgcC1UbSmYXcpaOQIftyIFOiCIAehVdB0AyN
   uq7ohFhuY40GFfAH54OlD6oh0yV0dZekVAliKzQTb9IBCAnNNiwjsQbEy
   GqszUF17PUMSPfQZ2mRJx1RXIJi+0vrfoRMyuoG8VbwGNrMS7c7Nzewum
   ayXUy3lPybnCTiqh9IgVlHEv6RjONbPYH6AlsUlUV0jr5BsiHuKhup/NN
   A==;
X-CSE-ConnectionGUID: 2qGL8L9EQVaaDc57GBqkvg==
X-CSE-MsgGUID: bN/wB67KSEKH/x9z3Jr1kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="38876348"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="38876348"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 18:40:42 -0800
X-CSE-ConnectionGUID: VYCynjA6QemBSx86/8s3Kg==
X-CSE-MsgGUID: svGCBrn4QnqmcMixv0MnPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116468991"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 08 Feb 2025 18:40:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgxFP-0010y1-2V;
	Sun, 09 Feb 2025 02:40:39 +0000
Date: Sun, 9 Feb 2025 10:40:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 27/38] arch/x86/kernel/kvm.c:475:12:
 warning: 'kvm_cpu_online' defined but not used
Message-ID: <202502091009.jaVZJTSJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   4234e8b9df9e1902968f836d9306c026adf43347
commit: 24697ba30b9aa885e58d744b4004e3ba1748e301 [27/38] x86/kvmclock: Enable kvmclock on APs during onlining if kvmclock isn't sched_clock
config: x86_64-randconfig-003-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091009.jaVZJTSJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091009.jaVZJTSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091009.jaVZJTSJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/kvm.c:475:12: warning: 'kvm_cpu_online' defined but not used [-Wunused-function]
     475 | static int kvm_cpu_online(unsigned int cpu)
         |            ^~~~~~~~~~~~~~


vim +/kvm_cpu_online +475 arch/x86/kernel/kvm.c

   474	
 > 475	static int kvm_cpu_online(unsigned int cpu)
   476	{
   477		return __kvm_cpu_online(cpu, KVM_GUEST_AP_ONLINE);
   478	}
   479	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
