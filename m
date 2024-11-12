Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC0320BB49
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731405495; cv=none; b=QHDSSuvKGQe9eyobajtrG6T0pEz5ffy29PajZg3t11v1tpzO92JeFu3C6cAGGXqU2js61qOya3wOrMBHEVi1sfqHf3DMeVVRvYwrV1LDeVgkLS2qU+US8PSLih89AqHhiIDQydQSu0vDEKV6MXKU//e/9scbd79bbp9/dDWsFxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731405495; c=relaxed/simple;
	bh=muZkVBfDK9xmWRjGVnQc3ZNTipQ4IxYAfxVbaToEE2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ta3Q+FEJNz0XbyZbz0lQ5rnglKdAQ7KRh1RHbL4PoOPrPcXmNpLppernJqlWZTjjpYIb9eCo5dWuBZgOZTwCKxkI9T1rp55J1iGBv4KQXMFI0GiXYWLH6b4iV6TyVQRbq6fWcN4LuX/GeYZirLZkYELk67RwE9lz/TL6D1g3VUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gemV5rJa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gemV5rJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731405494; x=1762941494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=muZkVBfDK9xmWRjGVnQc3ZNTipQ4IxYAfxVbaToEE2o=;
  b=gemV5rJaV+ZPzRMQYS+miZz5rHA8rDWlL7Ds1W9aHBrGhCBBRI/uNarn
   sNu8+JsP2+z+19S874hq3MG3aSxnVvjPmWwqB0GtucSI6DdnQzeC/RLAb
   CR4fP1k6xh8z9bVVqulc3/rd/Bok7koMlq7lWXMCtUVTlPNlI0XdXioUb
   Yqj8YGTxWf1fv/fZM87MEAep6x1D+/HXdEGVw9Os3StXvZDtOwnVlTh7J
   hFdOBuHLhDnECcbEEqHDyGS6ivyX0Jv98uG2xmyXvqug2MkAor5O34tw2
   P/wY+yxL71mb3CwkXtxDimAzeudVA3OyLwqHWbYZyghFTLW8OlQPNp0gb
   A==;
X-CSE-ConnectionGUID: eM9t01IsT5uSU2jWd/DwQQ==
X-CSE-MsgGUID: QgRJ4Wi3QcuMRVRWYxQjEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31086979"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31086979"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 01:58:13 -0800
X-CSE-ConnectionGUID: R/Ub/eKeS9iMsWVupGIKyA==
X-CSE-MsgGUID: /y8xY+D2QqSWyx+QY8D48A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; 
   d="scan'208";a="87788733"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Nov 2024 01:58:12 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAnf0-0000gx-06;
	Tue, 12 Nov 2024 09:58:10 +0000
Date: Tue, 12 Nov 2024 17:57:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 9715/30000] kismet: WARNING: unmet
 direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202411121721.OhliqFKU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   104cc535f91241da2629d8e2d5abcf57a97b0afd
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [9715/30000] ANDROID: Incremental fs: Add zstd compression support
config: x86_64-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20241112/202411121721.OhliqFKU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241112/202411121721.OhliqFKU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411121721.OhliqFKU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - LG_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && ACPI_WMI [=y] && INPUT [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_MAX98357A
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && GPIOLIB [=n]
     Selected by [y]:
     - SND_SOC_STORM [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_QCOM [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
