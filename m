Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF01DB15F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 21:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752789161; cv=none; b=V82ADprA3piXPW47jD+/UXuDgQxmMlTajXkCvtsnbfWs4dlDb6/o6ibADF+T/l1zQA/bn/dANeAggZ5n//L5Us1oWBE3sJuFupUAtCVoMLIwtaM4DRcu4cUofp4DQ1kW1AX/1fg9rL5Sj7fCdb7aKhCvUlkbyuC5aW8tSwi0Whg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752789161; c=relaxed/simple;
	bh=T+2BuvYPEn4sRmWcHakSkOx24wJ6Tlw6rRHHIjvmTsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BH+k7a9KxEVOD5GLBKNDwd1sVgUvAnCfxrzyDwogxVKOOZrkpUXnLEvrIxA01q5/B1vrmX43zt2AE+K1JFYNbbp8RkriLWWAm8p7aWTmk+S7fVrRfqpDujwTJZ+t+J5WkEDuS1bxtLDkWybZ6QgSdGRuMU2Vm9GpS4NNN0EyQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRooxLxX; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRooxLxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752789160; x=1784325160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+2BuvYPEn4sRmWcHakSkOx24wJ6Tlw6rRHHIjvmTsE=;
  b=GRooxLxXiVt5n5MDEJ5Apt0YX5oE98lpPMjmSIpyGj5aMDVh1QF5l9ik
   KTbQNuIyiPOLhozkmp/dR9wsMbId0ZuQ17jGT0z6FVEVrPHWoupXETHoJ
   wnQK04UOuAkRiEQgAT6X5ZR6VdVyphj1hevprvqEWY74eSPavAyqpIFwb
   PyEgFgj/J91aXFdFf35lfVxP9kn9T/GmGcGysWmjRN2ytcQ+ZESmSZKcx
   x4bSea+B0UqM3ivpi9iyEVMJSY+yRUFyQgXyvSOaWSSDyMgREI/vvoM8J
   nAdDChute6sMGL1zoKQSn+o2BD3Z8VynmsCa8CibiVDho7D0dZfCqmGxM
   w==;
X-CSE-ConnectionGUID: T21aPWZ8Qp6EXM68EdldpA==
X-CSE-MsgGUID: rqGcN0wdQHCZWlwUgz/v3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55021218"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55021218"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 14:52:37 -0700
X-CSE-ConnectionGUID: WZRHJ3prT8e9Z1PS3PLORw==
X-CSE-MsgGUID: xVtqE0mLSyWvVgt65U859g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157980365"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jul 2025 14:52:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucWWn-000E2r-21;
	Thu, 17 Jul 2025 21:52:33 +0000
Date: Fri, 18 Jul 2025 05:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 10133/10823]
 drivers/gpu/drm/sitronix/st7571-i2c.c:1027:26: sparse: sparse: symbol
 'st7567_config' was not declared. Should it be static?
Message-ID: <202507180503.nfyD9uRv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: a55863ba4c9ea9febe81ecf7dba36e7989a37b7e [10133/10823] drm/sitronix/st7571-i2c: Add support for the ST7567 Controller
config: arc-randconfig-r113-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180503.nfyD9uRv-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250718/202507180503.nfyD9uRv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180503.nfyD9uRv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/sitronix/st7571-i2c.c:1027:26: sparse: sparse: symbol 'st7567_config' was not declared. Should it be static?
   drivers/gpu/drm/sitronix/st7571-i2c.c:1039:26: sparse: sparse: symbol 'st7571_config' was not declared. Should it be static?

vim +/st7567_config +1027 drivers/gpu/drm/sitronix/st7571-i2c.c

  1026	
> 1027	struct st7571_panel_data st7567_config = {
  1028		.init = st7567_lcd_init,
  1029		.parse_dt = st7567_parse_dt,
  1030		.constraints = {
  1031			.min_nlines = 1,
  1032			.max_nlines = 64,
  1033			.min_ncols = 128,
  1034			.max_ncols = 128,
  1035			.support_grayscale = false,
  1036		},
  1037	};
  1038	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
