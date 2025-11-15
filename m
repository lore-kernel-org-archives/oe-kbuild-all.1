Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883714502F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 01:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763171710; cv=none; b=fnIhd5gXMvfbOq7jEfOvpsFlt1WdOsAwAiaY1+gRyxg59SyvWLV+eGwqsxP/XMkqKR8QVe518I2UDzPHhkyhJfLqI8irUFYw08o7G+1D0oaBoRGJbQ3fuaVryZxcskMLYAROE9HH5A4/gKs4sov1u7ZIbu93ReoFz0cJHeiU51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763171710; c=relaxed/simple;
	bh=4fQegpAMKMqTacecHV+iSSVbp39x/4ITEJeDIzgmJsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIV+O2QZoy/vLPo4sX5G6LbepUQYtUexp8y12Ep9SCmtUtXAjmFvj4RE3JgVNCAWxrshyFFDdk8wkgc8qZ7EMvOuDFHLcMmzgytiBTe1odkJb5esTWI5VDR+FGdUbKP4B7VcBW8GoQWljsVemQugb10XtrezPW1ozZphRWDPaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlHmvxlA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlHmvxlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763171708; x=1794707708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4fQegpAMKMqTacecHV+iSSVbp39x/4ITEJeDIzgmJsU=;
  b=PlHmvxlAyWSsmRbweiQD8jm2JQ3GVyh9ZtwSe5rDCdvmAj3S7zU5zdKK
   zFUsn57fDE+9r0oiktS2zxxsph6krjVY+6k7TyI8t5XNaxAs0MjhzbeXr
   jPsFcI96vKRiFP8zADh8Qdl2r72FJXhoyPvZJ+aAoiF4A8U6GFxJRqCEV
   czSFtyZe6wqRKEiyo6vKWYC5lgwgrTQ5mEyD5KJJIALCcbCDjNJvqHFr6
   wKtp/RqyZc0TBoORcNKXHrdzR3rCDkDJ/hI5PU9SC7DPtj5X8M3+CqqIX
   iL2xWoUt/GCvhEZDl/MtyNFnw9Fzn2ZI+ONU7D0o1X9LVie0xcj+yBaET
   A==;
X-CSE-ConnectionGUID: XsqPxb3RSxicKBMFUhYSTg==
X-CSE-MsgGUID: 9LKAM5j2RWWRIOPuixwlSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69116395"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="69116395"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 17:55:06 -0800
X-CSE-ConnectionGUID: GwJulG5iRVOWVyPNJemzyQ==
X-CSE-MsgGUID: d9NU6MNbQLK1NsqUMXTwag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="227257254"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Nov 2025 17:55:05 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK5VG-0007d9-1v;
	Sat, 15 Nov 2025 01:55:02 +0000
Date: Sat, 15 Nov 2025 09:54:12 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>
Subject: [linux-next:master 8417/8918] ERROR: modpost: "__divdi3"
 [drivers/gpu/drm/xe/xe.ko] undefined!
Message-ID: <202511150929.3vUi6PEJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f2995693867bfb26197b117cd55624ddc57582f
commit: e448372e8a8ed2708ac4f85d74979885e47d5566 [8417/8918] drm/xe/pf: Use migration-friendly GGTT auto-provisioning
config: i386-randconfig-061-20251114 (https://download.01.org/0day-ci/archive/20251115/202511150929.3vUi6PEJ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150929.3vUi6PEJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150929.3vUi6PEJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
