Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B373AE71E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 18:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787940013; cv=none; b=dZ95iqy5u/ZtGmckcAqJTUve0RXTH9vFC5yKpsIOamzxJ+ZagXaXQO5loOdlG7Dld3RMeCIzAd+eDCFjPXSn5UlXpw8uG7XrhADSRM0KKwRd6dWZ4RkoHntg6Yn3qnjMYqX8XOIJvTgQJlRV00bHS/xt6ZFXtQVuY1MLlscTQyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787940013; c=relaxed/simple;
	bh=78cBsW54jGDkYx054+iYYldxxqzYsubQRcmSnmYsXuk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FwQncjlmAh6msfA1nvPYPCMwHaIPPIO1cZhISdur+7AdzZQh9yiAWMrHhn82Dq9eZD901eGraPChsDEszMNCuuOVWM89HZ/me7kRNaVW5dnhwTU0BU821Y+caDHqYctR4dEPbyOAYCqcKlzGR/srDCWtgRRnyBlxbkkUB36dxqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HRLoZzGE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HRLoZzGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787940011; x=1819476011;
  h=date:from:to:cc:subject:message-id;
  bh=78cBsW54jGDkYx054+iYYldxxqzYsubQRcmSnmYsXuk=;
  b=HRLoZzGEfaet2tXjULlakaTvUYwPa5LiIkUF0qXDHAYMcSy6Q0NOaFP7
   yEUspGxZuF/RFPioj7dXG8kLONUU95y2LOCrzuF981wGr+GEQalO+rhPM
   ZUFdo5nKUG9k0jGz0YH3kxskIKxZbFUbNzF+JbOwofAV/tr7tMpKi4SpP
   1JahePcFeeu/rZrACi5OU75vg/8JUpuZ1Mi2HGd3juexrec2h/8PYYUsJ
   /Incf0rLYzp4ANtR2XO/DyyRF2UmkGMjtRgebzBJv1D6c7UeafS336yK7
   ZiDqR4jCG9nAAWvofUT/0s8rBZxvCodb9gzIG33fKmmhzt3XOm5oxP59c
   w==;
X-CSE-ConnectionGUID: m+1zPYzdRCeoeAyz5vsiyA==
X-CSE-MsgGUID: BTwx6CGZT6e1J+b/4Le0RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="88216526"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="88216526"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 11:00:10 -0700
X-CSE-ConnectionGUID: Zl2bpRHkSii+ghFn31URzA==
X-CSE-MsgGUID: kNR+M0q6RSikKVQunSUDLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="273483991"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 28 Aug 2026 11:00:08 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x00s2-0000000019p-3xFP;
	Fri, 28 Aug 2026 18:00:06 +0000
Date: Fri, 28 Aug 2026 19:59:57 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608281947.2ipjaBmu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   92378ced66f1faad5aa0211129792fcbca45a282
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608281947.2ipjaBmu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608281947.2ipjaBmu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608281947.2ipjaBmu-lkp@intel.com/

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
