Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C25357CF1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790521779; cv=none; b=JEJ9clgIqr5eL0ce8EV5SR5wxOcBWR8NKLH1dKs6RP5YJGrk2QCyhRpdEhVzG7uAXQ4C8tIT91am9DQWH+GycGhCgbJ5iheQD0j4P7Qfig8cbAHF+T9KhJZqMoCBLHDQUtxamXL0cNduC/Ss1EBhW3bEOVZF2O5dgwj9Rp8pABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790521779; c=relaxed/simple;
	bh=c07JmNnf1PUufJ7zWQWZtuzRHoqWusjbNoB9ilt9pmw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dShoIARGGizMEPtiNPdDKJZcv+5ooH9OAnQtCfJtIN34tOCQl97gIAq7BP7IkxP9I2oog4U/VDP5NOCY0HNqj79MFtGxIPrgqe4HJpM8B3D1IzAQjXEfSOWqLlfevv7DUIlOeqgp1WjGrCnPXnbu6cLb/u4mpSSPugpThDjc9Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0WoevLp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0WoevLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790521775; x=1822057775;
  h=date:from:to:cc:subject:message-id;
  bh=c07JmNnf1PUufJ7zWQWZtuzRHoqWusjbNoB9ilt9pmw=;
  b=n0WoevLpWwETL2x0XuSMlmn2MGci1u0qkHVrL9bza3G4/K5DPPahyogt
   ouDM9pyuEJ7ophLbKDzS2k9umqNsXLyvP+/JSTM3mShXDJw3J5d14dm5R
   gkfNnCcgvki5IopqryiMDCdC/+gZACEEqOAc0zzf2boZNwCwbhn2gXSj/
   +bDmEUC3JvGsieOvmOKQNqOX75BMY7H7lE4zwPTpfsUPKU1T725z5Ii0S
   Ua/GQJhQRv1URPlaZpvlhHE0syhmCOw1Z+iBkACJ2ds673Gd0438Ztda/
   GH2ORTqUBaaHx7L4WWGXg8NQ9oc1+eKbY/wNJL4/Q73OB8zi9sRJwxxPx
   A==;
X-CSE-ConnectionGUID: Ft6ZXjtwSOyi0sZXSzVkIw==
X-CSE-MsgGUID: oYUXuaVqS8Ko/DKhE48lug==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="90361082"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="90361082"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 08:09:32 -0700
X-CSE-ConnectionGUID: FI0z7a1dRsKzgD1qsC9qCg==
X-CSE-MsgGUID: 1pp4CIrsROG7b0vq2PVp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="312747674"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2026 08:09:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAqVJ-000000000cB-3fvd;
	Sun, 27 Sep 2026 15:09:25 +0000
Date: Sun, 27 Sep 2026 17:09:17 +0200
From: kernel test robot <lkp@intel.com>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>,
 Ricardo Koller <ricarkol@google.com>
Subject: [linux-next:master 9572/10910] kismet: WARNING: unmet direct
 dependencies detected for DRM_TTM when selected by DRM_XE
Message-ID: <202609271717.pg5HjzeZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
commit: 626ff2b34dbb7679b798f7a4962a8b3def695045 [9572/10910] um: allow deselecting CONFIG_MMU
config: um-kismet-CONFIG_DRM_TTM-CONFIG_DRM_XE-0-0 (https://download.01.org/0day-ci/archive/20260927/202609271717.pg5HjzeZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260927/202609271717.pg5HjzeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271717.pg5HjzeZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DRM_TTM when selected by DRM_XE
   WARNING: unmet direct dependencies detected for PCI
     Depends on [n]: HAVE_PCI [=y] && MMU [=n]
     Selected by [y]:
     - FORCE_PCI [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - DRM_TTM_HELPER [=y] && HAS_IOMEM [=y] && DRM [=y]
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=n] || !KUNIT [=n]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])
   
   WARNING: unmet direct dependencies detected for SHMEM
     Depends on [n]: MMU [=n]
     Selected by [y]:
     - DRM_XE [=y] && HAS_IOMEM [=y] && DRM [=y] && PCI [=y] && (KUNIT [=n] || !KUNIT [=n]) && (INTEL_VSEC [=n] || !INTEL_VSEC [=n]) && (X86_PLATFORM_DEVICES [=n] || !X86 || !ACPI) && (PAGE_SIZE_4KB [=y] || COMPILE_TEST [=n] || BROKEN [=n])

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
