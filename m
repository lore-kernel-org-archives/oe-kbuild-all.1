Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECE38489
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Nov 2023 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYbU6AQd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932150; x=1731468150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZiwVZpu/w9V0HkVlGPbETi7tetu7DinGfS+gwcNH38I=;
  b=EYbU6AQdbgj5rE8l95xOkEY1+7+vWG/E2XhbnGhV+BxdVTd8edSluvlG
   u+/6gdRKLfR1jDLxCfKz8v8VSD0EoT4eLZdA0jan2T24/zfBMFx/cTBxU
   lBVkXjfSVO1BuoprK+zLULCl4zCksECbwhO6ydy3FjHspc01WF3kN8bUi
   HFw03RDHPmOP7SyBFe9yRsHkzHBrX5bHKX8IN3NmbiDb2fTCY5O/Z+12r
   xoGVHFGA3OcwEOEbKnLLDRzhufs5vGdmEWC9oJZ1p1/xISNPZW0fgt6ac
   +wNGzw8sfpITYCJMbfo5g8DtxrTFGZaiC7wcurv76xecd6iTNp+X+8joS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375599917"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="375599917"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011751026"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="1011751026"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Nov 2023 19:22:28 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2k0Q-000CnX-30;
	Tue, 14 Nov 2023 03:22:26 +0000
Date: Tue, 14 Nov 2023 11:22:01 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>
Subject: xtensa-linux-ld: a6xx_gmu.c:undefined reference to `qmp_send'
Message-ID: <202311141134.fwWgT7wL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konrad,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: 88a0997f2f949f1f7076adeb5d4fa4d684cca5bf drm/msm/a6xx: Send ACD state to QMP at GMU resume
date:   5 weeks ago
config: xtensa-randconfig-001-20231114 (https://download.01.org/0day-ci/archive/20231114/202311141134.fwWgT7wL-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141134.fwWgT7wL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311141134.fwWgT7wL-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_fw_start':
   a6xx_gmu.c:(.text+0x2fec): undefined reference to `qmp_send'
>> xtensa-linux-ld: a6xx_gmu.c:(.text+0x3093): undefined reference to `qmp_send'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
