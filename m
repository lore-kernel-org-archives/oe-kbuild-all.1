Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E20B56B65
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 16:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715444357; cv=none; b=CAI0+S3AtRcf70DvNj+cvBjonShOjb50gtW56ITi9DupBiPbhIpfO7VugV2+rGvm8t0w7j0SxACZSqzQ2/0a8FMnpAbrpJ74MWFxi/vD23cTAHHtTJU4bmGJtBoF8HclfTU1F28V86vLXj/VejWG+8aDBP16PC5HPAB+smm0sUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715444357; c=relaxed/simple;
	bh=dsCS9n/Ieu84vzt0KLlxTOpYYUtzczjjvroWcH1+wmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GM8ypVfsra91QkMtmb2I6AGcO+RIME5Cj0enDD36YlX2amVQt/DYEugw66v8QfxzFMwrI3AB/iLCr7t7eVRpRFA/jJLfYffpJTqJibfIiJu/XqP2nhnSY0ml9XhqKo9afttb6EG7T+2p7FdoYnB8+D3ctB1Ivn9BwCkxue1xEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzNDaEQ7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzNDaEQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715444357; x=1746980357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsCS9n/Ieu84vzt0KLlxTOpYYUtzczjjvroWcH1+wmQ=;
  b=PzNDaEQ7OlXVAYzrQSmDjlUkZVGb7eHJCDTBquL7VBgP8XCcv7AdLArm
   AnMGNI3C3jIyTJ9F35y6r6fG4A9joa4SE6tlaMGo2f0uFPkURTzjml2gM
   29ya7FUTpZdSxuNQ5JjD+Rr3dGlgM4lQ+QOR3mzh3H2/uPkuBqIqG22e0
   0Oj+bFAEKuSj1D2+tgNju+qrdyWw81tCdbacTXXBseuajQ89LzMi2KyXI
   kfGFYKBMOTFKxRjZh5SwYdAJekVQObMncYc40nify96TRLv+UI8lg1H4d
   GtfmIwuv6YQm6o+6fCTz70o9D1j/CthSYHBh81fGz0OkAZdDhhEeqZBY1
   Q==;
X-CSE-ConnectionGUID: nchtBHP8TL2yxiN811lx0Q==
X-CSE-MsgGUID: 0UAvQAIjTbW7rEYuFt9ksQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11280401"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="11280401"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 09:19:16 -0700
X-CSE-ConnectionGUID: kt151ekvRwKCrzQr6ajvMg==
X-CSE-MsgGUID: 1OZc6VNJTbOQtfIe/S4Plw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="34596408"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 May 2024 09:19:15 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5pRI-0007cd-0z;
	Sat, 11 May 2024 16:19:12 +0000
Date: Sun, 12 May 2024 00:18:48 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/misc-patches 10/13] nios2-linux-ld: task_iter.c:undefined
 reference to `init_net'
Message-ID: <202405120025.GaFABc22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/misc-patches
head:   3c68876290b3daed7a2766d683c73bbb4fa5b3d1
commit: 32d03d460ba261b39cb694e6140d84f2f67c3f8d [10/13] bpf: kfunc for init netns
config: nios2-randconfig-001-20240511 (https://download.01.org/0day-ci/archive/20240512/202405120025.GaFABc22-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405120025.GaFABc22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405120025.GaFABc22-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/task_iter.o: in function `bpf_iter_net_new':
   task_iter.c:(.text+0x16fc): undefined reference to `net_namespace_list'
   nios2-linux-ld: task_iter.c:(.text+0x1700): undefined reference to `net_namespace_list'
   nios2-linux-ld: task_iter.c:(.text+0x1704): undefined reference to `net_namespace_list'
   nios2-linux-ld: task_iter.c:(.text+0x1708): undefined reference to `net_namespace_list'
   nios2-linux-ld: kernel/bpf/task_iter.o: in function `bpf_init_net':
   task_iter.c:(.text+0x17e4): undefined reference to `init_net'
>> nios2-linux-ld: task_iter.c:(.text+0x17e8): undefined reference to `init_net'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
