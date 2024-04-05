Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA9C145B15
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 08:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712304998; cv=none; b=Jgko2WeJqX17lmXMRNQ9j27OfLxsv1BniokFG18Sa5G4c7lO7lg97NV0rWMYWtql5DI0fc/FhbP7XRGzrSPbUPLcGesiDgSkcYnagB3ba+r+N6u0+YDX55MBDsbTrYV5Sp2S8BqG4bBYxqpR6SciTx9In7lKHvXnPhZ9ECPyBP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712304998; c=relaxed/simple;
	bh=I2WP0h8sCoKoXZQ2n+DxD4wIbUIEV0HQW+mi+FlxkeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4KcyS/zO4pQiuz3kh2NUn+y3fVMf5lfgQ8sy9YJsq4xVmrHz3yUGl3ydBVpmnhKgUTA0LeKkbEbfpzaT0cOyGxGcWQB/3IsR/BVy+AH0ude7dxjRT6manbD3/ArUHIAsWMri/Wj+lyoD2GJN+Usj1zsudS6UVA075TyVNRF9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K31bonbk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K31bonbk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712304997; x=1743840997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I2WP0h8sCoKoXZQ2n+DxD4wIbUIEV0HQW+mi+FlxkeI=;
  b=K31bonbkhdjK/WiG2cZ9w6byj4hZH6IIBsfjr1+HJc5GhvWCSK/toHfT
   OSzARgQ+wCGDRgOasNYo7E6Y3x+t3l7G3yyd4gfe9yLVzEJEjU79stumW
   LtHoZV1I6HiVakX2w/xZV1u4ZgmY15ptephrLVs02JOD9Fu6moQaY5H0e
   FnBo9PvsYddO6DE5KZ59KN91+equZveaP6a1cZGZUJycsA2C5olFZJ2Ub
   5Kc3Mxr4mD7tFgYvUXQ+7sCKRNuFwy3kPzATSol0ofRxCAS/Ia26sAsjk
   9Ds8lAArJadaVWbHobzWDa1+65IreSBO21V5fHbuxUad5A6ClbpeRhnnw
   g==;
X-CSE-ConnectionGUID: vqGaFvkMS6ufoEgP2sj5Eg==
X-CSE-MsgGUID: 46y6fAhJTxmO5Um/D3AGfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="19060022"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="19060022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 01:16:36 -0700
X-CSE-ConnectionGUID: jfhrcoXOSRiKqrRyvyy/3Q==
X-CSE-MsgGUID: 3h/yWqgYSByvwO9w/e7Usg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="23732198"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2024 01:16:34 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsekR-00022g-2z;
	Fri, 05 Apr 2024 08:16:31 +0000
Date: Fri, 5 Apr 2024 16:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 4050/4242] loongarch64-linux-ld:
 kernel/bpf/verifier.c:20223:undefined reference to
 `__SCK__perf_snapshot_branch_stack'
Message-ID: <202404051659.aawUkGUQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8568bb2ccc278f344e6ac44af6ed010a90aa88dc
commit: 314a53623cd4e62e1b88126e5ed2bc87073d90ee [4050/4242] bpf: inline bpf_get_branch_snapshot() helper
config: loongarch-randconfig-r021-20230624 (https://download.01.org/0day-ci/archive/20240405/202404051659.aawUkGUQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240405/202404051659.aawUkGUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051659.aawUkGUQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: kernel/bpf/verifier.o: in function `.LBB2972':
   kernel/bpf/verifier.c:20223:(.text+0xa814): undefined reference to `__SCK__perf_snapshot_branch_stack'
>> loongarch64-linux-ld: kernel/bpf/verifier.c:20223:(.text+0xa818): undefined reference to `__SCK__perf_snapshot_branch_stack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
