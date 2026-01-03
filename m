Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87581D555
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jan 2026 01:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767405494; cv=none; b=EHW77trRH07RCPmlF1t0E9UcKauE8y/WXt/i8xRXU9xBrfd7jEs3HVUVU/GD7yy+cg/tCABWb62IDA4HLkhVV/Nk4IFFcINtjgnNserOxrFEa+ogkHdxTq+OFOR0wue3gDp4mKxuchNkKNy/bW7vUrxvKjL375AGJFZtTazKKp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767405494; c=relaxed/simple;
	bh=OMCxlI3YynPVrbccv57I6W9XtmqaNCjqA8h5Bf7nqPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoMHtprfHgRGx7Tgbzeli9HzRHCsrrZswTsWj/hIR0ONQB0KE8LMu1YmvvV6FLPA+prNmAjGu5dYtq3LFj0z9oWl/gw/Z6iHhZFVERKb3l8mmGyBEKW7kcU1ccy8ZVjlnx/v/MbRthXEvi+uwYO0Gd2/TnRTL59zeijy39u17J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I2ExS4IB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I2ExS4IB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767405492; x=1798941492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OMCxlI3YynPVrbccv57I6W9XtmqaNCjqA8h5Bf7nqPc=;
  b=I2ExS4IBk16zyvMMQYbuM8LA8za74VMMhJVpOISkhcnbTHipf1V19OxO
   hqglzP9f5Df8cpftzBqP+XwSHDo7wER6QYVyPq0TE14kcEA2RsyghuuKa
   PcnJ+E2nWflAGtH/IMXSCVf59sEpXwYQ+7YWNlVR8fJZFUEBHlsC9P1RE
   ddvFZt65Luoh99EZ4eI63Swgxc0O1GtEgUAb9ul/Kxk8o7V1VfbaelBjh
   j7jVKAmIQQNyPpDB7xPZwLaRGuReRZ9TdMVW3uxZjeMCkm3foOdj8GWSI
   xDWWZip336isehJVCAm6tELc0EppNrRqX/4ZmhI+0lKwirr4TRjb9GuXs
   w==;
X-CSE-ConnectionGUID: OjwA0n44Sz6RuvW6hpmZVg==
X-CSE-MsgGUID: l/Twu4mmTKqEAuib6WIW+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="71464032"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="71464032"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 17:58:11 -0800
X-CSE-ConnectionGUID: Zsfy04mLQ322d+zDL9Gopg==
X-CSE-MsgGUID: Dl1pLjr5R66izZJcvATNYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="206980348"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2026 17:58:10 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbqu8-000000000Vl-03r6;
	Sat, 03 Jan 2026 01:58:08 +0000
Date: Sat, 3 Jan 2026 02:57:53 +0100
From: kernel test robot <lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] genirq/cpuhotpug: notify of irq affinity change for
 offlined cpu.
Message-ID: <202601030233.nwztbDRu-lkp@intel.com>
References: <20260102152637.25377-1-imran.f.khan@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102152637.25377-1-imran.f.khan@oracle.com>

Hi Imran,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/genirq-cpuhotpug-notify-of-irq-affinity-change-for-offlined-cpu/20260102-232823
base:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
patch link:    https://lore.kernel.org/r/20260102152637.25377-1-imran.f.khan%40oracle.com
patch subject: [RFC PATCH] genirq/cpuhotpug: notify of irq affinity change for offlined cpu.
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260103/202601030233.nwztbDRu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260103/202601030233.nwztbDRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601030233.nwztbDRu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/jump_label.h:78,
                    from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:621,
                    from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:28,
                    from include/linux/kernel.h:23,
                    from include/linux/interrupt.h:6,
                    from kernel/irq/cpuhotplug.c:12:
   kernel/irq/cpuhotplug.c: In function 'irq_migrate_all_off_this_cpu':
>> include/linux/cleanup.h:439:19: warning: this 'else' clause does not guard... [-Wmisleading-indentation]
     439 |                 } else
         |                   ^~~~
   include/linux/cleanup.h:442:9: note: in expansion of macro '__scoped_guard'
     442 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   kernel/irq/cpuhotplug.c:180:17: note: in expansion of macro 'scoped_guard'
     180 |                 scoped_guard(raw_spinlock_irqsave, &desc->lock)
         |                 ^~~~~~~~~~~~
   kernel/irq/cpuhotplug.c:182:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
     182 |                         if (affinity_broken && desc->affinity_notify) {
         |                         ^~


vim +/else +439 include/linux/cleanup.h

857d18f23ab172 Peter Zijlstra  2025-07-11  422  
fcc22ac5baf06d Przemek Kitszel 2024-10-18  423  /*
fcc22ac5baf06d Przemek Kitszel 2024-10-18  424   * Helper macro for scoped_guard().
fcc22ac5baf06d Przemek Kitszel 2024-10-18  425   *
fcc22ac5baf06d Przemek Kitszel 2024-10-18  426   * Note that the "!__is_cond_ptr(_name)" part of the condition ensures that
fcc22ac5baf06d Przemek Kitszel 2024-10-18  427   * compiler would be sure that for the unconditional locks the body of the
fcc22ac5baf06d Przemek Kitszel 2024-10-18  428   * loop (caller-provided code glued to the else clause) could not be skipped.
fcc22ac5baf06d Przemek Kitszel 2024-10-18  429   * It is needed because the other part - "__guard_ptr(_name)(&scope)" - is too
fcc22ac5baf06d Przemek Kitszel 2024-10-18  430   * hard to deduce (even if could be proven true for unconditional locks).
fcc22ac5baf06d Przemek Kitszel 2024-10-18  431   */
fcc22ac5baf06d Przemek Kitszel 2024-10-18  432  #define __scoped_guard(_name, _label, args...)				\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  433  	for (CLASS(_name, scope)(args);					\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  434  	     __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);	\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  435  	     ({ goto _label; }))					\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  436  		if (0) {						\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  437  _label:									\
fcc22ac5baf06d Przemek Kitszel 2024-10-18  438  			break;						\
fcc22ac5baf06d Przemek Kitszel 2024-10-18 @439  		} else
e4ab322fbaaaf8 Peter Zijlstra  2023-09-17  440  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
