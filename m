Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5023443A9F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786397259; cv=none; b=FP7yFfdirRFhRPbG872Z/ZLi+4bDzHUzdlidHUj6g8EWBW8itBsgDUV90CRp/2fMUTKi3l8LBLJPM8gS0HpHw3TSqDXat2CRcvUX0nBBtWr6IS9ztlCioq379HjzNMZsA2WXjsX1DOG7i+LMNorvaG/0SITPHqT9JxxO49tmBLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786397259; c=relaxed/simple;
	bh=sQnIxa/MPTGieCAZHrc92cMnrJq5TucQl4fWdwY62ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2OEk322MQxhkrhKi+ZLhrpMMg8TSjGhHlvf9db9uXiuaR7r3o0sAkEh37qK57Ya1gc/7VqRrqBdj7Xhyir6ujCzuRriJiJdGzjivNrvos8mlLEojceZQeEl/O2ilv8l3kyYbasqJUDWOBJ3QBxBOOXHvcHS22dXi+rCJz7J2Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VbPjDjgh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbPjDjgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543E31F000E9;
	Mon, 10 Aug 2026 21:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786397258;
	bh=RvGt8QPiiQYKT33nWAPC591/owLber++NSO0RTej25E=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=VbPjDjgh0ie2oeIf1Okcp5wITfwMAaiII987mYy5Lv1EoCxKlhwPnFK1dBgC9lg3z
	 cNRX/vGAYOL8g77a2oB/y64PbZkg88VmzRSxBgSK8VwGaCDs0BLbDQKl31gFdfa/8v
	 PkxGiVU+2uUwtsjwEZ9MR6xGS9VwwL34LVDdiDv48mWFnbJBl/IzihBhedqvkny12U
	 f2N95gxP/ZOazdEX2eFLQnR+dw9LpVqdO233eC3dQLZbFjZBc0EOFTP1nZM9SLkuAQ
	 20rFuI/7jLoRTA4DaRKSX4hDwbEpS4u8AMInWX+QPGTBCv4ZZtQoErcMbpK+tYo/Si
	 CEOu9ZhLIfUqg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 084DACE1BF7; Mon, 10 Aug 2026 14:27:38 -0700 (PDT)
Date: Mon, 10 Aug 2026 14:27:38 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.03.24a 22/31]
 kernel/rcu/hazptrtorture.c:508:7: error: implicit declaration of function
 'torture_sched_setaffinity'; did you mean 'torture_sched_set_normal'?
Message-ID: <ea9ddee8-319e-4e4e-b631-4a08e1b2e212@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202608110436.QhdFI1Er-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608110436.QhdFI1Er-lkp@intel.com>

On Tue, Aug 11, 2026 at 04:57:59AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2026.03.24a
> head:   8600e98cae614a9336f54a79ea5c152b14369076
> commit: 16ad40d1089c5f212d7d87babc2376284f3bf244 [22/31] fixup! torture: Add a hazptrtorture.c stress test
> config: sparc64-randconfig-002-20260811 (https://download.01.org/0day-ci/archive/20260811/202608110436.QhdFI1Er-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260811/202608110436.QhdFI1Er-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608110436.QhdFI1Er-lkp@intel.com/
> 
> Note: the paulmckrcu/dev.2026.03.24a HEAD 8600e98cae614a9336f54a79ea5c152b14369076 builds fine.
>       It only hurts bisectability.
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/hazptrtorture.c: In function 'hazptr_torture_preempt':
> >> kernel/rcu/hazptrtorture.c:508:7: error: implicit declaration of function 'torture_sched_setaffinity'; did you mean 'torture_sched_set_normal'? [-Werror=implicit-function-declaration]
>       if (torture_sched_setaffinity(current->pid, cpumask_of(cpu), false))
>           ^~~~~~~~~~~~~~~~~~~~~~~~~
>           torture_sched_set_normal
>    cc1: some warnings being treated as errors

Thank you for the testing, but I have long since folded this commit into
the buggy one.  Which *should* have taken care of this.  *Should*.  ;-)

							Thanx, Paul

> vim +508 kernel/rcu/hazptrtorture.c
> 
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  491  
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  492  // Randomly preempt online CPUs.
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  493  static int hazptr_torture_preempt(void *unused)
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  494  {
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  495  	int cpu = -1;
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  496  	DEFINE_TORTURE_RANDOM(rand);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  497  
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  498  	schedule_timeout_idle(onoff_holdoff * HZ);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  499  	do {
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  500  		// Wait for preempt_interval ms with up to 100us fuzz.
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  501  		torture_hrtimeout_ms(preempt_interval, 100, &rand);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  502  		// Select online CPU.
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  503  		cpu = cpumask_next(cpu, cpu_online_mask);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  504  		if (cpu >= nr_cpu_ids)
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  505  			cpu = cpumask_next(-1, cpu_online_mask);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  506  		WARN_ON_ONCE(cpu >= nr_cpu_ids);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  507  		// Move to that CPU, if can't do so, retry later.
> 26cca1d546bd55 Paul E. McKenney 2026-03-24 @508  		if (torture_sched_setaffinity(current->pid, cpumask_of(cpu), false))
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  509  			continue;
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  510  		// Preempt at high-ish priority, then reset to normal.
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  511  		sched_set_fifo(current);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  512  		torture_sched_setaffinity(current->pid, cpu_present_mask, true);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  513  		mdelay(preempt_duration);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  514  		sched_set_normal(current, 0);
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  515  		stutter_wait("hazptr_torture_preempt");
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  516  	} while (!torture_must_stop());
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  517  	torture_kthread_stopping("hazptr_torture_preempt");
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  518  	return 0;
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  519  }
> 26cca1d546bd55 Paul E. McKenney 2026-03-24  520  
> 
> :::::: The code at line 508 was first introduced by commit
> :::::: 26cca1d546bd557fdda0d8d6000dfcb80da759ab torture: Add a hazptrtorture.c stress test
> 
> :::::: TO: Paul E. McKenney <paulmck@kernel.org>
> :::::: CC: Paul E. McKenney <paulmck@kernel.org>
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
