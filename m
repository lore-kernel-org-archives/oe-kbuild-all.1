Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098381FCCF4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740305166; cv=none; b=dPyIsXdSfPBYswwJDENU1zNR21xgDQazKWrS12LSUKa4v4MlruBPsvDnCLOAw+fYcA1829Dr+exYkU1UWSo+VROfjpyW8BQT1iL5yhPsGtwfJLAEYfFnlqriL9j1IVP8M13f0x5FUvNe/QLyMitvTjvvm+V/ghZi9EUNRjNhjio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740305166; c=relaxed/simple;
	bh=YjM2V6EgSLxlJAjsBdyEKkcadXt6YfBVwcwAQAI3nfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sfo5vxtPint9fkSgs6dPAqpTT/QzfapwFK7bov19leUVEfzfLLehYBaF3tkhX7Akv0PbjrR7YyL5NIYK5yJuojhadNOqOUFaYdP5gPb0bMBmN9nI/dJSlgvEz15IKs7QlQBrW0LxinCuxsEIdUAlz1y9HxpBmTGmn7zM4Afv0rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dXF5c19J; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dXF5c19J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740305164; x=1771841164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YjM2V6EgSLxlJAjsBdyEKkcadXt6YfBVwcwAQAI3nfc=;
  b=dXF5c19J5qS2Y15FpM1krGdw1WJ0gw0qk89+2pLxeQtshl/fIwMQEHLs
   WR+PndTwZr2SdhIJN3XHF58XMVC7NVRH/1JvkoIpXWrnFUwu9shG7mV4w
   5StV7yndW5SOd6Xx5qZiGDJnJN/5sE21ao8UELZfz9CyvQheJ9/0sMC3i
   eeE7PEHnKXwHvTy6fx3dCIPl9tln/bLGqMTpGYLwKilbT38Uk83rYD/MU
   tgEoQkcrHKtfqixA6CED4vGJTFq7GYSrAe4WMskcSkBU8uzeXC4IXgxCh
   756UhGOO4NFy4XtDIcKrttGtsbwj1Pm7t7Y1VpgTYeJWiRBOH5q3H756H
   w==;
X-CSE-ConnectionGUID: qiH4PI7oR563VknpB9G30Q==
X-CSE-MsgGUID: k0qgSk7SRe+RQlrOH5RrJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40311228"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="40311228"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:06:03 -0800
X-CSE-ConnectionGUID: SEylCyf0REKW0qvqOZ5pXg==
X-CSE-MsgGUID: df3kaeRfSTm+77O6TTr8AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139017926"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2025 02:06:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm8s4-0007Fr-1d;
	Sun, 23 Feb 2025 10:06:00 +0000
Date: Sun, 23 Feb 2025 18:05:54 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot
 section
Message-ID: <202502231726.Sy9P7hJc-lkp@intel.com>
References: <20250222190623.262689-3-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222190623.262689-3-brgerst@gmail.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 01157ddc58dc2fe428ec17dd5a18cc13f134639f]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/percpu-Introduce-percpu-hot-section/20250223-031046
base:   01157ddc58dc2fe428ec17dd5a18cc13f134639f
patch link:    https://lore.kernel.org/r/20250222190623.262689-3-brgerst%40gmail.com
patch subject: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot section
config: x86_64-buildonly-randconfig-003-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231726.Sy9P7hJc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231726.Sy9P7hJc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231726.Sy9P7hJc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~
--
   In file included from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from drivers/md/dm-vdo/vdo.h:10,
                    from drivers/md/dm-vdo/vdo.c:30:
>> include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~
   drivers/md/dm-vdo/vdo.c: In function 'vdo_make':
   drivers/md/dm-vdo/vdo.c:562:19: warning: '%s' directive output may be truncated writing up to 55 bytes into a region of size 16 [-Wformat-truncation=]
     562 |                  "%s%u", MODULE_NAME, instance);
         |                   ^~
   drivers/md/dm-vdo/vdo.c:561:9: note: 'snprintf' output between 2 and 66 bytes into a destination of size 16
     561 |         snprintf(vdo->thread_name_prefix, sizeof(vdo->thread_name_prefix),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     562 |                  "%s%u", MODULE_NAME, instance);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
>> include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~
   kernel/sched/core.c: In function '__fire_sched_out_preempt_notifiers':
   kernel/sched/core.c:4958:52: error: passing argument 2 of 'notifier->ops->sched_out' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4958 |                 notifier->ops->sched_out(notifier, next);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct task_struct *
   kernel/sched/core.c:4958:52: note: expected 'struct task_struct *' but argument is of type 'struct task_struct *'
   cc1: some warnings being treated as errors
--
   In file included from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from vdo.h:10,
                    from vdo.c:30:
>> include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~
   vdo.c: In function 'vdo_make':
   vdo.c:562:19: warning: '%s' directive output may be truncated writing up to 55 bytes into a region of size 16 [-Wformat-truncation=]
     562 |                  "%s%u", MODULE_NAME, instance);
         |                   ^~
   vdo.c:561:9: note: 'snprintf' output between 2 and 66 bytes into a destination of size 16
     561 |         snprintf(vdo->thread_name_prefix, sizeof(vdo->thread_name_prefix),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     562 |                  "%s%u", MODULE_NAME, instance);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~


vim +340 include/linux/preempt.h

e107be36efb2a2 Avi Kivity 2007-07-26  322  
e107be36efb2a2 Avi Kivity 2007-07-26  323  /**
e107be36efb2a2 Avi Kivity 2007-07-26  324   * preempt_ops - notifiers called when a task is preempted and rescheduled
e107be36efb2a2 Avi Kivity 2007-07-26  325   * @sched_in: we're about to be rescheduled:
e107be36efb2a2 Avi Kivity 2007-07-26  326   *    notifier: struct preempt_notifier for the task being scheduled
e107be36efb2a2 Avi Kivity 2007-07-26  327   *    cpu:  cpu we're scheduled on
e107be36efb2a2 Avi Kivity 2007-07-26  328   * @sched_out: we've just been preempted
e107be36efb2a2 Avi Kivity 2007-07-26  329   *    notifier: struct preempt_notifier for the task being preempted
e107be36efb2a2 Avi Kivity 2007-07-26  330   *    next: the task that's kicking us out
8592e6486a177a Tejun Heo  2009-12-02  331   *
8592e6486a177a Tejun Heo  2009-12-02  332   * Please note that sched_in and out are called under different
8592e6486a177a Tejun Heo  2009-12-02  333   * contexts.  sched_out is called with rq lock held and irq disabled
8592e6486a177a Tejun Heo  2009-12-02  334   * while sched_in is called without rq lock and irq enabled.  This
8592e6486a177a Tejun Heo  2009-12-02  335   * difference is intentional and depended upon by its users.
e107be36efb2a2 Avi Kivity 2007-07-26  336   */
e107be36efb2a2 Avi Kivity 2007-07-26  337  struct preempt_ops {
e107be36efb2a2 Avi Kivity 2007-07-26  338  	void (*sched_in)(struct preempt_notifier *notifier, int cpu);
e107be36efb2a2 Avi Kivity 2007-07-26  339  	void (*sched_out)(struct preempt_notifier *notifier,
e107be36efb2a2 Avi Kivity 2007-07-26 @340  			  struct task_struct *next);
e107be36efb2a2 Avi Kivity 2007-07-26  341  };
e107be36efb2a2 Avi Kivity 2007-07-26  342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
