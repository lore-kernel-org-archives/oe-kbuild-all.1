Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF263CC7F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 06:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787120439; cv=none; b=bjrXGfSCvQxyi0L7kyzkS4SWE75ZFaKe/X0ZUWGMzzRCPU4WcqCPHxkszJmoDLAFhE8I57Mg+kDcylL8s4fzbiFgKtvyMnV2G3F/Yz65KOX8Bph8Xo6kHqIOa/BLEnLgI7XOWx88FRCwjITM0mIfxK9qUTiLyeCa0NEeIXIlEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787120439; c=relaxed/simple;
	bh=vac/wyPXkCpzhQgxEmPl0TnDr2J45dEWM5bBrWwyJ+g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hSegVg28kLb8F7n2PaBau79/UiWRwt/jjAtHXV8hCqij7gdhu9wJxp2vtrRqmgMxIQiZfOCTwBFY7u+AoWOcQu0c8tUjj/hHtvgx8uZhhLKl/L6Sexx1h1HQHx88VrPdvF4VpTktEP/4oXq9zGkHW1JSmf7wZKqO5slJLCzkShY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG8P8SHX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG8P8SHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787120438; x=1818656438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vac/wyPXkCpzhQgxEmPl0TnDr2J45dEWM5bBrWwyJ+g=;
  b=mG8P8SHXNNqFpnmU3eB6QhfXa1tw4fV/QFX9z8IXq/bu9J16eM5dtrjH
   8knU/Z524DYv2br3LwxPkwJEiPpzden3f0RIFwWJ68cbrW0TVk4Cq/BwH
   WmyU/mJmC+IxLZrAHZIEMp69ib1+hmjoiMjdOfUP4iJmxWaTtJNfYwI9B
   uxbGbbmHQiSiuPOwLb1r/mWPssDQ3Je877tENdeBYEJJ0pYYP2M/yV+wR
   xMQUedGqq8veRGljilHDKl5RwbU/j61KUubgVu0UDk8SLnQIQmhS0DiPm
   94SpCfl9ov5mY5hM0EN87gmsdPa3/YaPSlfMvj+YgsQWfK+x4vEhogRhP
   A==;
X-CSE-ConnectionGUID: yq4rDq/DRqyo6afqrKgpLg==
X-CSE-MsgGUID: TPLvoMSxTsuwg6athm3t2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="110408908"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="110408908"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 23:20:38 -0700
X-CSE-ConnectionGUID: qsodFFw0RHeonEqRfwnh2A==
X-CSE-MsgGUID: xbhcOAZHQieGoERia10Wug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="261691505"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Aug 2026 23:20:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwZf7-00000000ewC-0I20;
	Wed, 19 Aug 2026 06:20:33 +0000
Date: Wed, 19 Aug 2026 14:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:folio-pool-v2-lockdep 14/21]
 kernel/locking/lockdep.c:587:1: sparse: sparse: symbol
 'lockdep_trace_scratchpad_key' was not declared. Should it be static?
Message-ID: <202608191417.fTJXmNEy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git folio-pool-v2-lockdep
head:   b6042163d72458308afa7eef95a3293507a1538e
commit: 198cb0234063750d4125d2f5b3fd29f373fba200 [14/21] locking/lockdep: Migrate and compact stack trace entries into folio_scratchpad
config: x86_64-randconfig-122-20260819 (https://download.01.org/0day-ci/archive/20260819/202608191417.fTJXmNEy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191417.fTJXmNEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191417.fTJXmNEy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/locking/lockdep.c:63:1: sparse: sparse: symbol 'lockdep_pool_key' was not declared. Should it be static?
>> kernel/locking/lockdep.c:587:1: sparse: sparse: symbol 'lockdep_trace_scratchpad_key' was not declared. Should it be static?
   kernel/locking/lockdep.c:3517:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)
   kernel/locking/lockdep.c:3517:49: sparse: sparse: cast truncates bits from constant value (50000 becomes 0)

vim +/lockdep_trace_scratchpad_key +587 kernel/locking/lockdep.c

   586	
 > 587	DEFINE_STATIC_KEY_TRUE(lockdep_trace_scratchpad_key);
   588	static struct folio_scratchpad lockdep_trace_scratchpad =
   589		FOLIO_SCRATCHPAD_INIT_KEY(lockdep_trace_scratchpad,
   590					  FOLIO_POOL_64K_ORDER,
   591					  &lockdep_trace_scratchpad_key);
   592	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
