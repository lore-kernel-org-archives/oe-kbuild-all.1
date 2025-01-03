Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1231B0F10
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735900974; cv=none; b=XHmPyfDGYHGBvcsAPOs6vDpfiYAj5C2BnvHguEcj9UbIOoPs+w7uzFyYZoHAGNNKPKC6Bx/Y2+YQWkQP3PI4CA6ZMnpAD4MxDgDXIiXwPDeqagX59hoFphrUiNTX/31h4YSw5QtXKNOfLslhN1Q4cvYM0XmIh/T27an7VZIkeEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735900974; c=relaxed/simple;
	bh=iWnhFFYT+odxjQP+6kQrXxARer9oXGA54LNm5qaSuuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AxH0MbGkYg2I+n6+Q5UO5gtjmzF5oHcaWGbbZvHabBZhBBJgG5/OyX3YcCMIqA9Px7whpmQ6aFNd0bpJMpJFyfdvRHvfM82q/6K2HItuOgOoJHOZz4YONj8Pc1yRzVriv4GEc/rkALqCrLMKIe6cd51lGdPISjTnhQH464o0Zyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qvb80yJy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qvb80yJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735900973; x=1767436973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iWnhFFYT+odxjQP+6kQrXxARer9oXGA54LNm5qaSuuY=;
  b=Qvb80yJyMLcxntUqxo26RzWoj9v3KIDDmk1wcQTFEpMaZRRZmo9HWDYF
   ipftnJ5WUyJmZoTcN7cLnBLLo+J1/NH3s+eQxW2Dev723m45kdt2LH+Rk
   xPPhXN+/WlD29RwHRskLzKzT5k7cys3nj+R4T7wtrvFbH0ki82x2Ala1l
   xYswuyY2qTYxYVlBTUR12z085nCpgb+tz3zBMTgST2vB0c85u4cJizb0x
   W6UU6D7Xq7U2MZdFTsU6Cc1y00CdMjZZdI0NuRq8dvBv0OXyYTM8aTo/S
   lMMHg8ULsuMOPFb2eV3JU14F+4KO/g6sS2knhpevquwui5MQttyC4vvGc
   w==;
X-CSE-ConnectionGUID: yFjYlhgCQXeu7/Gv1uZgkg==
X-CSE-MsgGUID: Q0jM/mEDSaaCjCeUJ6MA8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="53558841"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="53558841"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 02:42:52 -0800
X-CSE-ConnectionGUID: d8sdR0wjSQmRvHENtYM5MQ==
X-CSE-MsgGUID: HoXV9k6ARh6V8Nry6Sd53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132687191"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 03 Jan 2025 02:42:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTf8h-0009ba-2a;
	Fri, 03 Jan 2025 10:42:47 +0000
Date: Fri, 3 Jan 2025 18:42:19 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Min Ma <min.ma@amd.com>
Subject: [linux-next:master 477/5236] drivers/accel/amdxdna/aie2_pci.c:21:5:
 sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
Message-ID: <202501031814.ZVbYKRLl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
commit: c88d3325ae69b30be7bb80080d211dbfced8003f [477/5236] accel/amdxdna: Add hardware resource solver
config: x86_64-randconfig-122-20241231 (https://download.01.org/0day-ci/archive/20250103/202501031814.ZVbYKRLl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250103/202501031814.ZVbYKRLl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501031814.ZVbYKRLl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie2_pci.c:21:5: sparse: sparse: symbol 'aie2_max_col' was not declared. Should it be static?
   drivers/accel/amdxdna/aie2_pci.c:259:34: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/accel/amdxdna/aie2_pci.c:261:31: sparse: sparse: cast removes address space '__iomem' of expression

vim +/aie2_max_col +21 drivers/accel/amdxdna/aie2_pci.c

    20	
  > 21	int aie2_max_col = XRS_MAX_COL;
    22	module_param(aie2_max_col, uint, 0600);
    23	MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
