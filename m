Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C984202976
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Aug 2025 07:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191921; cv=none; b=T7ompCLnTtZkaiBYYRDPQrqhgZ6jMb04OrGQZo6O8o1XtfEjDZylgDFyLDqo3FT6jneGb2YDXkH/sjijxGcPJRL0VeAOwfxGEcc9cGVEgz3qVt5t1bNchVTZ+1henUbxiGATnqiL81VZJ9NHI8SrJ50j/rbByg2eFgqVHzL6Duc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191921; c=relaxed/simple;
	bh=eQs4/rSjlBhVU3Vda+nOyw+AVB1p3t/Z+gVipzvLf8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ez5dej2uBOOhnUDErMCeH0F9kiQHMUHCoEo29fuMpgzKKult+uGgoMxJcpGMm+dkkvBS5cbQrG2XV3eYdZzEzLapi+FlLhhPYgrB+Ve+GSDDjz6ELZXu3OpIuLMUIe/nSI41QqnJ6wXkWmLlCS4IaEls6GL77Zi+KNUcjbiikE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiW43uDu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiW43uDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756191920; x=1787727920;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQs4/rSjlBhVU3Vda+nOyw+AVB1p3t/Z+gVipzvLf8Q=;
  b=DiW43uDuHNlrWOcUti7XhvI4/qKIeGwJ/iSagi/O6NXCwYf1hqjR/SZY
   OWIwGZhqIRR+flANxgopkFg/0xSqmp7SPNDVkeOGHQ9N2rukv+m0QBMaB
   BL4X/h9YN7G5lJ586btAF8k3Uv478hNNo8QMymTBbzTxBBsBOHgI46gHx
   rSXRaHKzxVNCXaQDOLH4GTI36gsf+2+PPxMlG/bNtiodhac4nfqn+Aa+g
   sMMt97ZpfPtrqK2ERiylKv2gWjMxNHWcv1aRtnfYz+1lMaCXlcpljVWbU
   +liSCedgCHSg1+O0QH+4RNSg4FJ0I7RD4uuBMXogI0kQB3ezKT7pCjgki
   g==;
X-CSE-ConnectionGUID: XRaJi0YvQGClhZt6yvFwbg==
X-CSE-MsgGUID: uBjRqjP0RCm5xNCc5cWDpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69129912"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69129912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2025 00:05:15 -0700
X-CSE-ConnectionGUID: c1fUEYmQTze4npPlGPbhOA==
X-CSE-MsgGUID: c10VTMeMRI6QM1WNrMyVGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="169900408"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2025 00:05:14 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqnju-000OI7-2j;
	Tue, 26 Aug 2025 07:05:08 +0000
Date: Tue, 26 Aug 2025 15:04:42 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:cpu-hotplug 15/17] arch/arm64/kernel/smp.c:139:26: sparse:
 sparse: cast to non-scalar
Message-ID: <202508261428.UDJLSGab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git cpu-hotplug
head:   cd36ff144dcb1aaaf6934be509232df463916321
commit: 2d5b8df5d4e2bbc142e3b4f21cabbca96e3da79d [15/17] Add error handling
config: arm64-randconfig-r113-20250826 (https://download.01.org/0day-ci/archive/20250826/202508261428.UDJLSGab-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce: (https://download.01.org/0day-ci/archive/20250826/202508261428.UDJLSGab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508261428.UDJLSGab-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/smp.c:139:26: sparse: sparse: cast to non-scalar
>> arch/arm64/kernel/smp.c:139:26: sparse: sparse: cast from non-scalar

vim +139 arch/arm64/kernel/smp.c

   133	
   134	void arch_cpuhp_cleanup_kick_cpu(unsigned int cpu, bool is_alive)
   135	{
   136		union secondary_status status;
   137	
   138		if (is_alive) {
 > 139			status = READ_ONCE(secondary_data.status);
   140			if (!status.val)
   141				return;
   142		} else {
   143			status.val = READ_ONCE(__early_cpu_boot_status);
   144		}
   145	
   146		/* A CPU has failed to boot. Try to figure out what happened. */
   147		if (smp_parallel_bringup)
   148			pr_warn_once("Parallel CPU bringup failed; consider passing \"cpuhp.parallel=off\" for a more accurate diagnosis.\n");
   149		else
   150			secondary_data.task = NULL;
   151	
   152		if (is_alive) {
   153			if (status.flags[CPU_PANIC_KERNEL])
   154				panic("CPU%u detected unsupported configuration\n", cpu);
   155	
   156			if (status.flags[CPU_KILL_ME]) {
   157				if (!cpu_present(cpu) && !op_cpu_kill(cpu)) {
   158					pr_crit("CPU%u: died during early boot\n", cpu);
   159					return;
   160				}
   161			}
   162		} else {
   163			if (status.early_flags[EARLY_CPU_STUCK_REASON_52_BIT_VA]) {
   164				pr_crit_once("CPU%u detected lack of support for 52-bit VAs\n",
   165					     cpu);
   166			}
   167	
   168			if (status.early_flags[EARLY_CPU_STUCK_REASON_NO_GRAN]) {
   169				pr_crit_once("CPU%u detected lack of support for %luK granules\n",
   170					     cpu, PAGE_SIZE / SZ_1K);
   171			}
   172		}
   173	
   174		pr_crit_once("CPUs may be stuck in kernel\n");
   175		cpus_stuck_in_kernel = true;
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
