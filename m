Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862CEAC7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Apr 2026 03:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777520794; cv=none; b=KacK5/sgf1g4s1kGWVgxKANVzIzqinTMfCTk98PZ0pyJJKZzLSRX4Gn4ZBBcjwsqjEWukvxjw80gA/ztQh6XL1RbDqy48ExDtSjpBdoKJX4nWJxrYYxtT8H5T8l4XvJkTs6UOhoOzrd1KGSdPjHtmG89W/bCo0nxVc2RhlmFIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777520794; c=relaxed/simple;
	bh=6Gk8mD8bwXzn/V6zdS8lNTB+Q6V3vz302ZpsRG4FeBs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZnF+6EfpOCtTwvea9wHhPwObaergpB5M0sxxUHIH74wm58HzMPTOAh2wpckrrFKA6wwc5KyQ933YbF1usnqJOPppZitJmj7V7IJBOYxPQCZLIlmQKSGNoUyT0ybEicc5/KPdYWFrOFlAzPsW96nNuMsUOiyFPh7URugqfzjC4ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gU/eeYe1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gU/eeYe1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777520793; x=1809056793;
  h=date:from:to:cc:subject:message-id;
  bh=6Gk8mD8bwXzn/V6zdS8lNTB+Q6V3vz302ZpsRG4FeBs=;
  b=gU/eeYe1eXT5LyvT+pJI16nhnw7GazjF3CEpf/OBKoBob19JTv6qR/sj
   P0TQdIu2Mq8pjIkLYfE7NUSyBBQNdAR06Rhe8SKSb8zbBfpod8tHSHfug
   hdF31PzlvbIoPi5AoB1Fy2K9VuNtzydDMIMCUz9pjJ8ulLhVnyTuRMdCx
   VDcBAbyoHQ5ptuLYhIfiQteXN4IM8rDebI7E2KsJAXETa4oVThqKXSXjY
   TMj6psn80hIdUY3SAq5+IW0DYLIi7TFb1GtK/mNrQ6O8ttzqenEXf5m8/
   8d5EZ1PM7nq1DYndWZ0rGuZqZQ05hT2Yt74TnV6pky/6N03pm01mVZmP7
   g==;
X-CSE-ConnectionGUID: Zi5C64iOSUen3eekm47uIA==
X-CSE-MsgGUID: 7UGMilinQtWEGksjUhD7yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78652000"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78652000"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:46:32 -0700
X-CSE-ConnectionGUID: LAKbaFXESdCHm4yDo7T06Q==
X-CSE-MsgGUID: rY7Wx3F8TJm68OkLgL+TNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="233405801"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Apr 2026 20:46:31 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIIM8-000000004j7-45JX;
	Thu, 30 Apr 2026 03:46:28 +0000
Date: Thu, 30 Apr 2026 05:46:04 +0200
From: kernel test robot <lkp@intel.com>
To: Kate Hsuan <hpa@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: versioncheck: ./drivers/media/i2c/imx471.c: 4
 linux/version.h not needed.
Message-ID: <202604300558.iv53LtE0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Kate-Hsuan/media-ipu-bridge-Add-DMI-information-of-Lenovo-X9-to-the-image-upside-down-list/20260420-180430
head:   59573be91ad63824ffd77b497623bd07ded50777
commit: 59573be91ad63824ffd77b497623bd07ded50777 media: i2c: imx471: Add Sony IMX471 image sensor driver
date:   10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260430/202604300558.iv53LtE0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300558.iv53LtE0-lkp@intel.com/

versioncheck warnings: (new ones prefixed by >>)
   INFO PATH=/opt/cross/rustc-1.88.0-bindgen-0.72.1/cargo/bin:/opt/cross/clang-20/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
   /usr/bin/timeout -k 100 3h /usr/bin/make KCFLAGS=\ -fno-crash-diagnostics\ -Wno-error=return-type\ -Wreturn-type\ -funsigned-char\ -Wundef\ -falign-functions=64 W=1 --keep-going LLVM=1 -j384 ARCH=x86_64 versioncheck 
   find ./* \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o \
   	-name '*.[hcS]' -type f -print | sort \
   	| xargs perl -w ./scripts/checkversion.pl
>> ./drivers/media/i2c/imx471.c: 4 linux/version.h not needed.
   ./samples/bpf/spintest.bpf.c: 8 linux/version.h not needed.
   ./tools/lib/bpf/bpf_helpers.h: 446: need linux/version.h
   ./tools/testing/selftests/bpf/progs/dev_cgroup.c: 9 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/netcnt_prog.c: 3 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_map_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_send_signal_kern.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_spin_lock.c: 4 linux/version.h not needed.
   ./tools/testing/selftests/bpf/progs/test_tcp_estats.c: 37 linux/version.h not needed.
   ./tools/testing/selftests/wireguard/qemu/init.c: 27 linux/version.h not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
