Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FF437E2F7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Mar 2026 23:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772839928; cv=none; b=ndVfWQOMeP7uabTxOS277yZ1XU3tENbzp/Yh5+otYNIzIv6jUUdeA3UwFqY6Qhp5QDVuG1XHsPt33fEts8aTBocHoGGss/JLgdVxaelRcYZVuHcSqVztImoiiR+friD2ZPv/6K+qEm2Gs3mPhtcSCKH8/A1D+wFpv2AqqwyI1jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772839928; c=relaxed/simple;
	bh=BWOgXYVj1Nnm2s4OBO53TaBMa8M0R6z14G3vDiME+8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a6fmiQ6ndFHX31yuR0y0fH0qUNa85hsUr65Watvi4b2prItmnn+gy10845XsjvHEC5s9Cq2RlGb1+ipkD3i2YU3ARuAl4TcYz3fn+v1aDGfN3X3ScfXwYzCAuOW5Ivgwv7VJYICgO74s+s34POZ/mIp9FNLLL8/j4aOTiAYqjuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkfPLNdt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkfPLNdt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772839925; x=1804375925;
  h=date:from:to:cc:subject:message-id;
  bh=BWOgXYVj1Nnm2s4OBO53TaBMa8M0R6z14G3vDiME+8U=;
  b=UkfPLNdt9QZ/Lk8yUrXa/xeli16E8MTCvm7XuJyDxa4luvcHZgdUHpMn
   MZHsCqSDLaX4G8CBBtRhsLZbvinlAeBAAvcMXtJYo8O3IDIjkAMK76ZN+
   XP1IYBPdDhtiu0K/Yuj9QVToi/LzMAbTpIETYmIDWCRqVYdXOBWqIUHRx
   dB8Eq/bFXA9f9eLtQ+kxcdbwLiQQXYEESRf4Er6Q+ZQrK+rulPqmEe4+P
   +it8PqJBSRXAdO3tPxO1wG3mxfXjstN0OVTsMXP0Di8didRUcXntXO72p
   pWm59ZmZrU2RqqHKC4mZlzJmp4KIi6kr0myXdtCG/1WmDiNATqrt1rToh
   w==;
X-CSE-ConnectionGUID: jctpz/jvTJmcfqbNMWlRmA==
X-CSE-MsgGUID: Hd5AHlMNQcyRnBmB8/qu1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73923185"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73923185"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 15:32:05 -0800
X-CSE-ConnectionGUID: YUTGvr0RQXC/70QwG0+f3w==
X-CSE-MsgGUID: Sy9hTqluTy6iQVZ4yNO+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="242159215"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 15:32:03 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyeeH-000000002Nt-1cbe;
	Fri, 06 Mar 2026 23:32:01 +0000
Date: Sat, 07 Mar 2026 00:31:56 +0100
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.empty.mntns.consolidated 2/4]
 statmount_test_ns.c:37:19: error: static declaration of 'wait_for_pid'
 follows non-static declaration
Message-ID: <202603070020.wRAOi3Ah-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git work.empty.mntns.consolidated
head:   a50152df656989b93b3ab28144cd7dda89ebe1fe
commit: 2e1910db293b4ad0405081a88937039cae094bde [2/4] selftests/filesystems: add tests for empty mount namespaces
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260307/202603070020.wRAOi3Ah-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070020.wRAOi3Ah-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070020.wRAOi3Ah-lkp@intel.com/

Note: the brauner-github/work.empty.mntns.consolidated HEAD a50152df656989b93b3ab28144cd7dda89ebe1fe builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> statmount_test_ns.c:37:19: error: static declaration of 'wait_for_pid' follows non-static declaration
      37 | static inline int wait_for_pid(pid_t pid)
         |                   ^~~~~~~~~~~~
   In file included from statmount_test_ns.c:17:
   ../utils.h:47:12: note: previous declaration of 'wait_for_pid' with type 'int(pid_t)' {aka 'int(int)'}
      47 | extern int wait_for_pid(pid_t pid);
         |            ^~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
