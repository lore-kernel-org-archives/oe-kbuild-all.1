Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1382A3C0B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 01:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735349714; cv=none; b=qj2YeX3IY/COc9DTYQEtvCotAjh0HExmhyY7pADtNF3v1nLzCrX5xMXHBGFoSKxKuygJsjstCYQVSBQ9gK4NWASVdFkrxSpktY4tuopZqUt4PUD/G7+2fy2WEyh4HpNfARdZ9EeqVjscNTCR0aAKIa4IXRuQSdCrBdQ6RYZlWIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735349714; c=relaxed/simple;
	bh=s+nD4/jUer30dQvlqll+Vs86x4whB62E4Tcdw68gNb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R4Mmqhv2zu/BK1UAsMtNHMf1FVsi2ykDyoSuQtf01zDFFoLxtRb4wDGUOYeoioSEk6U92T/SSTS0Qy/2HUMN2XXQSU/WodxRzOvPeeIBOavUA9NHnqoQ7ZUOSQkeSZgswBE2DhtMQ8mYPXyNR9diwP9GUI7TAB0fFq5CcgYZtfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9JjBI9V; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9JjBI9V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735349713; x=1766885713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+nD4/jUer30dQvlqll+Vs86x4whB62E4Tcdw68gNb0=;
  b=f9JjBI9VLoejUTpgEZ6wX/d/WiReri4bY4kt7BGIByPUL5uCPxIBtxGM
   NIGtNcMXVkOVIeEW0bUBifE5HtkIGfCt9PCibsujvxwotLtwAcYo1N9KM
   WUwrla0zLaoFiy9wFginVS+qr+7+q8OeQaUux+XxtC/gU3GM9EHtx+yT+
   1fOhLl2ReQ6HA/8A0k9LY5UirQUwNgg+KOQxVc/gdJl2+kyLZHS9uVP7k
   pc7JmVngw8ZiHM4hHkkraahBeFtUvhzY6i73DYsnoYV3Jtw3HGvro6MUp
   EzXE7CWfweljBJJXhFIITxGxhXrwPnqWPG3tSk6xnhkwJXMlwjynv1Ypz
   w==;
X-CSE-ConnectionGUID: 14GkxiMmS4WxwsBOecHkSg==
X-CSE-MsgGUID: DyKqgLsTTgO53qBFi7ol/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35881608"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35881608"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 17:35:12 -0800
X-CSE-ConnectionGUID: MZpy0iO0TIq5xmz2YosAGQ==
X-CSE-MsgGUID: wlXzW+TGRKCO1sP3d7IaSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="105250108"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Dec 2024 17:35:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRLjQ-0003mu-2q;
	Sat, 28 Dec 2024 01:35:08 +0000
Date: Sat, 28 Dec 2024 09:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Julian Chen <julian.chen@intel.com>,
	hepengpx <pengpengx.he@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/imx390.c:148:
 warning: This comment starts with '/**', but isn't a kernel-doc comment.
 Refer Documentation/doc-guide/kernel-doc.rst
Message-ID: <202412281147.9jPUTLWN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: 727b148e5943f45d8d4176bccbdb2bb2654bbb0f [3/3] driver: media: pci: i2c: support IMX390 on kernel 6.6
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412281147.9jPUTLWN-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281147.9jPUTLWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281147.9jPUTLWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/imx390.c:148: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Register addresses (see data sheet/register map)
   drivers/media/i2c/imx390.c:1180: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * imx390 gain is 0 to 30 in .3db steps.


vim +148 drivers/media/i2c/imx390.c

e986ee1ba98444 zouxiaoh 2024-01-18  146  
e986ee1ba98444 zouxiaoh 2024-01-18  147  /**
e986ee1ba98444 zouxiaoh 2024-01-18 @148   * Register addresses (see data sheet/register map)
e986ee1ba98444 zouxiaoh 2024-01-18  149   */
e986ee1ba98444 zouxiaoh 2024-01-18  150  enum {
e986ee1ba98444 zouxiaoh 2024-01-18  151  	IMX390_REG_STANDBY = 0x0000,
e986ee1ba98444 zouxiaoh 2024-01-18  152  	IMX390_REG_REG_HOLD = 0x0008,
e986ee1ba98444 zouxiaoh 2024-01-18  153  	IMX390_REG_SHS1 = 0x000c,
e986ee1ba98444 zouxiaoh 2024-01-18  154  	IMX390_REG_SHS2 = 0x0010,
e986ee1ba98444 zouxiaoh 2024-01-18  155  	IMX390_REG_AGAIN_SP1H = 0x0018,
e986ee1ba98444 zouxiaoh 2024-01-18  156  	IMX390_REG_AGAIN_SP1L = 0x001a,
e986ee1ba98444 zouxiaoh 2024-01-18  157  
e986ee1ba98444 zouxiaoh 2024-01-18  158  	/* default bayer order RGGB */
e986ee1ba98444 zouxiaoh 2024-01-18  159  	IMX390_REG_WBGAIN_R = 0x0030,
e986ee1ba98444 zouxiaoh 2024-01-18  160  	IMX390_REG_WBGAIN_GR = 0x0032,
e986ee1ba98444 zouxiaoh 2024-01-18  161  	IMX390_REG_WBGAIN_GB = 0x0034,
e986ee1ba98444 zouxiaoh 2024-01-18  162  	IMX390_REG_WBGAIN_B = 0x0036,
e986ee1ba98444 zouxiaoh 2024-01-18  163  
e986ee1ba98444 zouxiaoh 2024-01-18  164  	IMX390_REG_OBB_CLAMP_CTRL_SEL = 0x0083,
e986ee1ba98444 zouxiaoh 2024-01-18  165  	IMX390_REG_REAR_EMBDATA_LINE = 0x2E18,
e986ee1ba98444 zouxiaoh 2024-01-18  166  	IMX390_REG_REV1 = 0x3060,
e986ee1ba98444 zouxiaoh 2024-01-18  167  	IMX390_REG_REV2 = 0x3064,
e986ee1ba98444 zouxiaoh 2024-01-18  168  	IMX390_REG_REV3 = 0x3067,
e986ee1ba98444 zouxiaoh 2024-01-18  169  	IMX390_REG_WBGAIN_FORCE_X1 = 0x36A8,
e986ee1ba98444 zouxiaoh 2024-01-18  170  };
e986ee1ba98444 zouxiaoh 2024-01-18  171  

:::::: The code at line 148 was first introduced by commit
:::::: e986ee1ba98444c2b97240478a5b1dda508e0b35 add ipu driver for kernel 6.6

:::::: TO: zouxiaoh <xiaohong.zou@intel.com>
:::::: CC: ranjan-dutta <ranjan.dutta@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
