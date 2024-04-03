Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75060156966
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Apr 2024 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712183178; cv=none; b=mhQ+VJzAKLU4UnzI/mEqozTzzetj0rCzcHR1TlA6cs2FAgO3fc7IL34uhU77CcvJE476dfzQK4fzkKbOa1ijU5FFTv2pZJdrDo7snzA0DHUy5iaPnMy8e5sxtd7qY5P7kUPGVtw6uFR12xrTkgeih7W/6/7S2vtEIqSWFmM4ag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712183178; c=relaxed/simple;
	bh=Wrvk4nE1SYBACAaQaQjeDpnfMlN8qB7TtYEbJ3TAs+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=locrpovxp/KDoaPrakvx0UjA+PkrLWQCQc+t3TdFx3cIvE2x4FocfWpEGeTV6ZQdzjvn9ssOvXiPqoykon8AF4q47Mtye+hRyfLHm/bETSYF7MS1H+h0o6kmPopaY5YUO6xS0OjFkCw0F5Hus9LDwNo4nmbxyQJtboLPCjSLdwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZFg5+uJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZFg5+uJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712183177; x=1743719177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wrvk4nE1SYBACAaQaQjeDpnfMlN8qB7TtYEbJ3TAs+Y=;
  b=QZFg5+uJolZmsxjeWpeaJIhtOV99C08wJzDH0NcFF8VL7mTLMnrmVt+x
   Cnoab8Zc1GRwC2OgvRxbQ58mr1A5XIHDSw7bxEJXCsPUAEE1SmCBGF+EX
   3jRoQtK/d/y+bbbnUg+d06tToQeFy5wQb0w/+22kNXLrtXVR4aiTQvoyF
   Xy8AoY4aCYT/45ar3c0UkH6V6+ewEe6v1CW9GHno1KdWBCGZ7FdK1JqjS
   cNjlRHcXdVXEySI5S8c7tKJkOBKsN208v/B+w42/7eYAUx9MVzQqY0kmu
   mpo+Hr9tasu+8AQ1TtikeyCYTGmvSjx+i/sH1yCdgDG/uq0IckSoccYWq
   Q==;
X-CSE-ConnectionGUID: Dr/4s6vFRp+J7dYcijeetw==
X-CSE-MsgGUID: ZbvuJ9sPTmyIcznCCkE2Hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="29920085"
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="29920085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 15:26:16 -0700
X-CSE-ConnectionGUID: F+wALV7NQmuZNib4SWRDBQ==
X-CSE-MsgGUID: 4ykD+oCxSsGefA0aN06awg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,178,1708416000"; 
   d="scan'208";a="19183834"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Apr 2024 15:26:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rs93c-0000Io-2o;
	Wed, 03 Apr 2024 22:26:12 +0000
Date: Thu, 4 Apr 2024 06:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/testing 6/6] timer.c:undefined reference
 to `__tracepoint_tmigr_fetched'
Message-ID: <202404040653.eCLxKhSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/testing
head:   45406f6df1aa857434d206a1b0b9274b68ff5dc1
commit: 45406f6df1aa857434d206a1b0b9274b68ff5dc1 [6/6] tracing
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240404/202404040653.eCLxKhSr-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404040653.eCLxKhSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404040653.eCLxKhSr-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/time/timer.o: in function `__get_next_timer_interrupt':
>> timer.c:(.text+0x6491): undefined reference to `__tracepoint_tmigr_fetched'
>> /usr/bin/ld: timer.c:(.text+0x69db): undefined reference to `__traceiter_tmigr_fetched'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
