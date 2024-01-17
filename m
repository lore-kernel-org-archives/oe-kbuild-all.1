Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0C51EA7F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 12:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705494426; cv=none; b=dfs+yfEEt6q38C1OMIvXC3C5xIpD5zkPTklpkYErnAcGqVkRrtVSUywmXELi5xSm2myNVVYIP+0s0bUUJ3ow4zQX5lYVoQCXP/OHu/3zWM7RIq0x6kELyKsRcACYDbcGjZSFXPxbIx8DX8rEQrzPs8rmPl3B/XbXTi+T95GoLBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705494426; c=relaxed/simple;
	bh=I8/VPQSC06M7+44YaCBcX5fTTGNh15nJfwgmdPQSsgw=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=uqvP0x8GeP7P2vS1Qibj5XhCCsD/bqhL/pzpIK7qELPeAmQ7M7Sw4x98BUtPKn3ws9Q3dYigwKmR5miuHD4LpvOYYhuws9ruqW96EkR3pyFyY6w3FKddWigzPAQ2Psy4zI5pOPaWs6MA6m+mq2L3yWXlMx3oBhAm1HO9JHDK0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjSzrpUn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjSzrpUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705494424; x=1737030424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8/VPQSC06M7+44YaCBcX5fTTGNh15nJfwgmdPQSsgw=;
  b=EjSzrpUnnjCq+NTMIoeaM/OYAtCixQx8k1Gc1kH2y7nMTfpV7MPmwnXd
   AbRpgi3x8wPXQa+i6ZdqncAG/IDXCkgivifn5xygrdh+y0FWE/2ZDVTjN
   oFiPZ7UgTcWRgUGUqBk3L18mSkq88+CLieYaJsrWHJDlutVlMoqljQzXJ
   Bkypr73OAWX5xBFAWeRcxXbXyXMpddpRxiLePg4EYvw1keu6CgYt+fjxt
   9RicOalxfCWIfybgRbS9yfwtJDXGXRLD7w+4K4SRBYUq1qi6Lbl+Y1aJ+
   E801JU1r4NQS0D6JT8xf+TzZ0OOa2uVQJp77Z9+5S94BpcuFvooPmTTyf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6859724"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6859724"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 04:27:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="818504249"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="818504249"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Jan 2024 04:27:01 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ50V-0001yi-0i;
	Wed, 17 Jan 2024 12:26:59 +0000
Date: Wed, 17 Jan 2024 20:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [cip:linux-4.19.y-cip 7835/28855]
 drivers/gpu/drm/rcar-du/rcar_lvds.c:849:43: warning:
 'rcar_lvds_r8a77995_info' defined but not used
Message-ID: <202401172007.uXYUlR3l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   6617f4528449a329abd3b2dab36052b341610d99
commit: 973babadc01000cf32944e4b17adc41cbb66bcb2 [7835/28855] drm: rcar-du: lvds: Add API to enable/disable clock output
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240117/202401172007.uXYUlR3l-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401172007.uXYUlR3l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401172007.uXYUlR3l-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/rcar-du/rcar_lvds.c:849:43: warning: 'rcar_lvds_r8a77995_info' defined but not used [-Wunused-const-variable=]
     849 | static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/rcar_lvds_r8a77995_info +849 drivers/gpu/drm/rcar-du/rcar_lvds.c

44ead813e2d762 Laurent Pinchart 2019-10-01  848  
44ead813e2d762 Laurent Pinchart 2019-10-01 @849  static const struct rcar_lvds_device_info rcar_lvds_r8a77995_info = {
44ead813e2d762 Laurent Pinchart 2019-10-01  850  	.gen = 3,
44ead813e2d762 Laurent Pinchart 2019-10-01  851  	.quirks = RCAR_LVDS_QUIRK_GEN3_LVEN | RCAR_LVDS_QUIRK_PWD
44ead813e2d762 Laurent Pinchart 2019-10-01  852  		| RCAR_LVDS_QUIRK_EXT_PLL | RCAR_LVDS_QUIRK_DUAL_LINK,
44ead813e2d762 Laurent Pinchart 2019-10-01  853  	.pll_setup = rcar_lvds_pll_setup_d3_e3,
b6eb7102ad6dc7 Sergei Shtylyov  2018-03-01  854  };
b6eb7102ad6dc7 Sergei Shtylyov  2018-03-01  855  

:::::: The code at line 849 was first introduced by commit
:::::: 44ead813e2d76216d7bdf1d479bbe7e0271a3d22 drm: rcar-du: lvds: D3/E3 support

:::::: TO: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
:::::: CC: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
