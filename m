Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087DCEC0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 15:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB53EC433D2;
	Sat, 13 May 2023 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683990694;
	bh=pR4RXgNA+/+KjsSrCT4MQ28a3vJH47KkHXVp9PB3kKk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gjBSYIL7Is7/Y6iRml8LqVndMiGe65qw8Ah/jdq9qXSDQ2xKGZUNo/qdkIgMpPP2T
	 wLkwOwwxeWHBV7TInS3pgHe0EzVDLAOw7LSlV4fzYKh1A0Dtmixo7Y8m6ZXv6YmqW5
	 RQUlu5k/0gLfSM8MghKa45j7+VUr13Ix6tWs1YvGrEkWArdgcZCvIzJHqxGJfpOTK2
	 hVdlKeyLx1TqiBaCpeC+pOiu4e4YgxkDe8RIAapssEsOjURzG9Ri1ytXxK8Dhoopdi
	 BVy6kx63tuUuwSIRTPhO6oDCTc4VSP6F+ofCEsMoOrsQ8LyfDT0zng+qcAp2mOibqt
	 uNwtthcgVriGA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 49C78CE001B; Sat, 13 May 2023 08:11:34 -0700 (PDT)
Date: Sat, 13 May 2023 08:11:34 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	rpearsonhpe@gmail.com
Subject: Re: [linux-next:master 1574/2056]
 drivers/infiniband/sw/rxe/rxe_verbs.c:1359:21: error: macro "kfree_rcu"
 requires 2 arguments, but only 1 given
Message-ID: <cb631139-8116-4f18-b850-4959a8f11067@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202305130903.yugzGgvD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202305130903.yugzGgvD-lkp@intel.com>

On Sat, May 13, 2023 at 09:53:01AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   e922ba281a8d84f640d8c8e18a385d032c19e185
> commit: 7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6 [1574/2056] rcu/kvfree: Eliminate k[v]free_rcu() single argument macro
> config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20230513/202305130903.yugzGgvD-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build):
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 7e3f926bf4538cb4988b3e3f8bc1cb4a603b2ef6
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=x86_64 olddefconfig
>         make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/sw/rxe/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202305130903.yugzGgvD-lkp@intel.com/

The fix for this was recently in -next.  Should we push a fix up through
-rcu?  The default approach is of course to change that kfree_rcu()
to kfree_rcu_mightsleep().

							Thanx, Paul

> Note: the linux-next/master HEAD e922ba281a8d84f640d8c8e18a385d032c19e185 builds fine.
>       It may have been fixed somewhere.
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/infiniband/sw/rxe/rxe_verbs.c: In function 'rxe_dereg_mr':
> >> drivers/infiniband/sw/rxe/rxe_verbs.c:1359:21: error: macro "kfree_rcu" requires 2 arguments, but only 1 given
>     1359 |         kfree_rcu(mr);
>          |                     ^
>    In file included from include/linux/rculist.h:11,
>                     from include/linux/pid.h:5,
>                     from include/linux/sched.h:14,
>                     from include/linux/ratelimit.h:6,
>                     from include/linux/dev_printk.h:16,
>                     from include/linux/device.h:15,
>                     from include/linux/dma-mapping.h:7,
>                     from drivers/infiniband/sw/rxe/rxe_verbs.c:7:
>    include/linux/rcupdate.h:986: note: macro "kfree_rcu" defined here
>      986 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
>          | 
> >> drivers/infiniband/sw/rxe/rxe_verbs.c:1359:9: error: 'kfree_rcu' undeclared (first use in this function); did you mean 'kfree_skb'?
>     1359 |         kfree_rcu(mr);
>          |         ^~~~~~~~~
>          |         kfree_skb
>    drivers/infiniband/sw/rxe/rxe_verbs.c:1359:9: note: each undeclared identifier is reported only once for each function it appears in
> 
> 
> vim +/kfree_rcu +1359 drivers/infiniband/sw/rxe/rxe_verbs.c
> 
> 8700e3e7c4857d2 Moni Shoua  2016-06-16  1342  
> 5bf944f24129cbc Bob Pearson 2023-03-03  1343  static int rxe_dereg_mr(struct ib_mr *ibmr, struct ib_udata *udata)
> 5bf944f24129cbc Bob Pearson 2023-03-03  1344  {
> 5bf944f24129cbc Bob Pearson 2023-03-03  1345  	struct rxe_mr *mr = to_rmr(ibmr);
> 5bf944f24129cbc Bob Pearson 2023-03-03  1346  	int err, cleanup_err;
> 5bf944f24129cbc Bob Pearson 2023-03-03  1347  
> 5bf944f24129cbc Bob Pearson 2023-03-03  1348  	/* See IBA 10.6.7.2.6 */
> 5bf944f24129cbc Bob Pearson 2023-03-03  1349  	if (atomic_read(&mr->num_mw) > 0) {
> 5bf944f24129cbc Bob Pearson 2023-03-03  1350  		err = -EINVAL;
> 5bf944f24129cbc Bob Pearson 2023-03-03  1351  		rxe_dbg_mr(mr, "mr has mw's bound");
> 5bf944f24129cbc Bob Pearson 2023-03-03  1352  		goto err_out;
> 5bf944f24129cbc Bob Pearson 2023-03-03  1353  	}
> 5bf944f24129cbc Bob Pearson 2023-03-03  1354  
> 5bf944f24129cbc Bob Pearson 2023-03-03  1355  	cleanup_err = rxe_cleanup(mr);
> 5bf944f24129cbc Bob Pearson 2023-03-03  1356  	if (cleanup_err)
> 5bf944f24129cbc Bob Pearson 2023-03-03  1357  		rxe_err_mr(mr, "cleanup failed, err = %d", cleanup_err);
> 5bf944f24129cbc Bob Pearson 2023-03-03  1358  
> 5bf944f24129cbc Bob Pearson 2023-03-03 @1359  	kfree_rcu(mr);
> 5bf944f24129cbc Bob Pearson 2023-03-03  1360  	return 0;
> 5bf944f24129cbc Bob Pearson 2023-03-03  1361  
> 5bf944f24129cbc Bob Pearson 2023-03-03  1362  err_out:
> 5bf944f24129cbc Bob Pearson 2023-03-03  1363  	rxe_err_mr(mr, "returned err = %d", err);
> 5bf944f24129cbc Bob Pearson 2023-03-03  1364  	return err;
> 5bf944f24129cbc Bob Pearson 2023-03-03  1365  }
> 5bf944f24129cbc Bob Pearson 2023-03-03  1366  
> 
> :::::: The code at line 1359 was first introduced by commit
> :::::: 5bf944f24129cbc4b5828348bdce2db94ca9fbd6 RDMA/rxe: Add error messages
> 
> :::::: TO: Bob Pearson <rpearsonhpe@gmail.com>
> :::::: CC: Jason Gunthorpe <jgg@nvidia.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
