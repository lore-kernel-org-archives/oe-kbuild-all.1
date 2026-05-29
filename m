Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B471A6828
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780099019; cv=none; b=F9cmdf86afZ2YZn6LihHu32CzwkoKQnQk5hx5NljjAwIVyt9kAQvVr4qTO3sviqQXmKzDGf3vok6pVgbQaNdD83yhc0GqL/i9laYp3TC8UTo25rAw3PVptzwqryucYFOg6LMzOWKRRRMTPTlXDiHuuHnzgmCgmaSCWPvAL1JizM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780099019; c=relaxed/simple;
	bh=cgTQMK2h5iHjMkVZRSI5Pr6rnLhzmfaQnGVy7KwbeP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=egM5ccyjvzuigDqMr8ppFHds1VPIij6cuZPaaCtzNJNZoGr3kfbYmifOPLYD3vHXQsSap+5n+R3BZjICx+ZAFd5usCp/ziGZxzw6WgIz36czo/95HKJpaR5rZgsMByo/B3F+r21sI+bMt3z7m0mEWdnTagiwmdZsuVVrAxQ7eRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VntN29Dy; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VntN29Dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780099019; x=1811635019;
  h=date:from:to:cc:subject:message-id;
  bh=cgTQMK2h5iHjMkVZRSI5Pr6rnLhzmfaQnGVy7KwbeP4=;
  b=VntN29Dy7S1MLHHReAmJrvOiJDFdKjYQA6S4jvzyyurcklFGc6ME7/GW
   u2UOwZ9Sb7Ye/lAQmHVfDQzLXhTngvwe/oTJ7eQZwprhQy45nAOQ1DiEr
   wp4Q2zbtHsJ31Y16xEzZ/5iYMfd8IDMXCZfVWMmsg4NMnm5KKJwkiFkrZ
   QS+OpAKFXyotNMUNCWAteP5RKVHj43UGQbSrlxvodmmBm/HSw8UC/Npx7
   rmgOI9UKcRqwo5hgojWqaC60n+DWBgExLkD8WLEswplIlJdaoMXw06DM5
   opwuQAt/yj7uhZS5f7cAALtiWvrrHwkgg+xO+YZb57O5yZiU8MrrjB6gl
   Q==;
X-CSE-ConnectionGUID: fc4QmTBqTPafvTrqYryXYA==
X-CSE-MsgGUID: 2dEMKcKRSFC14INc84Bjwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91264447"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91264447"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 16:56:58 -0700
X-CSE-ConnectionGUID: z8iNfqHFRq66hsGVsRCG3w==
X-CSE-MsgGUID: FHuE5nKUSVSE/B5mkETZYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="240442315"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2026 16:56:56 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT74Q-000000007mY-15t5;
	Fri, 29 May 2026 23:56:54 +0000
Date: Sat, 30 May 2026 07:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 10/10] microblaze-linux-ld:
 kernel/time/timekeeping.c:2600:undefined reference to `ntp_get_time_state'
Message-ID: <202605300703.Li0NXZnu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   70c32e7a9e128f2579034276c19d34bcf79f4b0c
commit: 0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b [10/10] kernel/time: Add /dev/vmclock_host miscdev
config: microblaze-defconfig (https://download.01.org/0day-ci/archive/20260530/202605300703.Li0NXZnu-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300703.Li0NXZnu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300703.Li0NXZnu-lkp@intel.com/

All errors (new ones prefixed by >>):

   microblaze-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust':
   kernel/time/timekeeping.c:2600:(.text+0x30b4): undefined reference to `ntp_get_status'
>> microblaze-linux-ld: kernel/time/timekeeping.c:2600:(.text+0x30c0): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
