Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDD4219EB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820640; cv=none; b=aSfB6hQFIK3BWkjDbnwC2WcvDr2Rpy0ulvO18JF4VRMd+wzZVkwXcgOnTsdWtnsY7f6iqbuI1LMtwW6rsiZ5jzCgaRQa5U0DOwuFWfMCBb8ZIlYYzGAXl0mVH+KbEGMw9g66feW/2f6vvc8/pdowsyKXO6627hP+mODHb9/2qy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820640; c=relaxed/simple;
	bh=QvNv1j2tTTxEg+s9TgIqrNnAKOMtquX1WhMRWokhLrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NFIC4+56KAtfnvXWVm2f96oysWiyuf/3Ij25VwApFDij06VURaRETJkezM8UmkQOIoRfVpbpk1w6WP7csIvLhIyl0cU12ESJe/5jWXuIvxHMWlAY4MJR/xS9NiDBWWQ80DssF7bWZNVHDuu8LPZN0TnnC7TkvfQ1Ap5+wxFn8Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JL5asNB4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JL5asNB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779820639; x=1811356639;
  h=date:from:to:cc:subject:message-id;
  bh=QvNv1j2tTTxEg+s9TgIqrNnAKOMtquX1WhMRWokhLrc=;
  b=JL5asNB4BxKXBECKeh82RzksOp5unwYFeQKwfJtPFFCU3ypFY5BTy0os
   cAaF1kAuxkGqP//05pf3wDskCkE9P5PgqNVwhgoJR8Eb3+m7rXrHXydHv
   1Woy5SvT9hvWiPeHq/wxDNFzgHhiAA5iP+59rxs0rc3612/qeNfXiVK5G
   fHBFKIx4bprDclKyc2h2na7QpGKHrf9C/KcCLcZBG31qKBgqXmFv9HEIN
   EpneQu/pS54p9ky47jiMNnPEPXbvR2aPodSUkfVFnU6rGXx+hTT1qAT9/
   Kfc4LqtHGlqTsflnD2zq7iUXEwYaKWiLobe85IvG5nBwbyeHmW1bHXXLf
   A==;
X-CSE-ConnectionGUID: D7ZrnbqcSZKvKeW9sQQe2A==
X-CSE-MsgGUID: OEeCdZjbS4q5y5SKo2B1Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="92117574"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="92117574"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 11:37:18 -0700
X-CSE-ConnectionGUID: wnk5/rQ2Ra+zcx0FNM5zbQ==
X-CSE-MsgGUID: wgMegpT1T3C2QGXldtI6WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="241158620"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 May 2026 11:37:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRweQ-000000002va-2b7C;
	Tue, 26 May 2026 18:37:14 +0000
Date: Wed, 27 May 2026 02:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:health-monitoring-7.0 3/11] hppa-linux-ld:
 fs/xfs/xfs_trace.o(.text+0x41100): cannot reach
 00003317_trace_event_buffer_reserve+0, recompile with -ffunction-sections
Message-ID: <202605270233.pkHRRFxq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git health-monitoring-7.0
head:   b8accfd65d31f25b9df15ec2419179b6fa0b21d5
commit: b3a289a2a9397b2e731f334d7d36623a0f9192c5 [3/11] xfs: create event queuing, formatting, and discovery infrastructure
config: parisc-randconfig-r051-20260526 (https://download.01.org/0day-ci/archive/20260527/202605270233.pkHRRFxq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605270233.pkHRRFxq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605270233.pkHRRFxq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x41100): cannot reach 00003317_trace_event_buffer_reserve+0, recompile with -ffunction-sections
>> hppa-linux-ld: fs/xfs/xfs_trace.o(.text+0x41100): cannot handle R_PARISC_PCREL17F for trace_event_buffer_reserve
   hppa-linux-ld: final link failed: bad value

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
