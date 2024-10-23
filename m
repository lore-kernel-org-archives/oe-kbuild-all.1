Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA4E1E515
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 04:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658430; cv=none; b=UMTvJ/V6p+41dvF69R7S6bDmKkpUY/V9d/xH3TFeQFKoI9R7bUHexEleXwrUVwNuJAFUrNzZMoU0mvTOQWWTXTYP7+WGpfoILJh93nZAmobpTR0VaQ8C1Ji5XZ68tHRZ8GO0GRZrOrSktFb/V8WDfEdffNtWV190lQHsfFv1OLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658430; c=relaxed/simple;
	bh=n5nB9fZLw1/+hs9cgc/cNzm748QmY1KE+0J6b9SicpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=opARiNVgQoRpx8rEQTJ6WumMoQpl9Zgi1WQ3PmJIjFg+ti7tmgQlr44Q9eNWXNE84WGLpxNq7/uFWo8TCj6mJeuqlM4SmxGRDsVr5lHIBt6oJ7wspblvFV+uc/mkQMTGR4OUy+IriaKFO1QjFd6GQlkZZYFedJGnJztU22xClkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4BxLM/j; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4BxLM/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729658428; x=1761194428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5nB9fZLw1/+hs9cgc/cNzm748QmY1KE+0J6b9SicpQ=;
  b=R4BxLM/jVi0kyyN/pihixtAZe5/K/g/VQNyNofL8XcyIyFnvmLOzkU3k
   fPkOdcTIDpEkmbGOTe9VCpqdKQCvAoftYZVZHwBhQfk/0INglZs+TdElb
   oon2COJhf6FFfq17EwitiydThfWRBkYfXXUJ3vzZXsmM8i+OzyZSO5xM7
   5ZRKTNbJ1M7pRQL+eEcAPzwEYbtQ1OepnElKkkhN61fyhzC42YR3ceYIW
   b67jR0RXnVTzuA7TvHmUxQJq0ArRF+6md7TBRdAPEefChKCFS30BUY10g
   r0cu1u5FBpMug1J6a1r562oaQR1n2ed8XoqCEtkcL51tLQvyCIXlvHLsu
   Q==;
X-CSE-ConnectionGUID: xOHgVArCQaCWfgWL3S7uTg==
X-CSE-MsgGUID: YJHKj8nCRs2wPmzmPNyojA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="46706250"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="46706250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 21:40:26 -0700
X-CSE-ConnectionGUID: 1X7aHdDTRfa01V7yByfEZg==
X-CSE-MsgGUID: uOCeiuoIQL6GMDo2jldhpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80882335"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 Oct 2024 21:40:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3TAU-000URi-2k;
	Wed, 23 Oct 2024 04:40:22 +0000
Date: Wed, 23 Oct 2024 12:39:34 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2633/6080] panel-samsung-s6e3ha8.c:undefined
 reference to `drm_dsc_pps_payload_pack'
Message-ID: <202410231257.k9b92zTu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7436324ebd147598f940dde1335b7979dbccc339
commit: 779679d3c1640d8f45c75b1e15831180ab2712e2 [2633/6080] drm/panel: Add support for S6E3HA8 panel driver
config: arm64-randconfig-003-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231257.k9b92zTu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231257.k9b92zTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231257.k9b92zTu-lkp@intel.com/

Note: the linux-next/master HEAD 7436324ebd147598f940dde1335b7979dbccc339 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/gpu/drm/panel/panel-samsung-s6e3ha8.o: in function `s6e3ha8_amb577px01_wqhd_prepare':
>> panel-samsung-s6e3ha8.c:(.text+0xe38): undefined reference to `drm_dsc_pps_payload_pack'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
