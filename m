Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293491917E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635111; cv=none; b=kEGVZQtYA+JTl5V0fNgAf8DOrT6seFxyOe+Zg4jxfhFswYJMU0CfsVbDQJQVbTldoI9JSRCSKaSvXbYk9VgLJ1O3j3/pH1UJAekar8iPUYe+jXpbUaxGmbB/JsaYZug7X3vl/vdUa9rY++jDNs8w0VeEGPUwfF/wX5jmrMSxqAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635111; c=relaxed/simple;
	bh=Uo0lGj/WWH1dixs3erRqd0+34EFBuMiGOc+pAEuT6lU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CNrEHl7YwFXPzX25DKamJtjSw/zmU1HK4my5+f2rUrE3k4FUWe4h4QDfbelKOMwnYlursqfn4Ti3qMBUz68HPZy7TxaV85DHKSE471N80Guja3kJ3CnERUzdHPkRKfdGYxldeiF/SPlyiHaK8VIrOL6WHN9Chhft4NqxFqRNl9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D56C4CECF;
	Tue, 26 Nov 2024 15:31:50 +0000 (UTC)
Date: Tue, 26 Nov 2024 10:32:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: kernel test robot <lkp@intel.com>, Peter Zijlstra
 <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:trace/for-next 5/6] kernel/sched/pelt.c:479:50: sparse:
 sparse: dereference of noderef expression
Message-ID: <20241126103239.36f2d698@gandalf.local.home>
In-Reply-To: <7309278e-2e9b-44d2-94e4-22474d5cffd1@efficios.com>
References: <202411261119.Lj0iQ4LZ-lkp@intel.com>
	<7309278e-2e9b-44d2-94e4-22474d5cffd1@efficios.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 Nov 2024 09:06:13 -0500
Mathieu Desnoyers <mathieu.desnoyers@efficios.com> wrote:

> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
> > head:   ef0d4186083127d2f99ed04e051fd94ba061d253
> > commit: 98bf0fbb65226809a8df4d1948c5b6cf0c91590f [5/6] tracing: Remove conditional locking from __DO_TRACE()
> > config: x86_64-randconfig-122-20241125 (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261119.Lj0iQ4LZ-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202411261119.Lj0iQ4LZ-lkp@intel.com/  
> 
> Peter ? I have no clue why the bot complains about my commit. It looks
> unrelated to tracing and more about the scheduler, but perhaps I'm
> missing something.

I think it has something to do with the scoped_guard(), as when I added
your latest patch, the warnings go away. Perhaps it has to do with that
dangling "else".

You can safely ignore these warnings.

-- Steve
