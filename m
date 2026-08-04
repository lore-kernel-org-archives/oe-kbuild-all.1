Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F643BDD5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785835080; cv=none; b=lzRNBXaKkglh7JB/UfX/E3Gdh0zFV3O+byPsTWx4inI6TrlyeOOStjMyIEQxPgj99FVvPTGOq5e8X2LerLS6454sV9JZ3AHeHWCjHYXHbyYlEf6W7RJL1C8zc1F7oVnntxKOo0W1rvATjxsgaY7R6/1w5EIWsZjSNb4x05e/ABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785835080; c=relaxed/simple;
	bh=FJIdriTcV+Zqy+AxBk0X3et3HxKQocTHkpotFXqHmz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LPxpMUCnVT2PttZAIqa/JRjLsHbWxdgQKi4iSEvuoBBYWcH82dMhnd279kq7QuiECMWjLw5JxxCX27/92k7NRZBzbyw4WjP9qHwAr1D+lYA0HMc1FObaj5r+lQ2UKVqWz5CROJe3/HN2Anr1Vh7jGuITgZGgkb0FTMo3giPOcd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkWf53sE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkWf53sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785835078; x=1817371078;
  h=date:from:to:cc:subject:message-id;
  bh=FJIdriTcV+Zqy+AxBk0X3et3HxKQocTHkpotFXqHmz8=;
  b=LkWf53sEBIc5dhg5CfIMpXJxjJyFyjgY1cMTC6E1aiR/UKw69hbH7h2K
   6w/6OGRFZN2tRE29riK0Cgs3labW5fOxf2ZGScLv77RFQhPs2JCcol8As
   VKC0xYuj6dv9n6+8mYbuc5nzO3OePyY1CkMbkXusN9BC3Z4T42SYQvKZa
   AxIwJOXRTVFRkMbTnDegZCfrszdtI/HnVGSbv0iU5KPQ8uDnW6NYs882b
   Uu/z0lpyOvDG1MbNso5k34/VaT61Ql11wmyr1tel6kNdBWEEHC1yTJvX0
   EASa5jm2U1haPeslrJ4A+wv9MLcYoZONPZ+ewt1OfdwqGBX0p5PCtUH7R
   A==;
X-CSE-ConnectionGUID: 9dboiLcaQpuwmmIl/KanYA==
X-CSE-MsgGUID: a2otLXGcS12+44bmd+X2pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86150470"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="86150470"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 02:17:56 -0700
X-CSE-ConnectionGUID: 7F88GwaBQ8OYlrOJ5AxMWw==
X-CSE-MsgGUID: K5PTXEAGSvWHWLYYPRFqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="263448288"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2026 02:17:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrBHT-000000009Wl-2dtg;
	Tue, 04 Aug 2026 09:17:51 +0000
Date: Tue, 04 Aug 2026 17:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>
Subject: [boqun:rust-sync 24/24] ERROR: modpost:
 "_local_interrupt_disable" [drivers/input/serio/serport.ko] undefined!
Message-ID: <202608041758.yZSaTtAl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
head:   01f609820dfd3182c99ce8a00723ca23798a8056
commit: 01f609820dfd3182c99ce8a00723ca23798a8056 [24/24] EXP: Avoid export local_interrupt_disable_state
config: um-randconfig-002-20260804 (https://download.01.org/0day-ci/archive/20260804/202608041758.yZSaTtAl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041758.yZSaTtAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041758.yZSaTtAl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "_local_interrupt_disable" [drivers/input/serio/serport.ko] undefined!
>> ERROR: modpost: "_local_interrupt_enable" [drivers/input/serio/serport.ko] undefined!
>> ERROR: modpost: "_local_interrupt_disable" [drivers/input/serio/userio.ko] undefined!
>> ERROR: modpost: "_local_interrupt_enable" [drivers/input/serio/userio.ko] undefined!
>> ERROR: modpost: "_local_interrupt_disable" [drivers/iio/buffer/industrialio-buffer-dma.ko] undefined!
>> ERROR: modpost: "_local_interrupt_enable" [drivers/iio/buffer/industrialio-buffer-dma.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
