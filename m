Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CCE2AB42
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jun 2023 23:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDF3C433C8;
	Tue, 20 Jun 2023 23:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687303995;
	bh=VHWEOUgqjOjLbUl1qwzP+wJ1O0Ure9aNYcbtXUbSdpk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=P9x6ivUyakAg5YnDmCu3QNDpdQcbKqLLfPsuAylJieT953FPvlnl9aHWrb3dfiIdC
	 b+1DyIuwXppJ5KXzGDG2jfOTb0Bppy+plbrs6QIDnokGlCGk9ofqOIVh/ZzeKx/9vZ
	 RERCcsuuD+j9A3ivzZZee+bFxO0L8JgWCj0QqfjPeIQZbcVOgY80/kcOh/u4Sacubg
	 O/4LgKxtOOoKblFzt59OFPo3GLDD4j2eefWUdhB83C5RoPm++6jn3iUJQbuNW4Mah2
	 YfBZrCyvf/PZ5XxzlJlDOKMHyVR/7H3BzBa+7wb7RlvuFHng9qTYyxyjHCGTRkj7U1
	 6RMphl0hB/Xig==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8FFA8CE2311; Tue, 20 Jun 2023 16:33:14 -0700 (PDT)
Date: Tue, 20 Jun 2023 16:33:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 7728/11071] kernel/rcu/rcuscale.c:301:27:
 error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did
 you mean 'get_rcu_tasks_trace_gp_kthread'?
Message-ID: <2d68cbf4-ef8e-44e9-a6f7-dbd27ca0ac70@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202306210727.vqY7wkdG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306210727.vqY7wkdG-lkp@intel.com>

On Wed, Jun 21, 2023 at 07:28:01AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
> commit: df8fa2f1fc4c20cd300855a11b31ba5565f45ac6 [7728/11071] rcuscale: Measure RCU Tasks Trace grace-period kthread CPU time
> config: microblaze-randconfig-r003-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210727.vqY7wkdG-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210727.vqY7wkdG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306210727.vqY7wkdG-lkp@intel.com/
> 
> Note: the linux-next/master HEAD 9dbf40840551df336c95ce2a3adbdd25ed53c0ef builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/rcu/rcuscale.c:301:27: error: 'get_rcu_tasks_gp_kthread' undeclared here (not in a function); did you mean 'get_rcu_tasks_trace_gp_kthread'?
>      301 |         .rso_gp_kthread = get_rcu_tasks_gp_kthread,
>          |                           ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                           get_rcu_tasks_trace_gp_kthread

This should be fixed by Arnd's commit in -rcu:

d22c97e39866 ("rcuscale: fix building with RCU_TINY")

Please let me know if this one does not do the trick.

							Thanx, Paul

> vim +301 kernel/rcu/rcuscale.c
> 
>    289	
>    290	static struct rcu_scale_ops tasks_ops = {
>    291		.ptype		= RCU_TASKS_FLAVOR,
>    292		.init		= rcu_sync_scale_init,
>    293		.readlock	= tasks_scale_read_lock,
>    294		.readunlock	= tasks_scale_read_unlock,
>    295		.get_gp_seq	= rcu_no_completed,
>    296		.gp_diff	= rcu_seq_diff,
>    297		.async		= call_rcu_tasks,
>    298		.gp_barrier	= rcu_barrier_tasks,
>    299		.sync		= synchronize_rcu_tasks,
>    300		.exp_sync	= synchronize_rcu_tasks,
>  > 301		.rso_gp_kthread	= get_rcu_tasks_gp_kthread,
>    302		.name		= "tasks"
>    303	};
>    304	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
