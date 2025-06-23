Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F2323C511
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jun 2025 10:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750674818; cv=none; b=jsVTKS47dBWUa+bp4CYrtZalkeU0D8PG6tP+1xQvFzSPqeowhaN+OY+ry0rQ1k7b9VbakzV1nrt+YcAXIli5TsO2pnkxXV5QkfdgRDutTcWlFY7ooVlouw6k4EC6IFiLSYk/IYv/DIY+PWun5yQ4dz+f56rRnLXtXwT15Y3H4HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750674818; c=relaxed/simple;
	bh=JVJZJ/ByGExQwLFmLk8AWQSTyJP9BcfMChS1LVOP4MI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gk/zAYXdbQFcGNbDlI1YguZq+DHyB0pFH0vpjHaotJLU4gFrQpilEYbMJu4Xknzei8Ki3SvsSzJvcQ+HK4zzq6Frz1YYjCrad9OX9oIejLQjmeoq68suYvw8oHfp86FzZM5Kc3Qg5pAqt3V4kDfmVhs/5niUXcYVA1KivNeIMkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3kbhP1a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3kbhP1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750674817; x=1782210817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JVJZJ/ByGExQwLFmLk8AWQSTyJP9BcfMChS1LVOP4MI=;
  b=a3kbhP1aPTT3upGNu3z3vxveJRQdBYqX8aNXtFycaFM7ZVK2seYheJZn
   1LuKOkTg5IS8bw4v0JRcvFoD+IDzzS9XpHhbzOhMz6dOr2RrSdOF0vsOw
   GjZAyQfq705wH5WLmt4tWK94ivJ0lq1jUySuL7IXTAM65isv3pIcPRTXt
   sL8NOuS1XrGuYzv8vSju3Waq3KXKcZAXAUEH5L5/uEFu8RE8MXd/yVm/e
   YEzjMC8g50qga5eJr73MflUviC/H5lF+4GmBEP1hV/pfv+0aE22YOXNu5
   H85+8W0puizn8Ws+Kuy6aJpnjaZFDK4Q0Bm0MGHHJhmBQid3+PlWsed3S
   g==;
X-CSE-ConnectionGUID: fVKIBE8lT4CL0CHOb4vyKA==
X-CSE-MsgGUID: 0tPJpShcQhiEh/sfxEsp9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52591738"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52591738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 03:33:37 -0700
X-CSE-ConnectionGUID: NfMKoieIRMWvsIklkDP1sA==
X-CSE-MsgGUID: IyqorVhaQSyK4c3bA9iW9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="188782948"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jun 2025 03:33:35 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTeUX-000NxE-04;
	Mon, 23 Jun 2025 10:33:33 +0000
Date: Mon, 23 Jun 2025 18:33:08 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-sha512-dedup-consts 29/29]
 lib/crypto/arm/sha512-core.S:108: Error: bad immediate value for offset
 (5636)
Message-ID: <202506231804.Y8Xyp2kU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-sha512-dedup-consts
head:   60d575cdb9d1658b1dd9048d7aafed8ac49ff730
commit: 60d575cdb9d1658b1dd9048d7aafed8ac49ff730 [29/29] lib/crypto: sha512: Deduplicate the round constants
config: arm-randconfig-004-20250621 (https://download.01.org/0day-ci/archive/20250623/202506231804.Y8Xyp2kU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231804.Y8Xyp2kU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231804.Y8Xyp2kU-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/crypto/arm/sha512-core.S: Assembler messages:
>> lib/crypto/arm/sha512-core.S:108: Error: bad immediate value for offset (5636)
   lib/crypto/arm/sha512-core.S:496: Error: bad immediate value for offset (4392)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
