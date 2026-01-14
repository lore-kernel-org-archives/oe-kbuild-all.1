Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B12E22BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768354923; cv=none; b=pKvG5u/7fwn1Mz6pXOst41bd/SruM8FtUNsSYCSa8OE4rvQ87nMGfPtmr8UIMVAU8aNP/TFdlkK3+LnYhv4dm/HNzaDpqCcX7h8QtNSA0Ke09qHZfVLzHgtdQtmwp/txCTFO6UK3+OLkGi0z4F4GWteXLzvWH20N/AFlQ0V5FlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768354923; c=relaxed/simple;
	bh=6FgRd6Mi8eGJ8kfc1wbiWaMYoHvR+wOlKz4A/w2vHcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBX/7uVFVE10jePmmT9ZHn/08J9YrdqsM1sGcyB2wmza9QzOm+avWwfsYq5Fa7YiBPo6NN02gcW8nImMpO1DnsTCNhe2WMD0xPf7vPFBeODby3bu1qcj1J8yJ5q3rjym4VBNGZAZ5T/swGR9XS4O0TncPRJJKGGHo8rrwt4y6oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/5HaFVq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/5HaFVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768354922; x=1799890922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6FgRd6Mi8eGJ8kfc1wbiWaMYoHvR+wOlKz4A/w2vHcg=;
  b=X/5HaFVqpD6rasMU4gfx2rKkVen+Mbfz1D9s+cYJiMmKjvKYv+6tQUlM
   5eV2FHmXCWHOePvlFQwMWrlw2OcocS1J42dDUA/VoCvBHNJ2mBti8xfMD
   js2jASljovd/VzmV29SIIxvUU/mfEYPUODaOIdBWfjPc2+VkDAAg6t9oY
   xwIMqRhA4nt6kQV0Xd2LRxPjq14Gv2IvRGdnvU1TKxsuxXTanGkE0cEl0
   eE1z1dLw92uRKinNlKmeSCVCKbzC6vm/zSJrPVUnxF86PrLI4yS8ZjoP8
   HExbEfaWhsLMFNX1IpZLnR0Y86wlZcy1yY0K3UA4hpRj+r+rbEU1X8z1m
   w==;
X-CSE-ConnectionGUID: 8LjK+651QjibqeSVkG0yjA==
X-CSE-MsgGUID: 1uJ2zcBUTr+hGQxCMw0zAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73507282"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73507282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 17:42:01 -0800
X-CSE-ConnectionGUID: lYeEE0+oTqmL6iMjEk7NTw==
X-CSE-MsgGUID: FE5FQ7jcS6WUhE22eomYEA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jan 2026 17:41:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfptV-00000000Fd6-1zwx;
	Wed, 14 Jan 2026 01:41:57 +0000
Date: Wed, 14 Jan 2026 09:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Imran Khan <imran.f.khan@oracle.com>, tglx@linutronix.de
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] genirq/cpuhotplug: notify about irq affinity change
 for offlined cpus.
Message-ID: <202601140909.LBJvN7Nb-lkp@intel.com>
References: <20260113143727.1041265-1-imran.f.khan@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113143727.1041265-1-imran.f.khan@oracle.com>

Hi Imran,

kernel test robot noticed the following build errors:

[auto build test ERROR on f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da]

url:    https://github.com/intel-lab-lkp/linux/commits/Imran-Khan/genirq-cpuhotplug-notify-about-irq-affinity-change-for-offlined-cpus/20260113-223900
base:   f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
patch link:    https://lore.kernel.org/r/20260113143727.1041265-1-imran.f.khan%40oracle.com
patch subject: [PATCH v3] genirq/cpuhotplug: notify about irq affinity change for offlined cpus.
config: x86_64-buildonly-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140909.LBJvN7Nb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140909.LBJvN7Nb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140909.LBJvN7Nb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:149:6: error: redefinition of 'schedule_affinity_notify_work'
     149 | void schedule_affinity_notify_work(struct irq_desc *desc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/irq/manage.c:15:
   include/linux/interrupt.h:449:20: note: previous definition of 'schedule_affinity_notify_work' with type 'void(struct irq_desc *)'
     449 | static inline void schedule_affinity_notify_work(struct irq_desc *desc) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/manage.c: In function 'schedule_affinity_notify_work':
>> kernel/irq/manage.c:151:23: error: 'struct irq_desc' has no member named 'affinity_notify'
     151 |         kref_get(&desc->affinity_notify->kref);
         |                       ^~
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/x86/include/asm/cache.h:5,
                    from include/vdso/cache.h:5,
                    from include/linux/cache.h:6,
                    from include/linux/irq.h:13,
                    from kernel/irq/manage.c:11:
   kernel/irq/manage.c:152:33: error: 'struct irq_desc' has no member named 'affinity_notify'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |                                 ^~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/irq/manage.c:152:9: note: in expansion of macro 'if'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |         ^~
   kernel/irq/manage.c:152:33: error: 'struct irq_desc' has no member named 'affinity_notify'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |                                 ^~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   kernel/irq/manage.c:152:9: note: in expansion of macro 'if'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |         ^~
   kernel/irq/manage.c:152:33: error: 'struct irq_desc' has no member named 'affinity_notify'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |                                 ^~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/irq/manage.c:152:9: note: in expansion of macro 'if'
     152 |         if (!schedule_work(&desc->affinity_notify->work))
         |         ^~
   kernel/irq/manage.c:154:31: error: 'struct irq_desc' has no member named 'affinity_notify'
     154 |                 kref_put(&desc->affinity_notify->kref,
         |                               ^~
   kernel/irq/manage.c:155:30: error: 'struct irq_desc' has no member named 'affinity_notify'
     155 |                          desc->affinity_notify->release);
         |                              ^~


vim +/schedule_affinity_notify_work +149 kernel/irq/manage.c

   141	
   142	/**
   143	 * schedule_affinity_notify_work - Schedule work to notify
   144	 * about irq affinity change.
   145	 * @desc:  irq descriptor whose affinity changed
   146	 *
   147	 * Caller needs to hold desc->lock
   148	 */
 > 149	void schedule_affinity_notify_work(struct irq_desc *desc)
   150	{
 > 151		kref_get(&desc->affinity_notify->kref);
   152		if (!schedule_work(&desc->affinity_notify->work))
   153			/* Work was already scheduled, drop our extra ref */
   154			kref_put(&desc->affinity_notify->kref,
   155				 desc->affinity_notify->release);
   156	}
   157	EXPORT_SYMBOL_GPL(schedule_affinity_notify_work);
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
