Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568852080C1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740220816; cv=none; b=rlNayUzknmkMJepwidZs/4VIa/lKy8d502q3qDARFpTtit83IeQJDXdMLLMhXh6DZAiCTXnjqtRys0CxRYBD2K6x8ktTgvdNdDCPP5++Tsn+FrcIkO+Hw/xVXNQQAgnjF+D/P2xx41Y+v4lCp99d68sjq/J6gdj+y+qAuhHFtEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740220816; c=relaxed/simple;
	bh=vSASphmv7GuCD3+nCg2Rl2lWFdCmO3iS1cyTzdEAICY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E7oTC1LwscfIso9xUrKI6GZYZo9GZy1pP5bjnQrCuMrmwmw+W+nQ8Ad9HE0Iap9pZxdadJOiCfV8GFqUPevTY9LUy9XFw4S4g+KvgevFDQqa8rkSDLXstkuAQJZUxfPkjKlB6HC4NTKxR1yp3muhBYD90hOy2BU2ytd70vZeP9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZVwQWK1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZVwQWK1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740220815; x=1771756815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vSASphmv7GuCD3+nCg2Rl2lWFdCmO3iS1cyTzdEAICY=;
  b=nZVwQWK1QNHXRPQt2T8C60SFxQe5dw9MRVRbv32m+DpDfDK7VLOf2Ajf
   bOZmEJ/Cw0lHa1Or56mhH1WVlUQiOy3hqQUtHiCG1S0ki4C/5djANynhT
   PuLdFu255UFvxBg8Rhikllcgl/eHgUqBMuH0AD8czwFfZIiz47SbWwK0G
   iXFVS3HwynRk1l1Hg7gtEOhO25v+dTOp+zp5wxYZ9VHGrM1Umx6Q0rjkw
   GuJwZL9rADYHWu9+KsIFCWG9FjEPA521wv6CALd4HDHsHPXdvQGrlJFty
   ++iYdYmQmS1oPJPE/Fs3SYbvG3mbc6TbJ3UNoDRA7bofi/QDC/vJWw+Vo
   Q==;
X-CSE-ConnectionGUID: GcqL7lQ3RjyIeACWNBPneA==
X-CSE-MsgGUID: z5EbP7WpSfSQYbPJu/roZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58584430"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="58584430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:40:12 -0800
X-CSE-ConnectionGUID: BHFVion9Q1qVzfXgyNINgg==
X-CSE-MsgGUID: 4s9SzbWqRPenr2SwJ4pwzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120843257"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2025 02:40:10 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlmvY-0006UL-1q;
	Sat, 22 Feb 2025 10:40:08 +0000
Date: Sat, 22 Feb 2025 18:39:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202502221846.LDnZaLto-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   f1a7d64e039461ef511f25b61668310cc675cf24
commit: 440d11cd96f3f7bad78bdb2e10122b02a626478e [1/1] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250222/202502221846.LDnZaLto-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250222/202502221846.LDnZaLto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221846.LDnZaLto-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for NET_DEVLINK
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for PAGE_POOL
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_NET_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
