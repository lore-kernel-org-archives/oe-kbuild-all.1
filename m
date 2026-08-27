Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537B2C11C4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 05:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787809482; cv=none; b=RZHGPnPvcfnvu7Ue2pQqubCd9oRx4smAMvg1mtzooNxDrwSTeujBcwSXSCGriWcvx+V8NUEidNE9deVHq5NFekeZiDCKQMRVbCci4lWpYfPSrdI0YcTd5z0MbemZ+mUgOEeWNnacrCRs8ZQuJnnU3SMKbnOjKisSKPAkOnmKUH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787809482; c=relaxed/simple;
	bh=Txrg44cF8Xj9kdHIy+3jpycoJEPH977mTRdA0LuNZp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nBawwbYHrcOU/ZgAahG4fkbNx83HQm1xEkunUL+wDixhgxEMlZ9ZTNbh9W1CVqkQFsMBzOXj9fjeb0jeXbT+4Gtrr60kaNjuL72ToQVML6QA/UHJ75v1wGThF+5PaqmUH3eu4lvaQujAdlNqi8C4ur77ao2WTn2gQdodqei2ZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpAffQL1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpAffQL1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787809481; x=1819345481;
  h=date:from:to:cc:subject:message-id;
  bh=Txrg44cF8Xj9kdHIy+3jpycoJEPH977mTRdA0LuNZp8=;
  b=BpAffQL1YFaRoMuT1q8v8kif1Zr08+dcxahektkK+1ri/IC4/9KpxX9P
   zAN+f9lCDYFTuThwvFttjLw3AbDVwu9C9iYdKiAqf3uh2lyipvOmFNAXP
   LK/nHE4GbOLRtc6DhmAiWX8VZSIiNMxHaTXPJE6ziboxUnd+rtP9a29Q6
   tFuULsNNud7E5YuMbDiBZahnPKbj3edKO1K0Xgs8oWI8qcBpbX8jU+NAR
   D/n6HROOW/70iRSzNxc7KvO4FDqBA2mSX6B2PXNxJgg8Sekv4txpy8vKh
   Oqd3hNFkyniGsnPgixiKYzc50v/oeWs3s/+P9sT1AwASWj6iJOTBnxGJp
   w==;
X-CSE-ConnectionGUID: 9CSqxzZgT0yA98jnzRsLMA==
X-CSE-MsgGUID: XAY2EWU2TVSbx199MY9GAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88065603"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88065603"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 22:44:41 -0700
X-CSE-ConnectionGUID: +2Y9vWCaTf27QDBPo1TxjA==
X-CSE-MsgGUID: YUJx63DMTD+chUhYT6jLvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="267188420"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Aug 2026 22:44:40 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzSuj-000000000if-2rPi;
	Thu, 27 Aug 2026 05:44:37 +0000
Date: Thu, 27 Aug 2026 07:44:27 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608270741.aXYtT03z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   3b090ab3bf57f3728e7cd0cca1e5e0461d9a79a9
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608270741.aXYtT03z-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608270741.aXYtT03z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608270741.aXYtT03z-lkp@intel.com/

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
