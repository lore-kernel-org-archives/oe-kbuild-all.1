Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814E19049A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308061; cv=none; b=AzwaHUBZ08qP+bg+GZCep1vfsbf7kY0AofHML7UrBSTmgF1VE/M5oqkqX+38jLoZgHH4uD92UHzw0f4MaU8ZXWrTNdT6ALM6yyZ423FtWOa7/QzTXqEVV1dDiXs0RtNaNQ1mCvex9FHVnd/l+Z2rhAlHLpAjtlBPRM8XGyPBv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308061; c=relaxed/simple;
	bh=WqvCi4EcyNiD0g9IkOfe1GwYhwdIpNUXnEUBmzGZfCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BGipypu3kdmTF2PvQ5PO5akNNV6nYoS4IZcvYO9s69QDBVSC42ORBTKkaSge7H9yAScrsqJb4qivb1eXQfERCV17M0j/vCIS60drZ8zts2xLf+sJDf+E9LzFnompIzmEQ93ITJrpW/e0xLT5sXzOrT2HkQixcLrtoMKuV48qO4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbmAbgJK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbmAbgJK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733308060; x=1764844060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WqvCi4EcyNiD0g9IkOfe1GwYhwdIpNUXnEUBmzGZfCE=;
  b=DbmAbgJKeJW6S8INcgL3ILoHuvcKezyS1zFUiYLC6DZCRgTJW9U6bIkk
   CmEoafluigPwpPLxqUL+QHmrtoNeGEVpQ+5AIHtxJ3/yg6YYTnDNDB3yc
   HsVs0gjWE40y3raXEG0I+RIWJMI4r7QQHO4vPYSzHyLYqhwHTLypvFfkT
   0mo9dXeJIXNBzTheuudyz2R/JEKAcgrk+yWrp4b7wvenwW78/IFRaRhEe
   wSlv5nIgFL0hpBpqtBK2NDYixmlZ8HgRVM+Saxs5kt1ZYg5G8UaimKSG1
   tjvSaMPppWiPPb8ONgiATt5ESZBVoKese9Iqypq+qzi9jozjaBh/1ELZa
   w==;
X-CSE-ConnectionGUID: qjsk6B8LSPKGOae1KGa8BA==
X-CSE-MsgGUID: c14wXkb4RmWmAjK7BDVzGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51098744"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51098744"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 02:27:39 -0800
X-CSE-ConnectionGUID: 2WNhOGdAS/ahzKOQuP6QXw==
X-CSE-MsgGUID: S4MDWZ84QAa62/3SfnBobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93381168"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 04 Dec 2024 02:27:35 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tImbV-0002sr-10;
	Wed, 04 Dec 2024 10:27:33 +0000
Date: Wed, 4 Dec 2024 18:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1] kismet: WARNING:
 unmet direct dependencies detected for SND_SOC_MAX98357A when selected by
 SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
Message-ID: <202412041833.QtPhpule-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: c643c189f0fec116e75f9661e734545af0e3225e [1/1] ASoC: Intel: boards: Add Cometlake machine driver support
config: arm64-kismet-CONFIG_SND_SOC_MAX98357A-CONFIG_SND_SOC_INTEL_DA7219_MAX98357A_GENERIC-0-0 (https://download.01.org/0day-ci/archive/20241204/202412041833.QtPhpule-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241204/202412041833.QtPhpule-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041833.QtPhpule-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A when selected by SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]
     - SND_SOC_INTEL_DA7219_MAX98357A_GENERIC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_DMIC
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_INTEL_DA7219_MAX98357A_GENERIC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y]
     - SND_SOC_INTEL_BXT_RT298_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] && SND_SOC_INTEL_APL [=y] && I2C [=y] && ACPI [=y] && (MFD_INTEL_LPSS [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
