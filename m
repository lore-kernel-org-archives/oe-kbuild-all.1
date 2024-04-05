Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE51C6A8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 20:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712350024; cv=none; b=gdHXvqpaL6i3uUndPGlwv/sSGUR2fWUMdmAl3b7/CLL5kFZqYpKgaHMSOHZ2WxI6C4KuFbgAW2vgMDkvZS1OvRYsOl2ulun8P+4hnT4qVIkO5usYB+qAjS5FI8r6AwQc0v7XGG9Z2xd+DVyek3DQuVEZP8nnHy2KBjDFdvsmaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712350024; c=relaxed/simple;
	bh=01xZDtyQaCF2szYOHkLqOXZuBflQp92pjKpEmLjYKxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGW9kab3O65f+5JSDPntWEyrEnhkMBYZrLT/eBZ4C2Om8snKL25N/VnLeEoBVtHuFDMVFlGes+1B0Lg2PqiY4nO4yzd00tjFYuefv4yxJQO16Kyp78r24uepAv6k5epQZ1kI9QKTfG0nEjW5TGeZUntN+5+6Al5TcRXBTpPI0S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VG2dAFCB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG2dAFCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712350021; x=1743886021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01xZDtyQaCF2szYOHkLqOXZuBflQp92pjKpEmLjYKxs=;
  b=VG2dAFCBXmLBy4kCBC/aqh6Y4VgEt/lSV8rOK2NaThETtFsdnlDs+Lib
   KpsG0BI0woTIF+JPeherh0+LAiOKlXp82JKSVa0uJjhm5m4MoSaKMkn3N
   GOsrz0h0Jh8z94v0iaAfNgoPKLXTvuw0zFNpaxadOkR9rF1p79jdElQ03
   UMx1XWH/38iE5KUOrAdI8bjR+m81baPZw++Wzl6kgwj7dPG7c0hoT2m64
   PyqMAkmuRabInTyPziLKOLUZkqUIwMURj6D9FeNhfGVDXP6NqdLFUc6a0
   hHhZqJqdZ4KKi6eKCKpQZKRewyouGU9Yg1s6J/PSdVgI0OdmbqMRx8Nrc
   A==;
X-CSE-ConnectionGUID: N/QACQ2iTEGLf+9SVhKZ2A==
X-CSE-MsgGUID: 1hiFaTTfSb2lM5RE4ntu9Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="7790999"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="7790999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 13:47:01 -0700
X-CSE-ConnectionGUID: RL1UolaMQSaQjX89bHOdcw==
X-CSE-MsgGUID: 08hnVQFvRQG+nnjwXseGew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24006548"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Apr 2024 13:47:01 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsqSg-0002hc-23;
	Fri, 05 Apr 2024 20:46:58 +0000
Date: Sat, 6 Apr 2024 04:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vireshk:rust/cpufreq-dt 18/22] error[E0425]: cannot find function
 `dev_pm_opp_init_cpufreq_table` in crate `bindings`
Message-ID: <202404060439.vwtvgUWV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt
head:   8f241e19b53321db7b31e68433162427ea8e73e3
commit: 06bb914eae00671a69b393bf86bb01ddec86c16f [18/22] rust: Add bindings for OPP framework
config: x86_64-buildonly-randconfig-001-20240406 (https://download.01.org/0day-ci/archive/20240406/202404060439.vwtvgUWV-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404060439.vwtvgUWV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404060439.vwtvgUWV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `crate::cpufreq`
   --> rust/kernel/opp.rs:10:15
   |
   10 |     bindings, cpufreq,
   |               ^^^^^^^ no `cpufreq` in the root
--
>> error[E0425]: cannot find function `dev_pm_opp_init_cpufreq_table` in crate `bindings`
   --> rust/kernel/opp.rs:391:23
   |
   391   |             bindings::dev_pm_opp_init_cpufreq_table(table.dev.raw_device(), &mut ptr)
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dev_pm_opp_get_opp_table`
   |
   ::: rust/bindings/bindings_generated.rs:73967:5
   |
   73967 |     pub fn dev_pm_opp_get_opp_table(dev: *mut device) -> *mut opp_table;
   |     ------------------------------------------------------------------- similarly named function `dev_pm_opp_get_opp_table` defined here
--
>> error[E0425]: cannot find function `dev_pm_opp_free_cpufreq_table` in crate `bindings`
   --> rust/kernel/opp.rs:420:23
   |
   420   |             bindings::dev_pm_opp_free_cpufreq_table(self.dev.raw_device(), &mut self.as_ptr())
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dev_pm_opp_get_opp_table`
   |
   ::: rust/bindings/bindings_generated.rs:73967:5
   |
   73967 |     pub fn dev_pm_opp_get_opp_table(dev: *mut device) -> *mut opp_table;
   |     ------------------------------------------------------------------- similarly named function `dev_pm_opp_get_opp_table` defined here
--
>> error[E0599]: no method named `as_ptr` found for mutable reference `&mut FreqTable` in the current scope
   --> rust/kernel/opp.rs:420:86
   |
   420 |             bindings::dev_pm_opp_free_cpufreq_table(self.dev.raw_device(), &mut self.as_ptr())
   |                                                                                      ^^^^^^ method not found in `&mut FreqTable`
--
>> error[E0282]: type annotations needed
   --> rust/kernel/opp.rs:460:22
   |
   460 |             cpumask: None,
   |                      ^^^^ cannot infer type of the type parameter `T` declared on the enum `Option`
   |
   help: consider specifying the generic argument
   |
   460 |             cpumask: None::<T>,
   |                          +++++
--
>> error[E0282]: type annotations needed
   --> rust/kernel/opp.rs:475:22
   |
   475 |             cpumask: None,
   |                      ^^^^ cannot infer type of the type parameter `T` declared on the enum `Option`
   |
   help: consider specifying the generic argument
   |
   475 |             cpumask: None::<T>,
   |                          +++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
