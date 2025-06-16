Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4F42BEFF3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 18:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099067; cv=none; b=WckkgP0HeZ0Nx0T1S/L3fhK8Vi6gMJEbg8PjNroQE51BwrbJPsUHwuK8c6/vqfQGBmkjUJZAfa1UnpmIH7AKkIc0gIDGtD9yI9vtc5roeP83amL/4K0SKdZTuR74svdCxs0C5J+z/67qn2ZMkTV9wMHl057cWrDHC/g0GkQvhJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099067; c=relaxed/simple;
	bh=WyHTqblKHgqi+K+V33jTI0oRS3RZcw72L09xilVzrSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sAjqPeTC0d2+n292PIbPPVv+x/tzz6IhX6zhbGEFTNWtzkDa9xyJveBqgfaCtQKoflvez8eR1bsv58KmH8shWiUCC3IyqwvfZC4+g1wVgCxN6qMcraxELycEvIJZO3tjw4zvhA3bFlBNaf03OUbWDIi9kH2UHR2bnqZzm6LG+aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ld/3xAKx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ld/3xAKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750099066; x=1781635066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WyHTqblKHgqi+K+V33jTI0oRS3RZcw72L09xilVzrSs=;
  b=ld/3xAKx0Q2+y6wtzr6Rbw8lhdjBFFBSrToe/ybTpSoVSZjzXgrp69w8
   C+2jtJFYgDsKQBpuHwWvWSnCRyEcMbBSOP1lM/ApEcDtzE/66EpA6YrxO
   qwn3TaPL/J+oEzrsUkyiQFEtaBIrSbst2vZrkoqhfbYC6ZioVvwaSHEM+
   uZtLOK1ua1l9MMqNws+0MlbfqcVYr6D7Kp596RDKP7YCWVlhhAAFY0PeP
   q8dPJSlpVMTE0tja9oerIffN1Ii7my6XJ0Cuhg8tZi4qXKepBrQkAxfNq
   rZ6VD0bHin0nLOkCmCMDIChaAJPSVh9ICv4r8yJe30bVwWrBZ9sNkdbvh
   Q==;
X-CSE-ConnectionGUID: UjJiM8wUQhiKWDkB0SbcCw==
X-CSE-MsgGUID: 5ibZhnahScKbcz5IRvJAaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69833192"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="69833192"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 11:37:45 -0700
X-CSE-ConnectionGUID: Rg9dqQAfTqG+SHEATKgTyA==
X-CSE-MsgGUID: l7hlPpKOQKOZNPydipZm0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148442886"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 11:37:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uREiD-000FGQ-3C;
	Mon, 16 Jun 2025 18:37:41 +0000
Date: Tue, 17 Jun 2025 02:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for THERMAL_ACPI when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202506170211.R2qUuVmc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1e5ec7fa67a49da2e7623c93fcecb159ae4ffed1
commit: 029165643e81d28849fd9c690ab6d479966cce6c [1/1] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_THERMAL_ACPI-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250617/202506170211.R2qUuVmc-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506170211.R2qUuVmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506170211.R2qUuVmc-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for THERMAL_ACPI when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for THERMAL_ACPI
     Depends on [n]: THERMAL [=n] && ACPI [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
