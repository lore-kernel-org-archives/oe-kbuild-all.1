Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC241F17E8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 02:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767926740; cv=none; b=ZnATDCrgjMdwFAr5Hef5RNleDro1W4ykvLhbFZf1jCI9wkohNi9V8mt+/frl2iU/mjetfxL3f4SVQWf82/Py1hO3u41Z6Y4FGznLl20xcgn5OabusmEcnETcdQQGpXEGX/1ZMIrbBCHQXKk4cL/T14IBkaf0wj1Zuhuqmt6QEeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767926740; c=relaxed/simple;
	bh=/5M9N4Je6Z/BpqlmvgLSQ0HwfOcc852CLXku2lczdqU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y/jM+adVOchCRXQKbbRBzusgcDsNLj2Q/rElxfGIOmvGrIv0Mzvc2JNsaPOmGg1hfJWREi0DFHMJXwwMPWKW0rKqfTRy1YVISaeAx17yzwnd9xJOuTLmnBUXRcTIoVfXIzjsz11O3lKROlqNgINoiubueAc1pBADfUbq7p/hkVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O6yEPXdw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O6yEPXdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767926738; x=1799462738;
  h=date:from:to:cc:subject:message-id;
  bh=/5M9N4Je6Z/BpqlmvgLSQ0HwfOcc852CLXku2lczdqU=;
  b=O6yEPXdwhVQ+dOq7jn34uGmi4f6ibkqyMu/HpMqAZt7dN8FGem4//YS4
   EMZm1BzRXSOM5Ymz+x7dmnpW9r4pAkQ2MEfm/G9QFzVs8sd1XpxGg3VWe
   Lj7LZwgeL7N0YqxhvOC/BtaI8kCUKcxagO0+54862wUnmpIuVKD4n1hC9
   sxFc9vA3IiRdyxNfIXHMZZhCCx2etySJUjxMwGbCjFA6xp8ZSpCCxSqKp
   4Zyd1nPzIoOqHkyAhjV0U1TcDOycVghE/U+fTsmJbDRy64LUpNy8QjsR2
   tq8oTzo1PwmO3YZleTaCzC1AZNhCv4X9gt3uGc9JbOwGet/ZIzxBGfFbp
   Q==;
X-CSE-ConnectionGUID: h6iNPPL4RrSeFNT2N0msyg==
X-CSE-MsgGUID: rJInRP1bTgyCGFfcUdIEWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="80676256"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="80676256"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 18:45:38 -0800
X-CSE-ConnectionGUID: 2LIovAO2TRiIHgLQjv5UGw==
X-CSE-MsgGUID: bmyij+0BTMuSZgQ3Khz4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="226756579"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2026 18:45:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ve2VK-000000005L2-0vot;
	Fri, 09 Jan 2026 02:45:34 +0000
Date: Fri, 09 Jan 2026 10:45:04 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Subject: [linux-next:master 3642/4725]
 arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d'
 is never less than zero.
Message-ID: <202601091047.oyAz4jQp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fc4e91c639c0af93d63c3d5bc0ee45515dd7504a
commit: 5ce3218d4f102aca5e90d3c831259b6e380f88b4 [3642/4725] overflow: Remove is_non_negative() and is_negative()
config: x86_64-randconfig-161-20260108 (https://download.01.org/0day-ci/archive/20260109/202601091047.oyAz4jQp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601091047.oyAz4jQp-lkp@intel.com/

smatch warnings:
arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '*_d' is never less than zero.
arch/x86/kernel/cpu/aperfmperf.c:444 scale_freq_tick() warn: unsigned '_a' is never less than zero.

vim +444 arch/x86/kernel/cpu/aperfmperf.c

5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  436  
73a5fa7d51366a Thomas Gleixner   2022-04-15  437  static void scale_freq_tick(u64 acnt, u64 mcnt)
55cb0b70749361 Thomas Gleixner   2022-04-15  438  {
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  439  	u64 freq_scale, freq_ratio;
55cb0b70749361 Thomas Gleixner   2022-04-15  440  
bb6e89df9028b2 Thomas Gleixner   2022-04-15  441  	if (!arch_scale_freq_invariant())
bb6e89df9028b2 Thomas Gleixner   2022-04-15  442  		return;
bb6e89df9028b2 Thomas Gleixner   2022-04-15  443  
55cb0b70749361 Thomas Gleixner   2022-04-15 @444  	if (check_shl_overflow(acnt, 2*SCHED_CAPACITY_SHIFT, &acnt))
55cb0b70749361 Thomas Gleixner   2022-04-15  445  		goto error;
55cb0b70749361 Thomas Gleixner   2022-04-15  446  
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  447  	if (static_branch_unlikely(&arch_hybrid_cap_scale_key))
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  448  		freq_ratio = READ_ONCE(this_cpu_ptr(arch_cpu_scale)->freq_ratio);
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  449  	else
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  450  		freq_ratio = arch_max_freq_ratio;
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  451  
5a9d10145a54f7 Rafael J. Wysocki 2024-08-28  452  	if (check_mul_overflow(mcnt, freq_ratio, &mcnt) || !mcnt)
55cb0b70749361 Thomas Gleixner   2022-04-15  453  		goto error;
55cb0b70749361 Thomas Gleixner   2022-04-15  454  
55cb0b70749361 Thomas Gleixner   2022-04-15  455  	freq_scale = div64_u64(acnt, mcnt);
55cb0b70749361 Thomas Gleixner   2022-04-15  456  	if (!freq_scale)
55cb0b70749361 Thomas Gleixner   2022-04-15  457  		goto error;
55cb0b70749361 Thomas Gleixner   2022-04-15  458  
55cb0b70749361 Thomas Gleixner   2022-04-15  459  	if (freq_scale > SCHED_CAPACITY_SCALE)
55cb0b70749361 Thomas Gleixner   2022-04-15  460  		freq_scale = SCHED_CAPACITY_SCALE;
55cb0b70749361 Thomas Gleixner   2022-04-15  461  
55cb0b70749361 Thomas Gleixner   2022-04-15  462  	this_cpu_write(arch_freq_scale, freq_scale);
55cb0b70749361 Thomas Gleixner   2022-04-15  463  	return;
55cb0b70749361 Thomas Gleixner   2022-04-15  464  
55cb0b70749361 Thomas Gleixner   2022-04-15  465  error:
55cb0b70749361 Thomas Gleixner   2022-04-15  466  	pr_warn("Scheduler frequency invariance went wobbly, disabling!\n");
55cb0b70749361 Thomas Gleixner   2022-04-15  467  	schedule_work(&disable_freq_invariance_work);
55cb0b70749361 Thomas Gleixner   2022-04-15  468  }
bb6e89df9028b2 Thomas Gleixner   2022-04-15  469  #else
bb6e89df9028b2 Thomas Gleixner   2022-04-15  470  static inline void bp_init_freq_invariance(void) { }
bb6e89df9028b2 Thomas Gleixner   2022-04-15  471  static inline void scale_freq_tick(u64 acnt, u64 mcnt) { }
bb6e89df9028b2 Thomas Gleixner   2022-04-15  472  #endif /* CONFIG_X86_64 && CONFIG_SMP */
73a5fa7d51366a Thomas Gleixner   2022-04-15  473  

:::::: The code at line 444 was first introduced by commit
:::::: 55cb0b70749361d7f82a979768c77ac301f07da9 x86/smp: Move APERF/MPERF code where it belongs

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
