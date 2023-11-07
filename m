Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FD5328DA
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Nov 2023 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bw3bGEmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699374630; x=1730910630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/LDXkJILMnSOo5v6Me3FVFf3joS6KXoA2ShYlBnuf1Q=;
  b=bw3bGEmZ+slPTeXm4An6dBWNM00LWx3pSA+L10RTX+iabawAo7Fxr5iB
   d1pIANP+PtKIhH2QDsbfTrgblBoLaXMqzTfN47jnkk17QbAXeV31F6nJ2
   AlC2gH1BHsTuIioYiqb8Gr72Of4TVxxKbeqfv7s1MjRkUUquxRzFCncOp
   eZhcTWcq6rrFWHFXPtfIrsjYDgA+zY7pByK5hRSvHebC1K3kjvCv73Dkk
   w0G56y8NvpSIt3PgPrrbH7DcJMo15zBLCUFdAD6Tp1Pnurk1alkRvRY1o
   UmPXg+OLPBlZxPw3CNzb9PWHEEQvx01Rvtl8LPw/pKSBBVm9lKs9hNPKl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="379942848"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="379942848"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 08:30:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886346693"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="886346693"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2023 08:30:27 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0Oy9-0007Dq-1H;
	Tue, 07 Nov 2023 16:30:25 +0000
Date: Wed, 8 Nov 2023 00:29:24 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 2/15] arc-elf-ld:
 fs/verity/init.o:undefined reference to `fsverity_require_signatures'
Message-ID: <202311072305.uS2gEAnt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   107fa261565f93b888f89afa60d3c75914955461
commit: 85625dae2927fcd9cff9620b68fb09c6367587d0 [2/15] aio: rm sentinel element from ctl_table array
config: arc-randconfig-001-20231107 (https://download.01.org/0day-ci/archive/20231107/202311072305.uS2gEAnt-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311072305.uS2gEAnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311072305.uS2gEAnt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-elf-ld: fs/verity/init.o:(.data+0x4): undefined reference to `fsverity_require_signatures'
>> arc-elf-ld: fs/verity/init.o:(.data+0x4): undefined reference to `fsverity_require_signatures'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
