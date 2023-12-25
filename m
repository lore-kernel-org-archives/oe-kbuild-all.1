Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BACB537E2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 18:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OalkQwja"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703527491; x=1735063491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lSlGKptBzJFjO63Hi1KCJD65iFcjdGWTmXSHPFW4AIw=;
  b=OalkQwjaL/lll+R76iB63dtIIVf/2z1QuVE+ALwhw1HETeTMKhiwsN9X
   SKvwjZvLoBVMjhZFmrh+bzqmmq8ZfWpi0/9vGujJvw6MomhiUFFjigSzn
   Ei1hfOzcQlmK9OPn5mo6Pk4f8u6GwgRfSAh8ToF0ZdVeWviTNCpQN6SZe
   opKTjPPM7lsq7Uwa21kx+YPhCDWfGgWvYr6ryI5mLw6u+R3YihSqwEyCF
   VoL7xStFeUSzXkakq6Q6WSMx5BRymlc/5tBsNU5t+6ladx8BP7OHPBQRf
   oAv1SJFK01jOj1o1OF9iYVoKxBUol3h9c21QsCKcYNDadWfPKUtymU7MM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="482474153"
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="482474153"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 10:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,303,1695711600"; 
   d="scan'208";a="12249105"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2023 10:04:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHpJh-000DXj-2T;
	Mon, 25 Dec 2023 18:04:42 +0000
Date: Tue, 26 Dec 2023 02:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 21/27492] ld.lld: error: undefined
 symbol: create_function_device
Message-ID: <202312260207.XbLZKtTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   55f6a969754a9c9d51d385edf2a4d1e98d6dcd50
commit: 1983276ceb62da2dda057c83fe676916b51fe939 [21/27492] ANDROID: usb: gadget: f_audio_source: New gadget driver for audio output
config: x86_64-randconfig-073-20230830 (https://download.01.org/0day-ci/archive/20231226/202312260207.XbLZKtTb-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312260207.XbLZKtTb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312260207.XbLZKtTb-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:162: at least one side of the expression must be absolute
   ld.lld: error: ./arch/x86/kernel/vmlinux.lds:163: at least one side of the expression must be absolute
>> ld.lld: error: undefined symbol: create_function_device
   >>> referenced by f_audio_source.c:1028 (drivers/usb/gadget/function/f_audio_source.c:1028)
   >>>               drivers/usb/gadget/function/f_audio_source.o:(audio_source_alloc_inst) in archive built-in.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
