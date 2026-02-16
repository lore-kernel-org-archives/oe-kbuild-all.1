Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D5B332916
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257921; cv=none; b=mmUBhezeW4gquh002R6ZH0k7BehfceHe1F8mZ0/i0ATI3ZVDixbKUxLZAWXPg7xEEKdUIM323vDUaF3BLYuuLVKNPxkloZDIXkexH24k51opSsO+LsDrGEDyg+rJ1h8NdX3zEEzb7c/uNV/atRaNOI8tAGQrnZ296MAc9BG7kGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257921; c=relaxed/simple;
	bh=qHCNQtUiB/qHwVXwQ/1FkPzBFdSV2PDmtD0JKx8v0ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMwF1L0045FFSOJcV9LOIiT6HhwGHt3bfOmYgR/yM6bK3KCfUR2Inr9esqHLkHxjdcVf6KNSx2mpSySdF2VIBSP8uysNagVoGRZ/8jsQ8xi9+fO68k1b1Empt1BlDjWrNbznG5aa7kcMOEPNPSFl0ZB9T6NflGckJ05vFDegL9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f2spBX00; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f2spBX00"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771257919; x=1802793919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qHCNQtUiB/qHwVXwQ/1FkPzBFdSV2PDmtD0JKx8v0ao=;
  b=f2spBX00MZMAqJmzQMaNicLM12krxIzkt22DxqXeuav3r/OEFADNaVb7
   LcGkTgozh8VqeGoa5j2JOUZUeDpj75Zs10VsiszGQ9ML9gZqdJlUJA2xS
   mmbm5lwuTw0FEJP0HGkzxOkYsDogXj3YDapabWh670MnP4tDraTBvQfx9
   wD8Dmfu7YsWFoWFMyIWx/bwrXIy/zUMwwJuGyGJpRtI++EOuhkwo4ZQ75
   UsV9i4Umx/ZFdC+eKoPKtQUpnUqdqkvprbjUDl0PiLgM5oEo0gBuVil4f
   8Mxr4AoGQoBW8AkHvVsCOq0P7KKPHrDAi29bKZYdeLGrnoWrglwV6zknO
   Q==;
X-CSE-ConnectionGUID: 8hI1MmT9S2aB7A01B4SgMA==
X-CSE-MsgGUID: Vmd8UWhzQ+qarOLhBp2+hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="75959908"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="75959908"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 08:05:18 -0800
X-CSE-ConnectionGUID: CYt7VqExSk+BAVZ5rauWow==
X-CSE-MsgGUID: R/d9wrytRNqHyVM5DtILAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="251318402"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Feb 2026 08:05:14 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs160-00000001032-0Qdo;
	Mon, 16 Feb 2026 16:05:12 +0000
Date: Tue, 17 Feb 2026 00:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>, peterz@infradead.org,
	aboorvad@linux.ibm.com
Cc: oe-kbuild-all@lists.linux.dev, boqun.feng@gmail.com,
	frederic@kernel.org, joelagnelf@nvidia.com, josh@joshtriplett.org,
	linux-kernel@vger.kernel.org, neeraj.upadhyay@kernel.org,
	paulmck@kernel.org, rcu@vger.kernel.org, rostedt@goodmis.org,
	srikar@linux.ibm.com, sshegde@linux.ibm.com, tglx@linutronix.de,
	urezki@gmail.com, samir@linux.ibm.com, vishalc@linux.ibm.com
Subject: Re: [PATCH v2 2/2] cpuhp: Expedite RCU grace periods during SMT
 operations
Message-ID: <202602170042.5jdtaQeu-lkp@intel.com>
References: <20260216121927.489062-6-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216121927.489062-6-vishalc@linux.ibm.com>

Hi Vishal,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20260213]
[also build test ERROR on linus/master]
[cannot apply to tip/smp/core rcu/rcu/dev v6.19 v6.19-rc8 v6.19-rc7 v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vishal-Chourasia/cpuhp-Optimize-SMT-switch-operation-by-batching-lock-acquisition/20260216-202247
base:   next-20260213
patch link:    https://lore.kernel.org/r/20260216121927.489062-6-vishalc%40linux.ibm.com
patch subject: [PATCH v2 2/2] cpuhp: Expedite RCU grace periods during SMT operations
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260217/202602170042.5jdtaQeu-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170042.5jdtaQeu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170042.5jdtaQeu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/update.c:50:
>> kernel/rcu/rcu.h:515:20: error: static declaration of 'rcu_expedite_gp' follows non-static declaration
     515 | static inline void rcu_expedite_gp(void) { }
         |                    ^~~~~~~~~~~~~~~
   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/alpha/include/asm/hardirq.h:8,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from kernel/rcu/update.c:25:
   include/linux/rcupdate.h:1193:13: note: previous declaration of 'rcu_expedite_gp' with type 'void(void)'
    1193 | extern void rcu_expedite_gp(void);
         |             ^~~~~~~~~~~~~~~
>> kernel/rcu/rcu.h:516:20: error: static declaration of 'rcu_unexpedite_gp' follows non-static declaration
     516 | static inline void rcu_unexpedite_gp(void) { }
         |                    ^~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1194:13: note: previous declaration of 'rcu_unexpedite_gp' with type 'void(void)'
    1194 | extern void rcu_unexpedite_gp(void);
         |             ^~~~~~~~~~~~~~~~~


vim +/rcu_expedite_gp +515 kernel/rcu/rcu.h

2b34c43cc1671c Paul E. McKenney        2017-03-14  509  
25c36329a30c8c Paul E. McKenney        2017-05-03  510  #ifdef CONFIG_TINY_RCU
25c36329a30c8c Paul E. McKenney        2017-05-03  511  /* Tiny RCU doesn't expedite, as its purpose in life is instead to be tiny. */
7414fac050d5e0 Paul E. McKenney        2017-06-12  512  static inline bool rcu_gp_is_normal(void) { return true; }
7414fac050d5e0 Paul E. McKenney        2017-06-12  513  static inline bool rcu_gp_is_expedited(void) { return false; }
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  514) static inline bool rcu_async_should_hurry(void) { return false; }
7414fac050d5e0 Paul E. McKenney        2017-06-12 @515  static inline void rcu_expedite_gp(void) { }
7414fac050d5e0 Paul E. McKenney        2017-06-12 @516  static inline void rcu_unexpedite_gp(void) { }
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  517) static inline void rcu_async_hurry(void) { }
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  518) static inline void rcu_async_relax(void) { }
2be4686d866ad5 Frederic Weisbecker     2023-10-27  519  static inline bool rcu_cpu_online(int cpu) { return true; }
25c36329a30c8c Paul E. McKenney        2017-05-03  520  #else /* #ifdef CONFIG_TINY_RCU */
25c36329a30c8c Paul E. McKenney        2017-05-03  521  bool rcu_gp_is_normal(void);     /* Internal RCU use. */
25c36329a30c8c Paul E. McKenney        2017-05-03  522  bool rcu_gp_is_expedited(void);  /* Internal RCU use. */
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  523) bool rcu_async_should_hurry(void);  /* Internal RCU use. */
25c36329a30c8c Paul E. McKenney        2017-05-03  524  void rcu_expedite_gp(void);
25c36329a30c8c Paul E. McKenney        2017-05-03  525  void rcu_unexpedite_gp(void);
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  526) void rcu_async_hurry(void);
6efdda8bec2900 Joel Fernandes (Google  2023-01-12  527) void rcu_async_relax(void);
25c36329a30c8c Paul E. McKenney        2017-05-03  528  void rcupdate_announce_bootup_oddness(void);
2be4686d866ad5 Frederic Weisbecker     2023-10-27  529  bool rcu_cpu_online(int cpu);
474d0997361c07 Paul E. McKenney        2021-04-20  530  #ifdef CONFIG_TASKS_RCU_GENERIC
e21408ceec2de5 Paul E. McKenney        2020-03-16  531  void show_rcu_tasks_gp_kthreads(void);
e0a34641eb551e Arnd Bergmann           2023-06-09  532  #else /* #ifdef CONFIG_TASKS_RCU_GENERIC */
e0a34641eb551e Arnd Bergmann           2023-06-09  533  static inline void show_rcu_tasks_gp_kthreads(void) {}
e0a34641eb551e Arnd Bergmann           2023-06-09  534  #endif /* #else #ifdef CONFIG_TASKS_RCU_GENERIC */
e0a34641eb551e Arnd Bergmann           2023-06-09  535  #endif /* #else #ifdef CONFIG_TINY_RCU */
e0a34641eb551e Arnd Bergmann           2023-06-09  536  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
