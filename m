Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5763020B810
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774922634; cv=none; b=Zih3eVlap8wcV/YlSuCoAW6IWbtHlQ4kqmxEMb5XR5H13fEipib3aumHrd5hi4GGsRRpvmwy8b/HYfTObhupSbzAxIpZJ5T165JGKcZphO/iImcsw4hht40BEV3cS+/0v4L1SN7cmujdghEXxc1bRtDUwqBuGYVfiG1jyHTYLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774922634; c=relaxed/simple;
	bh=dXWmZCSxjHnf/IVMLyhf5gyUZQZR41Vaua8FQ/k9qsk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o1zZux375z2mDL/qqiD7iy/n/TuvGyhi83+jzMKRGVx9v7rJCaRPRolfymj1Wtt0Dk3a+nqbFeVUtHDCzk9xwjyc4giOzUt2298k4OEV37onKjX7NPOhf2U7JDUMEDfgvSP7QP4lZ638pBLQmMxFkZbBUeRagclKYl2XqHP0i5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e46V6y5J; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e46V6y5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774922632; x=1806458632;
  h=date:from:to:cc:subject:message-id;
  bh=dXWmZCSxjHnf/IVMLyhf5gyUZQZR41Vaua8FQ/k9qsk=;
  b=e46V6y5JWIVvJp7jndjfcfZM8LL3Lktfow5d0tVOAasgvfPvHwUZuvnE
   +sfYvywumzcYxoeaFZ/o6MeHigJSD1e1thuqLk192k5OJ1e0YkaI+bQUJ
   7zzNFceUaP4XHWOtR64eq94rO+QHtXktXfV4/h/fIV2pT5veNc8vzpQbJ
   QcflWN2G9PWvR7UfanN55l/b3zmJNwNM+r+4OXTl5YDWoC8Ufm08BpVBT
   iq21VILqVgH2QAEP4Jyxqb0Kcx87sHsGxS+beIuMSYDVsLTZCbeRi6J5G
   MpwMAqri3HlJSZuPJH9+VMRwx0AgZEWw0qnnMrX7ifYyMUeQzVWU5LlWJ
   A==;
X-CSE-ConnectionGUID: u1mFiADkTcqQBYP8rbd/OQ==
X-CSE-MsgGUID: HqaPy2EMRT2m5bFcXTvBBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75813087"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75813087"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:03:52 -0700
X-CSE-ConnectionGUID: MdHzqJiTRH+HXzwqar2vOQ==
X-CSE-MsgGUID: TM7DBZKXSzySBCTArkFCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="231147479"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Mar 2026 19:03:50 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7OSK-00000000213-0NBX;
	Tue, 31 Mar 2026 02:03:48 +0000
Date: Tue, 31 Mar 2026 10:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 kernel/sched/test_ksched_football.c:57:15: sparse: sparse: symbol
 'players_per_team' was not declared. Should it be static?
Message-ID: <202603310934.9cdD82Ra-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   49e3211dc6f78316f18eda489420693b4f42cc58
commit: 84f4417638e9588ebcb43c4ed0280d097c46abf9 [1/1] ANDROID: sched: Initial ksched_football test implementation
config: x86_64-randconfig-r121-20260331 (https://download.01.org/0day-ci/archive/20260331/202603310934.9cdD82Ra-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310934.9cdD82Ra-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310934.9cdD82Ra-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/test_ksched_football.c:55:10: sparse: sparse: symbol 'players_ready' was not declared. Should it be static?
   kernel/sched/test_ksched_football.c:56:10: sparse: sparse: symbol 'ball_pos' was not declared. Should it be static?
>> kernel/sched/test_ksched_football.c:57:15: sparse: sparse: symbol 'players_per_team' was not declared. Should it be static?
   kernel/sched/test_ksched_football.c:58:6: sparse: sparse: symbol 'game_over' was not declared. Should it be static?
   kernel/sched/test_ksched_football.c:78:17: sparse: sparse: symbol 'mutex_low_list' was not declared. Should it be static?
   kernel/sched/test_ksched_football.c:79:17: sparse: sparse: symbol 'mutex_mid_list' was not declared. Should it be static?
   kernel/sched/test_ksched_football.c:216:19: sparse: sparse: symbol 'referee_done' was not declared. Should it be static?

vim +/players_per_team +57 kernel/sched/test_ksched_football.c

    54	
    55	atomic_t players_ready;
    56	atomic_t ball_pos;
  > 57	unsigned long players_per_team;
    58	bool game_over;
    59	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
