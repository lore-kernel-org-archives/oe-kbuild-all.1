Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F315EDB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 04:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+gVHKuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697344658; x=1728880658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m+WsvyflPAaVY/ag7QuwVdVcduqCyNjcxjDxGxBaIz8=;
  b=Q+gVHKuCgP4gIK/Uqq6e9rVMN++s2ZUM35phg8ibQAIccqv0Qkwl27z7
   ZQw0yfYj0TNHdfROqKowoIA6kPGl/zs6xNiAf1f1Vy/gquvhvTp6ZzZKo
   Ova0cp/qz6eUg+GvVeDoVNS47u01CV/kONzZb85Zk8QYmk8SyvlqjpRmd
   qGnOdwlgAqoXUNPKjWT/MMIwvpRPgxgK6EF8z93CnNyPAlmIq91+xShtZ
   6xhZgooqcf41PBoCVfX4MpsbfBW+7RdNotwBFn8GI+enWD3dzsJs7e8ZH
   Jr1CTpjgtTutKD4JXf/T0f+/+9eslKj1ofQhgZ0mBagkHMtIoqyu7uP4S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="364725484"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="364725484"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 21:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="758970739"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="758970739"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2023 21:37:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrssf-00072N-2R;
	Sun, 15 Oct 2023 04:37:33 +0000
Date: Sun, 15 Oct 2023 12:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Rob Clark <robdclark@chromium.org>
Subject: [linux-next:master 10393/12130] a6xx_gmu.c:undefined reference to
 `qmp_get'
Message-ID: <202310151236.GmDkEW9D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: 88a0997f2f949f1f7076adeb5d4fa4d684cca5bf [10393/12130] drm/msm/a6xx: Send ACD state to QMP at GMU resume
config: arm64-buildonly-randconfig-r003-20221114 (https://download.01.org/0day-ci/archive/20231015/202310151236.GmDkEW9D-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151236.GmDkEW9D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151236.GmDkEW9D-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_resume':
   a6xx_gmu.c:(.text+0x30cc): undefined reference to `qmp_send'
   aarch64-linux-ld: drivers/gpu/drm/msm/adreno/a6xx_gmu.o: in function `a6xx_gmu_init':
>> a6xx_gmu.c:(.text+0x3e80): undefined reference to `qmp_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
