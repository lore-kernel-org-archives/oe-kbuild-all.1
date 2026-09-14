Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBB548A8A7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Sep 2026 15:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398658; cv=none; b=e+ddhSKic4qMeHSEIRJ7Vmgt2PoYGhiGDE94FIWF8Te8SUkSDHmqSvcN5AxjhnFOkaddJPdE3KApofTxvyTje2+UANXJ51VwwTMm52TOtqdZ+CJgYQABSfJIKE6nU+DYHlktZbuok9GHBB4egT+eENVCbqKIft/XseRiHyXua+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398658; c=relaxed/simple;
	bh=GMACxyYVLcZhcqd0qN4EbB4TIGe72Bnx187PyGjo2rY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AowrtL+1yEqDEoaWXC4JI/Gnu07vs+WD0G6L/rcTSZng4aEsA+leeJEmpuuMF6gDcQUEA14tYQzaCsh5wEJ3Awv+iIOe7tPIBJAjKqsPem4yVX1hNnxu+8v1FNHNaxITUR/v8Q9NMK9r9oiVg6U+hq+IApRAXYPCFyi+i5SHeow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jf5UCHHT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jf5UCHHT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67371F00898;
	Mon, 14 Sep 2026 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398656;
	bh=JJW2UlADqsB3xnlyJZaNAdzdNyzmCH4HkwVjBjpw+ZM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=Jf5UCHHTl1iiwg4NQCp6FKqASPva06eyw6My5bMyB1j0ma8p8N8dNUN+zHroNH3Mh
	 BSB3Ba5OxrXOB58O6kTp+26sR+Ffy+spp/wstgJDsTFm069GpfTUiB/zVgyzum6A2T
	 pdfhJw270d8au7ACVbj+v5hv6e4XrahRYLXnRDakiIJngdWozm8EYskNpNkeQU1RoH
	 YDrnYkuGVk7SNs2TUk06RdXypqab9ReuuWPz3CEkj13O692AoMKPBKMNlBecM8xHIY
	 zMK6JyLiNw8kUqTYfaYEMTrlcHLIgfRMizDL+jqwGEsQBBfZg2yTbiiRxpcGJNXZFc
	 XHTmiP3w+2egA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BC1F4CE10F1; Mon, 14 Sep 2026 08:10:55 -0700 (PDT)
Date: Mon, 14 Sep 2026 08:10:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.09.09a 42/56]
 kernel/rcu/tree_stall.h:332:29: error: implicit declaration of function
 'rt_mutex_owner'; did you mean 'rt_mutex_init'?
Message-ID: <23c8718d-fdc7-49fb-baaf-e4175f8659a5@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609112046.0850pdpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609112046.0850pdpM-lkp@intel.com>

On Fri, Sep 11, 2026 at 08:41:51PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2026.09.09a
> head:   d61d9b5dd56c6cf72b70bb5fb52b213ead9f7765
> commit: e33488c41be623f7c7ef5b8763e20c45f1364d1c [42/56] rcu: Add running and boosted indications to RCU task stall dump
> config: s390-randconfig-r133-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112046.0850pdpM-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 11.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112046.0850pdpM-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609112046.0850pdpM-lkp@intel.com/

Good catch, thank you!  The alleged fix is here:

9a63263e1a4a ("squash! rcu: Add running and boosted indications to RCU task stall dump")

Or please see the corresponding patch at the end of this email.

							Thanx, Paul

> All error/warnings (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/tree.c:5112:
>    kernel/rcu/tree_stall.h: In function 'check_slow_task':
> >> kernel/rcu/tree_stall.h:332:29: error: implicit declaration of function 'rt_mutex_owner'; did you mean 'rt_mutex_init'? [-Werror=implicit-function-declaration]
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                             ^~~~~~~~~~~~~~
>          |                             rt_mutex_init
> >> kernel/rcu/tree_stall.h:332:69: warning: comparison between pointer and integer
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                                                                     ^~
>    In file included from kernel/rcu/tree_plugin.h:14,
>                     from kernel/rcu/tree.c:5115:
>    kernel/rcu/../locking/rtmutex_common.h: At top level:
> >> kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting types for 'rt_mutex_owner'; have 'struct task_struct *(struct rt_mutex_base *)'
>      231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
>          |                                   ^~~~~~~~~~~~~~
>    In file included from kernel/rcu/tree.c:5112:
>    kernel/rcu/tree_stall.h:332:29: note: previous implicit declaration of 'rt_mutex_owner' with type 'int()'
>      332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>          |                             ^~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> 
> vim +332 kernel/rcu/tree_stall.h
> 
>    311	
>    312	/*
>    313	 * Report out the state of a not-running task that is stalling the
>    314	 * current RCU grace period.
>    315	 */
>    316	static int check_slow_task(struct task_struct *t, void *arg)
>    317	{
>    318		struct rcu_node *rnp;
>    319		struct rcu_stall_chk_rdr *rscrp = arg;
>    320	
>    321		if (task_curr(t))
>    322			return -EBUSY; // It is running, so decline to inspect it.
>    323		rscrp->nesting = t->rcu_read_lock_nesting;
>    324		rscrp->rs = t->rcu_read_unlock_special;
>    325		rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
>    326		rscrp->rcu_rdr_running = task_curr(t);
>    327		rscrp->rcu_rdr_boosted = 0;
>    328		if (rscrp->on_blkd_list) {
>    329			rnp = READ_ONCE(t->rcu_blocked_node);
>    330			raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
>    331			if (rnp == READ_ONCE(t->rcu_blocked_node)) {
>  > 332				if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
>    333					rscrp->rcu_rdr_boosted = 1;
>    334			} else {
>    335				rscrp->rcu_rdr_boosted = 2;
>    336			}
>    337			raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
>    338		}
>    339		return 0;
>    340	}
>    341	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

commit 9a63263e1a4ad44bc9ea4a6ad233abd47c0c835c
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Fri Sep 11 10:08:47 2026 -0700

    squash! rcu: Add running and boosted indications to RCU task stall dump
    
    [ paulmck: Apply kernel test robot feedback. ]
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index fae30294841f..5dded1e89197 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -11,6 +11,7 @@
 #include <linux/kvm_para.h>
 #include <linux/rcu_notifier.h>
 #include <linux/smp.h>
+#include <linux/rtmutex.h>
 
 //////////////////////////////////////////////////////////////////////////////
 //
