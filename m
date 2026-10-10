Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9D93043CF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Oct 2026 19:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791662091; cv=none; b=jbel9nWo908W12XSIwyGpBohBPPh691oUzYBuEED6FlPIHxju9ZisXlvApyDLyaWwhjFHJmQckye4b3dmvuiStVDL0fnHFvGez3FiOwuFF8ogQ6X2IYKdU91oUyEjxiTBoJPbwFZWInS6AbZttlLIauvCOJP8RIlv3MCIj0SXaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791662091; c=relaxed/simple;
	bh=DDY7sdWnzvOGrSQ0kyUd1gG8poOTIx0sHxhxEOXz1g0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEshc1XqjKmBuEtudbZiZRJsrV9flT/KwADMZ9wZ/q/5PZRLSAXhTPuXgOSSVZab05aHyAA0sqPGdINc31uylnneTc2gdaasKH3LJZArb6E/qktUw/TQ1OBjddNZ5X644BNKEHfwZ3QfBFuegQue5xBBR6vWh+255p1oTIGBfzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngj5JSbq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngj5JSbq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8F21F000FF;
	Sat, 10 Oct 2026 19:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791662088;
	bh=HKx3+Vj6vFvVOanCFMTEeGgQXB7iKxmPT/ej6nCQCLg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=ngj5JSbqnJrp4ZkB4GPICPFATeD8zZ5PF/3IkXv141guvf7clCSmK4jTJHzU2ElYY
	 ntQXsneu11qFpzlsKs2U8gY29O8e3r1jSxE7XZyzR6Vnk0nikH9xV1pHrYcF+QfMAz
	 Ts6QRsxP7qlQfbbNuj++zBhRFhiALMTZqnijNhwppleHOyoGAgpo1xN8Rj3CSeGYNw
	 rkWuticmvIjnBf+3V3YQJk4OWy53DVh1EIV3SWBxCD0qbEwvetTQaa2jMb4sEdOkjs
	 gcIKPE7wX7P8FUZyNEVDk04WmEU+Ooua1fV7Kg2Do5K/Vv2bm28DTxl2f2Yh0CyNzf
	 OGd0+n7zQQRxw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id E651DCE397D; Sat, 10 Oct 2026 12:54:47 -0700 (PDT)
Date: Sat, 10 Oct 2026 12:54:47 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 20/22] kernel/rcu/tree.c:2772:59: error: 'struct
 task_struct' has no member named 'rcu_node_entry'
Message-ID: <7e1f958e-2184-46b7-815e-c3a6b371d75d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610101152.pcWaETEm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610101152.pcWaETEm-lkp@intel.com>

On Sat, Oct 10, 2026 at 11:43:26AM +0200, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   96aaeadd587ee111e53032f63b93e54a8b476483
> commit: 2c4925768252397b03d47704f70891ce2b47e774 [20/22] EXP rcu: Send resched_cpu() to idle CPUs having preempted RCU readers
> config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261010/202610101152.pcWaETEm-lkp@intel.com/config)
> compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101152.pcWaETEm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610101152.pcWaETEm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/tree.c: In function 'fqs_slow_task':
> >> kernel/rcu/tree.c:2772:59: error: 'struct task_struct' has no member named 'rcu_node_entry'

Good catch, this experimental patch should handle non-preemptible RCU
despite that not being part of the experiment.  Will fix, thank you!

							Thanx, Paul

>     2772 |         if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
>          |                                                           ^~
>    In file included from ./include/linux/container_of.h:5,
>                     from ./include/linux/kernel.h:22,
>                     from kernel/rcu/tree.c:21:
>    kernel/rcu/tree.c: In function 'force_qs_rnp':
> >> ./include/linux/container_of.h:8:47: error: 'struct task_struct' has no member named 'rcu_node_entry'
>        8 | #define typeof_member(T, m)     typeof(((T*)0)->m)
>          |                                               ^~
>    ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
>       80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                                        ^~~~
>    ./include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>       20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
>          |         ^~~~~~~~~~~~~
>    ./include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>       20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
>          |                       ^~~~~~~~~~~
>    ./include/linux/container_of.h:20:43: note: in expansion of macro 'typeof_member'
>       20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
>          |                                           ^~~~~~~~~~~~~
>    kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
>     2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
>          |                                     ^~~~~~~~~~~~
>    ././include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
>      610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    ./include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
>       80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
>          |                                                        ^~~~
>    ./include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
>       20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
>          |         ^~~~~~~~~~~~~
>    ./include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
>       20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
>          |                       ^~~~~~~~~~~
>    kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
>     2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
>          |                                     ^~~~~~~~~~~~
>    In file included from ./include/uapi/linux/posix_types.h:5,
>                     from ./include/uapi/linux/types.h:14,
>                     from ./include/linux/types.h:5,
>                     from kernel/rcu/tree.c:20:
> >> ./include/linux/stddef.h:16:33: error: 'struct task_struct' has no member named 'rcu_node_entry'
>       16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
>          |                                 ^~~~~~~~~~~~~~~~~~
>    ./include/linux/container_of.h:23:34: note: in expansion of macro 'offsetof'
>       23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
>          |                                  ^~~~~~~~
>    kernel/rcu/tree.c:2823:37: note: in expansion of macro 'container_of'
>     2823 |                                 t = container_of(rnp->gp_tasks, struct task_struct, rcu_node_entry);
>          |                                     ^~~~~~~~~~~~
> 
> 
> vim +2772 kernel/rcu/tree.c
> 
>   2757	
>   2758	// Check to see if a task holding up the current grace period is
>   2759	// preempted but runnable on an idle CPU.  This involves an
>   2760	// rcu_node structure, a pointer to which is passed to fqs_slow_task()
>   2761	// as a callback from task_call_func().  The fqs_slow_task()
>   2762	// function returns the CPU to pass to resched_cpu() or -1 if
>   2763	// there is no need for an additional call to resched_cpu().
>   2764	static int fqs_slow_task(struct task_struct *t, void *arg)
>   2765	{
>   2766		int cpu;
>   2767		struct rcu_node *rnp = arg;
>   2768		struct task_struct *tc;
>   2769	
>   2770		// If the task is running or is no longer blocking the current
>   2771		// grace period, there should be no call to resched_cpu().
> > 2772		if (task_curr(t) || READ_ONCE(rnp->gp_tasks) != &t->rcu_node_entry)
>   2773			return -1;
>   2774	
>   2775		// If the target CPU is not idle, there should be no call to
>   2776		// resched_cpu().
>   2777		WARN_ON_ONCE(1); // @@@
>   2778		cpu = task_cpu(t);
>   2779		tc = rcu_cpu_curr(cpu);
>   2780		if (!is_idle_task(tc))
>   2781			return -1;
>   2782	
>   2783		// But the target CPU is idle, so resched_cpu() it is!
>   2784		WARN_ON_ONCE(1); // @@@
>   2785		return cpu;
>   2786	}
>   2787	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
