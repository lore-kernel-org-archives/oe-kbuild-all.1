Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DA1391845
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 08:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323241; cv=none; b=pvzvIe/MkdC4dH1dI/j3/ToPKgDuJPTk57H1fbHIFE/ZhXhbdcuJT8JacMJKmSQvkafOmaYSJMTcsugJi/YaRb5TOPFGs8ldC217rD9BFBJpY2wJFtqmhqrUzBEmTM2SecSTZsb0cTLw2otObzi8i2rAeSYpTfzpwD2w9GoIBNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323241; c=relaxed/simple;
	bh=KoQMJLtxg26Ffta9FMliFoG52d/LagigrSJ/CNfBoZw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MSPQ5xtsrbbAUBIqPClUf6Dy8xLdcivmZP4JoU5J947wyWoOd70S9JZkTtRQ/jhTItfaitDTv6y8mtE7M5TOpGEuFPIhF6sUjBmfJS5D+/LSGGrK0NPdLdhBhmIuAAZ88r/GouGTRJRHCY6lVC+cFNlkQfY5LEiUU2LMHC6jhp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuZPyPnT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuZPyPnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790323239; x=1821859239;
  h=date:from:to:cc:subject:message-id;
  bh=KoQMJLtxg26Ffta9FMliFoG52d/LagigrSJ/CNfBoZw=;
  b=OuZPyPnTrkWSpnwwIfX43GP2b3XeKBTqhhKXgZt+F/9grYsNto+pyFfx
   qj1Rn8HVvG6BVzUsSWx+sb/Yymsi/60Cp1eE7+krmmxHBuKQE2ohIt6m3
   sQOSVhV3Ep3/y+nM/FT+Tjb8oCJeGMlncg4ceIYrC4WfHrMXM5kXzltXx
   RhTbiGeHGmJ9uxzVk0YvDjoHvZr0goWcPCh0YeTq72Td73OMyoAJ01YLo
   ywJeXTpuzZSvf2yEhHeaVK7AcCLhs2ff9SwaneXBVgYkbGzpe3vPf2X2r
   ZS6y91PJQE0BDX5Lq292sYIx9qeLGlFGu3V5qdDqCUmcWZWSV6nzr5exq
   A==;
X-CSE-ConnectionGUID: 605tCLnHTmi1R6uI1fojxw==
X-CSE-MsgGUID: lc+j0+UZSJKJme+vxeOXdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116634081"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116634081"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 01:00:38 -0700
X-CSE-ConnectionGUID: OrPbWS4pSyyzsIgYthVRkA==
X-CSE-MsgGUID: B/sekRcCTjmV+058VYJ0TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273820431"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2026 01:00:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA0rC-00000000KG6-3vEK;
	Fri, 25 Sep 2026 08:00:34 +0000
Date: Fri, 25 Sep 2026 16:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 6508/9480] ERROR: modpost:
 sound/soc/codecs/snd-soc-tas2783-sdw.ko: symbol 'efi' undefined!
Message-ID: <202609251506.VbwkGOXB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: 28114992dd2f03724eb3d024839b3f9f299656d3 [6508/9480] ASoC: amd: acp: enable TAS2783 and add RT712-VB SoundWire machine
config: i386-randconfig-1003-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251506.VbwkGOXB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251506.VbwkGOXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251506.VbwkGOXB-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: sound/soc/codecs/snd-soc-tas2783-sdw.ko: symbol 'efi' undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2783_SDW
   Depends on [n]: SOUND [=y] && SND [=m] && SND_SOC [=m] && SOUNDWIRE [=m] && SND_SOC_SDCA [=m] && EFI [=n]
   Selected by [m]:
   - SND_SOC_AMD_LEGACY_SDW_MACH [=m] && SOUND [=y] && SND [=m] && SND_SOC [=m] && SND_SOC_AMD_ACP_COMMON [=m] && X86 [=y] && PCI [=y] && ACPI [=y] && SOUNDWIRE [=m]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
