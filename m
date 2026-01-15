Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544A33446CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768483689; cv=none; b=IOjcik5gYqD9jtjjRwf+wSEB7IjsJD1cFRF6St1cha8LK0uAeWGVeI0FUvT7zakN1yOLwCu32p1t+SHH6wUBCHE6XCPRD+Y11eEYjfIu1IIkQqcQxDG2HkRdAdfuMzlM/ebpG3xynxqZ7JdVkQzAVPTURhUj7bnBrav28EDz8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768483689; c=relaxed/simple;
	bh=BrUvQtDlSzJrJZoe3Q/Pq9X7euNKjwfyjw25a7tK1Do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IaVOerxqBgnsFdgNH6R96kh8N071y+LwNUW8ZtFHxBEG3WHYN0rBoP2ADUV3ODjqeLdVAxURdRWfFgqFQBkRm3mSfM88VK77UoJucCb9i3rb85yyM+/x2qSIfMZZR9gu8Mt1jmH8+tyBVVjxpweCGM04eJzp8YPuB57PM6NwpJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EwB1EqAO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EwB1EqAO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768483687; x=1800019687;
  h=date:from:to:cc:subject:message-id;
  bh=BrUvQtDlSzJrJZoe3Q/Pq9X7euNKjwfyjw25a7tK1Do=;
  b=EwB1EqAOUB2mgoS6l/MWCwLIvTnwUOnD4lx+la2Snwh6bCVXyFBV8j6G
   HbOflQEDlog3kkxT8iHiuZNmqKrwY9tgn1m3bKYOgNSuPvds7RK/AMTg6
   MSovBYya0iVhCF8qqqX+YMGgJ7S21oIWygxYGXVmvN0oo6DpHAjpQhGp0
   UGrYbSQ08zmNGlT7xf3GjsIsvQscbRDSHAHEooBn7ekVN27x95mn3h+Vp
   GJt1u/BV+q/jEwzqJPez9YNfNlRzvOx8p+/o22LD2SjdsUDErlhy/0Rfj
   EZVIIJjekRCFEpXXUNRehL9vqqs0sa0fhAUzQEnFnYcKf8wGbMIabbdxA
   w==;
X-CSE-ConnectionGUID: jIN2IlneSoC2g3dvaOTRog==
X-CSE-MsgGUID: FmC1M7hPQW6ZjHp0APcrzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69704698"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69704698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 05:28:06 -0800
X-CSE-ConnectionGUID: MKvcckt0S429R0EE9ZaB5A==
X-CSE-MsgGUID: XITlGCUoTDSp2nym4tJi+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209467815"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jan 2026 05:28:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgNON-00000000I0c-19gU;
	Thu, 15 Jan 2026 13:28:03 +0000
Date: Thu, 15 Jan 2026 21:27:21 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 11/14] ERROR: modpost:
 "kcpustat_field_idle" [drivers/leds/trigger/ledtrig-activity.ko] undefined!
Message-ID: <202601152154.zEHaNCQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   84086eab45346839d78c3edec1874e737f92ee3b
commit: 5573718bc6af764405b16b4b904d6c3750a38523 [11/14] tick/sched: Consolidate fetching idle time
config: sparc-randconfig-001-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152154.zEHaNCQp-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152154.zEHaNCQp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601152154.zEHaNCQp-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kcpustat_field_idle" [drivers/leds/trigger/ledtrig-activity.ko] undefined!
>> ERROR: modpost: "kcpustat_field_iowait" [drivers/leds/trigger/ledtrig-activity.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
