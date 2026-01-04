Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF721579F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 10:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767523513; cv=none; b=K7/ApfCi+JRO3HzeemYQ1XpAnaZmcp6+DHVxclh5IpYgqZ+yxMT80AutS4ZGl9dkbF3xxVf+eascM2Y/1NnrSNwT83NSyCjhSNvTrBT2qzxJZqHlgLGZLoVps6oBA+64FuVYh1KJhOa8QIyoJzepEjv0OY36RPsGNbU4YcijQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767523513; c=relaxed/simple;
	bh=ktwHsdreMOy3nXLKvFJ0EqHl5o10OsVdQQOqs+UIyeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4f8H7a88uL1baUDwgDVBMAEdAPj4lW/5yajtlCTq32MFylfd0MZmVktHYXjP5f+8nm/2+BzCv9XgQbm0DbtpdsKT8WJY0AKnbND1s1CCrCja11pwaWgfMaKJi7E7+IgPjOtbzoX/0C+tWX9eVnvfBuKnI/NcehPHdgFHpSEf30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E01QLPcf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E01QLPcf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767523511; x=1799059511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ktwHsdreMOy3nXLKvFJ0EqHl5o10OsVdQQOqs+UIyeA=;
  b=E01QLPcfAj7Go9pc+21Pd/+DO3ev/c9xJ+2xk7bxVjoqupdIEIv+hY89
   NG9GINQW+daGnwvWidBpO3HNlHZ4V58Wcgbsm8VkkbmGgN0ankSYH/Hl9
   8v6+x83no/DIrYznRnqnyhrlY557IvYQV68csK/JwenAFtn4huaKumneh
   scLX/l1/X+Vb7JdBmCDJd+iTLNJlrFDgkNU55rA49SLnndPPoKoYEtZIH
   MZr3QfMYrvMwwnM2g6kAtSNy4AONPYNE/tWH5qaMsZ4IfMx4jC75qG++o
   PI4U2ryMllMJuvON7ZrKwZnSjRcAElg+yJrQvlW8FPovCTSUVaQtRKA29
   Q==;
X-CSE-ConnectionGUID: d7opBc08TG2ZC03ItkU7pw==
X-CSE-MsgGUID: Au1ggTKuQrqu/15Gw/ixbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68832776"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="68832776"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 02:45:10 -0800
X-CSE-ConnectionGUID: ADv6f5dcTOe85eJFZpu8VQ==
X-CSE-MsgGUID: yObrqGyaQlylT4I8Pv62Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="206690326"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jan 2026 02:45:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcLbe-000000000W1-196D;
	Sun, 04 Jan 2026 10:45:06 +0000
Date: Sun, 4 Jan 2026 18:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org,
	Pnina Feder <pnina.feder@mobileye.com>
Subject: Re: [PATCH] panic/kexec: Allow forcing panic execution on a specific
 CPU
Message-ID: <202601041820.6M8cIq2e-lkp@intel.com>
References: <20260101123237.277411-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101123237.277411-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc3 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-kexec-Allow-forcing-panic-execution-on-a-specific-CPU/20260101-203448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260101123237.277411-1-pnina.feder%40mobileye.com
patch subject: [PATCH] panic/kexec: Allow forcing panic execution on a specific CPU
config: arm64-randconfig-r122-20260104 (https://download.01.org/0day-ci/archive/20260104/202601041820.6M8cIq2e-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601041820.6M8cIq2e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601041820.6M8cIq2e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/panic.c:349:69: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 0)' attribute to the declaration of 'panic_force_target_cpu' [-Wmissing-format-attribute]
     321 |         vsnprintf(panic_redirect_msg, sizeof(panic_redirect_msg), fmt, args);
         |                                                                            ^
   kernel/panic.c:321:13: note: 'panic_force_target_cpu' declared here
     321 | static bool panic_force_target_cpu(const char *fmt, va_list args)
         |             ^
   1 warning generated.


vim +349 kernel/panic.c

   308	
   309	/**
   310	 * panic_force_target_cpu - Redirect panic to a specific CPU for crash kernel
   311	 * @fmt: panic message format string
   312	 * @args: arguments for format string
   313	 *
   314	 * Some platforms require panic handling to occur on a specific CPU
   315	 * for the crash kernel to function correctly. This function redirects
   316	 * panic handling to CONFIG_PANIC_FORCE_CPU_ID before kexec.
   317	 *
   318	 * Returns true if panic should proceed on current CPU.
   319	 * Returns false (never returns) if panic was redirected.
   320	 */
   321	static bool panic_force_target_cpu(const char *fmt, va_list args)
   322	{
   323		static char panic_redirect_msg[1024];
   324		int cpu = raw_smp_processor_id();
   325		int target_cpu = CONFIG_PANIC_FORCE_CPU_ID;
   326	
   327		/* Already on target CPU - proceed normally */
   328		if (cpu == target_cpu)
   329			return true;
   330	
   331		/* Target CPU is offline, can't redirect */
   332		if (!cpu_online(target_cpu)) {
   333			pr_warn("panic: CPU %d is offline, cannot redirect panic. "
   334				"Crash kernel interrupts may be unavailable.\n", target_cpu);
   335			return true;
   336		}
   337	
   338		/* Another panic already in progress */
   339		if (panic_in_progress()) {
   340			pr_warn("panic: Another panic in progress on CPU %d, cannot redirect to CPU %d. "
   341				"Crash kernel interrupts may be unavailable.\n",
   342				atomic_read(&panic_cpu), target_cpu);
   343			return true;
   344		}
   345	
   346		pr_info("panic: Redirecting from CPU %d to CPU %d for crash kernel\n",
   347			cpu, target_cpu);
   348	
 > 349		vsnprintf(panic_redirect_msg, sizeof(panic_redirect_msg), fmt, args);
   350	
   351		smp_call_function_single(target_cpu, do_panic_on_target_cpu, panic_redirect_msg, false);
   352	
   353		return false;
   354	}
   355	#else
   356	static inline bool panic_force_target_cpu(const char *fmt, va_list args)
   357	{
   358		return true;
   359	}
   360	#endif /* CONFIG_PANIC_FORCE_CPU */
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
