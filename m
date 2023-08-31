Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2BF11CBA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 16:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC838C433C8;
	Thu, 31 Aug 2023 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693498938;
	bh=JrMZKx4CpXJp7uU1vEvb0IgYXij8rPo+tfyY+LtuhXs=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Q6RGFzLtIZ9qOUnC/GL4Vr+bAtTPCFR8ggUlJHJ50Phb95qSFofROmX3nQ0TuVdm5
	 MayToVDYej5OgrHS9EKDfnCCUwKbVSBVnUnLROx1BpsAxAsKbOzDrMsEPlIMVY0txw
	 DznCF+1N7ls/UP0jOqjz1E7RpGNY1H7vi8IVL+ox2a1w4yypkzHI9kPMYTV6U5XAWz
	 SKkUFyneKBoPuldDNL/aqQ5x9ChIaQpNViFq8YLy3qWBxwierQJXE5dw34xD0FvciB
	 KxbOfvdxLRF8E8+GnOIpWM/H63C2U1S1CrLQ0cc8Td+ZC/Ds6GAEdS+VCeHIl4z7/c
	 73g6YcnzrkD8g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9BE5FCE0737; Thu, 31 Aug 2023 09:22:17 -0700 (PDT)
Date: Thu, 31 Aug 2023 09:22:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmck-rcu:dev.2023.08.22a 63/69]
 kernel/locking/locktorture.c:294:20-23: ERROR: t is NULL but dereferenced.
 (fwd)
Message-ID: <7c706521-1e20-44da-91a7-e71f238a235e@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <e24280d0-dfbb-f4f-64aa-9f50268450b@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e24280d0-dfbb-f4f-64aa-9f50268450b@inria.fr>

On Thu, Aug 31, 2023 at 11:01:02AM +0200, Julia Lawall wrote:
> Maybe a ! has been forgotton on line 290?

Right you are, and thank you!

I will go get my brown paper bag.  ;-)

							Thanx, Paul

> julia
> 
> ---------- Forwarded message ----------
> Date: Thu, 31 Aug 2023 10:46:56 +0800
> From: kernel test robot <lkp@intel.com>
> To: oe-kbuild@lists.linux.dev
> Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
> Subject: [paulmck-rcu:dev.2023.08.22a 63/69]
>     kernel/locking/locktorture.c:294:20-23: ERROR: t is NULL but dereferenced.
> 
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: "Paul E. McKenney" <paulmck@kernel.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev.2023.08.22a
> head:   354957ec11dc80eac68c4b1e10c237d69adc1833
> commit: 758918804e0d5216981df3cef99ffd7ba0842192 [63/69] locktorture: Add indication of task write-holding lock
> :::::: branch date: 6 days ago
> :::::: commit date: 7 days ago
> config: i386-randconfig-053-20230831 (https://download.01.org/0day-ci/archive/20230831/202308311022.j7jKnIdL-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20230831/202308311022.j7jKnIdL-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Julia Lawall <julia.lawall@inria.fr>
> | Closes: https://lore.kernel.org/r/202308311022.j7jKnIdL-lkp@intel.com/
> 
> cocci warnings: (new ones prefixed by >>)
> >> kernel/locking/locktorture.c:294:20-23: ERROR: t is NULL but dereferenced.
>    kernel/locking/locktorture.c:294:43-47: ERROR: t is NULL but dereferenced.
> 
> vim +294 kernel/locking/locktorture.c
> 
> bdd8d60bd4047a Paul E. McKenney 2023-08-23  284
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  285  static int torture_spin_lock_dump(struct notifier_block *nb, unsigned long v, void *ptr)
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  286  {
> 758918804e0d52 Paul E. McKenney 2023-08-23  287  	struct task_struct *t = READ_ONCE(lock_is_write_held);
> 758918804e0d52 Paul E. McKenney 2023-08-23  288
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  289  	pr_alert("%s invoked: v=%lu, duration=%lu.\n", __func__, v, (unsigned long)ptr);
> 758918804e0d52 Paul E. McKenney 2023-08-23  290  	if (t) {
> 758918804e0d52 Paul E. McKenney 2023-08-23  291  		pr_alert("%s No task holding lock.\n", __func__);
> 758918804e0d52 Paul E. McKenney 2023-08-23  292  	} else {
> 758918804e0d52 Paul E. McKenney 2023-08-23  293  		pr_alert("%s Lock held by task %ps %d %*s\n",
> 758918804e0d52 Paul E. McKenney 2023-08-23 @294  			 __func__, t, t->pid, TASK_COMM_LEN, t->comm);
> 758918804e0d52 Paul E. McKenney 2023-08-23  295  		sched_show_task(t);
> 758918804e0d52 Paul E. McKenney 2023-08-23  296  	}
> bdd8d60bd4047a Paul E. McKenney 2023-08-23  297  	spinlock_dump(&torture_spinlock, true);
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  298  	return NOTIFY_OK;
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  299  }
> 94a8fb5e4673d7 Paul E. McKenney 2023-08-22  300
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
