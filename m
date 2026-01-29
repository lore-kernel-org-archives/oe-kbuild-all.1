Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD4A2F4A05
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jan 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769679650; cv=none; b=V53dtvO8Aweg/iv5IUUWmheMsno3a8Y5N96ut86VKbeB4+aLOukCMVI0a5V0PfnLvFJtYsSTph2vojAeGsIiGYDHFPeWlD8gdFLqPjr/qryUuwPQjBBjf944ASqeDHsJn6aaGgAXcScc85D0bEM+68nF0wXLbJDjv7qudSxZOqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769679650; c=relaxed/simple;
	bh=vSNvGe2smOpsUd484WJuZdTAwxkjgPo+o489vUER2Zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AcnWAtqd0WHuFinWXtPTtJOnFInfHTECnvzGm6o6LB5pV/F4pHuzZZvw3RV0P8eX4MBBweUkmlTsTEXfINkkw/dV9HhbM86Fz1HeVN5SZvMxtvt4QQcR9fbTE13AnFk6GXiGJe/LI+fOJ/8y0KVPtRWOjSX0eEHv10NMLyD6u1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcBtmsqy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcBtmsqy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769679650; x=1801215650;
  h=date:from:to:cc:subject:message-id;
  bh=vSNvGe2smOpsUd484WJuZdTAwxkjgPo+o489vUER2Zw=;
  b=OcBtmsqyrrC8jPf03/gMh78rjX/MedMYfBz4sru/ta4rEU8KYyu0mQXq
   frszBW9H3H71bNhHaazne9LP5W3R05W4ffMenK5wImr/Uot19N6qn67FN
   9Vnioy2wqEEyOjpoJ1kE1FieGMBbrtdQIK8ZZRHU7B1XiYU3PHLK/bnSC
   CsSYQXTk4H02UpH2IxTRSBaY0GsgOZ2X1auS2R+1W8pXcjpdlsbnptVJj
   TqhhD9F+piSubCkktWPdO+X0CkdKsske5fqclQv+EUpTkh4HOkYWVTBrV
   lO9ZURPQolWUtgiOxctco+Aq9kKy+kM9zCWzK+IDoMe2sieuTNlaGOqXw
   Q==;
X-CSE-ConnectionGUID: DiolG7iXT0Ke69QpQUY3ew==
X-CSE-MsgGUID: bhWIwQIQRXSpt1WUmUgUlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88325599"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="88325599"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 01:40:49 -0800
X-CSE-ConnectionGUID: etAMO2MlTf6pyGpDY20Ueg==
X-CSE-MsgGUID: vMvPBhsmTyuFOkItzy43fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="213486968"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Jan 2026 01:40:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlOW4-00000000bKc-20V5;
	Thu, 29 Jan 2026 09:40:44 +0000
Date: Thu, 29 Jan 2026 17:40:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ulfh-pm:debug_pm 4/6] pm_domain_oc_aux_test.c:undefined
 reference to `__auxiliary_driver_register'
Message-ID: <202601291714.3YXivJXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git debug_pm
head:   343b4c4cd555617755b4fd2772fddfc707a5b9fd
commit: 66645a5157076a6c4dedcb43d442298da986c05a [4/6] pmdomain: Add auxiliary driver for onecell PM domain providers
config: arm-u8500_defconfig (https://download.01.org/0day-ci/archive/20260129/202601291714.3YXivJXr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601291714.3YXivJXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601291714.3YXivJXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/pmdomain/pm_domain_oc_test.o: in function `pm_domain_oc_test_probe':
   pm_domain_oc_test.c:(.text+0x58): undefined reference to `__devm_auxiliary_device_create'
   arm-linux-gnueabi-ld: drivers/pmdomain/pm_domain_oc_aux_test.o: in function `pm_domain_oc_aux_test_driver_init':
>> pm_domain_oc_aux_test.c:(.init.text+0x2c): undefined reference to `__auxiliary_driver_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
