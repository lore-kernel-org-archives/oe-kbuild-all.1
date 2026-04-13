Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9F938F647
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107075; cv=none; b=YcBvSsvmq4bgrIMW+U0+svW9IH9gmPx8MWfSL4qcnfUBlTmqSfWOO0xN1sCUv+AX6nPlYkQib9Ete0hfPD10blkct0cqr/h3WqlGFv2Jp2j7LV6E96oPwmgfU5ZkXLKnVHSs9G0PdVhr3cryf9tk/+cJ/vWIiOSMFnOD4rBDLEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107075; c=relaxed/simple;
	bh=OLIGA8Xpbl7LwxTdNwtzaRpKzMbUpVXoHb3feq0X+18=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h6GFL7CzaRxFHnIHNwacC6CENyOpgGc1gX042Opu2Y3r2mFYgYqPfDYgANUmdhrQjgSQeg65Fbgid/cIMagELa1wdCUbvSf+KNpMcd51ryDo1gD6hecwlLqLi+pvgNMwjVc6s5rAxpwIbilO5FMJtgzzaT5/N8dvfhtA0P6js2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg5sMeh+; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg5sMeh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776107074; x=1807643074;
  h=date:from:to:cc:subject:message-id;
  bh=OLIGA8Xpbl7LwxTdNwtzaRpKzMbUpVXoHb3feq0X+18=;
  b=Mg5sMeh+E+fzSuXqe+c9DDsf/q91vsjzgs58nBK4qwLFwlcjrbxjdjoa
   MSeFgZNe23Bcj8ShdCQ3gbf35pJiP4+N3XWEDoar95xKYAjBzMAKoSXXb
   vZjhZFTHwjfJx61eq9+1B5nlWy7xdiniJBf68UoXE2g+HnQaTEZfXYM7E
   +rqTMSj+B0oOFqYwxfJEPwKN61wLfGb+5zBq0G1Gnq8JY57oVgxgBYq00
   Z8lfJ45DnAQrFHBennCPveTz5ho1TTVhiCbqpEX8W1C2rgaYTUrRMqZBI
   MOGtrDLoq/T12PpsrUuYcUT9IeQZqnyoX0JjW0s1M1yfVMhxUMRIzKXbW
   g==;
X-CSE-ConnectionGUID: WeUJt7mtRUSj6Yfr+7DvWQ==
X-CSE-MsgGUID: LIo++f6mSJegHByPUU57Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77018213"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="77018213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:04:32 -0700
X-CSE-ConnectionGUID: r1YozvwbRueOrMwI4aCiAQ==
X-CSE-MsgGUID: 4EFGtkD7RR6arvDjlHwcTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="225568146"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Apr 2026 12:04:30 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCMaB-000000000lp-3Qc6;
	Mon, 13 Apr 2026 19:04:27 +0000
Date: Tue, 14 Apr 2026 03:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, xiane <sangch.go@gmail.com>
Subject: [tobetter:odroid-7.0.y 65/65]
 drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning:
 'odroid_vu5s_gip_sequence' defined but not used
Message-ID: <202604140200.Qd8Tcwl6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.0.y
head:   527f04a009428b2e35090bd8ef9858d3fcc7a017
commit: fcbcacb4d233bdb2f84b9d9949e67d337881f287 [65/65] ODROID-M1/M1S: gpu/drm: add ODROID-Vu5S panel to ST7701 driver
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260414/202604140200.Qd8Tcwl6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140200.Qd8Tcwl6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140200.Qd8Tcwl6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-sitronix-st7701.c:545:13: warning: 'odroid_vu5s_gip_sequence' defined but not used [-Wunused-function]
     545 | static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK_AXG_AUDIO
   Depends on [n]: COMMON_CLK [=y] && (ARCH_MESON || COMPILE_TEST [=y]) && ARM64
   Selected by [m]:
   - SND_MESON_AXG_FIFO [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && (ARCH_MESON || COMPILE_TEST [=y] && COMMON_CLK [=y])


vim +/odroid_vu5s_gip_sequence +545 drivers/gpu/drm/panel/panel-sitronix-st7701.c

   544	
 > 545	static void odroid_vu5s_gip_sequence(struct st7701 *st7701)
   546	{
   547		ST7701_WRITE(st7701, 0xE0, 0x00, 0x00, 0x02);
   548		ST7701_WRITE(st7701, 0xE1, 0x08, 0x00, 0x0A, 0x00, 0x07,
   549				0x00, 0x09, 0x00, 0x00, 0x33, 0x33);
   550		ST7701_WRITE(st7701, 0xE2, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   551				0x00, 0x00, 0x00, 0x00, 0x00);
   552		ST7701_WRITE(st7701, 0xE3, 0x00, 0x00, 0x33, 0x33);
   553		ST7701_WRITE(st7701, 0xE4, 0x44, 0x44);
   554		ST7701_WRITE(st7701, 0xE5, 0x0E, 0x60, 0xA0, 0xA0, 0x10, 0x60, 0xA0, 0xA0,
   555				0x0A, 0x60, 0xA0, 0xA0, 0x0C, 0x60, 0xA0, 0xA0);
   556		ST7701_WRITE(st7701, 0xE6, 0x00, 0x00, 0x33, 0x33);
   557		ST7701_WRITE(st7701, 0xE7, 0x44, 0x44);
   558		ST7701_WRITE(st7701, 0xE8, 0x0D, 0x60, 0xA0, 0xA0, 0x0F, 0x60, 0xA0, 0xA0,
   559				0x09, 0x60, 0xA0, 0xA0, 0x0B, 0x60, 0xA0, 0xA0);
   560		ST7701_WRITE(st7701, 0xEB, 0x02, 0x01, 0xE4, 0xE4, 0x44, 0x00, 0x40);
   561		ST7701_WRITE(st7701, 0xEC, 0x02, 0x01);
   562		ST7701_WRITE(st7701, 0xED, 0xAB, 0x89, 0x76, 0x54, 0x01, 0xFF, 0xFF, 0xFF,
   563				0xFF, 0xFF, 0xFF, 0x10, 0x45, 0x67, 0x98, 0xBA);
   564	
   565		ST7701_WRITE(st7701, 0xCC, 0x10);
   566		ST7701_WRITE(st7701, 0xB9, 0x10);
   567	
   568		ST7701_WRITE(st7701, 0x3A, 0x70);
   569		ST7701_WRITE(st7701, 0x53, 0xEC);
   570		ST7701_WRITE(st7701, 0x55, 0xB3);
   571		ST7701_WRITE(st7701, 0x5E, 0xFF);
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
