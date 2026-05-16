Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB1933E347
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 May 2026 18:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778957457; cv=none; b=W+2/WvxRsKTL4nMqvw1iPdydcEdAar1KoFb34mKI+JDPPdw+MnhCS2FF8XniqLRX05f6cfokj1Te0l4ZsouE8HvbRqImyebrpL9G4OOVqhsIA0NE2LSAoN0aPlTJ++zYLqkFzzIO7oLpg9DO0i13wtpkIjqKpTbp9Ry569C8MQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778957457; c=relaxed/simple;
	bh=UjXM0T37vUYpDA835G0crz7PFOdcShNHRK8VUXvRO6A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S2xDweHymZiS/xKVp0oiKH936f2IUQYFwEsj6ROGB+fVDSw2ms7WIo1nIJX4qC7MnRGHKg4Hu/ZatW76nBV/EH+xcXJUt24WnjERJSZ6yI6YUZDc+M2+UYUWVfnu2/N3Q+ZLwQz1aE28465BqD7lAWxggjpI1t22GrLrfZDXWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9XLguA9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9XLguA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778957455; x=1810493455;
  h=date:from:to:cc:subject:message-id;
  bh=UjXM0T37vUYpDA835G0crz7PFOdcShNHRK8VUXvRO6A=;
  b=m9XLguA9rph01ZGv2CPWFDhV5iGukyRS5cyay26vFd0V87fyh2XlqoQG
   ItFtE24O4keew7npLULa8Hzs1DJzsHspohqC3BGgEzZFYVn0XKKH1w5AK
   yE/QWPj6ndEsh/ubxwp+zH3vHpCIOJrA/fYFHRG9CoPbGVy/R+YHreg5S
   z8KF3zNzZ/IK6EALWu/CPQFyiZ7N7GAwkou5saeZRYcbuDWL2AekQqa/Q
   yf4vmOvJZHJelwoOpSXgSOt5U6fXRou5mrmWH92wsheRliyWlcge7zdmE
   wH7LVZsrxFqBgQ589aioGSzHN1tRVLLczlt+j5vfqYeFkxv5FLrEvujbX
   Q==;
X-CSE-ConnectionGUID: Q3TVTmOsTmaC/cMzDf5fXg==
X-CSE-MsgGUID: U1NDjuYzSQeYghDszyeJSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79773381"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79773381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 11:50:55 -0700
X-CSE-ConnectionGUID: c4+ePUIdR/GVj+RSiKcs8A==
X-CSE-MsgGUID: MGC9/itgTeWjjJCQVKJB0w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 May 2026 11:50:54 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOK67-0000000013S-2aOF;
	Sat, 16 May 2026 18:50:51 +0000
Date: Sun, 17 May 2026 02:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 39/39] Warning: kernel/time/ntp.c:88 struct
 member 'skew_delta' not described in 'ntp_data'
Message-ID: <202605170242.FKnx2C9R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   72f314e9b0f01e7dcdde02534c4dcfe782c3fa62
commit: 72f314e9b0f01e7dcdde02534c4dcfe782c3fa62 [39/39] timekeeping: Drive time_offset skew via mult override
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20260517/202605170242.FKnx2C9R-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170242.FKnx2C9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170242.FKnx2C9R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/time/ntp.c:88 struct member 'skew_delta' not described in 'ntp_data'
>> Warning: kernel/time/ntp.c:88 struct member 'skew_delta' not described in 'ntp_data'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
