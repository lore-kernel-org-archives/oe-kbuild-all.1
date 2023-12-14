Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78AE5B20A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdMTdNSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E07C433C9;
	Thu, 14 Dec 2023 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702565612;
	bh=zKtsxzg5ewuuUfmH3dtP4m+8v7AC4l/Rsgp+zoFSlTk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OdMTdNSdsBedHYfA/km55tpAhoPxGuQ5C3sv3H802YR71x9Rq8caFZzBTTcxz6iLO
	 gJIVA/eifhNKgRNFwtDt2s+orbzO2eOryvXk8wf3LY6iG07r3DoAYmTi9bKMR7YfsG
	 YkWChjsvnOXi4MkNnl4Z/TnXZu9fyNAJwe63YVaSAZw8vE44fZx3PEmjkBtPNNDZfM
	 aiAkx/SsAyONpl+nZy0s2sHFAeaxRgcMvGK7q5TTyrowX6kERmTdqCQB0Jj5a2wOmm
	 LFa6mGiO803X71Z2nrR4O39bdQicckiVSFzvOruc3AcPAJFUcrx1K9U2kmVbiE+z7Y
	 0EvR2nkopVQXA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A482FCE0DDE; Thu, 14 Dec 2023 06:53:31 -0800 (PST)
Date: Thu, 14 Dec 2023 06:53:31 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Neeraj Upadhyay (AMD)" <neeraj.iitr10@gmail.com>,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: [linux-next:master 6386/7300]
 kernel/rcu/tree.c:2965:(.text+0x5b44): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <f42f90f3-8cc8-4bb7-8455-685e699eb2ae@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202312140939.zA3tdSi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202312140939.zA3tdSi2-lkp@intel.com>

On Thu, Dec 14, 2023 at 09:25:29AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
> commit: 4e58aaeebb3c27993c734c99eae6881b196b1ddb [6386/7300] rcu: Restrict access to RCU CPU stall notifiers
> config: csky-randconfig-r013-20230826 (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140939.zA3tdSi2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202312140939.zA3tdSi2-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/tree.o: in function `drain_page_cache':
> >> kernel/rcu/tree.c:2965:(.text+0x5b44): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'

I have questions.  ;-)

Is this something that I need to fix, or is this a problem with the
csky toolchain?  If it is something that I need to fix, how exactly do
I fix it?

							Thanx, Paul

>    kernel/rcu/tree.c:2968:(.text+0x5b5c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.o: in function `kfree_rcu_shrink_scan':
>    kernel/rcu/tree.c:3476:(.text+0x5b6a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.o: in function `rcu_do_batch':
>    kernel/rcu/tree.c:2102:(.text+0x5be6): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.c:2117:(.text+0x5c06): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.c:2119:(.text+0x5c22): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.c:2135:(.text+0x5c66): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.c:2144:(.text+0x5ca2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.o: in function `rcu_lock_acquire':
> >> include/linux/rcupdate.h:301:(.text+0x5cb2): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    include/linux/rcupdate.h:301:(.text+0x5cce): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
>    kernel/rcu/tree.o: in function `rcu_lock_release':
>    include/linux/rcupdate.h:306:(.text+0x5cee): additional relocation overflows omitted from the output
> 
> 
> vim +2965 kernel/rcu/tree.c
> 
> 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2951) 
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2952  static int
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2953  drain_page_cache(struct kfree_rcu_cpu *krcp)
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2954  {
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2955  	unsigned long flags;
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2956  	struct llist_node *page_list, *pos, *n;
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2957  	int freed = 0;
> 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2958) 
> 6b706e5603c44f Zqiang                  2023-04-18  2959  	if (!rcu_min_cached_objs)
> 6b706e5603c44f Zqiang                  2023-04-18  2960  		return 0;
> 6b706e5603c44f Zqiang                  2023-04-18  2961  
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2962  	raw_spin_lock_irqsave(&krcp->lock, flags);
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2963  	page_list = llist_del_all(&krcp->bkvcache);
> ac7625ebd5f7ba Uladzislau Rezki (Sony  2021-04-15  2964) 	WRITE_ONCE(krcp->nr_bkv_objs, 0);
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15 @2965  	raw_spin_unlock_irqrestore(&krcp->lock, flags);
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2966  
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2967  	llist_for_each_safe(pos, n, page_list) {
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2968  		free_page((unsigned long)pos);
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2969  		freed++;
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2970  	}
> 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2971) 
> d0bfa8b3c411e2 Zhang Qiang             2021-04-15  2972  	return freed;
> 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2973) }
> 53c72b590b3a0a Uladzislau Rezki (Sony  2020-05-25  2974) 
> 
> :::::: The code at line 2965 was first introduced by commit
> :::::: d0bfa8b3c411e25e014e4131d2804afe29c440a6 kvfree_rcu: Release a page cache under memory pressure
> 
> :::::: TO: Zhang Qiang <qiang.zhang@windriver.com>
> :::::: CC: Paul E. McKenney <paulmck@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
