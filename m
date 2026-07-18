Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAA52EA154
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 08:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362789; cv=none; b=KvAGQWh9KnA2njn/0IlGY+Wu4uHyTN0bVgwKUe0TXVej0aKHMzzjh+RV2+jmmG6tR3e5LlZLktW1SM+j1EjZFsPY2a68lfuxD6O90llfYydf5QLSqB0jnA1Shwl+64Uxi2Ij8QKZ2BU7CBCWQqenb96FfYki97VC4/ZezwTgtIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362789; c=relaxed/simple;
	bh=WiFEYV/ylRbdDVJvBvcogvKXYN6VelFVPXPRdclcz6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BN9XHIsL516WsI0NT3r8oZYZN6QuQvUxi9LPt/7A/UFz03PKXbup+7Aeh4mzofRlRD/4uIqn96o/sR4ySAdv0NOqrCNjqTz3y0KHJXUbPY4tlNaCurO4ELHEBh8WvV1bmS3/2nwPumkSVsaodc0cLEWBL+pp+ReUD0g6bCNhxFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfZhZWql; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfZhZWql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784362786; x=1815898786;
  h=date:from:to:cc:subject:message-id;
  bh=WiFEYV/ylRbdDVJvBvcogvKXYN6VelFVPXPRdclcz6g=;
  b=ZfZhZWqlOgJx0kDa6K24OqFiH7u/xBSQD+wqL8vAo2I1J0UMnPMaJNzV
   HPdOHeRK3OYptGrVRL6GaXvNiTTMQySMcaxCGz1mDY1gH/RFkRfdwG7gH
   YPD7TcrFazINqOukCjOxceBYf+XZ0fUOg8CrJ32+1guyAbfXFpCOOLF+u
   NDemK+MfcaLq7lT8twlA/885HHc+6YN8xN4vfAp+V4J4TK4KYrTixvIDo
   ynw4G2rh/bvFJBQhHIMFzZZ0ksq+aF544XDRdcK417USt6Tr+Z/xFE0z0
   LrJzTUpP+o+Pq784LU3l5sxU68CfNyZurmUOw2c/jaZwXySgZWT7o4pwF
   Q==;
X-CSE-ConnectionGUID: 9//t2uP8T4+8EIh6YLCMtw==
X-CSE-MsgGUID: 4CH/4KURRe6jUUSmBKDaUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="85112123"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="85112123"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 01:19:46 -0700
X-CSE-ConnectionGUID: c7S2GgFXT46YWsZmSQJXEw==
X-CSE-MsgGUID: 1dAu+20WTJaWP/ZzAKfa/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="281438501"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jul 2026 01:19:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl0Gq-00000000Ta5-0TYQ;
	Sat, 18 Jul 2026 08:19:40 +0000
Date: Sat, 18 Jul 2026 16:19:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 23/23]
 fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named
 'min_coredump'
Message-ID: <202607181640.NhtDPdk1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   921ffc45a309b3b476101d896d8aca3eca758ed9
commit: 58e2fa4ec4b1e15b7c7510bc98befafa31c03f70 [23/23] ANDROID: 16K: Remove build time dependencies on ELF_EXEC_PAGESIZE
config: i386-randconfig-015 (https://download.01.org/0day-ci/archive/20260718/202607181640.NhtDPdk1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607181640.NhtDPdk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607181640.NhtDPdk1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/binfmt_elf.c: In function 'init_elf_binfmt':
>> fs/binfmt_elf.c:2143:19: error: 'struct linux_binfmt' has no member named 'min_coredump'
    2143 |         elf_format.min_coredump = ELF_EXEC_PAGESIZE;
         |                   ^


vim +2143 fs/binfmt_elf.c

  2140	
  2141	static int __init init_elf_binfmt(void)
  2142	{
> 2143		elf_format.min_coredump = ELF_EXEC_PAGESIZE;
  2144		register_binfmt(&elf_format);
  2145		return 0;
  2146	}
  2147	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
