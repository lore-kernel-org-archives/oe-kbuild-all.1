Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692112119
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 09:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRIyeX+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697362395; x=1728898395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PCeNGCa68Fmh/kaTaKEGFsNWEM14yCm7cjL+1X9m9Zg=;
  b=NRIyeX+zEvG+01dxIyUHelawyzmHr81MtTkLjFwan+eVEzcEwD2lFB7n
   Sm9dpC6SxTi0d7BYxwXeOQVOBdJfCWbQXr+xJByg/vU5guwfwvzDfU8zq
   8K3kBKaG+qnSGdpJ2IFNljJMzSgrC8Hl9REPPP/XvqtKYRFtMpcWnoGf7
   ZPbLKwi2zimNdUEp9Rdp3szj3MbDFHw0jmGZu/l490ppOgTkel5O91Rn4
   TpxFa7fP6kJkdUqpQ44TXSOV0qHfMNapDey3CGVULFmYL3fQWE9NNXqw3
   OLLe9EpJxHYJLeAKBA6nL8Fq3ppNd9yVM/Qw2DrhX1j0RG06rcGNtH3qU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="471607220"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="471607220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 02:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705231508"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="705231508"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Oct 2023 02:33:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrxUh-0007Hj-1e;
	Sun, 15 Oct 2023 09:33:08 +0000
Date: Sun, 15 Oct 2023 17:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4851/15767] loongarch64-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202310151701.99h0v5rM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 77225c634e06fdb5ae7fcd3d52cb5dd7d2996acb [4851/15767] Merge branch 'mxc/next' into next
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310151701.99h0v5rM-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151701.99h0v5rM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151701.99h0v5rM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: la464 loongarch64 native
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   loongarch64-linux-gcc: note: valid arguments to '-mtune=' are: la464 loongarch64 native
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mfpu=neon'
   loongarch64-linux-gcc: note: valid arguments to '-mfpu=' are: 32 64 none
>> loongarch64-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
