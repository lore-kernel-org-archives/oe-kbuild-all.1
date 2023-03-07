Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937CFBA3E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Mar 2023 17:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62ECCC433EF;
	Tue,  7 Mar 2023 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678210645;
	bh=hwBzmn6pp1mWDaPUtpbmEmQiUDyC6Iu20WHdhOw5kp4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=KQGbSSw0O51PAZKcZw0/dPkD45xseynI0G42h2vj+fCGG1yyk4L28dNPCAW/yr/iY
	 myyl4YNT2ty30dzoBTHE6XJ8olaRYZsNq4rKpGCctgz7fSxBMAWLH061jCPyUNjUKg
	 0IXqzRBqSVeTO3/bVrZ19Cad/eFz+2xxsaN//kFx2lhEvRXVCtkTkWYQ5jby5fg/R4
	 UEp+iH5h5qtAnfcM+p+JzudTgFDGosTvstHcU4hU3louVDN/S0w6PV6h56WCvwnoZV
	 p+GuIk3mIR9+QwBhH05UVGwycxRTxf3ulJn06hw0VAGdJjDh1N6s8cVJyhR/xb/0wh
	 e/jTEPY5qv96A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 103675C01E4; Tue,  7 Mar 2023 09:37:25 -0800 (PST)
Date: Tue, 7 Mar 2023 09:37:25 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2023.02.27a 108/108]
 kernel/rcu/rcutorture.c:3289: undefined reference to `set_nmi_torture'
Message-ID: <20230307173725.GK1301832@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202303071217.ajqvt2rz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303071217.ajqvt2rz-lkp@intel.com>

On Tue, Mar 07, 2023 at 01:03:43PM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2023.02.27a
> head:   b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
> commit: b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007 [108/108] rcutorture: Test NMI diagnostics
> config: arm-randconfig-r006-20230305 (https://download.01.org/0day-ci/archive/20230307/202303071217.ajqvt2rz-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/ammarfaizi2/linux-block/commit/b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2023.02.27a
>         git checkout b171cbcbbd8e5f5f2e0638c5b5b5c77e3cc79007
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303071217.ajqvt2rz-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    arm-linux-gnueabi-ld: kernel/rcu/rcutorture.o: in function `rcutorture_test_nmis':
> >> kernel/rcu/rcutorture.c:3289: undefined reference to `set_nmi_torture'
> >> arm-linux-gnueabi-ld: kernel/rcu/rcutorture.c:3301: undefined reference to `set_nmi_torture'

This was me accidentally putting an x86-only not-for-mainline diagnostic
patch on the -rcu tree's "dev" branch.  I reset the "dev" branch to
avoid this.

							Thanx, Paul

> vim +3289 kernel/rcu/rcutorture.c
> 
>   3281	
>   3282	static void rcutorture_test_nmis(int n)
>   3283	{
>   3284	#if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
>   3285		int cpu;
>   3286		int dumpcpu;
>   3287		int i;
>   3288	
> > 3289		set_nmi_torture(nmi_delay, nmi_halt1, nmi_halt2, nmi_halt3);
>   3290		for (i = 0; i < n; i++) {
>   3291			preempt_disable();
>   3292			cpu = smp_processor_id();
>   3293			dumpcpu = cpu + 1;
>   3294			if (dumpcpu >= nr_cpu_ids)
>   3295				dumpcpu = 0;
>   3296			pr_alert("%s: CPU %d invoking dump_cpu_task(%d)\n", __func__, cpu, dumpcpu);
>   3297			dump_cpu_task(dumpcpu);
>   3298			preempt_enable();
>   3299			schedule_timeout_uninterruptible(15 * HZ);
>   3300		}
> > 3301		set_nmi_torture(0, false, false, false);
>   3302	#else // #if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
>   3303		WARN_ONCE(n, "Non-zero rcutorture.test_nmis=%d permitted only when rcutorture is built in.\n", test_nmis);
>   3304	#endif // #else // #if IS_BUILTIN(CONFIG_RCU_TORTURE_TEST)
>   3305	}
>   3306	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
