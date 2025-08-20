Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3025D536
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Aug 2025 21:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755725981; cv=none; b=qMaJiMMsoMFzU09PkEHnz9Y5MeEWITEW8mTCa+O0twaAScF4zWX52FZW8d48igO94Vvh85qG5NWVdHlOC8eJHzdbZqIL1Opo5fpgDLxJVhi2MdylBnUxTQ4amGywgqE9wELednf4vx826r4jkujxciQjlA59x5ucbNSii02jO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755725981; c=relaxed/simple;
	bh=pfvX5oH9SYoHlQRFfUJOgMOg9OmNuK8N9oijEO2LW2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rvPPRuE0VeGk0/xvPplNtefj6N9hTC06oHOE1V2WDKXJNGTUvRE5Wq0EwIAEvUG/Awh4MX9A7/IuqpM7wjqEHlGWZEVuXi/XfAOUeDAO3+0G2CUonemwGhxAp6Ip9bnH3u46Ful8LP87i6ktEY/+BupWbdf/m4ds2EQsKU+S5t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=km++KAj8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="km++KAj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755725980; x=1787261980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pfvX5oH9SYoHlQRFfUJOgMOg9OmNuK8N9oijEO2LW2c=;
  b=km++KAj8Rvz3s0s/6ZD+FyfiOOBGqrUAQG+/4tcRTsdxZ9bWoF2CDTG5
   yPnaFtaJTktVHIrLqeqKMjPWbTdrqEQMFSh8CC12RxJ5hgCUpVEMLkfL/
   eF9+sPNruLCPK8H1Gi058wlPMfZbLxLZ4+PsmetB2zK/buzQR2gZh6s/j
   6HQ2kw0quXDOC36e5oKv7iiiYNR68XAnNM0fXZo6zHkjVpOXKngyDoLhK
   rFludiUYMzB8+Jg047fPcwa9FVLX6nc8OBUsJeGItR3i1CFOT1Rp2Vzzo
   YvIU8hgbMLgKd/L0J9ZUuDeOEutI9EuIGQcNSxvexjgXyvxZjYFY62dgH
   A==;
X-CSE-ConnectionGUID: M9ncMuCdQdWBzmbkYcF0Ig==
X-CSE-MsgGUID: 9l8KYVpzRfShKDw+EjoXbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57934683"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="57934683"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 14:39:38 -0700
X-CSE-ConnectionGUID: ZEv40UTyTYiBl0ZmkrcFUQ==
X-CSE-MsgGUID: xpsm9xphRKygWRxqS8s57A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="172495381"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 20 Aug 2025 14:39:36 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoqWs-0001bn-1K;
	Wed, 20 Aug 2025 21:39:34 +0000
Date: Wed, 20 Aug 2025 23:39:28 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3135/3135] arch/x86/events/amd/brs.c:339:6:
 warning: no previous prototype for 'perf_amd_brs_lopwr_cb'
Message-ID: <202508202313.jlfYOA3M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xie,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   28d3b936dc6be28156ddfb85879ccdf7b3cf2ded
commit: 600130a3b3f73d76dbfa38d63f68d1c2520e582d [3135/3135] kabi: Fix kabi breakage without build warning.
config: x86_64-buildonly-randconfig-2002-20250820 (https://download.01.org/0day-ci/archive/20250820/202508202313.jlfYOA3M-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250820/202508202313.jlfYOA3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508202313.jlfYOA3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/amd/brs.c:339:6: warning: no previous prototype for 'perf_amd_brs_lopwr_cb' [-Wmissing-prototypes]
     339 | void perf_amd_brs_lopwr_cb(bool lopwr_in)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/perf_amd_brs_lopwr_cb +339 arch/x86/events/amd/brs.c

fb5f22f8054df9 Stephane Eranian 2022-03-22  334  
fb5f22f8054df9 Stephane Eranian 2022-03-22  335  /*
fb5f22f8054df9 Stephane Eranian 2022-03-22  336   * called from ACPI processor_idle.c or acpi_pad.c
fb5f22f8054df9 Stephane Eranian 2022-03-22  337   * with interrupts disabled
fb5f22f8054df9 Stephane Eranian 2022-03-22  338   */
fb5f22f8054df9 Stephane Eranian 2022-03-22 @339  void perf_amd_brs_lopwr_cb(bool lopwr_in)
fb5f22f8054df9 Stephane Eranian 2022-03-22  340  {
fb5f22f8054df9 Stephane Eranian 2022-03-22  341  	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
fb5f22f8054df9 Stephane Eranian 2022-03-22  342  	union amd_debug_extn_cfg cfg;
fb5f22f8054df9 Stephane Eranian 2022-03-22  343  
fb5f22f8054df9 Stephane Eranian 2022-03-22  344  	/*
fb5f22f8054df9 Stephane Eranian 2022-03-22  345  	 * on mwait in, we may end up in non C0 state.
fb5f22f8054df9 Stephane Eranian 2022-03-22  346  	 * we must disable branch sampling to avoid holding the NMI
fb5f22f8054df9 Stephane Eranian 2022-03-22  347  	 * for too long. We disable it in hardware but we
fb5f22f8054df9 Stephane Eranian 2022-03-22  348  	 * keep the state in cpuc, so we can re-enable.
fb5f22f8054df9 Stephane Eranian 2022-03-22  349  	 *
fb5f22f8054df9 Stephane Eranian 2022-03-22  350  	 * The hardware will deliver the NMI if needed when brsmen cleared
fb5f22f8054df9 Stephane Eranian 2022-03-22  351  	 */
fb5f22f8054df9 Stephane Eranian 2022-03-22  352  	if (cpuc->brs_active) {
fb5f22f8054df9 Stephane Eranian 2022-03-22  353  		cfg.val = get_debug_extn_cfg();
fb5f22f8054df9 Stephane Eranian 2022-03-22  354  		cfg.brsmen = !lopwr_in;
fb5f22f8054df9 Stephane Eranian 2022-03-22  355  		set_debug_extn_cfg(cfg.val);
fb5f22f8054df9 Stephane Eranian 2022-03-22  356  	}
fb5f22f8054df9 Stephane Eranian 2022-03-22  357  }
fb5f22f8054df9 Stephane Eranian 2022-03-22  358  

:::::: The code at line 339 was first introduced by commit
:::::: fb5f22f8054df9c6cc2c2e40e54a76ea62fb4824 perf/x86/amd: Add idle hooks for branch sampling

:::::: TO: Stephane Eranian <eranian@google.com>
:::::: CC: Xie Haocheng <haocheng.xie@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
