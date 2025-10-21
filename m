Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A158532A3FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Oct 2025 10:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761044031; cv=none; b=bKC8dQnTOGMbzaidIzIvEgW0Xiy7EeCSVD+o5UISC900qcBauDZ8tU9WS14J8YrtPNxmLdryNejQ+1ZvHgicdpsmZFyIn+z+jYeR6o8haJ42tnQpCqsfrcjUW3RVHE4N64qe2Vu0Yt+wqBGtVA5Sz1F0Gni7o9QDdFHdc4q/M+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761044031; c=relaxed/simple;
	bh=z9W08tFakR4rntFVt2C/QolkYErlrqGUGVDVL7R2suo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQ76nF5ghThe6P0UiiLBgsnE+HknL1ciaRm58nKosvfQnv3KI1smMWpsevbflTCO2AelddHSUV+nhXyIn6H7jkHQ5idGqUXd3JJF6ajNfu0bftPuFKo2Beoju5cMi5QiXFyxvzrOrCCEH4UXQk/8q2OH+IM5Z8j5gxPnNJVhgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USb9eZli; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USb9eZli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761044029; x=1792580029;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9W08tFakR4rntFVt2C/QolkYErlrqGUGVDVL7R2suo=;
  b=USb9eZlihMhrECLUe681iakpHJLp0Z6QO6a61YPvztQbIWBfMIQWCajS
   Ydwl2aLICqotf79VWMfh2uwmE15/qatnfBBX9wp930qPJJaVVgi+X7t0B
   fBE7K7yJz0XRF+J3IdQXaTE/0D25QiBVjUgYqqOu0uXUghD+OVov25C0r
   LsTUid4T4WtfbQATLtfqLZ4ByQux1/D8XjyvFFCzwB9ebE0L2gFFSBY5E
   GjBgEQW3NZcwWqsM7yRhRn4xgORlFngAHfkSAusAbIe89JvWPG2w+dixt
   WPlh9xHRCMzNIOAQXfRUomabc4lnJ4F/eePXBTRafrkY+S5NSYH6bpZMy
   w==;
X-CSE-ConnectionGUID: HeZPcOwSRdyJTPPWQ5cWCw==
X-CSE-MsgGUID: Oyo0Zg2AS7GaRJQRCZc+jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66807481"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="66807481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 03:53:49 -0700
X-CSE-ConnectionGUID: FuZJDGqQRaWI+/fMpYk8RA==
X-CSE-MsgGUID: srHAXlx1TWm6LrffBOZKlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; 
   d="scan'208";a="214194137"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2025 03:53:47 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB9zS-000AkP-09;
	Tue, 21 Oct 2025 10:53:26 +0000
Date: Tue, 21 Oct 2025 18:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: zhoumin <teczm@foxmail.com>, mingo@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	zhoumin <teczm@foxmail.com>
Subject: Re: [PATCH] cputime:make function static
Message-ID: <202510211821.9NudzdNn-lkp@intel.com>
References: <tencent_C04F39CA166C38A5502D7CF206688E191307@qq.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_C04F39CA166C38A5502D7CF206688E191307@qq.com>

Hi zhoumin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.18-rc2 next-20251021]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhoumin/cputime-make-function-static/20251020-235256
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/tencent_C04F39CA166C38A5502D7CF206688E191307%40qq.com
patch subject: [PATCH] cputime:make function static
config: s390-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510211821.9NudzdNn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510211821.9NudzdNn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510211821.9NudzdNn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:57:
>> kernel/sched/cputime.c:189:13: warning: 'account_system_time' defined but not used [-Wunused-function]
     189 | static void account_system_time(struct task_struct *p, int hardirq_offset, u64 cputime)
         |             ^~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +/account_system_time +189 kernel/sched/cputime.c

   182	
   183	/*
   184	 * Account system CPU time to a process.
   185	 * @p: the process that the CPU time gets accounted to
   186	 * @hardirq_offset: the offset to subtract from hardirq_count()
   187	 * @cputime: the CPU time spent in kernel space since the last update
   188	 */
 > 189	static void account_system_time(struct task_struct *p, int hardirq_offset, u64 cputime)
   190	{
   191		int index;
   192	
   193		if ((p->flags & PF_VCPU) && (irq_count() - hardirq_offset == 0)) {
   194			account_guest_time(p, cputime);
   195			return;
   196		}
   197	
   198		if (hardirq_count() - hardirq_offset)
   199			index = CPUTIME_IRQ;
   200		else if (in_serving_softirq())
   201			index = CPUTIME_SOFTIRQ;
   202		else
   203			index = CPUTIME_SYSTEM;
   204	
   205		account_system_index_time(p, cputime, index);
   206	}
   207	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
