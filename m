Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCE724169D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766269371; cv=none; b=oVk1nMYBsMUpA7dbxMaM/XRJF1k+TosxEf0bySptCSCv+s5XbkGhiOK99eRdDQSzszKay/cCgit5PZYfudv24hkvZ+DVzaL+3eJkRz3flW3y6BPDOWtNVUtP1H+ElmgpPbPHU1LHtSfM4tcXyNWP0AqYgGOy5m8UMnGleOEjK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766269371; c=relaxed/simple;
	bh=t5/cYGgPD77cBjDPBRvAaFHGjTl2vepCWu3L6XZ7z1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uB6+7DLdGi1O/eDNwHWdUU4jglXbMutUgD2AtiXSo2LAOf6t7RuaelckMqGZ8hlhPBxqD1K0e9e7ox+uKIOF1SbMBrvpkuIXqIiJDTP1aeFQIjicAwgImpXYi7x0yGEOk8w8MFdTGM3fPbm7xt3FYwHOOsdzZmr+4PZE7ZvYnI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpFBXkYl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpFBXkYl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766269369; x=1797805369;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t5/cYGgPD77cBjDPBRvAaFHGjTl2vepCWu3L6XZ7z1Y=;
  b=HpFBXkYlcee2iWSTEBFSAZFp85SZjo4fwprUkPhafrgUxLkYe5CZ06oO
   qaML93Q/ucJkKd1MZ/Mow/WoXksy86RU+JYhHENjmxP7x2HFf3qKd45fO
   gxXEKFQgL7GDKTVpNNuOQQaJezPsEz2i2Yy/y0ZjBFPn7ph3SgNqpYvls
   GSiMLYbsINEVTAe2KWt8vzbWllABU0xwzMLstU8RKZNosd0upmqLkNHuV
   Ajw9gvbNr2NapWWvjb1+LEtnTDZXbeO/UBrdiO4vAAuzyRy8RMXTep5fm
   fVtG4Hvx7TAFZVTpnXR+8ECp1JBCQ/vU0LpYp+1m9ZBsu61udGWwSXSNX
   Q==;
X-CSE-ConnectionGUID: CAobr2kARVqT0EAf63t5Ig==
X-CSE-MsgGUID: dZhVmFwmQPqh5/UVF2pJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78823154"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78823154"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 14:22:49 -0800
X-CSE-ConnectionGUID: sSyfY5kDQ76QmkbsGur7RQ==
X-CSE-MsgGUID: E9Y3zXp5QTmnP+NjTNVHNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="200062661"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 14:22:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX5La-000000004nk-0YH8;
	Sat, 20 Dec 2025 22:22:46 +0000
Date: Sat, 20 Dec 2025 23:21:55 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512202322.i3j0KFDa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: 025be59f9131c7d197bef270bd95dcaa100c2b80 [12/12] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251220/202512202322.i3j0KFDa-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251220/202512202322.i3j0KFDa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202322.i3j0KFDa-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=n]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
