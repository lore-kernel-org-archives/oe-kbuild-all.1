Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C133BBFAF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Aug 2026 18:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787943072; cv=none; b=uc9Pl8fW4BID1Ti68Wg9+cQO4jzztibljkIgP+0bF2b/I5YjCm0uTi5AkIEfmRtLRa8GK6BaAcon89lOaGGjdD25KNChM2fzDvpCxyhRk+5SKwrb5kmno0IWfbgm9edp3QZhpJxjMv5Kd+6SwHVtgmB7amw1LErL7O3aD+SG1IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787943072; c=relaxed/simple;
	bh=kXMM37+Q60w5oA/G96tBz4SAp8ub8QlakDXiwk4T6FQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i7sLUkSQJa9ehPgrMiUpHGtSWFvQeLp9OJZ5ZvgK6C9apQfEqCgMFhWmSsKPvVRN2VA3LgZeUb0hseFxSO+oPGT5GkNDM6qB8NKqSiY9VDxLpGc8PqbRiXJt+e26zJdOqX+2ZS8yvKX2UBkeh2lPlxUvLRWAbe3OnU4mQXE1nGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUmlhqxm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUmlhqxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787943071; x=1819479071;
  h=date:from:to:cc:subject:message-id;
  bh=kXMM37+Q60w5oA/G96tBz4SAp8ub8QlakDXiwk4T6FQ=;
  b=BUmlhqxmx/FHpOKzN+oekcc003LzWMc3+WYqncK6xbCpZ3mJFOr7Qc7+
   bcSxNq62DHIJtj34ip6V9y41FgwHAoZQBOSaZpVFY5nYKJT7NptuTcyoY
   6l6MTd3HCHgAw6JzEV/NsGczMku56qxCRxphYa+WLRUKMir9A5r93BBAK
   pg5wlFxr81pD4DwiJTCUcd1P0u5uY3ehzSn/G1IazpGXQifJmgZFRGb4G
   3zzh5G9e1nH2TzQdEYFB+CuCc1peE8/483fEZi4qk2sKsJpLY5CCkVrR3
   pjOJONLH013kbyz21+vtkq0R207gl83LFbErH4vzHwqIqlboFaIgH2X+d
   Q==;
X-CSE-ConnectionGUID: 8GHr4bxKQJKvphkA78sUVQ==
X-CSE-MsgGUID: NfU5+cNFRxWnH+Bh/7S+IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="111231700"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; 
   d="scan'208";a="111231700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2026 11:51:11 -0700
X-CSE-ConnectionGUID: 88D4d2BKQc+qRgG6rp6xpw==
X-CSE-MsgGUID: zwG/+ioTQ3qPAS26d5tfaw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 28 Aug 2026 11:51:09 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x01fP-000000001AX-2RWA;
	Fri, 28 Aug 2026 18:51:07 +0000
Date: Fri, 28 Aug 2026 20:50:48 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608282026.BvtfQLKL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   1c86cd5c39452049ce86298942c99e7da54aa62d
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260828/202608282026.BvtfQLKL-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260828/202608282026.BvtfQLKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608282026.BvtfQLKL-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   
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
