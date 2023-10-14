Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E524E570
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MoqF1Sk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697277310; x=1728813310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g94GrpJGNt6byKYT8/B5T03sC5hzYQ+jfVdZw/MvwtU=;
  b=MoqF1Sk6gmoZeLzfZo8I9nmJzZ1LbRPV3GzLpTHj7KhHqW2Alwo/KCHv
   gyk3pxydeE9qfX2vE14v8lQtTkXzTdOz8X6jK2wE7T+pV4gw1QzPGTpz6
   CEj2Z3Z5SoZeR2aNRauNp4F3WoedIR6DPEeAYKQK42LlClQYuLMsTDjgZ
   3KlMQuPnKDG44SbAinUXzFUhuTW6BIK2wFC1yF4THqernLAzRQBgC9QEa
   TiaDvGY3taAc2ZxWKblPbmalokuz9mCOBtI/9UMbtLFetmesiFtf18ZCE
   gxHC2usPY2cNcLQUYnNjUBbeixg3WyjODcWcdtXc9vHVjfKVTbq/F1lNL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="365582489"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365582489"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 02:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="1002265690"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002265690"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 02:55:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrbMM-000627-1f;
	Sat, 14 Oct 2023 09:55:02 +0000
Date: Sat, 14 Oct 2023 17:54:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [mark:arm64/cpucap/cleanup 13/38] aarch64-linux-ld:
 arch/arm64/kernel/cpufeature.o:undefined reference to `cpu_enable_fpsimd'
Message-ID: <202310141758.VUU3TsCQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/cpucap/cleanup
head:   4c5fc7356317632f143f0974732e70d7a3248784
commit: 73bee64e2740cd36dccc20ee586472ed267fabc7 [13/38] arm64: Use a positive cpucap for FP/SIMD
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20231014/202310141758.VUU3TsCQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141758.VUU3TsCQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141758.VUU3TsCQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: arch/arm64/kernel/cpufeature.o:(.rodata+0x1090): undefined reference to `cpu_enable_fpsimd'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
