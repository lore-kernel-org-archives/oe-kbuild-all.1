Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938D4F7CA7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 19:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624098; cv=none; b=FR1dQCptI/IUeoSiJTSv9C7Z5uc0UZmP745MsqY04yDSsHJklO5kU8OoeyaX0hE6JsymbCWPbPuSiJQ08IYz7aZzZvQvCx1RkxKdyugTfdPGYOdY3vKEVpZ0lfVOi3LMByHlMyTXb/xW6Ghh5LdgVl2koj3lvDbJZCzOIzwFxls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624098; c=relaxed/simple;
	bh=weKG3tRIA0O34Mkj7D5pUt+tS+ZyU6UUW85NyqabWo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IhjJvCvgC7H4FBhBDzwSCmO4sjj/jHmPNfBmL0FwshSOtFyz8peq+Gm0qt1c3m2W9TuaVw3nU5UE2tyTBOtty4TL40lEwyIH/gu7tQDfZqhQBNJ95yuXTqEtgcApejcaiAyrhTq7NiQn+mwH/QsyEDltCUcor4DG2tZu14ozadA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VotvfHxL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VotvfHxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790624096; x=1822160096;
  h=date:from:to:cc:subject:message-id;
  bh=weKG3tRIA0O34Mkj7D5pUt+tS+ZyU6UUW85NyqabWo4=;
  b=VotvfHxL6JZCVpcgCIrxNb0aKvtTobHzpfRjCRvX5qwPWopJmztPTlyU
   aktSY6WrRc6jXf9udW/iBN+8cegbuD2GA72I/sc4EvVz4gYKSiJVPp3Vm
   xSb1UoKISlVZ1XE8HZHEOFOWBjfuFbH1DI+vL3ROunRC4iFHFQU1oqhVf
   1oIcraNIDnqaoa24Td+1va/lS+/iEBx5GsGckZTCJtKCfGqANIg1qFJhH
   Wn9FiPoJBr2bytQyXKo4p0O2f0hBs4TK3ZQze+egXY2NeTvl9ynYuStMq
   cvHokvN39syk2Z7m8UthBD54NeGmqX4yo6w8wheAF4RUwK/w2xq80xUXR
   Q==;
X-CSE-ConnectionGUID: Wh4M31aCQf2V8V2OIPjeLQ==
X-CSE-MsgGUID: RO7wAKEKStCL9mN4e4ZXgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101500372"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="101500372"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 12:34:46 -0700
X-CSE-ConnectionGUID: QGemluT7TfewEgvrt2S1+Q==
X-CSE-MsgGUID: mdiW+IaERoWTfhn+LpQvSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="283229279"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Sep 2026 12:34:43 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBH7Y-00000000OP3-3ITN;
	Mon, 28 Sep 2026 19:34:40 +0000
Date: Tue, 29 Sep 2026 03:33:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Zhang <jesse.zhang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [agd5f:amd-unified-interface 3431/3470] Warning:
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:649 expecting prototype for
 amdgpu_get_cpu_gpu_counters(). Prototype was for amgpu_get_cpu_gpu_counters()
 instead
Message-ID: <202609290338.bw6APhNG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-unified-interface
head:   a0fe30c73b88075faca1735b8a65e045521d4651
commit: ab15dcb441cb29b20ff3d3e0d3933cfe4da59edb [3431/3470] drm/amdgpu: Add atomic CPU-GPU clock counter correlation
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260929/202609290338.bw6APhNG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290338.bw6APhNG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290338.bw6APhNG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:649 expecting prototype for amdgpu_get_cpu_gpu_counters(). Prototype was for amgpu_get_cpu_gpu_counters() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
