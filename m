Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5013AD11
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 17:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730135418; cv=none; b=uQNICDa672frD2ZTMqWpYc0d3bCyRK6kM259xh7ON+4gz/c14HcEeObRpV1AVR5D3blc2sr6v28s255zsCU0VQ6ILOcWzzhrZ1/hkqg9oU2PIxjJ1Ad0tbgKKKA/0vyfvXxyR8gCHnzevJtnUp+gG4dSHO5ELvwC12XIFejZwVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730135418; c=relaxed/simple;
	bh=2jTLjUobhcMgVteuPO6XO/GgoFdf3qKvYnGq3361Hcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NhIcpjsRCeQhNSJ73g9FBDMdhEIR1cgAMQ+qQ1+hMYWAuUwsc7d0D4xNu9ZuDyWRKg+ntte7CCZQkeQ34A0vFF/55xzUzFxTq/OVqTXUs/lZxqf/rrB7DfSfmciIud+cRUeVFkoDUha2wZ4N8NJ70/GObe2C5Xqlu0xF/6KPxPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kt241bMt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kt241bMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730135416; x=1761671416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2jTLjUobhcMgVteuPO6XO/GgoFdf3qKvYnGq3361Hcw=;
  b=kt241bMt+zHYLWgog0U5aIPlscds1nop1lL4AxyTs1+yqEtxKLuqY+pk
   9yBXmNWBho3xkUwVODyDLu3nhebGkbH9x5FPKF9H7CrHf8FHtaX1h624z
   FsijaMZJZcCEh3RAACua+55bZLnf1UUn6UKklF6cBUCud0XcUYUtv2Xhz
   AUZI/QjXh5KHrkVxZsQjE7zsavTvUjqtE2xLQjwsOkAPY0a+rOVW2QuHm
   0YtkjS8vX5i8PnI8Edgbs/pjMBEVZzOGJgH+plMtrXWhInCRABwepRZ19
   /dnXD+TE971n/U1xTz36xHuyRyojmMGM/lhdxJm+PGExl71335WtA6wnx
   Q==;
X-CSE-ConnectionGUID: 4EIUKvGeR3GU+GoQtFKGKQ==
X-CSE-MsgGUID: lorCnUjMQymB+kH5hH57AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40281661"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40281661"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 10:10:15 -0700
X-CSE-ConnectionGUID: ajmHetubR6ef8diA4gYrnA==
X-CSE-MsgGUID: uuvMfKTqSamfKUUU5vry/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="81575184"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Oct 2024 10:10:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5TFr-000cfo-2q;
	Mon, 28 Oct 2024 17:10:11 +0000
Date: Tue, 29 Oct 2024 01:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 5599/30000]
 arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype
 for '__kernel_time'
Message-ID: <202410290158.HzO1ma3N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   ca48ea8b94307a011f58fdc6efa124ff7f5508f8
commit: 7bbd50f11d3086fe75fac78882de0d42e27293fa [5599/30000] ANDROID: arch: arm64: vdso: export the symbols for time()
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20241029/202410290158.HzO1ma3N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290158.HzO1ma3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290158.HzO1ma3N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
       9 | int __kernel_clock_gettime(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
      15 | int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
      21 | int __kernel_clock_getres(clockid_t clock_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype for '__kernel_time' [-Wmissing-prototypes]
      27 | time_t __kernel_time(time_t *time)
         |        ^~~~~~~~~~~~~
--
   arch/arm64/kernel/vdso/vgettimeofday.c:9:5: warning: no previous prototype for '__kernel_clock_gettime' [-Wmissing-prototypes]
       9 | int __kernel_clock_gettime(clockid_t clock,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:15:5: warning: no previous prototype for '__kernel_gettimeofday' [-Wmissing-prototypes]
      15 | int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/vdso/vgettimeofday.c:21:5: warning: no previous prototype for '__kernel_clock_getres' [-Wmissing-prototypes]
      21 | int __kernel_clock_getres(clockid_t clock_id,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/vdso/vgettimeofday.c:27:8: warning: no previous prototype for '__kernel_time' [-Wmissing-prototypes]
      27 | time_t __kernel_time(time_t *time)
         |        ^~~~~~~~~~~~~


vim +/__kernel_time +27 arch/arm64/kernel/vdso/vgettimeofday.c

   > 9	int __kernel_clock_gettime(clockid_t clock,
    10				   struct __kernel_timespec *ts)
    11	{
    12		return __cvdso_clock_gettime(clock, ts);
    13	}
    14	
    15	int __kernel_gettimeofday(struct __kernel_old_timeval *tv,
    16				  struct timezone *tz)
    17	{
    18		return __cvdso_gettimeofday(tv, tz);
    19	}
    20	
    21	int __kernel_clock_getres(clockid_t clock_id,
    22				  struct __kernel_timespec *res)
    23	{
    24		return __cvdso_clock_getres(clock_id, res);
    25	}
    26	
  > 27	time_t __kernel_time(time_t *time)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
