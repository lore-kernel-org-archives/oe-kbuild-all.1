Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E5379FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Jul 2025 07:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751699674; cv=none; b=aqxAwp+aKMrKnojVdEXORKzxaqH8MmdbADhNoj0Px6b2on7lJWpSlHD1hmt+YgtzT2NYBdcYvsgEyRSaMuRGrLseKyAZQq0ywUSMoAKPQcLnSRBWMAciVma4TEHTP0gx3YH6HwgG8gWFp/8kc1yLXTkaAOKshjdvx6T2blIk9nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751699674; c=relaxed/simple;
	bh=jum0NBx+qtVVgzkAKMkXG3BgMWSM2xxDyC8+GpQ4DoY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sx/A8GccPx7b82TekOInnfR2TZ6y6CbN6+2J3tEPJO7QCM32txurjI9F314mzc9+Pen48Xl1hVHRGMkMiFbUIDBRHCf6JaV85xq+tIycUFB7To/Lx5mFlWiTwygqJb+F1icUYPtren4S7ZUGha+rSayD/qpGN8HynQj27+fDnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONNZddie; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONNZddie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751699672; x=1783235672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jum0NBx+qtVVgzkAKMkXG3BgMWSM2xxDyC8+GpQ4DoY=;
  b=ONNZddie4g0/I4/gnXEDEcX5bZLtrIgTzFfxat42yWZ/KZIjiuE7ba2R
   qIlvgrfepIbIYZRoNxTdC2r2TzarNY5jvjxh+utkauZtAcTRPSpfA77y4
   xKsYPArq20/9LKyf9W36he2DY86FN7hF5/EOvQ2oukMcl4CAFPjQuhLr4
   sYxTvuj9cqbyP3JusSmHJkSi6oot4xfDdiM5PY9t3mndByJCEFp+7vDvL
   eW6y3RlUqxqQhHEw8Es0UYyXoMOAUlltJ05ecn4dp4/NSng0Ftt2zp7LZ
   ExAH6uk7yAcA35AlMNHdBbu1IOX2GYZRipe1TM2KoFgyeQU9g1YPpbqzx
   g==;
X-CSE-ConnectionGUID: hhEHykipRMWycFxpY/5rkg==
X-CSE-MsgGUID: DpNhbzjFQ8G+3SNu1PW2zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="71440583"
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="71440583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2025 00:14:31 -0700
X-CSE-ConnectionGUID: CIkJA765ROizvbUYT3kbFA==
X-CSE-MsgGUID: v6DjLHIxT8idERykiWFvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,289,1744095600"; 
   d="scan'208";a="185801156"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Jul 2025 00:14:31 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXx6S-0004Mh-1Z;
	Sat, 05 Jul 2025 07:14:28 +0000
Date: Sat, 5 Jul 2025 15:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/irq-exit-v2-no-task 4/4] kernel/rcu/tree_plugin.h:637:54:
 error: 'DEFER_QS_REQUIRED' undeclared
Message-ID: <202507051527.E7ugpHyM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/irq-exit-v2-no-task
head:   720e9973f06adae235ae751d9b2ee1acf81fe98a
commit: 720e9973f06adae235ae751d9b2ee1acf81fe98a [4/4] rcu: Fix IRQ work handler state during nested RCU critical sections
config: i386-buildonly-randconfig-004-20250705 (https://download.01.org/0day-ci/archive/20250705/202507051527.E7ugpHyM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250705/202507051527.E7ugpHyM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507051527.E7ugpHyM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:4879:
   kernel/rcu/tree_plugin.h: In function 'rcu_preempt_deferred_qs_irqrestore':
   kernel/rcu/tree_plugin.h:493:14: error: 'struct task_struct' has no member named 'rcu_defer_qs_iw_pending'
     493 |         if (t->rcu_defer_qs_iw_pending == DEFER_QS_PENDING)
         |              ^~
   kernel/rcu/tree_plugin.h:494:18: error: 'struct task_struct' has no member named 'rcu_defer_qs_iw_pending'
     494 |                 t->rcu_defer_qs_iw_pending = DEFER_QS_IDLE;
         |                  ^~
   In file included from ./arch/x86/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:390,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from kernel/rcu/tree.c:21:
   kernel/rcu/tree_plugin.h: In function 'rcu_preempt_deferred_qs_handler':
>> kernel/rcu/tree_plugin.h:637:54: error: 'DEFER_QS_REQUIRED' undeclared (first use in this function)
     637 |                 WRITE_ONCE(rdp->defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   kernel/rcu/tree_plugin.h:637:17: note: in expansion of macro 'WRITE_ONCE'
     637 |                 WRITE_ONCE(rdp->defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                 ^~~~~~~~~~
   kernel/rcu/tree_plugin.h:637:54: note: each undeclared identifier is reported only once for each function it appears in
     637 |                 WRITE_ONCE(rdp->defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                                                      ^~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   kernel/rcu/tree_plugin.h:637:17: note: in expansion of macro 'WRITE_ONCE'
     637 |                 WRITE_ONCE(rdp->defer_qs_iw_pending, DEFER_QS_REQUIRED);
         |                 ^~~~~~~~~~


vim +/DEFER_QS_REQUIRED +637 kernel/rcu/tree_plugin.h

   626	
   627	/*
   628	 * Minimal handler to give the scheduler a chance to re-evaluate.
   629	 */
   630	static void rcu_preempt_deferred_qs_handler(struct irq_work *iwp)
   631	{
   632		volatile unsigned long flags;
   633		struct rcu_data *rdp = this_cpu_ptr(&rcu_data);
   634	
   635		local_irq_save(flags);
   636		if (rcu_preempt_depth() > 0) {
 > 637			WRITE_ONCE(rdp->defer_qs_iw_pending, DEFER_QS_REQUIRED);
   638			local_irq_restore(flags);
   639			return;
   640		}
   641		local_irq_restore(flags);
   642	}
   643	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
