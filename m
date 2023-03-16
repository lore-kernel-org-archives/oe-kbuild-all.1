Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C9620EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 07:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD5DC433D2;
	Thu, 16 Mar 2023 07:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1678952578;
	bh=WOkzqfJSo1YlCjySRpVzuqh9a4WHgpc0FcPS8hihNxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8ZWU7rM3n3BnNuDUv0VSxjSpE1Pd5TNNedUXwa7hL99v+W4QlDj7QUnwUnepzEVG
	 pBtk/eULo17dPwG1ZlOudINUMfi83KGfJ23Ty6SfrgXvAtGoVr8dCmr2eBOR+hfGqa
	 GJK45NYqtVAG4CTiML0uIXRkaplT2J3VUtFP0P8Q=
Date: Thu, 16 Mar 2023 08:42:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Qais Yousef <qyousef@layalina.io>
Cc: kernel test robot <lkp@intel.com>, Qais Yousef <qais.yousef@arm.com>,
	oe-kbuild-all@lists.linux.dev, Sasha Levin <sashal@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: [linux-stable-rc:queue/5.10 96/108]
 kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named
 'cpu_capacity_inverted'
Message-ID: <ZBLIgL0ZSEHElN4r@kroah.com>
References: <202303151800.NP9tJsgK-lkp@intel.com>
 <20230315124404.3266l6k3ygsyempp@airbuntu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315124404.3266l6k3ygsyempp@airbuntu>

On Wed, Mar 15, 2023 at 12:44:04PM +0000, Qais Yousef wrote:
> On 03/15/23 19:01, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
> > head:   e6a15a9d1bcf661f6bb79a1c2dce0c796234ac80
> > commit: db4f76185823d00afb688cbd63fdf7200de209ea [96/108] sched/fair: Detect capacity inversion
> > config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230315/202303151800.NP9tJsgK-lkp@intel.com/config)
> > compiler: riscv64-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=db4f76185823d00afb688cbd63fdf7200de209ea
> >         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
> >         git fetch --no-tags linux-stable-rc queue/5.10
> >         git checkout db4f76185823d00afb688cbd63fdf7200de209ea
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash kernel/
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Link: https://lore.kernel.org/oe-kbuild-all/202303151800.NP9tJsgK-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from kernel/sched/core.c:13:
> >    kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
> > >> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
> >     2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
> >          |                           ^~
> >    kernel/sched/core.c: In function 'ttwu_stat':
> >    kernel/sched/core.c:2430:20: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
> >     2430 |         struct rq *rq;
> >          |                    ^~
> > --
> >    In file included from kernel/sched/loadavg.c:9:
> >    kernel/sched/sched.h: In function 'cpu_in_capacity_inversion':
> > >> kernel/sched/sched.h:2560:27: error: 'struct rq' has no member named 'cpu_capacity_inverted'
> >     2560 |         return cpu_rq(cpu)->cpu_capacity_inverted;
> >          |                           ^~
> 
> Need to extend the #ifdef CONFIG_SMP to wrap the new functioin
> 
> 	diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> 	index 10b717533f62..852e856eed48 100644
> 	--- a/kernel/sched/sched.h
> 	+++ b/kernel/sched/sched.h
> 	@@ -2540,7 +2540,6 @@ static inline unsigned long capacity_orig_of(int cpu)
> 	 {
> 		return cpu_rq(cpu)->cpu_capacity_orig;
> 	 }
> 	-#endif
> 
> 	 /*
> 	  * Returns inverted capacity if the CPU is in capacity inversion state.
> 	@@ -2559,6 +2558,7 @@ static inline unsigned long cpu_in_capacity_inversion(int cpu)
> 	 {
> 		return cpu_rq(cpu)->cpu_capacity_inverted;
> 	 }
> 	+#endif
> 
> 	 /**
> 	  * enum schedutil_type - CPU utilization type
> 
> Should I resend with the fix applied?

Yeah, I'm going to drop all of these patches from the queues now as it
is causing lots of build regressions (as you've seen.)  Please resend a
working set of patches and I will be glad to queue them up in a future
release.

thanks,

greg k-h
