Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A455F2BFC60
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 23:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787095146; cv=none; b=Q4s2kNKJQZNrj/pTpXvOYDIqukYd2zQzmxKKKqfaKiZtzq9UsmYjD14hA2WKeJkfpAUNirBWsBWL0iM520OuZeNgXDJjrVR1ByCXClhlZ3v+NQ3+iQMMlyoCRjdet0baUJPECcAHeowfxpxv7pFIFskJO9PH6NiI5AywrQ6YA7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787095146; c=relaxed/simple;
	bh=wN8LyteSkx8yvXRtruSGC5Zu20b8LlE6PCVv75gL8+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0ebQpEcmTChx+XFK27uOVhxd5vMVvVK2LtQTDpsea4xm42QCW1+s/hmce52DapeF3yiT1HCNZWBbdWoFO09zjOQsUSPYIiRg6hU3NIQ08XimC/IeIwCSJgBIYiu3qj+UQBsVpYL66IV91mqioF6QO07I9ssUhypsCefuUYwYIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg5rK8hn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg5rK8hn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D101F000E9;
	Tue, 18 Aug 2026 23:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787095145;
	bh=GneT8VLO4q0qYvdHw+7XGPW1mNrdY8wKU7AlNKd3T+g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=lg5rK8hnVRcdoFwq0WmbT0rfs5rsoJrrsma2MsOulvRWs8sMcFyYFEZ+gL5bDGlYg
	 EFykNMdYkbXYdOTEAY3b3cjmxJ97n52iB2yDodN6oTIxK7/1USwiSfbUgnuwLePWBB
	 YAM/ptt6nlibGk6N9Fr0GtSDgNosMIng/ctVu07E6FSmOcmLn2syj+Ik6hWfrwHe4s
	 yjaEPIBewCJkzW3JZ6qIXhHoyokhB/v4DsecuzFaGTglmb2BijOt54jThloMLegJtR
	 1mg5rQoZKhiaU8FtTa0zvvXkbNID8BFHfJgeRneez4osDjtEumEfmjhLNGdelSCbkc
	 0PynwPu1Wchwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8CC78CE1623; Tue, 18 Aug 2026 16:19:04 -0700 (PDT)
Date: Tue, 18 Aug 2026 16:19:04 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:non-rcu/next 39/40] include/linux/hrtimer.h:355:16:
 sparse: sparse: incorrect type in return expression (different modifiers)
Message-ID: <a3953bb5-ca5c-42ea-b78c-8c60be0982d7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202608131347.dXTHYsI1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608131347.dXTHYsI1-lkp@intel.com>

On Thu, Aug 13, 2026 at 01:39:51PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux non-rcu/next
> head:   e39a12053df0951120ff6283177e0d5179feda45
> commit: c3d1cae06fc1ad9b6948fa0ca8a93415607ea8b1 [39/40] hrtimer: Mark the hrtimer_sleeper structure's ->task field __private
> config: arc-randconfig-r132-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131347.dXTHYsI1-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 13.4.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131347.dXTHYsI1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608131347.dXTHYsI1-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    kernel/time/sleep_timeout.c: note: in included file (through include/linux/alarmtimer.h, include/linux/posix-timers.h, include/linux/sched/signal.h):
> >> include/linux/hrtimer.h:355:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct task_struct * @@     got struct task_struct [noderef] * @@

Thank you for the testing!

Does the patch below clear things up for you?

							Thanx, Paul

------------------------------------------------------------------------

commit 6597c140656fe857a51debfd684e66e09636fa45
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue Aug 18 16:17:47 2026 -0700

    squash! hrtimer: Mark the hrtimer_sleeper structure's ->task field __private
    
    [ paulmck: Apply kernel test robot feedback. ]
    
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>

diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
index 5c04423e8e900b..b919ee508fb494 100644
--- a/include/linux/hrtimer.h
+++ b/include/linux/hrtimer.h
@@ -73,7 +73,7 @@ enum hrtimer_mode {
  */
 struct hrtimer_sleeper {
 	struct hrtimer timer;
-	struct task_struct __private *task;
+	struct task_struct *__private task;
 };
 
 static inline void hrtimer_set_expires(struct hrtimer *timer, ktime_t time)
