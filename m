Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6534B14C5BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 19:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714074078; cv=none; b=M9PtEy0C5eEO8SyUXqDKKmLbz/Mp/deu6dpsElH2WQbNZx8AnZ3t0XmWqkyyIWGiAccZfiIwQgP4D0SO5cUq9kD5aTr3bavA5JaGnsulfKUz8489R+OkbCBriaW/cOvmmdtgP8bRYCEajoIpudUIEQtUX2Y6f4sSho0TPKXsGMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714074078; c=relaxed/simple;
	bh=eW+nMszNU9tnsOXne8SmPVoEo1Jo72HGcxpnwGphtD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9qK6a28LAhSHZbvWPlH7HCa36YxP1Vy7ueLhejbv0R5sDxaXUxr1PlMjt27bIZVbTTPx3X0yQ2vSw1GssAAMRdGo2qjuUtylp14KpMdXQryrErDIM6O+30p1IEWKChaO6wP6epc/VT7XfPPLG9hhOYT3VaQqGv5GpRSErZC5aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnsRy90w; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnsRy90w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714074077; x=1745610077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eW+nMszNU9tnsOXne8SmPVoEo1Jo72HGcxpnwGphtD8=;
  b=WnsRy90wNk0ldpVPPjvFCUsFYEujwTvJL3peY97oSbCwDl7oFOWYfUlq
   g/C8Oz8TuUs0COi0jU0L56kojozOREtBuwp4mmPFnDplaHKL3B97RQI5D
   dI3Bv/cME1mljtcJ+pySZOC6C4E47VSTqcof5MFIbsjHr3N050Cqwy0L5
   6Bso6eOFW9IOiC1qmDgbPJ4lINXAeg0DrYkoBs6IBDjDfVBuwtK6427s3
   kb9crvUlbl5OkilmMI5yQc32WpmxkHPMSQqg+rHxfj1DXrN1GeI1+ruye
   twG6BIL7hnkJ7DaV8SJTSBSwo/gfqhcjMi0tOlnzzx+YiHymcqXyEDRiY
   Q==;
X-CSE-ConnectionGUID: 5/iwVxrxTVeX8IiclTvpuw==
X-CSE-MsgGUID: xlPOOfllREavDpLusOjaaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="13575823"
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="13575823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 12:41:16 -0700
X-CSE-ConnectionGUID: jy1Rbf/AQ8aLHqjT7ABvvg==
X-CSE-MsgGUID: AWYQlneZSQucs16NRuChmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,230,1708416000"; 
   d="scan'208";a="25823526"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Apr 2024 12:41:14 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s04xz-0002mu-13;
	Thu, 25 Apr 2024 19:41:11 +0000
Date: Fri, 26 Apr 2024 03:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:366:9: error: implicit
 declaration of function 'seq_printf'; did you mean 'drm_printf'?
Message-ID: <202404260313.KFRxhgYu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
head:   2bdb481bf7a93c22b9fea8daefa2834aab23a70f
commit: 9e2b84fb6cd7ee913aa61d461db65c1d6a08dcf2 [2/2] drm/print: drop include seq_file.h
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240426/202404260313.KFRxhgYu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404260313.KFRxhgYu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404260313.KFRxhgYu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c: In function 'komeda_pipeline_dump_register':
>> drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c:366:9: error: implicit declaration of function 'seq_printf'; did you mean 'drm_printf'? [-Werror=implicit-function-declaration]
     366 |         seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);
         |         ^~~~~~~~~~
         |         drm_printf
   cc1: some warnings being treated as errors
--
   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c: In function 'dump_block_header':
>> drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:94:9: error: implicit declaration of function 'seq_printf'; did you mean 'drm_printf'? [-Werror=implicit-function-declaration]
      94 |         seq_printf(sf, "BLOCK_INFO:\t\t0x%X\n", hdr.block_info);
         |         ^~~~~~~~~~
         |         drm_printf
   drivers/gpu/drm/arm/display/komeda/d71/d71_component.c: In function 'd71_gcu_dump':
>> drivers/gpu/drm/arm/display/komeda/d71/d71_component.c:1360:9: error: implicit declaration of function 'seq_puts' [-Werror=implicit-function-declaration]
    1360 |         seq_puts(sf, "\n------ GCU ------\n");
         |         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +366 drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c

7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  358) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  359) void komeda_pipeline_dump_register(struct komeda_pipeline *pipe,
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  360) 				   struct seq_file *sf)
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  361) {
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  362) 	struct komeda_component *c;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  363) 	u32 id;
a1c3be890440a1 Carsten Haitzler                       2021-02-04  364  	unsigned long avail_comps;
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22  365) 
7d3cfb70a604d2 james qian wang (Arm Technology China  2019-01-22 @366) 	seq_printf(sf, "\n======== Pipeline-%d ==========\n", pipe->id);

:::::: The code at line 366 was first introduced by commit
:::::: 7d3cfb70a604d215e195ba9282df42dd6edff16a drm/komeda: Add debugfs node "register" for register dump

:::::: TO: james qian wang (Arm Technology China) <james.qian.wang@arm.com>
:::::: CC: Liviu Dudau <Liviu.Dudau@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
