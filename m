Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF8913C67C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 22:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730931343; cv=none; b=PWZ/Nxsiw6xFgU4egdoPmKXxRBbm+wWWRgPYETpLksjbmPL2yFHrxe6T3QUY0h6KTceYel+t0LHHI4Ihup/z6B7hfNBeKTdMhlMcXQbWPZvByzIUTnoPV8Y+nVbPyfjmGMkfkhAewSsMrglzG9+NAsPO/oH3OgSSZ/bo5347ez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730931343; c=relaxed/simple;
	bh=GdUuBdVQuaAYzDtQCwXjSPhRZR87DTAP5BcJWhb4f4s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XJAVFUwvsEi9ywc5PDjyWB66EaOLBuBcHYptUnYY6fG+7Ld/WasOfS1EvYVw4+bvv84E+ToZ4AGygdgnQOT0ptywbKW4WtIMDknQ2MHOWZrGpUpq6fqwWx9/sVrSN63SJ14Wqph3PQtbNgIT4ecAs1B+drDGbetOSu3JdOaWdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHkApod7; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHkApod7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730931341; x=1762467341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GdUuBdVQuaAYzDtQCwXjSPhRZR87DTAP5BcJWhb4f4s=;
  b=kHkApod7xvP25Sp6a+9ycwZu6kqwSHDAibjrkoN1Ab5ZEeefxr6vcG6B
   iTyBpxjnNgDvtxvfMttqhGTiyvMIG7D3LJyuB1VATqJjkqJWpykzXg4ZR
   Vx1A6UvPCzayletsdoC++sULl3WhAIYPbs7m6tE+yo0H7Lx7jqd3JhLT8
   bCwmnijmjX2jDpod1Zm8YPB0yyg2nuQulwuH1dZwH4uQzyC3dN/lE8Isq
   duikY27Ji0biSEQ+k2tUVFPyab1hEjkUJ+rmvgiwwvq6F4cVdayD3euwm
   MumZunbJ24H1+4zT79v7spA587VHFx45rjY/XVH5zu+AlC8MObp9rF+Sl
   g==;
X-CSE-ConnectionGUID: XjxNIKFsR8OestwrfcCgPw==
X-CSE-MsgGUID: RjBEvTjFSZCfys18SiCnqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30932808"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30932808"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 14:15:40 -0800
X-CSE-ConnectionGUID: bHADgkb2TyuUp2pXXF8+GQ==
X-CSE-MsgGUID: 4M9HsobvQaKrJrxCkohNLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="89321805"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2024 14:15:38 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8oJM-000pTy-1U;
	Wed, 06 Nov 2024 22:15:36 +0000
Date: Thu, 7 Nov 2024 06:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [broonie-ci:20241106_yung_chuan_liao_asoc_intel_kconfig_fix_undefined_symbol_sdca_device_quirk_match_issue
 181/182] kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_ACPI_INTEL_MATCH when selected by SND_SOC_SOF_INTEL_COMMON
Message-ID: <202411070806.UhCRpZok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20241106_yung_chuan_liao_asoc_intel_kconfig_fix_undefined_symbol_sdca_device_quirk_match_issue
head:   845cb1ddf1fc2212f876db6df9d3277badd35709
commit: b6bd3f3b6357f727a177f31861144788eceda3c1 [181/182] ASoC: Intel: Kconfig: make SND_SOC_ACPI_INTEL_MATCH depend on ACPI
config: x86_64-kismet-CONFIG_SND_SOC_ACPI_INTEL_MATCH-CONFIG_SND_SOC_SOF_INTEL_COMMON-0-0 (https://download.01.org/0day-ci/archive/20241107/202411070806.UhCRpZok-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241107/202411070806.UhCRpZok-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070806.UhCRpZok-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_ACPI_INTEL_MATCH when selected by SND_SOC_SOF_INTEL_COMMON
   WARNING: unmet direct dependencies detected for SND_SOC_ACPI_INTEL_MATCH
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && (SND_SOC_INTEL_SST_TOPLEVEL [=n] || SND_SOC_SOF_INTEL_TOPLEVEL [=y]) && ACPI [=n]
     Selected by [y]:
     - SND_SOC_SOF_INTEL_COMMON [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_INTEL_TOPLEVEL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
