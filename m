Received: from smtpout.efficios.com (smtpout.efficios.com [167.114.26.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61684D528
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.114.26.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732629987; cv=none; b=eM39szCRLqWRWDfqkYrw7nenv5nikehHhMBKycWg12YRuw4Gjjc7l+eVbtXuZS0sHkrKYnrnjSEWRsRG260KYkN5veFkZheknS24RDC88YfAx21hcFrP7iTzKJIBaiuX7Dpr1iSnL/bXP4GMzdUj+NiFHmwoDpUUD6lYKib4LTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732629987; c=relaxed/simple;
	bh=7yPYZRYJZwwZ/x9pg/1GJbzRMUVxEZoChDN5n1d6vbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBM3XJr/A6vaYdcicAG3Qlk/UMWJIlORNU0WTnSbHT7S5E3xZ+oUxnzmP1w5Ztjxbd449Vpdav023MQGq6UWis1untayOVCsmyXFfAMveq63zJvOHQ3VpM4u+AfNDuW8nhr/qZra7dyLOZ6Uptib6N32sfMdI8z/gZT118uK5RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=SCUKpNgI; arc=none smtp.client-ip=167.114.26.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="SCUKpNgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1732629973;
	bh=7yPYZRYJZwwZ/x9pg/1GJbzRMUVxEZoChDN5n1d6vbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SCUKpNgI+HgIEPFuiYFuHcWrVmAAbspybfQrXeYQ9nr/e+ElukpVd4+g7lqu7YG/Q
	 7gGV4fQ+ocv4i+Cc5ZoKm9mt+4ycXkzbkMOhuYLlQ9kG+gF2lUYma/wgiuH1T0RVqr
	 +vYSJgXrm7a2GvwE8tG3HFWX+E2HBn7qxa79cj/zyKL0uBaZtuanq4MqsSkrocKQWd
	 AeWdO3D28isJ4QjoFOY27l8sH8rKuGYdJ+G4rezT1HFNxRrjqNCU14Bp6bFp8eubGK
	 NVm3gTFMKcKPVGzk/E72+OZJQPk0VKO9gS1goIay5hZPm3szjSmPGvfYEgXNZX5LM/
	 xJEOhs7W+H4UA==
Received: from [172.16.0.134] (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4XyPW92hWFz1Cp9;
	Tue, 26 Nov 2024 09:06:13 -0500 (EST)
Message-ID: <7309278e-2e9b-44d2-94e4-22474d5cffd1@efficios.com>
Date: Tue, 26 Nov 2024 09:06:13 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [trace:trace/for-next 5/6] kernel/sched/pelt.c:479:50: sparse:
 sparse: dereference of noderef expression
To: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>
References: <202411261119.Lj0iQ4LZ-lkp@intel.com>
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Content-Language: en-US
In-Reply-To: <202411261119.Lj0iQ4LZ-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-11-25 22:19, kernel test robot wrote:
> Hi Mathieu,
> 
> First bad commit (maybe != root cause):
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
> head:   ef0d4186083127d2f99ed04e051fd94ba061d253
> commit: 98bf0fbb65226809a8df4d1948c5b6cf0c91590f [5/6] tracing: Remove conditional locking from __DO_TRACE()
> config: x86_64-randconfig-122-20241125 (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411261119.Lj0iQ4LZ-lkp@intel.com/

Peter ? I have no clue why the bot complains about my commit. It looks
unrelated to tracing and more about the scheduler, but perhaps I'm
missing something.

Thanks,

Mathieu

> 
> sparse warnings: (new ones prefixed by >>)
>     kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
>     kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
>     kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
>     kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
>     kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
>     kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
>     kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/deadline.c:2703:23: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:2703:23: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/deadline.c:2713:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/deadline.c:2713:13: sparse:    struct task_struct *
>     kernel/sched/deadline.c:2713:13: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/deadline.c:2819:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/deadline.c:2819:25: sparse:    struct task_struct *
>     kernel/sched/deadline.c:2819:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
>     kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
>     kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
>     kernel/sched/deadline.c:2353:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/deadline.c:2353:38: sparse:     expected struct task_struct *tsk
>     kernel/sched/deadline.c:2353:38: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
>     kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
>     kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
>     kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
>     kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
>     kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
>     kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
>     kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/deadline.c:2564:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/deadline.c:2564:9: sparse:     expected struct sched_domain *[assigned] sd
>     kernel/sched/deadline.c:2564:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
>     kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
>     kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
>     kernel/sched/deadline.c:2227:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
>     kernel/sched/deadline.c:2227:15: sparse:     expected struct task_struct *donor
>     kernel/sched/deadline.c:2227:15: sparse:     got struct task_struct [noderef] __rcu *
>     kernel/sched/deadline.c:2303:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/deadline.c:2303:43: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:2303:43: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/deadline.c:2864:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/deadline.c:2864:38: sparse:     expected struct task_struct *tsk
>     kernel/sched/deadline.c:2864:38: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/deadline.c:2866:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/deadline.c:2866:23: sparse:     expected struct task_struct *p
>     kernel/sched/deadline.c:2866:23: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/deadline.c:2868:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
>     kernel/sched/deadline.c:2868:44: sparse:     expected struct sched_dl_entity const *b
>     kernel/sched/deadline.c:2868:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
>     kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
>     kernel/sched/deadline.c:3092:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
>     kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
>     kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/build_policy.c: note: in included file:
>>> kernel/sched/pelt.c:479:50: sparse: sparse: dereference of noderef expression
>     kernel/sched/build_policy.c: note: in included file (through include/linux/rculist.h, include/linux/sched/signal.h, include/linux/sched/cputime.h):
>     include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'thread_group_cputime' - different lock contexts for basic block
>     kernel/sched/build_policy.c: note: in included file:
>>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>     kernel/sched/deadline.c:1264:29: sparse: sparse: context imbalance in 'dl_task_timer' - different lock contexts for basic block
>>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>     kernel/sched/deadline.c:1675:6: sparse: sparse: context imbalance in '__dl_server_attach_root' - wrong count at exit
>     kernel/sched/deadline.c:1690:5: sparse: sparse: context imbalance in 'dl_server_apply_params' - wrong count at exit
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/sched.h:1750:9: sparse: sparse: context imbalance in 'inactive_task_timer' - unexpected unlock
>     kernel/sched/build_policy.c: note: in included file:
>>> kernel/sched/deadline.c:784:29: sparse: sparse: dubious: x & !y
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
>     kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/syscalls.c:1298:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
>     kernel/sched/build_policy.c: note: in included file:
>     kernel/sched/rt.c:1699:15: sparse: sparse: dereference of noderef expression
> --
>     kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/fair.c:1203:39: sparse:     expected struct task_struct *donor
>     kernel/sched/fair.c:1203:39: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/fair.c:1261:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
>     kernel/sched/fair.c:1261:34: sparse:     expected struct sched_entity const *se
>     kernel/sched/fair.c:1261:34: sparse:     got struct sched_entity [noderef] __rcu *
>     kernel/sched/fair.c:12779:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:12779:9: sparse:     expected struct sched_domain *[assigned] sd
>     kernel/sched/fair.c:12779:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c:6104:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/fair.c:6104:22: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/fair.c:6104:22: sparse:    struct task_struct *
>     kernel/sched/fair.c:6834:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/fair.c:6834:39: sparse:     expected struct task_struct *donor
>     kernel/sched/fair.c:6834:39: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/fair.c:7037:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/fair.c:7037:58: sparse:     expected struct task_struct *p
>     kernel/sched/fair.c:7037:58: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/fair.c:8411:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:8411:20: sparse:     expected struct sched_domain *[assigned] sd
>     kernel/sched/fair.c:8411:20: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c:8615:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:8615:9: sparse:     expected struct sched_domain *[assigned] tmp
>     kernel/sched/fair.c:8615:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c:8760:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>     kernel/sched/fair.c:8760:39: sparse:     expected struct task_struct *donor
>     kernel/sched/fair.c:8760:39: sparse:     got struct task_struct [noderef] __rcu *donor
>     kernel/sched/fair.c:8791:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/fair.c:8791:37: sparse:     expected struct task_struct *tsk
>     kernel/sched/fair.c:8791:37: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/fair.c:9002:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
>     kernel/sched/fair.c:9002:38: sparse:     expected struct task_struct *curr
>     kernel/sched/fair.c:9002:38: sparse:     got struct task_struct [noderef] __rcu *curr
>     kernel/sched/fair.c:9973:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
>     kernel/sched/fair.c:9973:40: sparse:     expected struct sched_domain *child
>     kernel/sched/fair.c:9973:40: sparse:     got struct sched_domain [noderef] __rcu *child
>     kernel/sched/fair.c:10595:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/fair.c:10595:22: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/fair.c:10595:22: sparse:    struct task_struct *
>     kernel/sched/fair.c:12018:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:12018:9: sparse:     expected struct sched_domain *[assigned] sd
>     kernel/sched/fair.c:12018:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c:11668:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:11668:44: sparse:     expected struct sched_domain *sd_parent
>     kernel/sched/fair.c:11668:44: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c:12127:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:12127:9: sparse:     expected struct sched_domain *[assigned] sd
>     kernel/sched/fair.c:12127:9: sparse:     got struct sched_domain [noderef] __rcu *parent
>     kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     kernel/sched/fair.c: note: in included file:
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/fair.c:7524:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>     kernel/sched/fair.c:7530:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>     kernel/sched/fair.c:7537:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
>     kernel/sched/fair.c:7545:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
>     kernel/sched/fair.c:8699:9: sparse: sparse: context imbalance in 'task_dead_fair' - wrong count at exit
>     kernel/sched/sched.h:2472:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2472:9: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2472:9: sparse:    struct task_struct *
>>> kernel/sched/fair.c:11850:64: sparse: sparse: dereference of noderef expression
>>> kernel/sched/fair.c:11850:64: sparse: sparse: dereference of noderef expression
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
>     kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
>     kernel/sched/fair.c: note: in included file:
>     kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
>     kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
> 
> vim +479 kernel/sched/pelt.c
> 
> 902d67a2d40f5b Tejun Heo      2024-09-11  470
> 902d67a2d40f5b Tejun Heo      2024-09-11  471  /*
> 902d67a2d40f5b Tejun Heo      2024-09-11  472   * Load avg and utiliztion metrics need to be updated periodically and before
> 902d67a2d40f5b Tejun Heo      2024-09-11  473   * consumption. This function updates the metrics for all subsystems except for
> 902d67a2d40f5b Tejun Heo      2024-09-11  474   * the fair class. @rq must be locked and have its clock updated.
> 902d67a2d40f5b Tejun Heo      2024-09-11  475   */
> 902d67a2d40f5b Tejun Heo      2024-09-11  476  bool update_other_load_avgs(struct rq *rq)
> 902d67a2d40f5b Tejun Heo      2024-09-11  477  {
> 902d67a2d40f5b Tejun Heo      2024-09-11  478  	u64 now = rq_clock_pelt(rq);
> af0c8b2bf67b25 Peter Zijlstra 2024-10-09 @479  	const struct sched_class *curr_class = rq->donor->sched_class;
> 
> :::::: The code at line 479 was first introduced by commit
> :::::: af0c8b2bf67b25756f27644936e74fd9a6273bd2 sched: Split scheduler and execution contexts
> 
> :::::: TO: Peter Zijlstra <peterz@infradead.org>
> :::::: CC: Peter Zijlstra <peterz@infradead.org>
> 

-- 
Mathieu Desnoyers
EfficiOS Inc.
https://www.efficios.com

