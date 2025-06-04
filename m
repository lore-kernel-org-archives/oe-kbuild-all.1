Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E2EBE67
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 14:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047522; cv=none; b=HyBIpoZHah4mVVSEj3Q5Hj3UmkwVJPhhQNkUBKs3KT0odK1jS/L1iT4T8ib80M7wJU95JHVERm6CXWtlRoOrZEqflkBcKe/mHEM99991D66EfJL5Zgmu5crCCVnX2MP4GAqQuAJKbC/jdjHJpjOyeHiwhpOgC90W8hfQQDuPzXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047522; c=relaxed/simple;
	bh=WrynPsgYyA+JL1RqGc7cI6aRcokqokNWg+EFypmXlLI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xlg/SElKjO+GnKt3u49jxkGhm4N4vVaMzbDJOF9t7F8j3aQ4TCi94BBYBmFSPcrunx9zhcyKBYG9oVsrJtaWcugNmyP8dOyXqMdIjS9am42ZQaPWfzyWTBgwikD5L6V41B4Gp8GWn95OYWeO5KrW6krL80ycbhewTwy9gv0NqSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTo7ojSs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTo7ojSs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749047521; x=1780583521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrynPsgYyA+JL1RqGc7cI6aRcokqokNWg+EFypmXlLI=;
  b=BTo7ojSs0sosIYFLx2UyaqOhClYrUiCeWa69NP1S/nhDZDTcZEE8TMC+
   sroBvS49l5bd8gP2lLN8tYcf0JrbSVTnlAhkNGFn6iR63cYhbbUQLT6os
   H+Dxh6KmEgQZC3vUFtHUPIfSm9kKodZutj6yVbPNSQ3sOMVHaFiom9YsG
   SsF++9Dc0GP5Em1YfQp3FfYqtdcat11ol2TmWkrvyPCd2xVey3UqflyzP
   rkU1LwDklYc/jDoxhFsKZwcenBaIvrsffe6r2TQHWjG1G9vqcaEz1Gdmu
   Ytl8nj2s4+tUMUgEaUMXnef9OsgXJGZwtFsKsiti33yoVBDBWRrj4kNdz
   g==;
X-CSE-ConnectionGUID: F9OvHKT2QdmFCrodVamzwg==
X-CSE-MsgGUID: YyKCTLoEQLGkut9qLi3lig==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51279667"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51279667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 07:32:01 -0700
X-CSE-ConnectionGUID: Lc5im4tcTIaumeM3xIFYtw==
X-CSE-MsgGUID: IzuEHkctRICVpjyCDS0/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176086661"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2025 07:32:00 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMp9p-0003DF-1a;
	Wed, 04 Jun 2025 14:31:57 +0000
Date: Wed, 4 Jun 2025 22:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202506042216.RlvMlE32-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   7d21e26cc9296ffd8d83440c989eb089f799f75c
commit: feb0be0c1302a55148a66cfd506047ea0c425836 [1/1] Revert "ANDROID: suppress GKI configs for 32-bit builds" am: 8b9a794068
config: i386-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250604/202506042216.RlvMlE32-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250604/202506042216.RlvMlE32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506042216.RlvMlE32-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
