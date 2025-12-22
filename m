Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C11C5D5E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 06:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766384418; cv=none; b=X3UiWHu3V/Ra8QbuaplSvW5GdZA0MTeXoSvk4Q3T51yrfZygWsdqTMLqGziDME5yWUWZRF6gpZoG+s210S+w9w9tSjNM7bgdhcfWO7uArjAYxUhWb1sCgDeMpLfUJHIWNUkiVeDxeOS7C/++Jr6C3M/1Njb3/TP9MGRLPa3c5rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766384418; c=relaxed/simple;
	bh=jsT/83NMTi28yooiJ/szpFYUopsA0wY2HcFOZTbrcik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CV44mtl1AXQGFHo0rn/xNVpVSz9tiyGMQbQcIH1zBC99bua6dry6gU0bC9z9H25y6F7a5Sj7VYxOtxDFXAtm5g5DkxDfUxW272H1umek9SHpPJpWl7elunPNShmtyGIwJn1rCdlF2CWgiCBi3Z8OznEh4dthiJSb6EXviK5opm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NVJe5mNP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NVJe5mNP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766384417; x=1797920417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jsT/83NMTi28yooiJ/szpFYUopsA0wY2HcFOZTbrcik=;
  b=NVJe5mNPk48sUXhEyqrjB33a4hMXwUK1SwjiQRgR/rhhA5p1s7zKofVW
   f3qrNv4qSxWRJljMAfLhZjnv/JFpFkLUT0iODP1yOKU6i5vGy9hHsAtoR
   FW9s0ApPiPgOoiRwPbnRlY9yPqJUMLaHlUfTE2q7g/gwS2yn/Is2ZK0Xh
   wbFJ2gzza0OC1Ie/eImaeou2cgArY9n/022eo3GnwOLYYYT49frjFlehM
   tv4f5qaDAs9Qel/Y+WQXYYLfPOZxDIx/VQ4ZELE05vT0BZUClnoBummcw
   CJJn4jnhvjh6i+1NINqPoKyq9kcK6nRr+qDFJ072tHh7ECnNcayrVJuph
   w==;
X-CSE-ConnectionGUID: tRLKflIxSJ6C8ER7M1Yy0w==
X-CSE-MsgGUID: /X3XoEEmTYGc3aa/BV9H7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68281616"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68281616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 22:20:16 -0800
X-CSE-ConnectionGUID: JS/x5GghQT2fxmlYbKglpw==
X-CSE-MsgGUID: e+UJOfP7RQKdUPt2IUS/Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230103295"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Dec 2025 22:20:15 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXZHA-000000005Ns-2K7w;
	Mon, 22 Dec 2025 06:20:12 +0000
Date: Mon, 22 Dec 2025 07:19:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for INTEL_TCC when selected by
 GKI_HIDDEN_X86_CONFIGS
Message-ID: <202512220700.MRWntWQu-lkp@intel.com>
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
commit: 206061b5b2f4bae5e87a6510fb2ea23acd238f20 [12/12] ANDROID: GKI: x86: Enable Intel TCC lib as x86 hidden
config: x86_64-kismet-CONFIG_INTEL_TCC-CONFIG_GKI_HIDDEN_X86_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512220700.MRWntWQu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512220700.MRWntWQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220700.MRWntWQu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INTEL_TCC when selected by GKI_HIDDEN_X86_CONFIGS
   WARNING: unmet direct dependencies detected for INTEL_TCC
     Depends on [n]: THERMAL [=n] && (X86 [=y] || X86_INTEL_QUARK [=n] || COMPILE_TEST [=y]) && X86 [=y]
     Selected by [y]:
     - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
