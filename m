Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293157E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 03:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731813602; cv=none; b=SsHNTDNrhGhot0GHUyZGUPWxZnnDe/40AiAZGm3DXUQgJPYA9HzV2RKWjnf/kU5J/jBzbU1mboxSPvsJ4tPkfLgMficGjy2bOzRCNpHefqdxcQLy2Wf4xOfdHqcwkQ0CP8DWh4MFo73cBrcOoe/sYzpu0qRvRGdtiRo8wnNO5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731813602; c=relaxed/simple;
	bh=IfFoEkDNjcI1S58MPYoY48z9hZGxMjOqYgLqWECDbAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KSCbHUyuIDKZPNxpshzAiU/g6nEBEEJSOnMCtapHYV5gcpMn7fRYbpV2B6SXiz0msGbPtO2Cxy6kcjcjNAkfByZqCrJT/SCqOVYhNCUE5CVybqt5Ogy9VxpOGiQlHpMtrGu/Ki/FV/O7Mkt6k9ng+v8+gTn7+C8Y+42ZBA/i2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETYpEQi+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETYpEQi+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5208C4CED6;
	Sun, 17 Nov 2024 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731813601;
	bh=IfFoEkDNjcI1S58MPYoY48z9hZGxMjOqYgLqWECDbAc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ETYpEQi+dl85pUt8EGEeniNrD9AS5Kn7i2IP1Yls+/Nv/AJ8MJ1eGvOUf+D4EjAOP
	 SX15ZepxyCycThODAfgAt2LL4A16qGRGpJoqZBolKtlu56yCDwk2YAYhSVEXD78XJ9
	 kQBR6CwEM0LmD77uuQ6xr4YxutBmd0jpvL6mBu+ivKD06+0xkD+Nal8Efda63IlHgp
	 x0dLezoRnntpkIKMcnTHcmNEgsKyIwY2MzaHoHNH8YXvCizlKpZmTlYgfAc1ydZgZ1
	 zx7yGeabqIAk83IzSKQUjqAByUeTyFhlcqx7BqJB1M/4L4drHhCwjkicRWDxBJi34c
	 p4U4alpdYQbzA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 583BECE0A73; Sat, 16 Nov 2024 19:20:01 -0800 (PST)
Date: Sat, 16 Nov 2024 19:20:01 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2024.11.11a 57/57] ERROR: modpost:
 "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <2865de48-b9e4-4746-ab28-0e645ab97d1d@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202411170515.xn5afSbv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202411170515.xn5afSbv-lkp@intel.com>

On Sun, Nov 17, 2024 at 05:36:37AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2024.11.11a
> head:   b97695352d2b790045081e2c9afe32736f5ae3d6
> commit: b97695352d2b790045081e2c9afe32736f5ae3d6 [57/57] rcutorture: Include grace-period sequence numbers in failure/close-call
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170515.xn5afSbv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411170515.xn5afSbv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!

Good catch!  Does the following updated version of that commit fix
things for you?

dce261566c2a ("rcutorture: Include grace-period sequence numbers in failure/close-call")

And thank you for your testing efforts!

							Thanx, Paul

------------------------------------------------------------------------

commit dce261566c2a67b8e088a6c6ed1e8a1d68e3c5b0
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Thu Nov 14 13:55:32 2024 -0800

    rcutorture: Include grace-period sequence numbers in failure/close-call
    
    This commit includes the grace-period sequence numbers at the beginning
    and end of each segment in the "Failure/close-call rcutorture reader
    segments" list.  These are in hexadecimal, and only the bottom byte.
    Currently, only RCU is supported, with its three sequence numbers (normal,
    expedited, and polled).
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/kernel/rcu/rcu.h b/kernel/rcu/rcu.h
index 2909662c805f5..dfcec925013e8 100644
--- a/kernel/rcu/rcu.h
+++ b/kernel/rcu/rcu.h
@@ -590,6 +590,8 @@ void do_trace_rcu_torture_read(const char *rcutorturename,
 #endif
 static inline void rcu_gp_set_torture_wait(int duration) { }
 #endif
+unsigned long rcutorture_gather_gp_seqs(void);
+void rcutorture_format_gp_seqs(unsigned long seqs, char *cp);
 
 #ifdef CONFIG_TINY_SRCU
 
diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index 79689a14359a9..de8f7f9ed99cd 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -273,6 +273,8 @@ struct rt_read_seg {
 	bool rt_preempted;
 	int rt_cpu;
 	int rt_end_cpu;
+	unsigned long rt_gp_seq;
+	unsigned long rt_gp_seq_end;
 };
 static int err_segs_recorded;
 static struct rt_read_seg err_segs[RCUTORTURE_RDR_MAX_SEGS];
@@ -407,6 +409,8 @@ struct rcu_torture_ops {
 	void (*gp_slow_register)(atomic_t *rgssp);
 	void (*gp_slow_unregister)(atomic_t *rgssp);
 	bool (*reader_blocked)(void);
+	unsigned long (*gather_gp_seqs)(void);
+	void (*format_gp_seqs)(unsigned long seqs, char *cp);
 	long cbflood_max;
 	int irq_capable;
 	int can_boost;
@@ -611,6 +615,8 @@ static struct rcu_torture_ops rcu_ops = {
 	.reader_blocked		= IS_ENABLED(CONFIG_RCU_TORTURE_TEST_LOG_CPU)
 				  ? has_rcu_reader_blocked
 				  : NULL,
+	.gather_gp_seqs		= rcutorture_gather_gp_seqs,
+	.format_gp_seqs		= rcutorture_format_gp_seqs,
 	.irq_capable		= 1,
 	.can_boost		= IS_ENABLED(CONFIG_RCU_BOOST),
 	.extendables		= RCUTORTURE_MAX_EXTEND,
@@ -656,6 +662,8 @@ static struct rcu_torture_ops rcu_busted_ops = {
 	.sync		= synchronize_rcu_busted,
 	.exp_sync	= synchronize_rcu_busted,
 	.call		= call_rcu_busted,
+	.gather_gp_seqs	= rcutorture_gather_gp_seqs,
+	.format_gp_seqs	= rcutorture_format_gp_seqs,
 	.irq_capable	= 1,
 	.extendables	= RCUTORTURE_MAX_EXTEND,
 	.name		= "busted"
@@ -1989,6 +1997,12 @@ static void rcutorture_one_extend(int *readstate, int newstate, bool insoftirq,
 				rtrsp[-1].rt_preempted = cur_ops->reader_blocked();
 		}
 	}
+	// Sample grace-period sequence number, as good a place as any.
+	if (cur_ops->gather_gp_seqs) {
+		rtrsp->rt_gp_seq = cur_ops->gather_gp_seqs();
+		if (!first)
+			rtrsp[-1].rt_gp_seq_end = rtrsp->rt_gp_seq;
+	}
 
 	/*
 	 * Next, remove old protection, in decreasing order of strength
@@ -3664,6 +3678,14 @@ rcu_torture_cleanup(void)
 				else
 					pr_cont(" ...");
 			}
+			if (cur_ops->gather_gp_seqs && cur_ops->format_gp_seqs) {
+				char buf1[16+1];
+				char buf2[16+1];
+
+				cur_ops->format_gp_seqs(err_segs[i].rt_gp_seq, buf1);
+				cur_ops->format_gp_seqs(err_segs[i].rt_gp_seq_end, buf2);
+				pr_cont(" %s-%s", buf1, buf2);
+			}
 			if (err_segs[i].rt_delay_ms != 0) {
 				pr_cont(" %s%ldms", firsttime ? "" : "+",
 					err_segs[i].rt_delay_ms);
diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
index b3b3ce34df631..f068bd9dc0376 100644
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@ -257,6 +257,20 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 EXPORT_SYMBOL_GPL(kvfree_call_rcu);
 #endif
 
+#ifdef CONFIG_RCU_TORTURE_TEST
+unsigned long rcutorture_gather_gp_seqs(void)
+{
+	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xff;
+}
+EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
+
+void rcutorture_format_gp_seqs(unsigned long seqs, char *cp)
+{
+	snprintf(cp, 8, "g%02lx", seqs & 0xff);
+}
+EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
+#endif
+
 void __init rcu_init(void)
 {
 	open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 976b31778273b..aeceac2ea29ee 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -559,6 +559,26 @@ void rcutorture_get_gp_data(int *flags, unsigned long *gp_seq)
 }
 EXPORT_SYMBOL_GPL(rcutorture_get_gp_data);
 
+/* Gather grace-period sequence numbers for rcutorture diagnostics. */
+unsigned long rcutorture_gather_gp_seqs(void)
+{
+	return ((READ_ONCE(rcu_state.gp_seq) & 0xff) << 16) |
+	       ((READ_ONCE(rcu_state.expedited_sequence) & 0xff) << 8) |
+	       (READ_ONCE(rcu_state.gp_seq_polled) & 0xff);
+}
+EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
+
+/* Format grace-period sequence numbers for rcutorture diagnostics. */
+void rcutorture_format_gp_seqs(unsigned long seqs, char *cp)
+{
+	unsigned int egp = (seqs >> 8) & 0xff;
+	unsigned int ggp = (seqs >> 16) & 0xff;
+	unsigned int pgp = seqs & 0xff;
+
+	snprintf(cp, 16, "g%02x:e%02x:p%02x", ggp, egp, pgp);
+}
+EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
+
 #if defined(CONFIG_NO_HZ_FULL) && (!defined(CONFIG_GENERIC_ENTRY) || !defined(CONFIG_KVM_XFER_TO_GUEST_WORK))
 /*
  * An empty function that will trigger a reschedule on
