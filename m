Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EC41F5D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Aug 2026 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787748982; cv=none; b=qVJd9JYuN/HIUwYJ6kSEBSMSG7AEOSqVyKsVUJG0JhRSo1KgErSOxYhjuvtRBtR69I8ShfB4avZpkc3NTqmTtOuIW0TMNt979bm820bOvMiAhs6mqF3fzt7G1cHFTmRGZB8siB52L6YaNp0MWv9qlExwZZJKxie/sVH7PrmgxeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787748982; c=relaxed/simple;
	bh=pTIlMw5nPGnPoGx1cFSjDgIwPREIZOmfc6585tQaLCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aUaLW9ofmlPjbmR/pT9sVNyFAhOB6DdTtrzJR9OEcE4HCjyYrNrrazWZJ8RfAQGyrSH3+7WnAHMt3+a0vE7+9fwj1jCUCSRPVUuDxyOuSyZEE2XUJEdY1xKvHh+Q5h2Oecxn8HdrKEo/uGBzXqgNJHiXeJAEJjkWKxb/XCM2q7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VktZcEPl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VktZcEPl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787748979; x=1819284979;
  h=date:from:to:cc:subject:message-id;
  bh=pTIlMw5nPGnPoGx1cFSjDgIwPREIZOmfc6585tQaLCY=;
  b=VktZcEPl+WKzCwfe8f5/O6io5sjyPux1oLcOM8w6Ifq8TvS22BNicuIF
   hoeQwaWwhHARrmqTUaATxFuD5UFbejYOQgm3Wn5Sjus6iZ1mjfvIvRHV6
   /sGkpGaNcgrkAz5O1vvTAKndkgK8+G/sWtT2q2iUztwIEBO/WNLfNANQI
   qwgsj+lr81jtrzRvIy8jJO8+doV4GdUgpvXzO8dmcMaSuEalYr63x5MWV
   H69YW8PbnxFKASQtO8Jn5u9W4vYGvOAVgCm8Ke6DzoTkeMtJlgVC8z9ip
   6vH0BAvlyHApJt20uJXYJC+Jln/smbPn1PCmwzy13OBMGiUdLEfPsi3dR
   w==;
X-CSE-ConnectionGUID: +2KDtTr7QUSQZnnKlRRDeQ==
X-CSE-MsgGUID: P9pitzPqT8y31tFCsHlbEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="99749599"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="99749599"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 05:56:18 -0700
X-CSE-ConnectionGUID: 9NtZxkn2TiyaqIkXEBwbpw==
X-CSE-MsgGUID: 4FCoXYg8SDW+pYbpwOygVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="305795880"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Aug 2026 05:56:16 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzDAs-000000000Jd-05oy;
	Wed, 26 Aug 2026 12:56:14 +0000
Date: Wed, 26 Aug 2026 14:55:16 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for ACPI_THERMAL_LIB when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202608261405.FcOVjzbX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   624994dfdb395b0071c731f6940cd7f26df5979c
commit: 4bb372791d1e195cad530dce5005509564c27cc7 [6/6] ANDROID: GKI: x86: Enable ACPI thermal lib as x86 hidden
config: x86_64-kismet-CONFIG_ACPI_THERMAL_LIB-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260826/202608261405.FcOVjzbX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260826/202608261405.FcOVjzbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608261405.FcOVjzbX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_SCU
     Depends on [n]: X86_PLATFORM_DEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   
   WARNING: unmet direct dependencies detected for ACPI_THERMAL_LIB
     Depends on [n]: ACPI [=y] && THERMAL [=n]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y] && ACPI [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
