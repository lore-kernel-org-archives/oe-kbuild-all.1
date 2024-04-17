Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29CD139F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Apr 2024 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713343561; cv=none; b=Rh49PknUsHmC6GhoOVtjylkoJiPyGGG0anQby1Wz4uJp5ttkpfZlsRtpjR/Rqtli0nhVoxz17cIEtT3BWT79Hgljn85UGUPZQM+hR8T94iUGPpUDuMWiu3myWP5zONrLdipemyBEE0zaLyJl6sGCZoWVv3kpcM2kSJoHYLMUrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713343561; c=relaxed/simple;
	bh=se3fmzkeIv5pBbnZ5lhXe+8CNZs66KyVHIZNf9eK8MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fgS1WT3TH51K8cmUEnnISncM96cZM/xNKbT63to2Jk7631gD9R0I+kwTsAl1vq2lZt16lKb4++xLhjAdNRW3GPfuKGf8y2JfT1IvLYGg8i3hkVfUydRzsvW0O0ZerhEssRz3WRsow6v9/mOQJbI2Km/6v8r3R6Jq0z2ags0w5QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TzrHhJ/T; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TzrHhJ/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713343559; x=1744879559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=se3fmzkeIv5pBbnZ5lhXe+8CNZs66KyVHIZNf9eK8MU=;
  b=TzrHhJ/T2Wm8+7lkqxZRA7RX2fstX3F4HtdQMSXJNgByZT5K+FrZKqWT
   I05wr6w7zYutrxSs69YrI5g7l4BtaiZ8ZX7Y6ZjOb8kH7u565XybV8TKr
   3fWr9B5C+0zJZIvWvSLH82FSYFASNl47HJcoO6buZ0FpprEd1vp4t0Zw1
   /zpF4i7W8tSDXancMFGeB37oMD352tCmxfz5eMLr5Vgol/KMKaJdLL6Zx
   r37h4UB9zW3hmxMKh9EaSkCOD5Xx+ZK5G7/GKr2Z9Ymt/G6BkgsH+CW8J
   D3VZ5ogH6RiG25n121sXl5xM9qwxpotKHX+Jm3uUkG7w3/o8HZF39ZSy7
   w==;
X-CSE-ConnectionGUID: wgiZ5N5bS9Sx1i/r0qd8yw==
X-CSE-MsgGUID: mVCAaN2JSFmdqtFB+rRZ3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20212627"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="20212627"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 01:45:58 -0700
X-CSE-ConnectionGUID: EABPmEXJQhiRKxfXhm9LFQ==
X-CSE-MsgGUID: kjrOLoDzSuysdtxe4v2zIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="23156147"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2024 01:45:58 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx0vT-0006JM-1j;
	Wed, 17 Apr 2024 08:45:55 +0000
Date: Wed, 17 Apr 2024 16:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:6.1/linux 16/20] ld.lld: error: undefined symbol:
 rt5645_sel_asrc_clk_src
Message-ID: <202404171616.To3K6O5e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.1/linux
head:   f9c4e4ce1f92a0c217760c3d23e2ed3289c69a41
commit: 32a0a5f85ad4357ef63044cffbdddc12cdaaabf3 [16/20] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
config: i386-randconfig-053-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171616.To3K6O5e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171616.To3K6O5e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171616.To3K6O5e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rt5645_sel_asrc_clk_src
   >>> referenced by sof_rt5682.c:322 (sound/soc/intel/boards/sof_rt5682.c:322)
   >>>               sound/soc/intel/boards/sof_rt5682.o:(sof_rt5682_codec_init) in archive vmlinux.a
   >>> referenced by sof_rt5682.c:326 (sound/soc/intel/boards/sof_rt5682.c:326)
   >>>               sound/soc/intel/boards/sof_rt5682.o:(sof_rt5682_codec_init) in archive vmlinux.a
   >>> did you mean: rt5640_sel_asrc_clk_src
   >>> defined in: vmlinux.a(sound/soc/codecs/rt5640.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
