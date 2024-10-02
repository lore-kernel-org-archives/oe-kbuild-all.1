Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D272216B5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 18:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727895034; cv=none; b=BI3PoHm2ALuLaRBgur72cMCKLr2yZuLMz4sWm2en4hVAHJfst/A+VO/sayXjvJq8vGEaL8rBhpmLDhBX5vMN9PwisEP5Zs361eO+sbp4erVnDYDFyaGyH/m7f7A45ZLjrA3iPiyuqw2y1svHu+MPs4oG4BMqPisRTzCcLKTSkFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727895034; c=relaxed/simple;
	bh=kFlIFumcWI5DnyV/SVBK0Zf8SxnMGxnGS1bghaaosEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W4dGLO/3A3JKu8U4FLBio+gTJuyEHIAyHMZ9SSKCLat2r6150+Fup2FKDe25r+kwH8GXALOIyLQvZXbNzCfm4QmSXnWJ98UGmqvl+/uV9wuG8A4ONjxmw/8uYHdoSXh9fuEch7stTZRlPZmX+i9FUz/ifJMOYIeRZ3r12o3G/eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1b++OUI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1b++OUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727895032; x=1759431032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFlIFumcWI5DnyV/SVBK0Zf8SxnMGxnGS1bghaaosEQ=;
  b=B1b++OUI8W5yjcPLd38+XPsW5StdeGRHdtFqBzQre+5U0uab+5WjBExm
   yyChzjZeM0Xr9/Ib8K3oUsxj819N3WgrXh6c2tdOhs/F71Wwj2ZQRFudB
   Q+splk7SagaUlGM3lxO9paeSg+OD3Oo/t5uGBMnosut73kXRmX/nVgVNd
   6AZvULf4fcLa+AoHvUY7Hl5ew8EhEBmOrdLJ4pkz7tgbwugDLQFLLBHqJ
   ISIYwN7IOjuvFp9P00bAS4A6wrgfFTUoz39CjLX5anM/NOgQDzr1LvILh
   BEMhrhcKChQ8DxfzuvMKsrfNBpzlDTF9muML1alXZJGzsdFBcIBimF0BR
   Q==;
X-CSE-ConnectionGUID: Q6oKj0qdSLy8eWIxQMO4iQ==
X-CSE-MsgGUID: qUTGsnVBSzGsGnz/cIGXfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26580089"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26580089"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 11:50:31 -0700
X-CSE-ConnectionGUID: 1Mt92jv6SCau9hxksGkAlg==
X-CSE-MsgGUID: ljYSm+M/Sv6JUD/jeVEXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="73769013"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Oct 2024 11:50:30 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw4Qd-000UPF-1X;
	Wed, 02 Oct 2024 18:50:27 +0000
Date: Thu, 3 Oct 2024 02:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Esben Haabendal <esben@geanix.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linusw-pinctrl:devel 8/22]
 drivers/pinctrl/freescale/pinctrl-imx27.c:21:9: warning: 'PC' macro
 redefined
Message-ID: <202410030214.dPrgmUqd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   30e830b8b952e550344224546f8cd83c5c49a5bf
commit: a55222b7a1327fabad71e1e61661077ab66bb98d [8/22] pinctrl: freescale: enable use with COMPILE_TEST
config: mips-randconfig-r112-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030214.dPrgmUqd-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project fef3566a25ff0e34fb87339ba5e13eca17cec00f)
reproduce: (https://download.01.org/0day-ci/archive/20241003/202410030214.dPrgmUqd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030214.dPrgmUqd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pinctrl/freescale/pinctrl-imx27.c:21:9: warning: 'PC' macro redefined [-Wmacro-redefined]
      21 | #define PC 2
         |         ^
   arch/mips/include/uapi/asm/ptrace.h:17:9: note: previous definition is here
      17 | #define PC              64
         |         ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PINCTRL_IMX_SCU
   Depends on [n]: PINCTRL [=y] && IMX_SCU [=n]
   Selected by [y]:
   - PINCTRL_IMX8QM [=y] && PINCTRL [=y] && OF [=y] && (IMX_SCU [=n] && ARCH_MXC && ARM64 || COMPILE_TEST [=y])
   - PINCTRL_IMX8DXL [=y] && PINCTRL [=y] && OF [=y] && (IMX_SCU [=n] && ARCH_MXC && ARM64 || COMPILE_TEST [=y])


vim +/PC +21 drivers/pinctrl/freescale/pinctrl-imx27.c

e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  17  
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  18  #define PAD_ID(port, pin) (port*32 + pin)
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  19  #define PA 0
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  20  #define PB 1
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29 @21  #define PC 2
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  22  #define PD 3
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  23  #define PE 4
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  24  #define PF 5
e16dbf60111373 drivers/pinctrl/pinctrl-imx27.c Markus Schneider-Pargmann 2013-10-29  25  

:::::: The code at line 21 was first introduced by commit
:::::: e16dbf6011137343f51685c1e0c5be36a68fc501 pinctrl: imx27: imx27 pincontrol driver

:::::: TO: Markus Pargmann <mpa@pengutronix.de>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
