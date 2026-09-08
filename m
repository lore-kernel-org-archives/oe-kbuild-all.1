Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155E3033DE
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 18:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892126; cv=none; b=Z8Z14EaB2UaiChJDkRzbVnwR+uOPG//57XJGhsMmvL43kteG2IR2GDlJd/FUY99VnQF0sO2tZ3u8aOebKvtorfK4crZxZi+3HYgRU0qq2T9iJif/dB99Y0eSHc+foGVjr+9h3TqiBDvi2ruJwF2AkjWBCkoA/mIepfp7f7XzZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892126; c=relaxed/simple;
	bh=4QC3dGJyGpPbpwbjHo/yjaPMFLwZ9S02NYhnSKnWWls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DIUWmeyQCSsRi21tfarhnzZT4zx8f4kret90dP42mzVWfR2YhncRyFHSHKUYzU8f/KDFV0z+5845rjQW+RiRTz1mcvI5KpqC+10zEnk1Y2B76Sn/u6p8jHpXDa0KdUpUcy+YHafsFcVFHpTrceoYGyP3Y0WY5PrZxkqPAYX2zTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3wquUpV; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3wquUpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788892121; x=1820428121;
  h=date:from:to:cc:subject:message-id;
  bh=4QC3dGJyGpPbpwbjHo/yjaPMFLwZ9S02NYhnSKnWWls=;
  b=G3wquUpVYxmtna2i4DxOArp4nJYIeB5VDhSvcq2ewuxW1BcU44WduVps
   MDTNLc4HRWoFknJ/rujdurgSD2cPrSDtE5LoLhZ/szo/HExdPtKa19lkK
   htLnsbj6XHgiNedp0Hm6z8IV/j/rmPKa09RXSAkL1kyygRy7lqJhSNF5Z
   nH+EvEhr+ClUl7Dy13CzQ7lvH2OkfiU3fWAZxXHs6LDKMr/l8eXwn+guk
   o/3hDqffPxI9svAuUcIeGf7KTe794T2XwAvp1FyllVDJlnR/E18GGwypv
   c1fwz44CsvKUmlaI4vZbKBc/nVJ5MWOwEVpex7EXdehqzpsX0e7B0r+95
   A==;
X-CSE-ConnectionGUID: +lKRXsUOQJ+f3nsuB/iarA==
X-CSE-MsgGUID: RO9RnVceQv2rTx6Ul9OQWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99897654"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="99897654"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 11:28:40 -0700
X-CSE-ConnectionGUID: U7vnemarTkmcYYaFvZ+e4A==
X-CSE-MsgGUID: e2FOtxO5S/6eROcdj3dPWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="264869210"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2026 11:28:41 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x40Yg-000000000nu-1M1t;
	Tue, 08 Sep 2026 18:28:38 +0000
Date: Tue, 08 Sep 2026 20:27:57 +0200
From: kernel test robot <lkp@intel.com>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rclaveau:b4/add-adla_npu-t7-vim4 11/12] kismet: WARNING:
 unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by
 DRM_ACCEL_ADLA
Message-ID: <202609082000.lFWeWdXb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/rclaveau-tech/linux-khadas.git b4/add-adla_npu-t7-vim4
head:   3729dea89f4ad77930792d1afd34a3bac456c7a1
commit: 330de5bf7f7e571e825653a31a5a788aeb17086e [11/12] accel: adla: Add driver for Amlogic NPU
config: m68k-kismet-CONFIG_DRM_GEM_SHMEM_HELPER-CONFIG_DRM_ACCEL_ADLA-0-0 (https://download.01.org/0day-ci/archive/20260908/202609082000.lFWeWdXb-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260908/202609082000.lFWeWdXb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609082000.lFWeWdXb-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER when selected by DRM_ACCEL_ADLA
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_ACCEL_ADLA [=y] && DRM [=y] && DRM_ACCEL [=y] && (ARCH_MESON || COMPILE_TEST [=y])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
