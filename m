Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542F935674A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 19:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761131; cv=none; b=fXyIj26BaLVqMo4lf94ssFoNtEbfFP3yacsDdKioCgDuZuW9RL26HVL+qHyOT0EsxI/E7nRi/U9r+n+uKjod3BzrYtKXYVPgm2sDnOw6I0vQgVHVfuqUWNAU7S+qRrf1+Q6i75ccz5WcGUUk+yNQ5dfa1DVaPXtyMxHI2EIxyR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761131; c=relaxed/simple;
	bh=n3bB5r452ISIME7K3QgTR6nelUPEfVwamsBmxIiHIy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A4bGI3lgRi4Npz18ZndYne3H2zAY/YCwzhsBltdqFEtIRNtOZZ2Bp0Mx7jROaze3TTZAGx6DnrR2bpahFakAcfCprbn29nEqFXwm5ooUiLuvThlszg5DvnUiOMGwF+I3MNpdWUJitF7oCIHbln2s63HNDTCvf9Jh7SG85mNYTLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3KAuYOL; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3KAuYOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789761129; x=1821297129;
  h=date:from:to:cc:subject:message-id;
  bh=n3bB5r452ISIME7K3QgTR6nelUPEfVwamsBmxIiHIy4=;
  b=c3KAuYOLzy02BO7fVsf7vsXkFaApn6xHgUjDx/DIhZ6gmgL+HU8Y8LnW
   Ph0jNMIIKD03LUNcwi2X/fbTGnXljZRAVsJWcakzcSpp9i63htlpmesfc
   vH3UuV/I7wvxKlh1Gsgj3bpp3gDeeICf21JFeuM6K1SS6hu2lpT6fFQFZ
   +Hs4PxKPh/s01cSLLhun0VvAWhEtNUdJe4xaNO/j5F0In++kxF8BYEp6T
   ERRLnvbCjf3g1HpIGLEBsD4OsuY1ltXyGJFNpQOUNXz9sca4K5DGGbd5y
   rOUk8UHbPCYf9fI2BXXmDNaj1AujGs31tHhSQGC1g/XG2KTEcGJNToarY
   g==;
X-CSE-ConnectionGUID: Bwes7RrATf6imuza0ZIzLg==
X-CSE-MsgGUID: kFWyiCmQTS6U30LDrv23yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="800583"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="800583"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 12:52:06 -0700
X-CSE-ConnectionGUID: gwVHTu10SKqrPURe7etpqg==
X-CSE-MsgGUID: JdnwA6JxQvmuJltO4VCHtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299658411"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 12:52:03 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7ecr-000000001BS-2rh7;
	Fri, 18 Sep 2026 19:52:01 +0000
Date: Fri, 18 Sep 2026 21:51:28 +0200
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.3 14/16] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_TAS2783_SDW when selected by
 SND_SOC_AMD_LEGACY_SDW_MACH
Message-ID: <202609182147.gfofWIXW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.3
head:   174d160884199cad97413f33fe1b56027dc0d3e1
commit: 28114992dd2f03724eb3d024839b3f9f299656d3 [14/16] ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine
config: x86_64-kismet-CONFIG_SND_SOC_TAS2783_SDW-CONFIG_SND_SOC_AMD_LEGACY_SDW_MACH-0-0 (https://download.01.org/0day-ci/archive/20260918/202609182147.gfofWIXW-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260918/202609182147.gfofWIXW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609182147.gfofWIXW-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW when selected by SND_SOC_AMD_LEGACY_SDW_MACH
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y] && EFI [=n]
     Selected by [y]:
     - SND_SOC_AMD_LEGACY_SDW_MACH [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP_COMMON [=y] && X86 [=y] && PCI [=y] && ACPI [=y] && SOUNDWIRE [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
