Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149841891A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 09:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776677629; cv=none; b=rg3U9tXcXA7lsUDTBRp7DNrBRYYzb7o3CHtIAiGEqnpGvHysgnLGJmAZ4PMiA5f/Rf3Fe0Uf3NZro+hE219kLSTKrekL/Q1CmxaFqW/HBcAtNk7fDVlmv/pvAfOumqsMaGhnR4LOerdsWUC6L4TohHMN4YPVyqi2gvi+YRTL3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776677629; c=relaxed/simple;
	bh=luJmXagWQhw8T97lvD3JidUw5LFT+Pfy+YI8p+R5l4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uqk3Og8mze8pWUirRPoUDBSZ5nqogIAZ1iG/iTi41MZIuAq6IxtT+K6zEvs+vmZuaco81mMbgMHF+I3nFPIojBfxOMp5yGmuxyio+uKJJ6/lCPW7SF81dbMjQslUbwEK/XwKL98Rv9zBSM2VcXW6ceMqkQPmugqLZHbbctPadts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evL6A0D+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evL6A0D+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776677627; x=1808213627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=luJmXagWQhw8T97lvD3JidUw5LFT+Pfy+YI8p+R5l4s=;
  b=evL6A0D+Ks3IQb7qmJhlKpafjGAsNR+jk/yMnmePhTWIjgClRQDfB3RX
   aMevid3KrjOPqaZZkpt5Q3Emd3bJnojL/ovjAGEPF5Ls7G9nYv061Ip41
   sv41s3d11MfuJ2inbh7Os/PfLMVmQA0/8TrC+t+UVXICmwovX7xN4yxYd
   8lArH5mZeBcpGsnl1fmzyGsXXMqUx5PYxfcwZB4WC2C93fxu4hN8Din+0
   ufnE2HX2UcxuMjhHGQdv1kWH3PbeT/xuj2KTNbiiuVscS03ODvpC7fZR5
   7tLsHFFBow8dxbPdFQkwnwCZPgIySdm1jrMgGIpAfJDu8lvgBgJ++W5lE
   A==;
X-CSE-ConnectionGUID: E4Wpd3FLSFqTzfHhupDj2w==
X-CSE-MsgGUID: dVdpGe6FT3CzWTK6mnyOlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77714538"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="77714538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 02:33:46 -0700
X-CSE-ConnectionGUID: XQH6n+mnQRK8C0wgzAkYog==
X-CSE-MsgGUID: O8aqYVF7QrKlBFjKoHuvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="236657811"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2026 02:33:45 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEl0g-000000002Iq-09fa;
	Mon, 20 Apr 2026 09:33:42 +0000
Date: Mon, 20 Apr 2026 17:32:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:submit/dyndbg-classmap-foundation 57/65]
 drivers/gpu/drm/mediatek/mtk_drm_drv.c:19:1: warning: data definition has no
 type or storage class
Message-ID: <202604201710.zVnPRrTX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git submit/dyndbg-classmap-foundation
head:   2d70490631040349cc146532e1238a579f148957
commit: 466d977cc2a7b9de8a11758e87acf72cee700703 [57/65] drm/mediatek: Register DRM classmap
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260420/202604201710.zVnPRrTX-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201710.zVnPRrTX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604201710.zVnPRrTX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:19:1: warning: data definition has no type or storage class
      19 | DRM_CLASSMAP_USE(drm_debug_classes);
         | ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:19:1: error: type defaults to 'int' in declaration of 'DRM_CLASSMAP_USE' [-Wimplicit-int]
   drivers/gpu/drm/mediatek/mtk_drm_drv.c:19:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +19 drivers/gpu/drm/mediatek/mtk_drm_drv.c

    14	
    15	#include <drm/clients/drm_client_setup.h>
    16	#include <drm/drm_atomic.h>
    17	#include <drm/drm_atomic_helper.h>
    18	#include <drm/drm_drv.h>
  > 19	DRM_CLASSMAP_USE(drm_debug_classes);
    20	#include <drm/drm_fbdev_dma.h>
    21	#include <drm/drm_fourcc.h>
    22	#include <drm/drm_gem.h>
    23	#include <drm/drm_gem_framebuffer_helper.h>
    24	#include <drm/drm_ioctl.h>
    25	#include <drm/drm_of.h>
    26	#include <drm/drm_probe_helper.h>
    27	#include <drm/drm_vblank.h>
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
