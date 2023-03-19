Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F031E4E7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Mar 2023 17:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50344C433EF;
	Sun, 19 Mar 2023 17:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679246787;
	bh=4oAmGtme2U4KToos8gPVYRpJj6p0LqbdTtw+RcWeIpQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=UPrMfo+EycH4JahQKM13t+opxJIZekeZqJ01p9XWwqQZ+1lZ+fTLCYcLfEonZuj+i
	 FZo3shunRpqNE5FImj0sPkTe0soUw3odKm+vMVkdCRSNMJMeADovzbOHX0X7/fMRrq
	 CQpQKcItrhq/6SONUIt+S39zX+m0avkN7Rc8wnCgWvEkSzGZ8S0HCTZEGShCwywoew
	 D65rH0dEZeWvzv/jf02fAlHPkMqJWp5PkbIDFrOGpYQo7a8veKWYgbn5oQkZvAbfLQ
	 ILc+B6Mi4R9K8eG0yIvnHfvjeiPw8PBhul48sZsbyVYCthyJfRUMFGpRJux0QEjS1O
	 /rJXzg+j+QOuQ==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id CCD301540381; Sun, 19 Mar 2023 10:26:26 -0700 (PDT)
Date: Sun, 19 Mar 2023 10:26:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [paulmck-rcu:dev.2023.03.17a 33/38] kernel/rcu/tasks.h:140:20:
 warning: 'tasks_rcu_exit_srcu' defined but not used
Message-ID: <0dfe1c60-0167-45b1-80fb-5f5400c2b1fe@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202303191536.XzMSyzTl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303191536.XzMSyzTl-lkp@intel.com>

On Sun, Mar 19, 2023 at 03:05:43PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.03.17a
> head:   19d218a4b125a4dce12eb88097a9c55f7126ce8c
> commit: 61eea4556e8cf92d4c9b483110a679d2652aa451 [33/38] srcu: Move work-scheduling fields from srcu_struct to srcu_usage
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230319/202303191536.XzMSyzTl-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/commit/?id=61eea4556e8cf92d4c9b483110a679d2652aa451
>         git remote add paulmck-rcu https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
>         git fetch --no-tags paulmck-rcu dev.2023.03.17a
>         git checkout 61eea4556e8cf92d4c9b483110a679d2652aa451
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303191536.XzMSyzTl-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from include/linux/srcu.h:49,
>                     from include/linux/notifier.h:16,
>                     from arch/x86/include/asm/uprobes.h:13,
>                     from include/linux/uprobes.h:49,
>                     from include/linux/mm_types.h:16,
>                     from include/linux/sched/signal.h:13,
>                     from kernel/rcu/update.c:26:
> >> kernel/rcu/tasks.h:140:20: warning: 'tasks_rcu_exit_srcu' defined but not used [-Wunused-variable]
>      140 | DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
>          |                    ^~~~~~~~~~~~~~~~~~~
>    include/linux/srcutree.h:184:38: note: in definition of macro '__DEFINE_SRCU'
>      184 |         is_static struct srcu_struct name =                                                     \
>          |                                      ^~~~
>    kernel/rcu/tasks.h:140:1: note: in expansion of macro 'DEFINE_STATIC_SRCU'
>      140 | DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
>          | ^~~~~~~~~~~~~~~~~~

It is true that if you build a kernel with CONFIG_TASKS_RCU_GENERIC=y and
CONFIG_TASKS_RCU=n, you will get this warning.  I am at a loss as to why
this commit would have changed that, but in any case it does need a fix.

Thank you for catching it!

							Thanx, Paul

> vim +/tasks_rcu_exit_srcu +140 kernel/rcu/tasks.h
> 
> 07e105158d97b4 Paul E. McKenney 2020-03-02  138  
> eacd6f04a13331 Paul E. McKenney 2020-03-02  139  /* Track exiting tasks in order to allow them to be waited for. */
> eacd6f04a13331 Paul E. McKenney 2020-03-02 @140  DEFINE_STATIC_SRCU(tasks_rcu_exit_srcu);
> eacd6f04a13331 Paul E. McKenney 2020-03-02  141  
> 
> :::::: The code at line 140 was first introduced by commit
> :::::: eacd6f04a1333187dd3e96e5635c0edce0a2e354 rcu-tasks: Move Tasks RCU to its own file
> 
> :::::: TO: Paul E. McKenney <paulmck@kernel.org>
> :::::: CC: Paul E. McKenney <paulmck@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
