Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735E53A1E72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 10:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052898; cv=none; b=DXodMMdoEbmXgJhi1R7IazYecNN9fV3BxC52cnezHEijoyBZjY2Re1tU5HEezgRhcHtHJLM217BJWmMiJXLZwIpBAq9j2yzlSrIYYR1vE4Bv2eJYEUFh8bv6Oou7QBEijDzkHLCFS2/zVhtZokcpVIaQmxAJVn0p6oRBwZ9bBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052898; c=relaxed/simple;
	bh=tgebpoWxG2z8iaCd/NRwEjL2bkKyTMu+oDY4dmRhwlE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFLBI+7Vo1ehK7aq+ZcK/HhX6dGc/XQGs8T+yimMP96bqc14R58sc4pIR7k8icO6L4Lvoaa3IZEEDPvmB8rhlVx0Osk7RiVG/lx/A8twacqWRqpx8WOSzk9xX7XhiqBnCBbT8f1KU58+GtifV/UxDI1G9dPmXmB+HTVgl8u+hNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+/6RAfQ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+/6RAfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766052897; x=1797588897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tgebpoWxG2z8iaCd/NRwEjL2bkKyTMu+oDY4dmRhwlE=;
  b=F+/6RAfQ1Y8DPqRqJepfKbdSEBu3X/olpy4TcxTfmeY+iGrM3mZLyM48
   ELxDGYk/wECQkrhF2onthhrClAlv+yx11x4fiBEPnPvU6LH/lbRasY6cP
   wfBJSe+ud32zvrIIRoer3jk2BMlF9ArtpKZQ1XEAdKHNhxysObigXeipg
   AjuLlSd3cbJAJ7Y+NR0sJinH1eT6fPeAEs0e6G1RkXo2ljHg+h1D2kV04
   +ZX11SdDBvCatJiFa+F6lYfJuZUlRe/HZkcd25c4EGXa+a6xzL0ux/QQb
   XJBBlgRM0Q/8wMBu5Na64o1yMKOrIvJBSaER4gDsfbNLYTY1Uz3G0+LJF
   A==;
X-CSE-ConnectionGUID: GiF90Z0pSdKiTBUltlCENA==
X-CSE-MsgGUID: KKa8TYPoS2ygpPdRw2hcDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67882304"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="67882304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:14:55 -0800
X-CSE-ConnectionGUID: 0lvBB3zQS7y6RPREXS9HqA==
X-CSE-MsgGUID: 4nqVdroTR4CRue1T/lJyUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203446484"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Dec 2025 02:14:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWB24-000000001w0-0LKr;
	Thu, 18 Dec 2025 10:14:52 +0000
Date: Thu, 18 Dec 2025 18:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lucas De Marchi <lucas.demarchi@intel.com>
Subject: xe_survivability_mode.c:undefined reference to
 `xe_configfs_get_survivability_mode'
Message-ID: <202512181854.hPyTAXc5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: bc417e54e24bc9c96d3c6eba2c8c60f7919e5afe drm/xe: Enable configfs support for survivability mode
date:   8 months ago
config: powerpc64-randconfig-r053-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181854.hPyTAXc5-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181854.hPyTAXc5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc64-linux-ld: warning: discarding dynamic section .glink
   powerpc64-linux-ld: warning: discarding dynamic section .plt
   powerpc64-linux-ld: linkage table error against `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: stubs don't match calculated size
   powerpc64-linux-ld: can not build stubs: bad value
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x10): undefined reference to `xe_configfs_init'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_module.o:(.data.rel.ro+0x18): undefined reference to `xe_configfs_exit'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_fini':
   xe_survivability_mode.c:(.text+0x260): undefined reference to `xe_configfs_clear_survivability_mode'
   powerpc64-linux-ld: drivers/gpu/drm/xe/xe_survivability_mode.o: in function `xe_survivability_mode_is_requested':
>> xe_survivability_mode.c:(.text+0x2cc): undefined reference to `xe_configfs_get_survivability_mode'
   powerpc64-linux-ld: xe_survivability_mode.c:(.text+0x304): undefined reference to `xe_configfs_clear_survivability_mode'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
