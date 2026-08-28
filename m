Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE8E3F1055
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 13:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923089; cv=none; b=HH9dQ8Uja80OVh+CbCpEoiPnLT7WWRv3lXuQT0AeIkfnFZQ6+0AswzZ+UrxifBKFBgPbWDloEi4uQ0ncppYQmz/r0u58C1HK1vmYLQ2eL3N3SgkAb6c0rW19Wa0u0HrqdCabZaioC8VZXq7EUA2D7wkBupBHY82aA4sENBaTI1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923089; c=relaxed/simple;
	bh=5WssZxugA7WKnEdVC1JF0VoOx5piaTz/mVfI1IPkTY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Jm7PewdMEwzwyNWb+YhR0IzIKped2cxYNG+gGCZF2i/ZSExRfyhcXk+np1jkSNVbnTScjd7zYtmbGI6STeRBbsmUJh4mm/xafRPtiMt5XL0Z9wOOX61eBGP8T0l9iFWvY8ZOseIi0khnS+i3dpZBRW8zzXzELBMvYiZdcyDdPnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+dNbKMa; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+dNbKMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787923086; x=1819459086;
  h=date:from:to:cc:subject:message-id;
  bh=5WssZxugA7WKnEdVC1JF0VoOx5piaTz/mVfI1IPkTY8=;
  b=O+dNbKMa5Vp8L86Ug+WjnK6gAn+yUIp1b7ojH/rwl7r1UfrdsaZmrZYJ
   cRf///Ypzv2OlMjdVwzYAJoP04WyaQ+bbaLAZbpU4Wx+eKrZF/gc49ENU
   oLcT42ekXwxFSkPXV6jcv4hpQ1QP1Nf827ZxDyqzQqaucsjFTaRkCm5cr
   hAprNfFwuRE7EHbfB/dvg05xfznR7m/EwBqLh9z1+6gQPh4Wb4eo5Twog
   pNC1D1ZI99hZAPAyG8ptwxLBlooJ0eNJsZRwg3X48e5fgt/5tc2rpadC2
   J724y+FfZbh69DQXl1lEAyLlXl9UW9tRqS9oA4uLpY84oZ2FUPSZCJV+V
   Q==;
X-CSE-ConnectionGUID: VFBOUfx1Tm2WuuXAOqUvAA==
X-CSE-MsgGUID: iSvF2Xu6QXSqAljuDHva4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88194059"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="88194059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 06:18:06 -0700
X-CSE-ConnectionGUID: oG6J15X7RVGFljDE32cTpg==
X-CSE-MsgGUID: G5t+AzCuQqaOtpwV2NEIQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
   d="scan'208";a="298059182"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Aug 2026 06:18:05 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzwT5-0000000015V-0KA1;
	Fri, 28 Aug 2026 13:18:03 +0000
Date: Fri, 28 Aug 2026 15:17:07 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608281520.3tOEHcYC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   92378ced66f1faad5aa0211129792fcbca45a282
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281520.3tOEHcYC-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281520.3tOEHcYC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281520.3tOEHcYC-lkp@intel.com/

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
