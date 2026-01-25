Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77714224F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 13:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769348049; cv=none; b=uDO1WftDk7kDcLlibzg21gdF4MDqRePNOn5yTBp+NYwzOMIODZz9UaZ2KKz119mh/neNIbJfqho13Xe06f3AtfgmYGWwECP/L2Bjvbl5UQWT1O0NPIjCgRqi1o20Pc3+cxle1aBuqoKkbg/8QpJa+KLwta5SoOHPPFivUheLkRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769348049; c=relaxed/simple;
	bh=TL5fEDXAGtpR8giXekYKxPv4AJV1TqlkkB4mbrWshw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=giTBrPz9lJ9QROgVGXunf5hVxangf9gte4rN/+Ull+KlNuIyEanEBKCzXDdGtWo/1R1ITGCPOLGLj5fTRPfE0NLEtlV+cXy7YEHCMNWq6a9envzexTg+6WduReNM1LyeyIQilkV0Tm4dZtdJ/JZN2niP+vbNtBIv/KH8QIppuH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2lwCrNg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2lwCrNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769348048; x=1800884048;
  h=date:from:to:cc:subject:message-id;
  bh=TL5fEDXAGtpR8giXekYKxPv4AJV1TqlkkB4mbrWshw4=;
  b=j2lwCrNgawYCvcNL5/ADgs0tCvENnd4Ytg2eAFlAQ2ZkaAKi34To6G+e
   LDspn7cUiZnlno2qsATFC9MxHz5coOdNxEWxfHwYqI/1MFaK2fziQkO4U
   aI2E5LyrV2YU55zcLWPmUUwW+nbCsW4uR80v+Gq0BNQNQ9CA2br+RZXht
   QQQ94M4GLQ7snLYCsH1Bb3+kVshJdg9k4MxqHBFJXJ08HzVuHjEYfPw8x
   ZuQ1GTuhhaam3gJQZ0ynsf4wa+mUuo7dct2MLBhkMTSoDv5oHh27cgpjT
   zIEX1Ijb3zVbRv6U5X/MKvZ/7Ktk2x+7WPOG/Po79MBfRP09QSa5d9Yo8
   g==;
X-CSE-ConnectionGUID: owWgygrvR7y+vtwMLRK6iw==
X-CSE-MsgGUID: R3Py2cCiQFSpHFV7JL2RjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70451402"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70451402"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 05:34:07 -0800
X-CSE-ConnectionGUID: OQIed5MuTSetfEw6rKPHMg==
X-CSE-MsgGUID: fMz8LCB2Rju3uFqR70zoiA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Jan 2026 05:34:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk0Fe-00000000W2K-30AW;
	Sun, 25 Jan 2026 13:34:02 +0000
Date: Sun, 25 Jan 2026 21:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.18/prjc 583/597] Warning:
 kernel/sched/alt_core.c:3501 function parameter 'prev' not described in
 'prepare_task_switch'
Message-ID: <202601252105.8CPtYpsf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 6.18/prjc
head:   abea98752bb65e92bc5fbd86e2af6f52409ea6ea
commit: e4b255e7df335060384f25467dd358d002112e24 [583/597] sched/alt: [Sync] 378b7708194f sched: Make migrate_{en,dis}able() inline
config: x86_64-buildonly-randconfig-001-20260125 (https://download.01.org/0day-ci/archive/20260125/202601252105.8CPtYpsf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601252105.8CPtYpsf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601252105.8CPtYpsf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/sched/alt_core.c:3501 function parameter 'prev' not described in 'prepare_task_switch'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
