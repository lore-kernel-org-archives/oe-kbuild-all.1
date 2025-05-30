Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76D9155C87
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 May 2025 06:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748585626; cv=none; b=f+9Js3xKBxt1EazaizHdA9sb0weciY8mbS3zSXqt6Ng5DJ4m/6MNWzTsfuMAVCohFTNegXTBIboMefKGQNi5AzybhpmgEFzCf7chs8jWSsbqaXrHXxfAdWqI0sObepZmcwE056CWAEfVwbDIdNkobGTo7E1maJ6cp2sJO35IdrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748585626; c=relaxed/simple;
	bh=n3TrehFCVXhr3pKqBGhdRlCs3qwfrKgW6sB8lFBM+xE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V+h4CqgnAepDKdixff62kFYNXyWTSS5toQrmwVamCsS8ka6kPM/fkrzL0S9wRnxbVhWwklxEYxcJ20Asz78T9SYG3Gq2qzkemM4qSt5ABLeSjnhV/GDd6yOQHYQzl8dl11L9EXCjkA6sYQDTSybwUes/VoR4IxiUWFY75+rIIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgVbOHUj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgVbOHUj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748585625; x=1780121625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n3TrehFCVXhr3pKqBGhdRlCs3qwfrKgW6sB8lFBM+xE=;
  b=IgVbOHUjbuV21U0ACfB36iWDcQmNMBcTeqF5iOFUVV6Y1ekmYzfgIYlC
   zDzi7zCUsN2kIW4SFk00q9ogpj+7n8Lp2SxjP/sVr8XUblzymbHpkKzWx
   tbws3Fu3eJVSA3UDDMTdVP/jENGZRkPAxawp/J7fafJmAoIxTIK1DGmPe
   s4fPBbrLMlr3EDuJuZ/B14fXF/h05x+Ybv9zDm1R5boEFURx3rqXsJYDQ
   MsQCd7jp4DMI3WZTcO22wjin9gNytM8tcL+6fecz9ijL656Uh8O4ZMjiV
   iaE1Pg+KaqYfuh9HJ1+CIQo7Eevx8mv1l4oLxRzJhuPTZrdPvFhkOcuUr
   Q==;
X-CSE-ConnectionGUID: wuJnK65qScaRVKELknDm9Q==
X-CSE-MsgGUID: a68LC0OoQdy5cInCxQ8rHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38293934"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="38293934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 23:13:44 -0700
X-CSE-ConnectionGUID: 0xW4JbxaTC+Uo1WhvWueTQ==
X-CSE-MsgGUID: 5np8uI99RHW+/tXJFkibIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; 
   d="scan'208";a="144766212"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 May 2025 23:13:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKszs-000XPE-36;
	Fri, 30 May 2025 06:13:40 +0000
Date: Fri, 30 May 2025 14:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 138/138]
 drivers/soc/mediatek/mtk-dpc.c:470:24: sparse: sparse: symbol
 'mtk_dpc_driver' was not declared. Should it be static?
Message-ID: <202505301435.vTHMKFDA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c76c68baa3b1801d81033deae4c36dd8dfe350f5
commit: 073720863458cfc81c898a81e68932cd296b3e37 [138/138] CHROMIUM: drm/mediatek: add display MMDVFS and MMQoS Support
config: arm-randconfig-r121-20250529 (https://download.01.org/0day-ci/archive/20250530/202505301435.vTHMKFDA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce: (https://download.01.org/0day-ci/archive/20250530/202505301435.vTHMKFDA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505301435.vTHMKFDA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/mediatek/mtk-dpc.c:470:24: sparse: sparse: symbol 'mtk_dpc_driver' was not declared. Should it be static?
--
>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:877:73: sparse: sparse: Using plain integer as NULL pointer
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:359:10: sparse: sparse: Initializer entry defined twice
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:363:10: sparse:   also defined here

vim +/mtk_dpc_driver +470 drivers/soc/mediatek/mtk-dpc.c

   469	
 > 470	struct platform_driver mtk_dpc_driver = {
   471		.probe = mtk_dpc_probe,
   472		.remove = mtk_dpc_remove,
   473		.driver = {
   474			.name = "mediatek-disp-dpc",
   475			.owner = THIS_MODULE,
   476			.of_match_table = mtk_dpc_driver_dt_match,
   477		},
   478	};
   479	module_platform_driver(mtk_dpc_driver);
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
