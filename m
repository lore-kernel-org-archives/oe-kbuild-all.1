Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3280A747F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Oct 2025 06:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761461325; cv=none; b=rdedSu6rf0vFK10p4CGPqPvU981u2yf/J0vTWvQuYXerN/q6M3D6eqGKj1gi+U35aDTPxFLYYZSzvk5lCVIr5myxJFi9zS36yr04P4frqgP+zGCigOboGYQHbK53aBuS+PEv7WUqWcd9sg6e2BqBzyxGjVFQ1BdIbQ1EgcRCbXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761461325; c=relaxed/simple;
	bh=3VA1Es/XopB20zl175E/cmzQSu3siM1f6rv177oeB50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Um9oJCBycgOg6C88uJI5KkKlJtimDe9Rp4JkPVjsf6Zndk1FlsITNS3/FzBtkXr/aFM7DaYjWaznR/xvTpXK8RSrbyEzRCZQpY5sDy8vmG7r1zD7n7ADNaa3M826KpOYozCkDdAVGPJkot0c1USI/BndZtM5Bor6IRysyJmMA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OfFccX62; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OfFccX62"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761461322; x=1792997322;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3VA1Es/XopB20zl175E/cmzQSu3siM1f6rv177oeB50=;
  b=OfFccX62uA5nUuXR1GlLzbPP/oK8I3k/BA3Jbz9qp8kemQUAbA0kfmkz
   ZInYZbafYTrzrGSRyXevfrhZr/c7yZKE+R6ve+9CsoPtqHAg3BUZ0hywb
   em+u/8tm4rTATl84Vj+Q7gkhkPIiJKRPPTPaWkBCHsABOvu0ltCBhg49B
   dYmNDhLvFFFnYWWce2cYPbnF0qQBbzqEHytxWVCuXT2b/bRHyMZ8OkVQW
   +oAXtEUnBmIypOatDfBf0eej6NxdUYrACi1LNNhCVsWs6H+a2ASqX1Olu
   KK/WmJbgGlDF3HRZXnYb0CKsyUog4jGYP5x8XMrMYsqij3IGV4s8IUKmI
   w==;
X-CSE-ConnectionGUID: oxPM+Gq0S/qPR2LXpbSi0Q==
X-CSE-MsgGUID: IWIK3bnLRai/0ssTtiJsYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51151961"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="51151961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 23:48:41 -0700
X-CSE-ConnectionGUID: p1bOyKzcQ3SD7owHl5CUZg==
X-CSE-MsgGUID: Qixio77ZQmqVJW1lCB50ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="183983612"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 25 Oct 2025 23:48:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCuYQ-000FwD-1B;
	Sun, 26 Oct 2025 06:48:38 +0000
Date: Sun, 26 Oct 2025 14:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1732/1732]
 drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable
 'phytium_spi_acpi_match'
Message-ID: <202510261440.yYSdGMBZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Malloy,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   ee55f6a88c1f70120d9cec8244c5cd10f0c4dce9
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [1732/1732] spi: add phytium spi support
config: x86_64-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20251026/202510261440.yYSdGMBZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510261440.yYSdGMBZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510261440.yYSdGMBZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: unused variable 'phytium_spi_acpi_match' [-Wunused-const-variable]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
