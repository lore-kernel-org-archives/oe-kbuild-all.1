Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAE62C15A0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 21:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753391953; cv=none; b=lxM33WFrk+S5eBorfi6rrj5Csm4ArjMb+cpD5vDLbC6CEOmC9D+hYWA03qG3TbpbUzrGi/iyCfywpi7RKFE5AhwzbH9W3Bf4D0gc+ySSLXlyqGrJJ0rXLJXD/zNVUi5QZ/wVWWJTYLTN/3NNWMhO4cnKGLwiYjVoVjDrMS+3OtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753391953; c=relaxed/simple;
	bh=ieq4S9crPzpTW54dH5MLqF1gbivlHx8Y+Qa8kHz/yu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2vZ+tgu2ac2tDSE4CkwbRPWpA67AyPTa3bYrp0wLNBDMP0D/lJi75vTNGpI4DTN5HA7WbfMCB7sXDwY63bzAUDIYWXK/567VKDjR8+JBqMKbhC1c7NiNQgPBDvZ4slUnWRqIIG+pnESPmLXXv7T1XH0LY7XeT8uKRqiqRAmqPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1t8c5Y6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1t8c5Y6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753391951; x=1784927951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ieq4S9crPzpTW54dH5MLqF1gbivlHx8Y+Qa8kHz/yu8=;
  b=e1t8c5Y6KC9mdcMQyz9h9sCtvWF1joyDdybfxTSDwD5wnleJ1zYAqaXJ
   1cWZn0NFYvkVQJw+5vLzwnCDq1Jz3Lcv+uRqKaJigpXPTMxpiAQ9orYhj
   7whTiQqE1B3/gvM0IvEG6OhmhnbmzCTpRV8rGcn3WQvqlV0SGmcDRspb8
   bhdrVTK8rA+kdV0O01xUoIWH+Xm51mxSdPMqJJJg6UoDDQ1SJEoxn5+Sb
   eK2sawu6xznHh3CNcXDbufbqeFPDrLUgLP+581wI7iChvAu1VZxjXEWg6
   VnCLsjZCYrgeaRxK4og6jf9VsUlsx19XPwO2HfzvOjNbIPMU6qgfkfEzQ
   w==;
X-CSE-ConnectionGUID: 7IeHzsk6QD6mFvgFv7iW3w==
X-CSE-MsgGUID: HBg83ip+S5KOWlngeUtWxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="65984585"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="65984585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:19:11 -0700
X-CSE-ConnectionGUID: jUkyI0RQQ3O4csMXNcXLhg==
X-CSE-MsgGUID: 9C0S0yJ8QsmjQ+iTqoTNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="164973592"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Jul 2025 14:19:10 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf3LH-000Kpg-28;
	Thu, 24 Jul 2025 21:19:07 +0000
Date: Fri, 25 Jul 2025 05:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Huy Bui <huy.bui.wm@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Hai Pham <hai.pham.ud@renesas.com>
Subject: [morimoto:x5h-upstream-2025-07-24 13/16]
 drivers/pinctrl/renesas/pinctrl.c:569:42: error: implicit declaration of
 function 'FIELD_GET'
Message-ID: <202507250556.1WoR0anb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux x5h-upstream-2025-07-24
head:   9c22a4a6bddbc7e8547038f75c046cee59577aea
commit: fd8a1c6431825e97be2b0a8bed2561d69fad4aff [13/16] LOCAL: pinctrl: renesas: Initial R8A78000 (R-Car X5H) PFC support
config: i386-buildonly-randconfig-001-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250556.1WoR0anb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250556.1WoR0anb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507250556.1WoR0anb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pinctrl/renesas/pinctrl.c: In function 'gen5_pinconf_set_drive_strength':
>> drivers/pinctrl/renesas/pinctrl.c:569:42: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     569 |         gen5_pinconf_write_bit(pfc, bit, FIELD_GET(GENMASK(0, 0), strength), reg->drvctrl0);
         |                                          ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +569 drivers/pinctrl/renesas/pinctrl.c

   550	
   551	int gen5_pinconf_set_drive_strength(struct sh_pfc *pfc,
   552					    unsigned int pin, u16 strength)
   553	{
   554		unsigned int bank = pin / 32;
   555		unsigned int bit = pin % 32;
   556		const struct gen5_pinmux_drive_reg *reg = &pfc->info->drive_regs_gen5[bank];
   557	
   558		if (reg->pins[bit] != pin)
   559			return -EINVAL;
   560	
   561		if (strength < 3 || strength > 24)
   562			return -EINVAL;
   563	
   564		/* Convert the value from mA based on a full drive strength value of
   565		 * 24mA. We can make the full value configurable later if needed.
   566		 */
   567		strength = strength / 3 - 1;
   568	
 > 569		gen5_pinconf_write_bit(pfc, bit, FIELD_GET(GENMASK(0, 0), strength), reg->drvctrl0);
   570		gen5_pinconf_write_bit(pfc, bit, FIELD_GET(GENMASK(1, 1), strength), reg->drvctrl1);
   571		gen5_pinconf_write_bit(pfc, bit, FIELD_GET(GENMASK(2, 2), strength), reg->drvctrl2);
   572	
   573		return 0;
   574	}
   575	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
