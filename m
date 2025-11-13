Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4B734AB09
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763035987; cv=none; b=b+ictt/UJDfjdvIRLnYR6Y+huqj7KvBpuZZ5+A2ylMJxcJzCPgl3Yj4XR0aoLWX6tINptTFI8rTRV/B3R1VXPrbmqrv+nrk54m/KJ3A44RcwgENUzXLsmWgJoMyDLKAdit/iAfi/PwfL4IoZCxR2onF4PpXrn26yH5/Lj1AYkwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763035987; c=relaxed/simple;
	bh=87wvej179jn/HgbsbbaQBALA59S22yvymGGtoJGZYDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSSWogne7vkE30VXZdgEfbAtlnadNbhiL7MU+8jVFKvj/yR7FjoOzwXWtKFAreZV7Adp4zSYaEid6T1BZClFHeWSE9bZ4LYXfukRQ7L8FPPvSfa5Ct2DzlDT9T2aJs86zL0+DdvWWnLs2UUtSBNWTy98tc+DeDzyzjaDFeUFvPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ykV+YaW7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H58p1VoD; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ykV+YaW7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H58p1VoD"
Date: Thu, 13 Nov 2025 13:13:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1763035983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jBcwotjAQkHo9M8b3NisK6IqqScUjauq63cPox1yVx0=;
	b=ykV+YaW7cVNrgp2R684EQoW4g/Zd3NG65aGKCeqFVM5F+pYNjADVeW3QGDuue7M3OCS5FW
	L9sXxFr9lzdrxYwWDBloaVlZJBQXk5p9n6JfUtu6upwsljYBMeP7aY27Awo+i4PGMYKs8k
	SgGNi1BxqNnEYE73a7ErcCJQeHeKlKZ0BcBY70123k7AU1aEgAKgaQ858eqmJhe6/HnAyq
	oz0Tu1smetbotGEwBCwbIfxc4qTxmdK+rsWhuBA9RRxwUe2t87eHBblyWzxZm3dSrKF9ds
	07xHyiqGkB5VK8j+haYO9zcMDst9ZXD7SYVwZqMfpJ6sBnsJ2Lx0m/EsuIapmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1763035983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jBcwotjAQkHo9M8b3NisK6IqqScUjauq63cPox1yVx0=;
	b=H58p1VoD6wEsOPJn4/Bvt7rp4E9qunl9xUmWdRRljXQc3y1mNNu5BbCivjZIccC0hLXdJH
	BgNnUdbHTdpzVhAg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>, 
	Steven Rostedt <rostedt@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:latency/for-next 3/5]
 kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of
 'rv_sleep' follows non-static declaration
Message-ID: <20251113130659-27597fbf-a991-4cfb-aaf5-de69100ed34d@linutronix.de>
References: <202511131948.vxi5mdjU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511131948.vxi5mdjU-lkp@intel.com>

On Thu, Nov 13, 2025 at 07:41:09PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace latency/for-next
> head:   69d8895cb9a9f6450374577af8584c2e21cb5a9f
> commit: 4f739ed19d222de33b19ca639a34523fbbec20d0 [3/5] rv: Pass va_list to reactors
> config: arc-randconfig-r071-20251113 (https://download.01.org/0day-ci/archive/20251113/202511131948.vxi5mdjU-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131948.vxi5mdjU-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511131948.vxi5mdjU-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/trace/rv/monitors/sleep/sleep.c:219:26: error: static declaration of 'rv_sleep' follows non-static declaration
>     static struct rv_monitor rv_sleep = {
>                              ^~~~~~~~
>    In file included from include/linux/cleanup.h:7,
>                     from include/linux/interrupt.h:8,
>                     from include/linux/trace_recursion.h:5,
>                     from include/linux/ftrace.h:10,
>                     from kernel/trace/rv/monitors/sleep/sleep.c:2:
>    include/rv/ltl_monitor.h:19:37: note: previous declaration of 'rv_sleep' was here
>     #define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
>                                         ^~~
>    include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
>     #define __CONCAT(a, b) a ## b
>                            ^
>    include/rv/ltl_monitor.h:19:25: note: in expansion of macro 'CONCATENATE'
>     #define RV_MONITOR_NAME CONCATENATE(rv_, MONITOR_NAME)
>                             ^~~~~~~~~~~
>    include/rv/ltl_monitor.h:24:26: note: in expansion of macro 'RV_MONITOR_NAME'
>     extern struct rv_monitor RV_MONITOR_NAME;
>                              ^~~~~~~~~~~~~~~

That 'extern' declaration if !CONFIG_RV_REACTORS doesn't make sense.
The whole conditional should go away and just always declare:

static struct rv_monitor RV_MONITOR_NAME;

Want me to send a new revision or will you fix it up directly?


Thomas
