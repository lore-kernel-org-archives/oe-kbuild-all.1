Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3121213240
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836434; cv=none; b=Of+kFIbtg24lingsgW7PrqG/Pjq+Js/76LRSj7XfYoiMe5bMiJlpj3VFphXzMkPgSgAixAeSc/3kGPpZ3PCz9gJosF/Rj192r8hyyvDJ8+PdKleI/iCNz+73H0qUKWAvMqg7iMzbyB/AWoG6ESHnOAvPFOJFKu3GCae2ibbruNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836434; c=relaxed/simple;
	bh=MXo6zkZHLCcMzelM44mkjNVux1sw6YOK3+QXottlTuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHpa598DI+fOnY6oJQP1AvJCfF7IAJDHTO4PXHFr4PssRJim9UZgkK8lSZyGa11EZay5nzOGNmei6ux3F51kGIP+jAwGXM51Y+tOXOOrAa+7vS1eXhPwhgEPwY52gtAAr1n8B0SW5HOEo+CGO6q6EbAHiadTTY7afcv/hk2uTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNTN7zf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNTN7zf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92254C4CEDD;
	Thu,  6 Feb 2025 10:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738836434;
	bh=MXo6zkZHLCcMzelM44mkjNVux1sw6YOK3+QXottlTuQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=lNTN7zf6JWUFHb7apYRJcS4pggv0Z19NQpujteMeSKg5e2CVCYXwsVGQwL05Le4Uc
	 +v0JjRdaelEMK//LI5cWRhFLLR5nnZREnTRc1F9Xdg4Y3IuJDAzjmk8KogLHrhaTDz
	 WSzhvwzzi1ABBeI62GsPjGX1LJaQXHHfcHC2WVJcNVCVe9M6nSWDkcSDBVkgDm4btF
	 klvwoPPn4vwho08UTADmavFuxLsaMK1DguIpAzThj/R1Bgc8l4/tmQ8mC0wm0T+cKy
	 B6ge+Ss0XM91QsgCgOay/VRX7OvYGCXcnDdnAs7RWdjcCKlrUWgHPwP/nGq6LeqXaB
	 HwJIAbC8/wEog==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 3EE05CE0809; Thu,  6 Feb 2025 02:07:14 -0800 (PST)
Date: Thu, 6 Feb 2025 02:07:14 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [rcu:torture.2025.02.04a 1/10] kernel/rcu/rcutorture.c:1152:40:
 error: implicit declaration of function 'get_torture_init_jiffies'
Message-ID: <4b06fcb8-d14f-4c32-85d8-a351bd57316c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502060922.xbvw2iso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502060922.xbvw2iso-lkp@intel.com>

On Thu, Feb 06, 2025 at 09:17:57AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git torture.2025.02.04a
> head:   7b4389d6456ab5bca223c6cd4829724d984c8511
> commit: 65c7582d8315f7f0451eac635d803b2def726d44 [1/10] rcutorture: Add a test_boost_holdoff module parameter
> config: i386-buildonly-randconfig-006-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060922.xbvw2iso-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060922.xbvw2iso-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502060922.xbvw2iso-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/rcutorture.c: In function 'rcu_read_delay':
>    kernel/rcu/rcutorture.c:445:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
>      445 |         unsigned long long ts;
>          |                            ^~
>    kernel/rcu/rcutorture.c:442:23: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
>      442 |         unsigned long completed;
>          |                       ^~~~~~~~~
>    kernel/rcu/rcutorture.c:441:23: warning: variable 'started' set but not used [-Wunused-but-set-variable]
>      441 |         unsigned long started;
>          |                       ^~~~~~~

These are set but not used when the do_trace_rcu_torture_read()
function is empty, and have been for quite some time.  This commit did
not change this.  I can of course add __maybe_unused, but I am curious
why it attributed these to this commit.

>    kernel/rcu/rcutorture.c: In function 'rcu_torture_boost':
> >> kernel/rcu/rcutorture.c:1152:40: error: implicit declaration of function 'get_torture_init_jiffies' [-Werror=implicit-function-declaration]
>     1152 |         unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
>          |                                        ^~~~~~~~~~~~~~~~~~~~~~~~

You lost me on this one.  There is a declaration in torture.h that
should be visible here.

>    kernel/rcu/rcutorture.c: In function 'rcu_torture_one_read':
>    kernel/rcu/rcutorture.c:2140:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
>     2140 |         unsigned long long ts;
>          |                            ^~
>    cc1: some warnings being treated as errors

As above, can add __maybe_unused.  Though this local variable is going
away soon anyway.  ;-)

							Thanx, Paul

> vim +/get_torture_init_jiffies +1152 kernel/rcu/rcutorture.c
> 
>   1145	
>   1146	static int rcu_torture_boost(void *arg)
>   1147	{
>   1148		unsigned long endtime;
>   1149		unsigned long gp_state;
>   1150		unsigned long gp_state_time;
>   1151		unsigned long oldstarttime;
> > 1152		unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
>   1153	
>   1154		if (test_boost_holdoff <= 0 || time_after(jiffies, booststarttime)) {
>   1155			VERBOSE_TOROUT_STRING("rcu_torture_boost started");
>   1156		} else {
>   1157			VERBOSE_TOROUT_STRING("rcu_torture_boost started holdoff period");
>   1158			while (time_before(jiffies, booststarttime)) {
>   1159				schedule_timeout_idle(HZ);
>   1160				if (kthread_should_stop())
>   1161					goto cleanup;
>   1162			}
>   1163			VERBOSE_TOROUT_STRING("rcu_torture_boost finished holdoff period");
>   1164		}
>   1165	
>   1166		/* Set real-time priority. */
>   1167		sched_set_fifo_low(current);
>   1168	
>   1169		/* Each pass through the following loop does one boost-test cycle. */
>   1170		do {
>   1171			bool failed = false; // Test failed already in this test interval
>   1172			bool gp_initiated = false;
>   1173	
>   1174			if (kthread_should_stop())
>   1175				goto checkwait;
>   1176	
>   1177			/* Wait for the next test interval. */
>   1178			oldstarttime = READ_ONCE(boost_starttime);
>   1179			while (time_before(jiffies, oldstarttime)) {
>   1180				schedule_timeout_interruptible(oldstarttime - jiffies);
>   1181				if (stutter_wait("rcu_torture_boost"))
>   1182					sched_set_fifo_low(current);
>   1183				if (torture_must_stop())
>   1184					goto checkwait;
>   1185			}
>   1186	
>   1187			// Do one boost-test interval.
>   1188			endtime = oldstarttime + test_boost_duration * HZ;
>   1189			while (time_before(jiffies, endtime)) {
>   1190				// Has current GP gone too long?
>   1191				if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
>   1192					failed = rcu_torture_boost_failed(gp_state, &gp_state_time);
>   1193				// If we don't have a grace period in flight, start one.
>   1194				if (!gp_initiated || cur_ops->poll_gp_state(gp_state)) {
>   1195					gp_state = cur_ops->start_gp_poll();
>   1196					gp_initiated = true;
>   1197					gp_state_time = jiffies;
>   1198				}
>   1199				if (stutter_wait("rcu_torture_boost")) {
>   1200					sched_set_fifo_low(current);
>   1201					// If the grace period already ended,
>   1202					// we don't know when that happened, so
>   1203					// start over.
>   1204					if (cur_ops->poll_gp_state(gp_state))
>   1205						gp_initiated = false;
>   1206				}
>   1207				if (torture_must_stop())
>   1208					goto checkwait;
>   1209			}
>   1210	
>   1211			// In case the grace period extended beyond the end of the loop.
>   1212			if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
>   1213				rcu_torture_boost_failed(gp_state, &gp_state_time);
>   1214	
>   1215			/*
>   1216			 * Set the start time of the next test interval.
>   1217			 * Yes, this is vulnerable to long delays, but such
>   1218			 * delays simply cause a false negative for the next
>   1219			 * interval.  Besides, we are running at RT priority,
>   1220			 * so delays should be relatively rare.
>   1221			 */
>   1222			while (oldstarttime == READ_ONCE(boost_starttime) && !kthread_should_stop()) {
>   1223				if (mutex_trylock(&boost_mutex)) {
>   1224					if (oldstarttime == boost_starttime) {
>   1225						WRITE_ONCE(boost_starttime,
>   1226							   jiffies + test_boost_interval * HZ);
>   1227						n_rcu_torture_boosts++;
>   1228					}
>   1229					mutex_unlock(&boost_mutex);
>   1230					break;
>   1231				}
>   1232				schedule_timeout_uninterruptible(HZ / 20);
>   1233			}
>   1234	
>   1235			/* Go do the stutter. */
>   1236	checkwait:	if (stutter_wait("rcu_torture_boost"))
>   1237				sched_set_fifo_low(current);
>   1238		} while (!torture_must_stop());
>   1239	
>   1240	cleanup:
>   1241		/* Clean up and exit. */
>   1242		while (!kthread_should_stop()) {
>   1243			torture_shutdown_absorb("rcu_torture_boost");
>   1244			schedule_timeout_uninterruptible(HZ / 20);
>   1245		}
>   1246		torture_kthread_stopping("rcu_torture_boost");
>   1247		return 0;
>   1248	}
>   1249	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
