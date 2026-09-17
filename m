Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F772572685
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Sep 2026 14:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789654269; cv=none; b=aw605veO9ivHq3CDh4yicgR2JjwWQhomXlJ3A6kugjn2U4CL1iaZBJp+bXE7NeoNib+DoMr5q/A8v+YMgbRe67tTaC5+UXEXV/NzEfCn2BJhEKcTSUgoSebN3LosBRl0dF0RDAXccOaj8WIwTmcXdI5KDCZUX59C7ROiAcrFVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789654269; c=relaxed/simple;
	bh=+/RuN7Ss682lFkjBFSFqjDLQdQyWj5eT7tgJ53F5n/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=f7OVK4VycS5qpUMUuEF0c+PDvKrU843mb9wPdtAOz60j3DlDwhBK0J8vAn3Hkruf3g/ra1NHlbaltXoWGoY/urDVemTBVtqKmoWef6omoRey5OxvfJ2xTqofOixdQtuO1o4dL4ER9VDcmFQ+Fql4dY5pEqP47jLv8IOYLuj+GZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJg/C8bb; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJg/C8bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789654265; x=1821190265;
  h=date:from:to:cc:subject:message-id;
  bh=+/RuN7Ss682lFkjBFSFqjDLQdQyWj5eT7tgJ53F5n/c=;
  b=oJg/C8bbXeOW703fvNIONdxOWpEP9lbqiCx7DkRlY4Gf+/ViFboFe0aD
   PKtv6dlFpNyPPT4skota6UjNc9VwDJuDt08dCITshtGUuUeFCyQhX7Oa6
   gAuhZcBjOsTU36GBUdYJYOzcgsikWwkL13sZn3kvikSCaT/JZG0Q03U0Z
   Oh6tfKpFR9aoMQtkIBK41JViQgNvmyomvrrwGelO0/Kczvbcoe0Hmwqch
   E4+C6X/3fBo7eeY2sr0T3PVW/BSY1Z+yTvaIS77EdlqjoethAbhTX8BXB
   AZ8qivgx3kCI712buirio/uZIkYhQQo4GrdI/dWigG2UEnU8mI7YZEdN0
   w==;
X-CSE-ConnectionGUID: Gr67Q6vmTfqQsYld5tM2IA==
X-CSE-MsgGUID: irA0BvbUTV+DdPNi8IQIZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="587491"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="587491"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:10:57 -0700
X-CSE-ConnectionGUID: qhoaRGvDQuGEC4iLoytTtQ==
X-CSE-MsgGUID: eAbZLDCgSZuA6wpeyP4hTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271169050"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2026 07:10:55 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7CpB-000000007xD-0Rpc;
	Thu, 17 Sep 2026 14:10:53 +0000
Date: Thu, 17 Sep 2026 22:10:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-09 14/14]
 drivers/pinctrl/renesas/pinctrl-rzt2h.c:670:25: warning: variable 'j' set but
 not used
Message-ID: <202609172124.kLi32PmY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thierry,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-09
head:   ee03b8f987e082acff09f2c63b41ab66e0fd8208
commit: 34d4d093077a5c60d452a2f42d0c1a08e55b8614 [14/14] pinctrl: renesas: Add support for RZ/T2H
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260917/202609172124.kLi32PmY-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609172124.kLi32PmY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 34d4d093077a ("pinctrl: renesas: Add support for RZ/T2H")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609172124.kLi32PmY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pinctrl/renesas/pinctrl-rzt2h.c: In function 'rzt2h_pinctrl_register':
>> drivers/pinctrl/renesas/pinctrl-rzt2h.c:670:25: warning: variable 'j' set but not used [-Wunused-but-set-variable=]
     670 |         unsigned int i, j;
         |                         ^


vim +/j +670 drivers/pinctrl/renesas/pinctrl-rzt2h.c

   664	
   665	static int rzt2h_pinctrl_register(struct rzt2h_pinctrl *pctrl)
   666	{
   667		struct pinctrl_desc *desc = &pctrl->desc;
   668		struct device *dev = pctrl->dev;
   669		struct pinctrl_pin_desc *pins;
 > 670		unsigned int i, j;
   671		int ret;
   672	
   673		desc->name = DRV_NAME;
   674		desc->npins = pctrl->data->n_port_pins;
   675		desc->pctlops = &rzt2h_pinctrl_pctlops;
   676		desc->pmxops = &rzt2h_pinctrl_pmxops;
   677		desc->owner = THIS_MODULE;
   678	
   679		pins = devm_kcalloc(dev, desc->npins, sizeof(*pins), GFP_KERNEL);
   680		if (!pins)
   681			return -ENOMEM;
   682	
   683		pctrl->pins = pins;
   684		desc->pins = pins;
   685	
   686		for (i = 0, j = 0; i < pctrl->data->n_port_pins; i++) {
   687			pins[i].number = i;
   688			pins[i].name = rzt2h_gpio_names[i];
   689			if (i && !(i % RZT2H_PINS_PER_PORT))
   690				j++;
   691		}
   692	
   693		ret = devm_pinctrl_register_and_init(dev, desc, pctrl, &pctrl->pctl);
   694		if (ret)
   695			return dev_err_probe(dev, ret, "pinctrl registration failed\n");
   696	
   697		ret = pinctrl_enable(pctrl->pctl);
   698		if (ret)
   699			return dev_err_probe(dev, ret, "pinctrl enable failed\n");
   700	
   701		return rzt2h_gpio_register(pctrl);
   702	}
   703	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
