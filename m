Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048107E118
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jun 2025 22:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750370813; cv=none; b=UbBMWdgzuI8Nq2m2/s7xYibJZdXzWcXOhw2AVcIWWsB8tU9/aW/PfRdNaJkpjPIrf8z9wkneSaiKnf322PhD4syYs2jxaah02Bqqpe7BDmpJVQwBVuBK6n9c9gd/k50vh7QJ6ZfpPKASug/ITW5KKqQx16Kk0KC1vhzUvRNz8SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750370813; c=relaxed/simple;
	bh=clLlpRwGzyTESLAJ6s3mDfFRNB7ykUbkTgd9WxuQ1+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ok/Y96+TPl+8eNXItqpeW4iNw1ClEuBRNWzN2wqzA8hsBF02rgczqXkmYVboZ5+V40vJA3+8pk9C5bj27kBsag3gmXgRjySSGAVnvUULZEhAoUmVmhmROUu9DJixps6M3yAqKPbY89YfIfBJgjtOBqOTG6VYfDG2XRmOofi80kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIvSjO1o; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIvSjO1o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750370811; x=1781906811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=clLlpRwGzyTESLAJ6s3mDfFRNB7ykUbkTgd9WxuQ1+w=;
  b=OIvSjO1oHtXrK9vxnUKMtakSNiqrwFxOTqS86gevIb5xl18kfbL/oYM4
   zcZ8Yf8/UHCNd/R73AkRiT7EzHvhXmO+De2pNkl1+/w3wXA2PJaxJXc23
   sboL70488R0zWiMAN6LFx3fmR8fieyoUXXmDoB/ItLJqrEmXPN+uyPXNH
   Ibe5+MZFFDDvrfQ2JUehj1mubvDDlJP+mfSMY1Vbw7pr9s2ociLMWuK/N
   +fqip6TwIMyE7gS2BCAbAj/kNp0pVujq+B9aDqXVX+7hAtspE6KrQoFf0
   Wm7A0WYicBdQQCr9Hq3DHelTL3JM3DlBcsYMCGfGwiCGJXJAj8JqTVAuv
   A==;
X-CSE-ConnectionGUID: 3u8yt3KbT0mYeaaeEamfig==
X-CSE-MsgGUID: kmcZxY2eT/afaQxq28DyCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78039199"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="78039199"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 15:06:50 -0700
X-CSE-ConnectionGUID: GZrb+4TVS0+aVUhqY6nKWQ==
X-CSE-MsgGUID: /RZG/fJuRQCUkEWKNvcasw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="174365574"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 15:06:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSNPD-000L88-16;
	Thu, 19 Jun 2025 22:06:47 +0000
Date: Fri, 20 Jun 2025 06:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2974/2974] kernel/softirq.c:352:6: warning: no
 previous prototype for 'xint_enter_rcu'
Message-ID: <202506200615.qzMJJNny-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   0bb9efd4883938dec34f710bce07ec3ecf5a04bd
commit: a05426a568e457640f58698c8ebd636fcde4d202 [2974/2974] arm64: Introduce Xint software solution
config: arm64-randconfig-001-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200615.qzMJJNny-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200615.qzMJJNny-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200615.qzMJJNny-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/softirq.c:352:6: warning: no previous prototype for 'xint_enter_rcu' [-Wmissing-prototypes]
     352 | void xint_enter_rcu(void)
         |      ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CPPC_CPUFREQ_SYSFS_INTERFACE
   Depends on [n]: CPU_FREQ [=y] && (ARM || ARM64 [=y]) && ACPI_CPPC_CPUFREQ [=n]
   Selected by [m]:
   - CPU_FREQ_GOV_SEEP [=m] && CPU_FREQ [=y] && (ACPI_CPPC_CPUFREQ [=n] || ARM64 [=y])


vim +/xint_enter_rcu +352 kernel/softirq.c

   347	
   348	#ifdef CONFIG_FAST_IRQ
   349	/**
   350	 * xint_enter_rcu - Copy from irq_enter_rcu
   351	 */
 > 352	void xint_enter_rcu(void)
   353	{
   354		if (tick_nohz_full_cpu(smp_processor_id()) ||
   355		    (is_idle_task(current) && !in_interrupt())) {
   356			/*
   357			 * Prevent raise_softirq from needlessly waking up ksoftirqd
   358			 * here, as softirq will be serviced on return from interrupt.
   359			 */
   360			local_bh_disable();
   361			tick_irq_enter();
   362			_local_bh_enable();
   363		}
   364	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
