Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95918883F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 22:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791325580; cv=none; b=esOmIKWDjVa6UwZv+daSz3kyrGuJ1Jz1LvwvaZ/kDlMjsdv54D8BQRk7+4uHNG0ZaUpd0iFP8+V7e0vk2UiIEDB+zT4Q1J9JgEzedu6XxAXCWcGhzPL6pOB8uj/jFihXVVuG/lmMK3NF3HGGJmXFK/ggul68LMpmxk+DvKWooAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791325580; c=relaxed/simple;
	bh=er7Nkd4TgdffP26owanVc0w7EYzVgBuCJwS1PTZoZR4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V/1ZjuW7FrFDTvpPtYPYhs4ts+QIHGD+jm0ONhdWkmpDzBqgig/P0DPoff4xpJ3DGTbJaciikdDcMzlDCg/zYvhZloodS6WeDf8taDMi3DF3qT62kRkMeGDIkalahbZVAsztQ2CXyPRT1QPiv+7ZLZkIl/5t/nK68R8xUHtz91o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CuKP3mZD; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CuKP3mZD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791325579; x=1822861579;
  h=date:from:to:cc:subject:message-id;
  bh=er7Nkd4TgdffP26owanVc0w7EYzVgBuCJwS1PTZoZR4=;
  b=CuKP3mZD15iUDjbnjXe/P5mI+7et3SNsCgJ+G5XeCvD1/Y131x5xMkQA
   cEO9ApDja6Vm/BIZORb+v4sEa3HqORPqjtqaL0xrjuEPMxqHvnhHirKj8
   pUHLfg/3xv3go9hwWqQhhtr0d7Bj8hwh8ASWQA+CxedYZEGjnRqSFERwu
   fOqo+3bAv/i/Yu4sTPRgUHU6lRP1QiwM5aIfh2rzmU4YKX8T+dkBMKW7t
   hhGAW9Hagy+aWssp9l2ksnR92E4HOk/3kpLz7NaxSw+cloniYA6Ovy4UN
   0pEYqlHf1uABK5CdPcP6++rj40TDDbyV9gKiCM+tOkO3ADFmcN6aRp4Lo
   w==;
X-CSE-ConnectionGUID: QySEK6FiRKK8IRUmXfA3ug==
X-CSE-MsgGUID: wfN4nQtVT3GfkbrGy1/lRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="90667"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="90667"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 15:26:18 -0700
X-CSE-ConnectionGUID: R1lQEdQWSAyjovE/+TxyZQ==
X-CSE-MsgGUID: lMJat15STAaAarO4xGLnaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="277414551"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Oct 2026 15:26:16 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEDbx-000000002CG-113t;
	Tue, 06 Oct 2026 22:26:13 +0000
Date: Wed, 07 Oct 2026 06:25:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Sudeep Holla <sudeep.holla@kernel.org>
Subject: [linux-next:master 8264/14724]
 drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
Message-ID: <202610070641.B8hxBJcf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: d8263a131bb05398faa72ac32be54a03e48fa197 [8264/14724] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
config: arm-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070641.B8hxBJcf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070641.B8hxBJcf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/smccc/smccc.c: In function 'smccc_devices_init':
>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here
    }
    ^
>> drivers/firmware/smccc/smccc.c:141:1: error: r7 cannot be used in asm here


vim +141 drivers/firmware/smccc/smccc.c

d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  122) 
b83c2d92be719bf Andre Przywara         2021-07-31  123  static int __init smccc_devices_init(void)
b83c2d92be719bf Andre Przywara         2021-07-31  124  {
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  125) 	struct arm_smccc_device *sdev;
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  126) 	const struct smccc_device_info *smccc_dev;
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  127) 
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  128) 	for (int i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  129) 		smccc_dev = &smccc_devices[i];
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  130) 
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  131) 		if (!smccc_probe_smccc_device(smccc_dev))
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  132) 			continue;
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  133) 
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  134) 		sdev = arm_smccc_device_register(smccc_dev->device_name, smccc_dev->func_id);
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  135) 		if (IS_ERR(sdev))
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  136) 			pr_err("%s: could not register device: %pe\n",
d8263a131bb0539 Aneesh Kumar K.V (Arm  2026-09-23  137) 			       smccc_dev->device_name, sdev);
b83c2d92be719bf Andre Przywara         2021-07-31  138  	}
b83c2d92be719bf Andre Przywara         2021-07-31  139  
b83c2d92be719bf Andre Przywara         2021-07-31  140  	return 0;
b83c2d92be719bf Andre Przywara         2021-07-31 @141  }

:::::: The code at line 141 was first introduced by commit
:::::: b83c2d92be719bf7b1d24ac02aaa53db3991ea58 firmware: smccc: Register smccc_trng platform device

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
