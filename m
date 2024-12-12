Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EA82135BA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012459; cv=none; b=d4/wttq1xbABTaRv2zQWyTJAfz8QkoQ6NGdtRowdOHQT/J0FxjmfyPnK50vHg9PF7pM+fvcE3vf0lmTf3SbHv9T8hWgLoVjXBbufBHSKLTSNDAAFXELjQVJHbFWixa/3BEiTaau0qQF7NrTdMYhEQz3gqEgbwhtZz+CwJm5Cg/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012459; c=relaxed/simple;
	bh=M2ZtHOy8Ho94zqPzq7G/Qje8SJ2oWX9FvaOsDmHEMBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PpoxXLI7AqnE9DPdj6wKdj19hKleZ0jMTqwB3+6kd7nf/9M2Bg+UVHeGFz2df+Km0y6oqL4z4EfdSBh094Xg+aUjpUSEOVyrcBwmvMa4zA7BMps9R0of8UXcpue2Q14pYvKzmoSrZrlKHzfBTIt72s5Wn7OvUHsXBzITQ0S80NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPEKb+7z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPEKb+7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734012458; x=1765548458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M2ZtHOy8Ho94zqPzq7G/Qje8SJ2oWX9FvaOsDmHEMBM=;
  b=VPEKb+7zXKzCGbAo+JU9LVhX5qg+0PQWgKbdt0rUdyK2PJl6cBfGkz9M
   IcCR+Kq7cCwOyT8iY/RmFZDv9Y3LcRf73yUWh4FWiFDhIcLy68/nnTXoa
   YKR82Dc7aaFP3i0gx0kSjCHV5BP8IkP8n6MdwD7L5M/m9ief2u3fA2Jqc
   BsvuV2g6QDTP3LGZf2HSnYFXtvPyxs8iN8afYTONgNe3BAB2OXbZJ/NYY
   ToYrnU3qvXQRzA5kv3UEvX4vVOBGTSPl7vvp8XTMi7e4FJp1JS0Kb2sqp
   FqHEanPEGxGs5WQZO82x3W1RFG7HkadnlXjDL/0tzpEKqpuR2n1X4b/jX
   Q==;
X-CSE-ConnectionGUID: TxA11LzpSzOPvDD8I1K2+A==
X-CSE-MsgGUID: U5DcSFgUROS3o9YjKP9TcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34156284"
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="34156284"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 06:07:38 -0800
X-CSE-ConnectionGUID: fDms8KpJSomRmOHzO5c/kQ==
X-CSE-MsgGUID: XzpwuLIKRWq3BuRfYkx6xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; 
   d="scan'208";a="96650156"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Dec 2024 06:07:36 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLjqn-0007uH-2J;
	Thu, 12 Dec 2024 14:07:33 +0000
Date: Thu, 12 Dec 2024 22:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 10983/30000]
 kernel/power/qos.c:358:1: warning: the frame size of 32800 bytes is larger
 than 2048 bytes
Message-ID: <202412122156.EywPbtNW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lina,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   a8bf86a0e0fa05070897a210d706d5c4d83c26ac
commit: 723feab600f71b3104a10de5b372bd1d9adf5943 [10983/30000] ANDROID: GKI: QoS: Enhance framework to support cpu/irq specific QoS requests
config: x86_64-buildonly-randconfig-005-20241212 (https://download.01.org/0day-ci/archive/20241212/202412122156.EywPbtNW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412122156.EywPbtNW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412122156.EywPbtNW-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:398:9: note: in expansion of macro '__DECLARE_TRACE'
     398 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:523:9: note: in expansion of macro 'DECLARE_TRACE'
     523 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/power.h:525:1: note: in expansion of macro 'DEFINE_EVENT'
     525 | DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
         | ^~~~~~~~~~~~
   include/trace/events/power.h: In function 'trace_dev_pm_qos_remove_request_rcuidle':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   include/linux/preempt.h:199:9: note: in expansion of macro 'if'
     199 |         if (unlikely(__preempt_count_dec_and_test())) \
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/linux/preempt.h:199:13: note: in expansion of macro 'unlikely'
     199 |         if (unlikely(__preempt_count_dec_and_test())) \
         |             ^~~~~~~~
   include/linux/tracepoint.h:204:17: note: in expansion of macro 'preempt_enable_notrace'
     204 |                 preempt_enable_notrace();                               \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:212:25: note: in expansion of macro '__DO_TRACE'
     212 |                         __DO_TRACE(&__tracepoint_##name,                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:248:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     248 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:398:9: note: in expansion of macro '__DECLARE_TRACE'
     398 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:523:9: note: in expansion of macro 'DECLARE_TRACE'
     523 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/power.h:525:1: note: in expansion of macro 'DEFINE_EVENT'
     525 | DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
         | ^~~~~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   include/linux/preempt.h:199:9: note: in expansion of macro 'if'
     199 |         if (unlikely(__preempt_count_dec_and_test())) \
         |         ^~
   include/linux/tracepoint.h:204:17: note: in expansion of macro 'preempt_enable_notrace'
     204 |                 preempt_enable_notrace();                               \
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:212:25: note: in expansion of macro '__DO_TRACE'
     212 |                         __DO_TRACE(&__tracepoint_##name,                \
         |                         ^~~~~~~~~~
   include/linux/tracepoint.h:248:9: note: in expansion of macro '__DECLARE_TRACE_RCU'
     248 |         __DECLARE_TRACE_RCU(name, PARAMS(proto), PARAMS(args),          \
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/tracepoint.h:398:9: note: in expansion of macro '__DECLARE_TRACE'
     398 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
         |         ^~~~~~~~~~~~~~~
   include/linux/tracepoint.h:523:9: note: in expansion of macro 'DECLARE_TRACE'
     523 |         DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
         |         ^~~~~~~~~~~~~
   include/trace/events/power.h:525:1: note: in expansion of macro 'DEFINE_EVENT'
     525 | DEFINE_EVENT(dev_pm_qos_request, dev_pm_qos_remove_request,
         | ^~~~~~~~~~~~
   kernel/power/qos.c: In function 'pm_qos_update_request_timeout':
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/power/qos.c:657:9: note: in expansion of macro 'if'
     657 |         if (WARN(!pm_qos_request_active(req),
         |         ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:202:9: note: in expansion of macro 'unlikely'
     202 |         unlikely(__ret_warn_on);                                        \
         |         ^~~~~~~~
   kernel/power/qos.c:657:13: note: in expansion of macro 'WARN'
     657 |         if (WARN(!pm_qos_request_active(req),
         |             ^~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/power/qos.c:657:9: note: in expansion of macro 'if'
     657 |         if (WARN(!pm_qos_request_active(req),
         |         ^~
   kernel/power/qos.c: In function 'pm_qos_update_target':
>> kernel/power/qos.c:358:1: warning: the frame size of 32800 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     358 | }
         | ^
   kernel/power/qos.c:630: warning: Function parameter or member 'new_value' not described in 'pm_qos_update_request'
   kernel/power/qos.c:630: warning: Excess function parameter 'value' description in 'pm_qos_update_request'


vim +358 kernel/power/qos.c

723feab600f71b kernel/power/qos.c     Lina Iyer           2014-05-21  294  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  295  /**
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  296   * pm_qos_update_target - manages the constraints list and calls the notifiers
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  297   *  if needed
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  298   * @c: constraints data struct
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  299   * @node: request to add to the list, to update or to remove
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  300   * @action: action to take on the constraints list
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  301   * @value: value of the request to add or update
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  302   *
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  303   * This function returns 1 if the aggregated constraint value has changed, 0
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  304   *  otherwise.
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  305   */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  306  int pm_qos_update_target(struct pm_qos_constraints *c, struct plist_node *node,
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  307  			 enum pm_qos_req_action action, int value)
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  308  {
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  309  	unsigned long flags;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  310  	int prev_value, curr_value, new_value;
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  311  	int ret;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  312  
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  313  	spin_lock_irqsave(&pm_qos_lock, flags);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  314  	prev_value = pm_qos_get_value(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  315  	if (value == PM_QOS_DEFAULT_VALUE)
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  316  		new_value = c->default_value;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  317  	else
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  318  		new_value = value;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  319  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  320  	switch (action) {
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  321  	case PM_QOS_REMOVE_REQ:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  322  		plist_del(node, &c->list);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  323  		break;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  324  	case PM_QOS_UPDATE_REQ:
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  325  		/*
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  326  		 * to change the list, we atomically remove, reinit
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  327  		 * with new value and add, then see if the extremal
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  328  		 * changed
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  329  		 */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  330  		plist_del(node, &c->list);
fe43e2ce526979 kernel/power/qos.c     Gustavo A. R. Silva 2018-03-30  331  		/* fall through */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  332  	case PM_QOS_ADD_REQ:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  333  		plist_node_init(node, new_value);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  334  		plist_add(node, &c->list);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  335  		break;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  336  	default:
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  337  		/* no action */
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  338  		;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  339  	}
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  340  
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  341  	curr_value = pm_qos_get_value(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  342  	pm_qos_set_value(c, curr_value);
723feab600f71b kernel/power/qos.c     Lina Iyer           2014-05-21  343  	pm_qos_set_value_for_cpus(c);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  344  
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  345  	spin_unlock_irqrestore(&pm_qos_lock, flags);
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  346  
247e9ee034b044 kernel/power/qos.c     Sahara              2013-06-21  347  	trace_pm_qos_update_target(action, prev_value, curr_value);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  348  	if (prev_value != curr_value) {
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  349  		ret = 1;
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  350  		if (c->notifiers)
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  351  			blocking_notifier_call_chain(c->notifiers,
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  352  						     (unsigned long)curr_value,
5f279845f9d684 kernel/pm_qos_params.c James Bottomley     2010-07-19  353  						     NULL);
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  354  	} else {
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  355  		ret = 0;
abe98ec2d86279 kernel/power/qos.c     Jean Pihet          2011-08-25  356  	}
2d984ad132a87c kernel/power/qos.c     Rafael J. Wysocki   2014-02-11  357  	return ret;
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04 @358  }
d82b35186eaa81 kernel/pm_qos_params.c Mark Gross          2008-02-04  359  

:::::: The code at line 358 was first introduced by commit
:::::: d82b35186eaa816267f044bd70cc0acb3c7971a3 pm qos infrastructure and interface

:::::: TO: Mark Gross <mgross@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
