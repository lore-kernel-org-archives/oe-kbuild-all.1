Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E0B26AD0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Dec 2024 18:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734285727; cv=none; b=OSPQsr3oJT6F/akFXrvz3rz6uIBc0zl/sdcyJLPIzJkYqTVh38W9YM5HOOLDxomJ36yBUmMgTqNMMJqN6ySHdUERl4u8IKf+e+qycwEi8dSHm4FYz7Tq5iVnvz8TxooEUougXHeLqdxk1xdNgDmJWaw3GHB9zfW8udxZ1sat7Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734285727; c=relaxed/simple;
	bh=f8pWc9DYrXWXxfmdCaU6UISuBwPrlcbIpEsDQQOZKYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwIMDDM3HlEhKawM0f9q4k6C7o5jVabInbEh49XIVQQPpbVcWwmqqPFbUn5rtvuW4tF98t0pxrbpBnZwaY6ld14r1hQ8QdEW2u/7tD0Zxlt5RKgkDIFLmn2N1Vs05s5BIQ0HGrj0F+Y2aF17jdGyERGcU3GD4sq12yBbLoPJx/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmwrjKS7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmwrjKS7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734285725; x=1765821725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f8pWc9DYrXWXxfmdCaU6UISuBwPrlcbIpEsDQQOZKYw=;
  b=LmwrjKS7PcT2ki5nn23LAP+YZRDUlY8dV6McH7Ih+Gm3s8R1sToO8/V9
   9rf86hkpBtjXo4q5Id0C+2O2z0u2moz80dn9uKpKc7m1EQrJ5mtuQP5qi
   lmJqHkN4pGgrSL8AQIon5D7b4IZ59DfSQUJseRTpZ3PPH0UX5dspLdgmQ
   NWHMBBXWCHxBhb+1hQEHEVT/859/DagTeF90nlSysnmxA2fOnXPIJZTkv
   OwM7lOk6DFZzbeqDP+6P2ZcmB/aaYEwnB2GDszvcJj+11KOhRATKxnW7i
   A2LRtVh8tlW10w9pacpKyV8gb6xWR4bfuPfiTw+R1ZI8AYQZ5I8p63Ijk
   g==;
X-CSE-ConnectionGUID: LOwAa3e8TFqBODAzTpv7FA==
X-CSE-MsgGUID: wN0wstmfRAC+qMClnGUXGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="45365360"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="45365360"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 10:02:05 -0800
X-CSE-ConnectionGUID: lyTzXulZSIGgG22S4+iwLA==
X-CSE-MsgGUID: 6mMvbRW/QMuKUARDMYx1Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97426614"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Dec 2024 10:02:04 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMswL-000DmM-2s;
	Sun, 15 Dec 2024 18:02:01 +0000
Date: Mon, 16 Dec 2024 02:01:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/16] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202412160122.R6nskNMx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   979e6f6aa3c78b92ad965d072eddc53477a84fb6
commit: 440d11cd96f3f7bad78bdb2e10122b02a626478e [12/16] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241216/202412160122.R6nskNMx-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241216/202412160122.R6nskNMx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160122.R6nskNMx-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for USB_PHY
     Depends on [n]: USB_SUPPORT [=n]
     Selected by [y]:
     - GKI_HIDDEN_USB_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
