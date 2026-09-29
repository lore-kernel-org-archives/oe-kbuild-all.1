Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AF12DB78C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 02:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647873; cv=none; b=Ysn69ZqhCRyxVy4I4VTKeXwd3qitwOXUFznCVXXQjC4dM+TsOxPSl4PtfllgHgl/WrHrgob1I+V0p+qbVmnkzEQkzuCuH0mmsKVfB91BoVMxLcEI9w9EVR/yRTqsth/+eTP2siTxb60ZKU02m4kIuZtGdXyFkUIV/tQieQQdE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647873; c=relaxed/simple;
	bh=9PZ+AwQWZJELTppe/EDb+XvnUVkDBvkP764gLalawhQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JT9ZcH6oqek/jnc0TFsDawRC7WhM3bra8sg5A7C+et/Sqyo2XDFem4+mtl8+K/6R+/iQqzOWrZpMfTYbVwoRCl2VG2gXTxdComP6zcxY/5NLsFtAErrKodXwQ3nke2tLQmwO8HyV+FTlgGautMGIORtHuzs+i87fXh1DC7Eo2rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVgaNW5q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVgaNW5q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790647871; x=1822183871;
  h=date:from:to:cc:subject:message-id;
  bh=9PZ+AwQWZJELTppe/EDb+XvnUVkDBvkP764gLalawhQ=;
  b=CVgaNW5qY0mNerTsALZ9ZBHbKawaqJSQcWWiyqL8+AlRrXjKuIUfJ9dB
   k9Rk4kA2hQFReKrXP+WsDyzC5v8fpZTx/8AwzCqWWhiQkWX46W50jS5eA
   JpAXDadv5LE4jIIBBkoUAKbcBd+gdc5XDHCndExSjz4kLOhM5bGiPNvg7
   jULhE5W+BjTV7CZ1xqUrkN/YIrUYa70b8yCSOSs7ZuiABUUZwvO1UZzsa
   uFHO0B3tNZu1h3CfI8vldj2FBS5lERlYwNpFJRmdoT6CdzudFHYNJVI9I
   gUp/X609WJSgHzEmVsw7/fZNEp/zFQrUJGzywm3OzCoAis6nu46KSRU0R
   Q==;
X-CSE-ConnectionGUID: RIF7hhgMQ3GtjY44DK3aeA==
X-CSE-MsgGUID: n+7SZFh7Sd+ogRiQZunr+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91457691"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91457691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 19:11:10 -0700
X-CSE-ConnectionGUID: 4n8H9EICSteHeOlB0nvM8w==
X-CSE-MsgGUID: TnKx//GLTX+PJKRuHUi0og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278434916"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 19:11:07 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBNJA-000000001FP-1QWT;
	Tue, 29 Sep 2026 02:11:04 +0000
Date: Tue, 29 Sep 2026 04:10:50 +0200
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 11138/11456]
 drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declaration
 of function 'devm_drm_of_get_bridge'; did you mean 'devm_drm_put_bridge'?
Message-ID: <202609290408.BOs7sk55-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Luca,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: aa8a8c7e4641ebcef02dd6fa387ca334857367f4 [11138/11456] drm/bridge: panel: move all code to drm_panel.c
config: parisc-randconfig-r2200-20260929 (https://download.01.org/0day-ci/archive/20260929/202609290408.BOs7sk55-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290408.BOs7sk55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290408.BOs7sk55-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
>> drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declaration of function 'devm_drm_of_get_bridge'; did you mean 'devm_drm_put_bridge'? [-Wimplicit-function-declaration]
     306 |         next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                devm_drm_put_bridge
>> drivers/gpu/drm/verisilicon/vs_bridge.c:306:14: error: assignment to 'struct drm_bridge *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     306 |         next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,
         |              ^


vim +306 drivers/gpu/drm/verisilicon/vs_bridge.c

dbf21777caa8b8 Icenowy Zheng 2026-01-29  288  
dbf21777caa8b8 Icenowy Zheng 2026-01-29  289  struct vs_bridge *vs_bridge_init(struct drm_device *drm_dev,
dbf21777caa8b8 Icenowy Zheng 2026-01-29  290  				 struct vs_crtc *crtc)
dbf21777caa8b8 Icenowy Zheng 2026-01-29  291  {
dbf21777caa8b8 Icenowy Zheng 2026-01-29  292  	unsigned int output = crtc->id;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  293  	struct vs_bridge *bridge;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  294  	struct drm_bridge *next;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  295  	enum vs_bridge_output_interface intf;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  296  	const struct drm_bridge_funcs *bridge_funcs;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  297  	int ret, enctype;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  298  
dbf21777caa8b8 Icenowy Zheng 2026-01-29  299  	intf = vs_bridge_detect_output_interface(drm_dev->dev->of_node,
dbf21777caa8b8 Icenowy Zheng 2026-01-29  300  						 output);
dbf21777caa8b8 Icenowy Zheng 2026-01-29  301  	if (intf == -ENODEV) {
dbf21777caa8b8 Icenowy Zheng 2026-01-29  302  		drm_dbg(drm_dev, "Skipping output %u\n", output);
dbf21777caa8b8 Icenowy Zheng 2026-01-29  303  		return NULL;
dbf21777caa8b8 Icenowy Zheng 2026-01-29  304  	}
dbf21777caa8b8 Icenowy Zheng 2026-01-29  305  
dbf21777caa8b8 Icenowy Zheng 2026-01-29 @306  	next = devm_drm_of_get_bridge(drm_dev->dev, drm_dev->dev->of_node,

:::::: The code at line 306 was first introduced by commit
:::::: dbf21777caa8b8c88c12f7f036b01208fec0d55a drm: verisilicon: add a driver for Verisilicon display controllers

:::::: TO: Icenowy Zheng <uwu@icenowy.me>
:::::: CC: Thomas Zimmermann <tzimmermann@suse.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
