Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B7526FDA8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735015; cv=none; b=J6Azsv0g4FlmjNdpKeS1/FLLCkqSMQ5WIV+QbIZopIW+wR35l9STmzQtEWrPRWgpwSkdLDM6vqF2lctZ3VNlhfkZCtciV3N6TAazWGx/2X3fm7et096Qdb//DEfrSbx/MXhBpUKf75PGceFL1X3QnZpu0opGkkqV2dx6mybTnOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735015; c=relaxed/simple;
	bh=NGieBSgrHZ7qXbyxQW4DB+PN4iFRBsUvswBGWMRlzH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6SxLX/6RNWNNtYWP1loO5Pn9Naeti6XJoU5GOrhPN70v+axEHacIDhOfr7ylQ5rtOy+5/lWYbllm8d5fCahGq8yiiyaNshyHLX6bK9ttgJ3YoAge96/5n1T3DICbt4tNl+xn9Y0JgJm2OEjVsYI3lP5Z9dzA+zsX5KFgmJJlYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPkY/cBn; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPkY/cBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764735013; x=1796271013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NGieBSgrHZ7qXbyxQW4DB+PN4iFRBsUvswBGWMRlzH4=;
  b=UPkY/cBnY+sa7LWs1LbJbq+c6Xg9Eg/5OF2mWnbo8HmCBjkt91uEDimc
   44ibPCOIa4Oz4B8vjTjwvxRTUm7Fd7uECEoSIBBU/8tWWWo2MInpg6IDe
   1fKBhI7gOCM/XmmnBOz9NY8UsGQtxdoByGyKqdvL+o7Rs0T1sK4y05LCv
   ZUzk8ESPqvRSFS5/Dddf3uneeQNrz+UsN/koWtjHDqM0i4dKgD2bKsrqK
   hnpyGmoSqBI2YEiPJUZyAUIxa3vMPy5kEhXLXs/AocEQqnTbefXxUrAvt
   zJ0JHklMb1XDINT7Fo1qTOH72hxLIGdzHPf2rIjYMejRhLkwVh2MF7QMJ
   A==;
X-CSE-ConnectionGUID: oajMIxPhQ6OlxvJ1GGonWg==
X-CSE-MsgGUID: 4nURA6Z6SGKxve6RIYisjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66886740"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66886740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 20:10:13 -0800
X-CSE-ConnectionGUID: icR0NW4tQ0qvBPHWo+f4Bg==
X-CSE-MsgGUID: Pp03yA/kT52QHMfFWhPm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="225510525"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Dec 2025 20:10:11 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQeBt-00000000AY7-1cxY;
	Wed, 03 Dec 2025 04:10:09 +0000
Date: Wed, 3 Dec 2025 12:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
Message-ID: <202512031219.3OgecL5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Viresh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
commit: 6ebdd7c9317737123b260a24e2780018008f1295 rust: cpufreq: Extend abstractions for policy and driver ops
date:   7 months ago
config: arm-randconfig-r121-20251201 (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031219.3OgecL5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031219.3OgecL5W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0609]: no field `cpu` on type `&bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:462:23
   |
   462 |         self.as_ref().cpu
   |                       ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `min` on type `&bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:468:39
   |
   468 |         Hertz::from_khz(self.as_ref().min as usize)
   |                                       ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `min` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:474:27
   |
   474 |         self.as_mut_ref().min = min.as_khz() as u32;
   |                           ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `max` on type `&bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:481:39
   |
   481 |         Hertz::from_khz(self.as_ref().max as usize)
   |                                       ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `max` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:487:27
   |
   487 |         self.as_mut_ref().max = max.as_khz() as u32;
   |                           ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `cur` on type `&bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:494:39
   |
   494 |         Hertz::from_khz(self.as_ref().cur as usize)
   |                                       ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `suspend_freq` on type `&bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:500:39
   |
   500 |         Hertz::from_khz(self.as_ref().suspend_freq as usize)
   |                                       ^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `suspend_freq` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:506:27
   |
   506 |         self.as_mut_ref().suspend_freq = freq.as_khz() as u32;
   |                           ^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `cpus` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:537:73
   |
   537 |         unsafe { cpumask::CpumaskVar::as_mut_ref(&mut self.as_mut_ref().cpus) }
   |                                                                         ^^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `clk` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:549:27
   |
   549 |         self.as_mut_ref().clk = clk.as_raw();
   |                           ^^^ unknown field
   |
   = note: available field is: `_address`
--
>> error[E0609]: no field `dvfs_possible_from_any_cpu` on type `&mut bindings::cpufreq_policy`
   --> rust/kernel/cpufreq.rs:556:27
   |
   556 |         self.as_mut_ref().dvfs_possible_from_any_cpu = val;
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^ unknown field
   |
   = note: available field is: `_address`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
