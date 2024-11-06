Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0911120968D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Nov 2024 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730921316; cv=none; b=ZfuVPPs5/dNAeAxtLQft22drr+eikC3LjKG+O6LQ0u1CME159g1iu9CCCBkxiggrO8X3W0VwQxV97zakiV1BzJcleB8xRYa41N/MVsSShNaXEqfqL18LJUxwmL1bYXtVWD1sHgrswD6wY4OdZLnN58SY3ONpA7d0uxN7/HRZRNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730921316; c=relaxed/simple;
	bh=ngSs3bUIjosbb1o1ItDudNcBC/FSyYLgGitbVO/NCTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUpPS7CBdTkxe49LSjxQdEkFdS+429DaOciIEE9P0YYREHTqKQ9LhU120nuwRUuBOHfM3M/i2hAWioD6ExofNeXIPBcsgLFrixNNUMZdLN+YR68+O2Ntn6RFBN1Cv+yLZiHWx6FPTcsz5Qm4yGBSZttHxKdRO3vt/jhNK+VPwxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcYf1Jya; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcYf1Jya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730921315; x=1762457315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ngSs3bUIjosbb1o1ItDudNcBC/FSyYLgGitbVO/NCTU=;
  b=HcYf1JyaHX6rHUWBX2EIknySeiqSiFr+wUXuw78R/90pttSzHGKhPFkK
   RJVk9BHSTlISvfZXB1Q81WNSsjICqIN0R2w6j1qs70xGy9kK4GN+FmqM1
   px3LWxWLchgFGW+V+BbXITvqg23I9kIdF9vqzp4IqQsYLfofFPnvUYX7Q
   hsrXvnGgSgc0UgUxzlesBSiBytGyA8mpUsH1PnD+39Kgp1Byg30uHJMUV
   oaAjxTx7+e/rOkZY40MNjN2E9Yg2dUJv1iAudfEKmhP1JfOLCrwYNvWRK
   GMr2ThxlHkFrGGKkbraSZ4GI5b4YvExmfUu4aimafIp7a/XHUHNfYInwK
   Q==;
X-CSE-ConnectionGUID: jAY5wDk+S8mHM1K6vhxSpA==
X-CSE-MsgGUID: 6B5DJkubQieOkE7fdhh56Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30919817"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30919817"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 11:28:34 -0800
X-CSE-ConnectionGUID: g3CKcg7hQ3KhOxw/kINJww==
X-CSE-MsgGUID: 5NUGvSqBRi2y3WdGZOcmkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89505152"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 11:28:34 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8lhf-000pLu-2K;
	Wed, 06 Nov 2024 19:28:31 +0000
Date: Thu, 7 Nov 2024 03:27:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13/16] kismet: WARNING: unmet
 direct dependencies detected for THERMAL_ACPI when selected by
 GKI_HIDDEN_THERMAL_CONFIGS
Message-ID: <202411070316.CuTKdyRZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   c9272c37b2b5aa8d04d7dcdb694b2caaf6b530ca
commit: 029165643e81d28849fd9c690ab6d479966cce6c [13/16] ANDROID: GKI: x86: Add hidden thermal configs
config: x86_64-kismet-CONFIG_THERMAL_ACPI-CONFIG_GKI_HIDDEN_THERMAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241107/202411070316.CuTKdyRZ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241107/202411070316.CuTKdyRZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411070316.CuTKdyRZ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for THERMAL_ACPI when selected by GKI_HIDDEN_THERMAL_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for THERMAL_ACPI
     Depends on [n]: THERMAL [=n] && ACPI [=y]
     Selected by [y]:
     - GKI_HIDDEN_THERMAL_CONFIGS [=y] && X86 [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
