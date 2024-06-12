Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973E1DFF0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 16:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718209748; cv=none; b=fINTPXD7aME8lfbkiQOO+wbADlhEDfJL7vagoxW6dAFECmzy2lKFUasXlXWL/JfxRuu9H1hjXeZzZEiYNhVCQAnFvZE2894urkvlEstUaztYQMkvHI8GXwyZiphnl0luBdukoJCd1eGk4hJWGvoQwZg/RH3+t2s77NhvxcS66SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718209748; c=relaxed/simple;
	bh=ILJJl/poRacGfidpf3bo5cFg9GXhxu4TUmy1niQimD8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HirkPK5hcoIi/ABHNC+msFA1UbyGC15s/CaOK2rtpJIjN2ReQ+EQ7IHJk3z33EO1FlgOIhjeLRSnUTk+o+uVQn6HdSq4VK4A/oh2DFXeNu+d8ukzN7AfMz67XWVga/9/LQeCSxjycH/GvgWnd1nOAx10qkoz1sIqGI1ieyMBNGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQbbIyIw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQbbIyIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718209746; x=1749745746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ILJJl/poRacGfidpf3bo5cFg9GXhxu4TUmy1niQimD8=;
  b=cQbbIyIwPld5cG+Gq+x/6HVWeyQ0bn4/TNRBKEXomkr8mb9a8jvE/J1D
   zOdXQ09LcxdMTHi+0iCCkffEX1VkQAjK5ZR77BazVMjkU4lvXxBsvJN/7
   NxZX51SY+z5fzgW/R4CmKftZ2zUF3yOtNTezU8fqyJrzllNbq4NFR7IrH
   A+i093JET1Fh+9j7iZPX+rgHQG5P1UAUGg8kaJZV8T6okJlY8/gYABJwP
   Nw+MHUJA5dA6yxplkY26mGD3mbjqTQXyFPW5vc4dcWLvUw+VRzEw8K5tk
   qfCQ+M7hksW/+3ZAkm0y+cLpoexrEYBk7YHW1TfbFzCfbFgyNXkuB7snq
   Q==;
X-CSE-ConnectionGUID: 0BfcJNg9Td+ssgU5iYK0uw==
X-CSE-MsgGUID: 01F2JvT1R7CgI4KyH4tQBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25620158"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="25620158"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 09:29:02 -0700
X-CSE-ConnectionGUID: qHga9V6XSyyU7ysePRJeYw==
X-CSE-MsgGUID: Gie21eo1TiScL4AS3Wkslg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="71042492"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jun 2024 09:29:00 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHQqH-0001ia-2w;
	Wed, 12 Jun 2024 16:28:57 +0000
Date: Thu, 13 Jun 2024 00:28:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 730/6555] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_MAX98373 when selected by
 SND_SOC_INTEL_CNL_MAX98373_MACH
Message-ID: <202406130043.3Vj5p2lO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 0b5ce6206cb013899ab47514f534db745ae7ae17 [730/6555] CHROMIUM: ASoC: Intel: Boards: Add CNL max98373 I2S machine driver
config: x86_64-kismet-CONFIG_SND_SOC_MAX98373-CONFIG_SND_SOC_INTEL_CNL_MAX98373_MACH-0-0 (https://download.01.org/0day-ci/archive/20240613/202406130043.3Vj5p2lO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240613/202406130043.3Vj5p2lO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130043.3Vj5p2lO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_MAX98373 when selected by SND_SOC_INTEL_CNL_MAX98373_MACH
   WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
     Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED || COMPILE_TEST [=y]) && OF [=y] && MFD_SYSCON [=n]
     Selected by [y]:
     - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 || COMPILE_TEST [=y]) && OF [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98373
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_INTEL_CNL_MAX98373_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && SND_SOC_INTEL_SKYLAKE [=y]
   
   WARNING: unmet direct dependencies detected for PINCTRL_ASPEED
     Depends on [n]: PINCTRL [=y] && (ARCH_ASPEED || COMPILE_TEST [=y]) && OF [=y] && MFD_SYSCON [=n]
     Selected by [y]:
     - PINCTRL_ASPEED_G4 [=y] && PINCTRL [=y] && (MACH_ASPEED_G4 || COMPILE_TEST [=y]) && OF [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98373
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_INTEL_CNL_MAX98373_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && SND_SOC_INTEL_SKYLAKE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
