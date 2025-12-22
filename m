Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7502FF140
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439209; cv=none; b=obXc+OpOm6aZVGufyH7fAZ9y4i8iHsKVRHG3erfv6pVf9C0NdmEdCVW+WXs1ZWAc732gRybbIyZ3Ft734lqLZwOE5QS9r4jQbbwlCSs6QRkfYo31vuMYo2fLW/kZHvXFYtTcQC8TdsCmpyOABJZTBySuDySd1bGJeOq3xQa02o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439209; c=relaxed/simple;
	bh=KJcbjL1K9lRvDxO52JLevpqHMAfz7oKwIpno98nWpBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHQZ1ENpJ70BxO/JyUkp4O4ju4PhJq6AwMJAjkCRdiHVvB9tpagK++3qujd4/2Re1aqYf6AYz28MSO3oT/XNsHTmZtTpGrDV7jeqmDcOrVKRErajsBbtxy1ohECuOoV50OvG95i/N2aSqOyl/IDuTtI6RPeGwM4UIP0bRXymiwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j7/nmg0r; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j7/nmg0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766439207; x=1797975207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KJcbjL1K9lRvDxO52JLevpqHMAfz7oKwIpno98nWpBc=;
  b=j7/nmg0rTqktqxyYdYO5z/d54k7QCXRTLcVUVdGqRY0WdwlQGxyLdIjv
   ZRnC8ZrLFYtfa/ij8mN7yi4dz+UoO/BavqV/fN9fNdDY6hYkbr9Dr/L3n
   AZ/E6Tu+/R1GRCax90fdYs+NFf+696pKd3CxQu9bIP7hG8iNwEl8wpchE
   4J92VZzIzsu0rGZgg7uYM4fx2QADKeZKirdssxABC6OYCPLGp6tbSfeFp
   ve69JXOdlt+F3+GZPvE7Gia3d4khZEeWBcOLGo2AlxPYAiisD0fCrXLod
   U3kU/iEiUhH0kr+BWjOWOnPk07ylW5Hs+NFFZmF6ShJC+oLY6DKAPPy5r
   w==;
X-CSE-ConnectionGUID: yv59SpihSu2YYYTcwVXqog==
X-CSE-MsgGUID: /phkKE+MT5KHMh1JzlqHqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68178296"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68178296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 13:33:26 -0800
X-CSE-ConnectionGUID: 45h6099IQtqB6l74p5Zhuw==
X-CSE-MsgGUID: 73WbAwmkRr2VJfAmbBiDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="237024413"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Dec 2025 13:33:25 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXnWt-000000005ca-1e0o;
	Mon, 22 Dec 2025 21:33:23 +0000
Date: Mon, 22 Dec 2025 22:33:17 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_CURVE25519_NEON when selected by WIREGUARD
Message-ID: <202512222255.eTRlUBAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   e936109d577b337e7c52ca363826e1f91aa76bbc
commit: c157fa22c4007147fd0c443c723380df5587246a [1/1] lib/crypto: arm/curve25519: Disable on CPU_BIG_ENDIAN
config: arm-kismet-CONFIG_CRYPTO_CURVE25519_NEON-CONFIG_WIREGUARD-0-0 (https://download.01.org/0day-ci/archive/20251222/202512222255.eTRlUBAz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512222255.eTRlUBAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222255.eTRlUBAz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_CURVE25519_NEON when selected by WIREGUARD
   

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
