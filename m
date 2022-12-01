Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4316FD7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Dec 2022 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD8A5C433C1;
	Thu,  1 Dec 2022 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669911029;
	bh=00EWjxjJ8Ij5TncIK8+fdbNgzFaYVkHrZBxJABbqoNg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nUJiSbpEu7Qfp1st8wj19MH/zNdn9YzM3mUNIInUhA+s9dF3thVKwdtdiLtPJcAz+
	 b8+fyNeqHj/1LB10hDeoV7i+Aka9Jh9ySuxNoRnYsmhkLAx/xwwhnTKDIOfvMK5OoP
	 t1dVxu4cRVBX1d5izH3VG/6Dvzd56ZeTCWLAJqk65UkmXDYwRWicZrBwGQtpEH627V
	 DaQceslyvnscV11+tOLLNRQYkfn9m6s9E2kaUWVEpzuj2AemdIqoatm118mjfR1/St
	 kaWREgfhZgOnJFU6C7LPuG3nQDjm0zD10p49+MvMpDpd61Gn2A4Ycj3SogyJdy+OcX
	 jRxqbxOkjuFiw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 66C585C0584; Thu,  1 Dec 2022 08:10:29 -0800 (PST)
Date: Thu, 1 Dec 2022 08:10:29 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [ammarfaizi2-block:paulmck/linux-rcu/dev.2022.11.22a 48/78]
 kernel/rcu/tasks.h:256:17: error: implicit declaration of function
 'raw_spin_lock_rcu_node'; did you mean 'raw_spin_lock_init'?
Message-ID: <20221201161029.GH4001@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <202212012318.367zcc3d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212012318.367zcc3d-lkp@intel.com>

On Thu, Dec 01, 2022 at 11:50:44PM +0800, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2022.11.22a
> head:   92cc9d759e41acfeaacc577aba0128dc4b06dab6
> commit: 4e3f7d2e042040d2ae511efaadb17e62c30d395c [48/78] rcu: Make SRCU mandatory
> config: i386-randconfig-m021-20221128
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>         # https://github.com/ammarfaizi2/linux-block/commit/4e3f7d2e042040d2ae511efaadb17e62c30d395c
>         git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>         git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2022.11.22a
>         git checkout 4e3f7d2e042040d2ae511efaadb17e62c30d395c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/update.c:605:
>    kernel/rcu/tasks.h: In function 'cblist_init_generic':
> >> kernel/rcu/tasks.h:256:17: error: implicit declaration of function 'raw_spin_lock_rcu_node'; did you mean 'raw_spin_lock_init'? [-Werror=implicit-function-declaration]
>      256 |                 raw_spin_lock_rcu_node(rtpcp); // irqs already disabled.
>          |                 ^~~~~~~~~~~~~~~~~~~~~~
>          |                 raw_spin_lock_init

This should be fixed in 0cd7e350abc4 ("rcu: Make SRCU mandatory"),
shown below.  The fix is specifically the changes in #if conditions
in kernel/rcu/rcu.h.

							Thanx, Paul

------------------------------------------------------------------------

commit 0cd7e350abc40eed5d3b60292dc102f700c88388
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Nov 22 13:53:57 2022 -0800

    rcu: Make SRCU mandatory
    
    Kernels configured with CONFIG_PRINTK=n and CONFIG_SRCU=n get build
    failures.  This causes trouble for deep embedded systems.  But given
    that there are more than 25 instances of "select SRCU" in the kernel,
    it is hard to believe that there are many kernels running in production
    without SRCU.  This commit therefore makes SRCU mandatory.  The SRCU
    Kconfig option remains for backwards compatibility, and will be removed
    when it is no longer used.
    
    [ paulmck: Update per kernel test robot feedback. ]
    
    Reported-by: John Ogness <john.ogness@linutronix.de>
    Reported-by: Petr Mladek <pmladek@suse.com>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Cc: <linux-arch@vger.kernel.org>
    Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
    Reviewed-by: John Ogness <john.ogness@linutronix.de>

diff --git a/include/linux/rcutiny.h b/include/linux/rcutiny.h
index 768196a5f39d6..d40b21ec7e0da 100644
--- a/include/linux/rcutiny.h
+++ b/include/linux/rcutiny.h
@@ -154,11 +154,7 @@ static inline bool rcu_preempt_need_deferred_qs(struct task_struct *t)
 	return false;
 }
 static inline void rcu_preempt_deferred_qs(struct task_struct *t) { }
-#ifdef CONFIG_SRCU
 void rcu_scheduler_starting(void);
-#else /* #ifndef CONFIG_SRCU */
-static inline void rcu_scheduler_starting(void) { }
-#endif /* #else #ifndef CONFIG_SRCU */
 static inline void rcu_end_inkernel_boot(void) { }
 static inline bool rcu_inkernel_boot_has_ended(void) { return true; }
 static inline bool rcu_is_watching(void) { return true; }
diff --git a/include/linux/srcu.h b/include/linux/srcu.h
index f0814ffca34bb..9b9d0bbf1d3cf 100644
--- a/include/linux/srcu.h
+++ b/include/linux/srcu.h
@@ -47,11 +47,8 @@ int init_srcu_struct(struct srcu_struct *ssp);
 #include <linux/srcutiny.h>
 #elif defined(CONFIG_TREE_SRCU)
 #include <linux/srcutree.h>
-#elif defined(CONFIG_SRCU)
-#error "Unknown SRCU implementation specified to kernel configuration"
 #else
-/* Dummy definition for things like notifiers.  Actual use gets link error. */
-struct srcu_struct { };
+#error "Unknown SRCU implementation specified to kernel configuration"
 #endif
 
 void call_srcu(struct srcu_struct *ssp, struct rcu_head *head,
@@ -78,11 +75,7 @@ static inline void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
 }
 #endif /* CONFIG_NEED_SRCU_NMI_SAFE */
 
-#ifdef CONFIG_SRCU
 void srcu_init(void);
-#else /* #ifdef CONFIG_SRCU */
-static inline void srcu_init(void) { }
-#endif /* #else #ifdef CONFIG_SRCU */
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 
diff --git a/kernel/rcu/Kconfig b/kernel/rcu/Kconfig
index f53ad63b2bc63..1b0d79b2f5fa0 100644
--- a/kernel/rcu/Kconfig
+++ b/kernel/rcu/Kconfig
@@ -54,21 +54,17 @@ config RCU_EXPERT
 	  Say N if you are unsure.
 
 config SRCU
-	bool
-	help
-	  This option selects the sleepable version of RCU. This version
-	  permits arbitrary sleeping or blocking within RCU read-side critical
-	  sections.
+	def_bool y
 
 config TINY_SRCU
 	bool
-	default y if SRCU && TINY_RCU
+	default y if TINY_RCU
 	help
 	  This option selects the single-CPU non-preemptible version of SRCU.
 
 config TREE_SRCU
 	bool
-	default y if SRCU && !TINY_RCU
+	default y if !TINY_RCU
 	help
 	  This option selects the full-fledged version of SRCU.
 
@@ -77,7 +73,6 @@ config NEED_SRCU_NMI_SAFE
 
 config TASKS_RCU_GENERIC
 	def_bool TASKS_RCU || TASKS_RUDE_RCU || TASKS_TRACE_RCU
-	select SRCU
 	help
 	  This option enables generic infrastructure code supporting
 	  task-based RCU implementations.  Not for manual selection.
diff --git a/kernel/rcu/Kconfig.debug b/kernel/rcu/Kconfig.debug
index 1b0c41d490f05..232e29fe3e5ec 100644
--- a/kernel/rcu/Kconfig.debug
+++ b/kernel/rcu/Kconfig.debug
@@ -27,7 +27,6 @@ config RCU_SCALE_TEST
 	tristate "performance tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
-	select SRCU
 	default n
 	help
 	  This option provides a kernel module that runs performance
@@ -43,7 +42,6 @@ config RCU_TORTURE_TEST
 	tristate "torture tests for RCU"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
-	select SRCU
 	default n
 	help
 	  This option provides a kernel module that runs torture tests
@@ -59,7 +57,6 @@ config RCU_REF_SCALE_TEST
 	tristate "Scalability tests for read-side synchronization (RCU and others)"
 	depends on DEBUG_KERNEL
 	select TORTURE_TEST
-	select SRCU
 	default n
 	help
 	  This option provides a kernel module that runs performance tests
diff --git a/kernel/rcu/rcu.h b/kernel/rcu/rcu.h
index be5979da07f59..1f7ca484483a1 100644
--- a/kernel/rcu/rcu.h
+++ b/kernel/rcu/rcu.h
@@ -286,7 +286,7 @@ void rcu_test_sync_prims(void);
  */
 extern void resched_cpu(int cpu);
 
-#if defined(CONFIG_SRCU) || !defined(CONFIG_TINY_RCU)
+#if !defined(CONFIG_TINY_RCU)
 
 #include <linux/rcu_node_tree.h>
 
@@ -375,6 +375,10 @@ extern void rcu_init_geometry(void);
 	     (cpu) <= rnp->grphi; \
 	     (cpu) = rcu_find_next_bit((rnp), (cpu) + 1 - (rnp->grplo), (mask)))
 
+#endif /* !defined(CONFIG_TINY_RCU) */
+
+#if !defined(CONFIG_TINY_RCU) || defined(CONFIG_TASKS_RCU_GENERIC)
+
 /*
  * Wrappers for the rcu_node::lock acquire and release.
  *
@@ -437,7 +441,7 @@ do {									\
 #define raw_lockdep_assert_held_rcu_node(p)				\
 	lockdep_assert_held(&ACCESS_PRIVATE(p, lock))
 
-#endif /* #if defined(CONFIG_SRCU) || !defined(CONFIG_TINY_RCU) */
+#endif // #if !defined(CONFIG_TINY_RCU) || defined(CONFIG_TASKS_RCU_GENERIC)
 
 #ifdef CONFIG_TINY_RCU
 /* Tiny RCU doesn't expedite, as its purpose in life is instead to be tiny. */
diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
index 738842c4886b2..f5e6a2f95a2a0 100644
--- a/kernel/rcu/update.c
+++ b/kernel/rcu/update.c
@@ -224,7 +224,7 @@ void rcu_test_sync_prims(void)
 	synchronize_rcu_expedited();
 }
 
-#if !defined(CONFIG_TINY_RCU) || defined(CONFIG_SRCU)
+#if !defined(CONFIG_TINY_RCU)
 
 /*
  * Switch to run-time mode once RCU has fully initialized.
@@ -239,7 +239,7 @@ static int __init rcu_set_runtime_mode(void)
 }
 core_initcall(rcu_set_runtime_mode);
 
-#endif /* #if !defined(CONFIG_TINY_RCU) || defined(CONFIG_SRCU) */
+#endif /* #if !defined(CONFIG_TINY_RCU) */
 
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 static struct lock_class_key rcu_lock_key;
@@ -559,10 +559,8 @@ static void early_boot_test_call_rcu(void)
 	struct early_boot_kfree_rcu *rhp;
 
 	call_rcu(&head, test_callback);
-	if (IS_ENABLED(CONFIG_SRCU)) {
-		early_srcu_cookie = start_poll_synchronize_srcu(&early_srcu);
-		call_srcu(&early_srcu, &shead, test_callback);
-	}
+	early_srcu_cookie = start_poll_synchronize_srcu(&early_srcu);
+	call_srcu(&early_srcu, &shead, test_callback);
 	rhp = kmalloc(sizeof(*rhp), GFP_KERNEL);
 	if (!WARN_ON_ONCE(!rhp))
 		kfree_rcu(rhp, rh);
@@ -585,11 +583,9 @@ static int rcu_verify_early_boot_tests(void)
 	if (rcu_self_test) {
 		early_boot_test_counter++;
 		rcu_barrier();
-		if (IS_ENABLED(CONFIG_SRCU)) {
-			early_boot_test_counter++;
-			srcu_barrier(&early_srcu);
-			WARN_ON_ONCE(!poll_state_synchronize_srcu(&early_srcu, early_srcu_cookie));
-		}
+		early_boot_test_counter++;
+		srcu_barrier(&early_srcu);
+		WARN_ON_ONCE(!poll_state_synchronize_srcu(&early_srcu, early_srcu_cookie));
 	}
 	if (rcu_self_test_counter != early_boot_test_counter) {
 		WARN_ON(1);
