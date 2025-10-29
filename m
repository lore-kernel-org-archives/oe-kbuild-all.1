Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EAB31062C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761739048; cv=none; b=rqc0+5YfjjbES57JFP5ttgpWB19DafX/P7aTuPC8vlLtTkZtsyhedPDFWvCV9VpC1RLMTLrb9twf1inXd2JXjEqvSmBfLt42bLGkfsCouPdntdqJeQ8jWTz7trE6T3h1RcmyWXmXc1DEj7GWMZMEYPPdRkC4UFUZSVud1oMzreA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761739048; c=relaxed/simple;
	bh=o0DYy1O3KX+gzL0p3YiM5i3r2723oNKurz7BLp3mlEM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O9RenibbvHjAD6mnTc+43aD+3PhWTpdoO9aWNXg4wkIVdos5g8g09Y97byeHAmPQ8GfmCp4MJk/qOkv0Sny9Z2o5/ffSc3eW57uqRpksqj5gklqMuBmNa+h+Fq2li/aXy78xjdLm18DpUpYNzUAinPqjPX0L8uDz/iigizGud9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOobCGIX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOobCGIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761739047; x=1793275047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0DYy1O3KX+gzL0p3YiM5i3r2723oNKurz7BLp3mlEM=;
  b=YOobCGIXYHoaTzOzrqR8XjYjbW4z11RUjLJKgbOTPR6IFQRScZwKK619
   4cvmZNYevOkO5DSbuDGbHrxxvIt9g7k9jq/N8KSV5ETavMy/Fad/dlfRT
   uVXvr+QRdLdTWGKzMZxPUJ2RqXrc/cRSaPE0MGIKeaVzD4UMg8x6RIMT8
   q5vez4G46Noc9ukVo2du0Yyy9rHNjOMl3cqPUTKK17n92lTJy3ABpaksW
   Eao4Aaj0j5JgD47aw6FncLTIQnRbWhhHGGusZIu+vm/FuPumAdc9pegoH
   O6IWljDAim4ZcXATnXdldNe2zgKOq715qWrKxcDM5XRkciw2n7lVvmov3
   g==;
X-CSE-ConnectionGUID: eElUliPwSLKQTuiN9JQZFw==
X-CSE-MsgGUID: hnpxWNZ4RWiYdIp1MBE6Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="63897568"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="63897568"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 04:57:26 -0700
X-CSE-ConnectionGUID: Ld2QK22tRtiadvDghBkDIg==
X-CSE-MsgGUID: +gH6priESNOyqGiIIivQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185559951"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2025 04:57:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE4nq-000KZJ-0S;
	Wed, 29 Oct 2025 11:57:22 +0000
Date: Wed, 29 Oct 2025 19:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Alex Deucher <alexander.deucher@amd.com>,
	Harry Wentland <harry.wentland@amd.com>
Subject: [linux-next:master 4410/4731] Warning:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function
 parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
Message-ID: <202510291905.CNy7FYI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f9ba12abc5282bf992f9a9ae87ad814fd03a0270
commit: e45d60a76999a2128bd1bd3d2e1597eec8b49c78 [4410/4731] drm/amd/display: Add analog link detection (v2)
config: parisc-randconfig-002-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291905.CNy7FYI0-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291905.CNy7FYI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291905.CNy7FYI0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:872 function parameter 'edid_header' not described in 'link_detect_evaluate_edid_header'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:890 function parameter 'link' not described in 'link_detect_ddc_probe'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1300 function parameter 'link' not described in 'link_detect_analog'
>> Warning: drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:1300 function parameter 'type' not described in 'link_detect_analog'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
