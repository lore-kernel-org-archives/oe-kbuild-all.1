Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0522E3E9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786493407; cv=none; b=bKrlEYuE+k7uF9e5i8Ha2vFz5lj/P7AKDwV+HV0mTYw6d+PVjYzGxZYW8nK8Buz6AdNUaMHEaO6nz7xuO0dy8HAvNz55basg0JTjtk/hDgBTRg8RV3aNAX2li8BaGNqSdHZZxuY6E5gNgijLjmQwPrXw/ga1SWe/Cw8VovAKSGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786493407; c=relaxed/simple;
	bh=QbUaWA6SFMUQtg+e57ZeAy6dgLN4mBuKkoU4TKHoV8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=slFr2KBz0nh4my26zc8ouxAwYd1zFXsmaR/cqyMCPobsbfWoWOmfDDYXLk6lU3I4mFmZS7QtA3t8HjHQ/A7U1ol5QIt2JlUhTn9S0U5GBwgwU/4WB4ZN/3aAdjMK3TZjqQFO7FMezpDNWkqvM0IOl+D0bW12V2H96negLXiVM70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C5WQfSsf; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C5WQfSsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786493406; x=1818029406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QbUaWA6SFMUQtg+e57ZeAy6dgLN4mBuKkoU4TKHoV8Y=;
  b=C5WQfSsfsLS96LaYQ0iimp2ePGu0E67EDrbruaCxtCil/txYfGxOcffa
   vGGo/u9DE5QiPZ//UjjVIGMxjUuxcXE8SmRYgjo/slZJ8z8iy3u3LzNZN
   HznknBsw1wovu4JobKNS4IUQZzcEBMbxxD5ro5JnKM3Gmv0wLu6VVooBf
   LtkBg5osnoAfD8znS76NhfbYOFYIsYtCEW2+qF+yLEA31ZTNyc6qeOHo9
   WzYjBqWy6IydByZ74tRRrDyRNGFcWkuVjty7W7246WWyh2c8zm0MAUDcI
   jGIhdxIjcxoY1of4orzbWBlghSE1hMfNCXKcJerAmT2N7aH8bi5Ha7HcS
   A==;
X-CSE-ConnectionGUID: YfKHVOa8ROWq+0y1Ix4XKw==
X-CSE-MsgGUID: N1AKXwg/RymmSwK+XkFp2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87048313"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87048313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 17:10:06 -0700
X-CSE-ConnectionGUID: XaBL0f3WS/y4bUVwMUMNtQ==
X-CSE-MsgGUID: ryLDUte1Sbed8/J/uR9mPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="267323883"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Aug 2026 17:10:04 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtwXh-00000000PUQ-331n;
	Wed, 12 Aug 2026 00:10:01 +0000
Date: Wed, 12 Aug 2026 08:09:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 36/64] ERROR:
 modpost: "__floatdidf" [kernel/time/time_test.ko] undefined!
Message-ID: <202608120737.FaUaXlvp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   3e8fc6d2f17abed506fb832160ecd7c7e5fdd222
commit: 0e7eee89b53771dd220be34fd7bae2861d74a723 [36/64] timekeeping: time_test: Add a test for auxiliary to monotonic clock conversions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260812/202608120737.FaUaXlvp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608120737.FaUaXlvp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608120737.FaUaXlvp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__floatdidf" [kernel/time/time_test.ko] undefined!
>> ERROR: modpost: "__muldf3" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "__subdf3" [kernel/time/time_test.ko] undefined!
>> ERROR: modpost: "__fixdfdi" [kernel/time/time_test.ko] undefined!
ERROR: modpost: "__adddf3" [kernel/time/time_test.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
