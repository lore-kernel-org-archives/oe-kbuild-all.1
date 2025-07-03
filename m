Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B0C2DE6F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556581; cv=none; b=uvn2vBocai8U8jpbri1c0ZOgV+2+jEi2li68S0wvnMzRbJEZIdRnhJ0QG5JW/MUnVQpKTGqVxnDvs9pWVjP67yXnrXbWPfeTZfpLXmtFjX5O7w/MDgQh6SozUlOcaSx8ymB7WiTBWJOckPiuntfgAFgd+0eebCLnUKz60Op3lP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556581; c=relaxed/simple;
	bh=kv9d0YwaB0wXryKkujSU5qqtrA5jrT8X5d9k8bLRI2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=daJc5P6CXoNZXjwxvuK65VbtMnkKn+JvNf1pgC+HDN0wLd4xYYcOPXdEgj5DKERu4mP6lejfpOz2Qv0nh0a1hTQ9yI5IKnJUwgWzYHtI67oarGzAG2YTT0XgHK5DWX7ik7AZcMk1OsrskwAAWPP/Dv9LhSk5EhjXJbkwmM7WH6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haEiPdW0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haEiPdW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751556579; x=1783092579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kv9d0YwaB0wXryKkujSU5qqtrA5jrT8X5d9k8bLRI2k=;
  b=haEiPdW0W7tQBirZ5/8ANuosgGz840ewBx7HuZOMi/+Ypt0kiBLLoyjc
   NAKYEuqMZWjy/OqJDouZeXcXllzqxHss0uxO3WBdOo4XaOslq42D77+nD
   yqUfdLr1L/L+bchmt6JDqHHQynQyLrP6g6I2XfWIYwATxKt/fXE6UMFvm
   fVY0/mI4j+bcfIw2roJC4RTEJpt4ytbysmQLJIjsF8HYLSTOeEPHSY4zl
   EmiC50KtGlbInQYFB2uNQO8vNBHXKeljOs0yeU9nAse9ymIUatcADF70O
   Su2tc1koQIfCho0j4JArdsOKIi5S4pveO2fgGP0oEWfHAdZCaIOm1n+ae
   w==;
X-CSE-ConnectionGUID: 3cz0bCe2T2+umf8NPMRaSw==
X-CSE-MsgGUID: LgGeOrYQS+aoOhixNbGUAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64582069"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="64582069"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 08:29:38 -0700
X-CSE-ConnectionGUID: mzmbCYIJRn6hD4AKrnvcWw==
X-CSE-MsgGUID: RmuyKiH6SCeRyV7zCwrmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185414142"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 08:29:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXLsV-0002ex-1Q;
	Thu, 03 Jul 2025 15:29:35 +0000
Date: Thu, 3 Jul 2025 23:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 4/4] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202507032316.RZgWfO58-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   7b423b7f82f1447ab090e96318cc6ecb6121b23a
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [4/4] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250703/202507032316.RZgWfO58-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250703/202507032316.RZgWfO58-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507032316.RZgWfO58-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
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
