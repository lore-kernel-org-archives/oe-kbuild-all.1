Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1663A9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Mar 2025 04:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740889005; cv=none; b=Cq5e4cEZjPn+dRdQqXjZdJjnVE8nu8aGdnSMLo03dM1GAvT7cVTPfva+stl1zhWYCe9hJKNvP3tlSlUnzujkf6LThv0SmXaKl0DLeGnP+yQ191O5vUH58Ez5F8oW6qqiksr1Wo2yC2Ni0E8BMTl4/x6I2/sAydmyRlm4/yVJjRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740889005; c=relaxed/simple;
	bh=BlVB0G/mMhV0eFM0fqaBhx8Tp/G0EPtcaSVL2Bd7f0A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DyvXCG8rPvREL29RCoBp4gHp1eJi8oZiTXU2tOObfDC9tCZbgJMRaAb5WYthGJFBD2fWdX0M/3x5bFf3TNXtoRvgOUkG5AvBmj0ECTPb/ic4huR4lTEWBjhGhfblI5X6lr6VEJ6n8lK42eekHPJOGQe1s2fToEh+wgSEwk9JZYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtuAIA2a; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtuAIA2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740889003; x=1772425003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BlVB0G/mMhV0eFM0fqaBhx8Tp/G0EPtcaSVL2Bd7f0A=;
  b=YtuAIA2axXBm6xCvLJ3fKQIZ+Pq3SuwhbkSFHi6LvQsgj7VTGATNoak3
   QKImrJFVEDK35oh6ye5IrbibWeXVj9rdEg7TDkwsjQtQHr836Dh3B41L8
   rR5x8r/hPe6nA8yfcSUDQB4WMAjl2xYKVntGGfj3l6JN6Vj6hoQm7sqVC
   ptaQb0oWzKv8bnb+pAgoiOfhJ3L12WoBDi2RUwracFAxSm7XADpYLQVYp
   n5zMZhl5khM//2RrN9ZY92T9DVAeLFf5W4bLR6m5N86FkQnnJ84YD6d4E
   uehd6pUWB3a72173AhHDb0pijeoui4Eiokn78kLbRP0uhMxufvJ0kjKCN
   A==;
X-CSE-ConnectionGUID: 5QqDhu3OToyvMgNYrCJMwA==
X-CSE-MsgGUID: VWT1T07/Rh6IuUPY/R3cQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41631339"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41631339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 20:16:43 -0800
X-CSE-ConnectionGUID: s5GoTJfIS9KKPnIBD0w6eA==
X-CSE-MsgGUID: zPH2kYpERQG3sl1gtiAS5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118591511"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Mar 2025 20:16:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toakp-000H2w-0r;
	Sun, 02 Mar 2025 04:16:39 +0000
Date: Sun, 2 Mar 2025 12:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:timed-may-goto 1/1] arch/x86/net/bpf_jit_comp.o: warning:
 objtool: arch_bpf_timed_may_goto+0x20: 'naked' return found in
 MITIGATION_RETHUNK build
Message-ID: <202503021205.ALjlbl1U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux timed-may-goto
head:   45ff7356c9ab73e7534fd1a2aca784c8bab7eedb
commit: 45ff7356c9ab73e7534fd1a2aca784c8bab7eedb [1/1] bpf: Implement timed may_goto support
config: x86_64-buildonly-randconfig-005-20250302 (https://download.01.org/0day-ci/archive/20250302/202503021205.ALjlbl1U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503021205.ALjlbl1U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503021205.ALjlbl1U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/net/bpf_jit_comp.o: warning: objtool: arch_bpf_timed_may_goto+0x20: 'naked' return found in MITIGATION_RETHUNK build

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
