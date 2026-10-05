Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DEB3E0C4A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 23:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791244377; cv=none; b=WVh+sWFFJIiy/PbOohJmqJxHOSfVJ+m2cwJTdkOs/+HTn6IPZjUzQCpL4K4cNBmOPUJSq5ywHxUeDIBbYFcbsXWEb1cOC3dhA389WBQTwMdHvbJyPjoVxXT5y7ClZKhHJuECGbUevShX8seAfpZLV02roP3tOQjI2cX6rE7c03Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791244377; c=relaxed/simple;
	bh=qXono64/1zAQCgRnR8wrrQqkDBcnJqq9AIqWlQTI2NQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qaFnhwYJSHmy/PMNyBhQQKr00nZoRZoIEsc2e0CkLZqPDSk2mANH6fQaMVLvZHahTmZSn5T761pDQzht4otLZBJQAK7p9W0fEeQ3y9qIuv1Jizsqb6z/l8IK4ZmTvImVsJadOjtXL9iGy6NlNVkiuUjb9NgI982pDJRRAqq8ke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKuQ4GRv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKuQ4GRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791244375; x=1822780375;
  h=date:from:to:cc:subject:message-id;
  bh=qXono64/1zAQCgRnR8wrrQqkDBcnJqq9AIqWlQTI2NQ=;
  b=kKuQ4GRvhgNetosCF9HKdsRkOqmm5qXr/3zFgCEsaFF43W76+0Hwohqv
   vlJ1eTwPvb0NzY7bTBqOKX1zXaMPz3NJy3S7IaBKyVU4lYvU0xfwbb4nZ
   JqEzdldkLpDgJPK9G0SeR61La3ve1aZ5uays+GNncNyxvW1yUVGsBZDfU
   OpqK7AzMdYiVVBt5472sqgME/GxvCwsqFsbgroZ9itjovGBmpZZIL/Pm1
   ezppTlroHNr2S00ChT4sjooPhqQ8qn7j2DlAqWYILZhg53Jk6qnQp4hry
   jowfm8dnM2hj2JyczlA8sT45EpOCRY+QAJ/8Rtp+AjujPe/34WS61RARv
   Q==;
X-CSE-ConnectionGUID: /6wQtKEyTmS4Cf2jgNBwpA==
X-CSE-MsgGUID: urSuj42BRb+jSovxYvrU1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102599108"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102599108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 16:52:55 -0700
X-CSE-ConnectionGUID: +WebNuGfTdypmuewTfo6sg==
X-CSE-MsgGUID: Af01hcfbQYWcTrMm9ltv5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="277073225"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 05 Oct 2026 16:52:53 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDsUE-000000000R9-2jUk;
	Mon, 05 Oct 2026 23:52:50 +0000
Date: Tue, 06 Oct 2026 01:52:08 +0200
From: kernel test robot <lkp@intel.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Nam Cao <namcao@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>
Subject: include/rv/automata.h:64:22: sparse: sparse: unsigned value
 that used to be signed checked against zero?
Message-ID: <202610060128.Sj0QiYiK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gabriele-Monaco/rv-Force-environment-reset-action-on-HA-monitor-start/20260929-144859
head:   60a413bc9eebf1d4e479e739c52d33f743fd3fb2
commit: 0aa6649f45c580345633b42c1822dc00b25c81ed rv: Add dl_server specific monitors
date:   6 days ago
config: x86_64-randconfig-2301-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060128.Sj0QiYiK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060128.Sj0QiYiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060128.Sj0QiYiK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/rv/monitors/boost/boost.c: note: in included file (through include/rv/ha_monitor.h):
>> include/rv/automata.h:64:22: sparse: sparse: unsigned value that used to be signed checked against zero?
   kernel/trace/rv/monitors/boost/boost.c:173:65: sparse: signed value source

vim +64 include/rv/automata.h

30984ccf31b7f0 Gabriele Monaco 2025-11-26  51  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  52  /*
30984ccf31b7f0 Gabriele Monaco 2025-11-26  53   * model_get_next_state - process an automaton event occurrence
30984ccf31b7f0 Gabriele Monaco 2025-11-26  54   *
30984ccf31b7f0 Gabriele Monaco 2025-11-26  55   * Given the current state (curr_state) and the event (event), returns
30984ccf31b7f0 Gabriele Monaco 2025-11-26  56   * the next state, or INVALID_STATE in case of error.
30984ccf31b7f0 Gabriele Monaco 2025-11-26  57   */
fa9b26dfa172d1 Gabriele Monaco 2025-11-26  58  static inline enum states model_get_next_state(enum states curr_state,
30984ccf31b7f0 Gabriele Monaco 2025-11-26  59  					enum events event)
30984ccf31b7f0 Gabriele Monaco 2025-11-26  60  {
30984ccf31b7f0 Gabriele Monaco 2025-11-26  61  	if ((curr_state < 0) || (curr_state >= STATE_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  62  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  63  
30984ccf31b7f0 Gabriele Monaco 2025-11-26 @64  	if ((event < 0) || (event >= EVENT_MAX))
30984ccf31b7f0 Gabriele Monaco 2025-11-26  65  		return INVALID_STATE;
30984ccf31b7f0 Gabriele Monaco 2025-11-26  66  
30984ccf31b7f0 Gabriele Monaco 2025-11-26  67  	return RV_AUTOMATON_NAME.function[curr_state][event];
30984ccf31b7f0 Gabriele Monaco 2025-11-26  68  }
30984ccf31b7f0 Gabriele Monaco 2025-11-26  69  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
