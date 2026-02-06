Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96528395D80
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 11:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378901; cv=none; b=c27rA7c1ZJcBP13PiGb9eG+VeujLr0+IgNvBi/GvFSYoThd2HjZ7mFeCu42tJobRjCUYbWGkiYCkG2f1PWpJU98igcuC2jqtLEIBMJPXA9V/VLu40NY0iIQw/Rc3TNDpIX5ovzFDG4K4el2Fo3bCu6F5vpFdoK2mP24oQQFd3Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378901; c=relaxed/simple;
	bh=bbViN2U7h/+Su9XQ6MU3JMmds/6oPuarh1vuIvQbH70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qu9BbSEGkdhx5ImIY6mTcciAdgdjDECBY8iDMN9EBH1SNa0NP0lxfiImSeA1FNAeA5IT5UB8etVgHNLcCh1cjuW9uS2Acl/TI9m/V8CSWMLpyKu87Pl28HbQ/VZgBZeSlD2Ut22zH31JXmjYlrIdrUxxtGSva5xOyWH3aqpxAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yjzbf/S9; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yjzbf/S9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z/uH5SzR9TtIyGxU/2v1+r7sLHVDqIOshdknRKc5HA8=; b=Yjzbf/S9Np1ofyWZ8g/Qya+6x3
	dBdX3/1/5VTBBLlv3cU/BqLA0JeiPJ28OCDEgatx6dDNKIlXR9dcfBf3Av6vBrhlIvtsaMcJ10W3h
	cLPbUOUOdlRfb3085m/34DkvE5K2EPnzDcdSSY0kB1WQEf1vgGOb3YpJ29NYjC1kRrg/PT+5ZqONi
	9qawB9pgZTD8mXnWRw4LsrV67ttTiYP7JEmDgm2Gu97kKW5xCDWaTSTZEm6cLcVHI57v2Wj6mS7oo
	Aiz5p2ErQQcPkVPfc/ahDJH0O4YRlJkLyXPY6Sb3rg9m11s46kz/6CRKI/eqp6hlkKtyNFkqrSuPg
	SXo8AoMw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voKQH-00000003kIm-40o4;
	Fri, 06 Feb 2026 11:54:55 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7678E301142; Fri, 06 Feb 2026 12:54:52 +0100 (CET)
Date: Fri, 6 Feb 2026 12:54:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun@kernel.org>,
	Lyude Paul <lyude@redhat.com>
Subject: Re: [boqun:rust-sync 12/17] kernel/time/timer.c:1754:30: warning:
 format '%x' expects argument of type 'unsigned int', but argument 6 has type
 'long int'
Message-ID: <20260206115452.GS1282955@noisy.programming.kicks-ass.net>
References: <202602060923.uRfnJm0i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602060923.uRfnJm0i-lkp@intel.com>

On Fri, Feb 06, 2026 at 09:33:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git rust-sync
> head:   3ef437b5dd8b13bd88b1512531391ad30c26d539
> commit: 6969095afa2073e65ecc958bb5064ddf808309b3 [12/17] preempt: Introduce HARDIRQ_DISABLE_BITS and PREEMPT_LONG
> config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20260206/202602060923.uRfnJm0i-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602060923.uRfnJm0i-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602060923.uRfnJm0i-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/asm-generic/bug.h:31,
>                     from arch/alpha/include/asm/bug.h:23,
>                     from include/linux/bug.h:5,
>                     from include/linux/random.h:6,
>                     from include/linux/nodemask.h:94,
>                     from include/linux/numa.h:6,
>                     from include/linux/cpumask.h:15,
>                     from include/linux/smp.h:13,
>                     from include/linux/kernel_stat.h:5,
>                     from kernel/softirq.c:13:
>    kernel/softirq.c: In function 'handle_softirqs':
> >> include/linux/kern_levels.h:5:25: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long int' [-Wformat=]
>        5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
>          |                         ^~~~~~
>    include/linux/printk.h:484:25: note: in definition of macro 'printk_index_wrap'
>      484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
>          |                         ^~~~
>    include/linux/printk.h:555:9: note: in expansion of macro 'printk'
>      555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>          |         ^~~~~~
>    include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
>       11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
>          |                         ^~~~~~~~
>    include/linux/printk.h:555:16: note: in expansion of macro 'KERN_ERR'
>      555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>          |                ^~~~~~~~
>    kernel/softirq.c:633:25: note: in expansion of macro 'pr_err'
>      633 |                         pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
>          |                         ^~~~~~
> --
>    In file included from arch/alpha/include/asm/bug.h:23,
>                     from include/linux/bug.h:5,
>                     from include/linux/random.h:6,
>                     from include/linux/nodemask.h:94,
>                     from include/linux/numa.h:6,
>                     from include/linux/cpumask.h:15,
>                     from include/linux/smp.h:13,
>                     from include/linux/kernel_stat.h:5,
>                     from kernel/time/timer.c:21:
>    kernel/time/timer.c: In function 'call_timer_fn':
> >> kernel/time/timer.c:1754:30: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'long int' [-Wformat=]
>     1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
>          |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     1755 |                           fn, count, preempt_count());
>          |                               ~~~~~
>          |                               |
>          |                               long int
>    include/asm-generic/bug.h:142:62: note: in definition of macro '__WARN_printf'
>      142 |                 warn_slowpath_fmt(__FILE__, __LINE__, taint, arg);      \
>          |                                                              ^~~
>    include/linux/once_lite.h:31:25: note: in expansion of macro 'WARN'
>       31 |                         func(__VA_ARGS__);                              \
>          |                         ^~~~
>    include/asm-generic/bug.h:185:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
>      185 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
>          |         ^~~~~~~~~~~~~~~
>    kernel/time/timer.c:1754:17: note: in expansion of macro 'WARN_ONCE'
>     1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
>          |                 ^~~~~~~~~
>    kernel/time/timer.c:1754:59: note: format string is defined here
>     1754 |                 WARN_ONCE(1, "timer: %pS preempt leak: %08x -> %08x\n",
>          |                                                        ~~~^
>          |                                                           |
>          |                                                           unsigned int
>          |                                                        %08lx
> 

Yeah, that's what I said :/ C format stuff sucks.

Perhaps the sanest solution is something like:

	"...%lx...", (long)preempt_count()

