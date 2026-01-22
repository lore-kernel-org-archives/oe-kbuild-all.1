Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F01330D26
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 03:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769051074; cv=none; b=G/PDAE+/SmKuIzjhkgP89bjcoY76axUoIkTVrezJfPTofnmmfN9B4oLw9MAVlHvz6WzWvoI18IgQ5PGMstJHlM0h7u6Mu/TfagYhsi3JRxPFJB3G28Yihq5Y+USe09kc2SgHx/M71DEjQLgY7I/BpB1CEPTgOFYKDWtzuj7udAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769051074; c=relaxed/simple;
	bh=dIy9Mw15j8nbDhcPFoseWQD6jupFMqgd/g26yXTVvAI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qZBzX/nqBCHSoc5R+L3DiszVtExKI+qRIJuKRGNHtzWbvI08fI6dRHkedFQjqdLfQymSt8ADSUCxLTB1weAkmP9RodJbrZ64eOWs71wH6Zr9ctciBgdQ2gkd/lWvJAUFsnHfOJvOe66fGSvQa/FX7O067gdjXu7+yIoKd2GJwLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7Mfzjls; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7Mfzjls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769051072; x=1800587072;
  h=date:from:to:cc:subject:message-id;
  bh=dIy9Mw15j8nbDhcPFoseWQD6jupFMqgd/g26yXTVvAI=;
  b=G7MfzjlsRJVrpcsxAZhA2vXO3/jw8WfNLYYrvIfkY80TouK3+iNDxBWy
   3KxMRgh5bmhMBb1RKi3wx4V3jmUI2DRmvUEG3y2T1+B0TrVoJNekw5j/9
   D2e80UPczOeQxE4d3WThbe9xYca+5IJVcz6l03OKppuBcc0kcr7Tt3vqF
   lE91ykFkatvb+vFZjBB3oHWpmNy2MCbgc3sl0u7L36hsImC6Jw3MeHRiS
   d3LhwzoBmODuCpVc5cyx8CmacvnvzKlmgK85v1jjiVOQlSzVSncWaVsBn
   CtIZ4Me4knqQIUvNGiOCEIsq4bl/s+1PM8/xSX4XvOa2GkF24sTv8HSBS
   w==;
X-CSE-ConnectionGUID: 9jUMDbd6SAqB2UyqoAkxMQ==
X-CSE-MsgGUID: sd8b1MKDR92KvnMzPNwE9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="73916170"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="73916170"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:04:31 -0800
X-CSE-ConnectionGUID: hqPnD0E+SHyOk1+GJWAd7g==
X-CSE-MsgGUID: uGIGanmuRCqatgyV65h0fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="229590975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jan 2026 19:04:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vikzk-00000000SMP-05wt;
	Thu, 22 Jan 2026 03:04:28 +0000
Date: Thu, 22 Jan 2026 11:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-01 0/1]
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: warning: objtool:
 amdgpu_bo_release_notify()+0x138: unreachable instruction
Message-ID: <202601221010.kclvD1bB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Rajneesh,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-01
head:   7a721dfe7a169f8cf273701f2f8d6f4bd11d158c
commit: 6694b8643bde4b940f6b410507960793b922a77d [0/1] drm/amdgpu: Fix recursive locking warning
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260122/202601221010.kclvD1bB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221010.kclvD1bB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221010.kclvD1bB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_object.o: warning: objtool: amdgpu_bo_release_notify()+0x138: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
