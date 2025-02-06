Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4483B226548
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836497; cv=none; b=TnIW1voyZQALiSF3ea6SJ49WO7nWe3QwnKpjaSRXJEO7ryKViVNfDCC6xT1Ac8ptHoXfBufIBQITKjVyj9F9dUS8m56qi+x1fa9GfVQnILvJ6chnZkddwVcVXlnqU93jsCChqbaXC/BK43sSuLcigMiRNezBkTNKh7X9FT6nA5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836497; c=relaxed/simple;
	bh=E2508b/GCdCAyoL0CDQ70hruAORn3fsVj3PUigCHy6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGd8W9VwZjSZks+p37Q53qW4ddK7FjekgqxNhytYPzXIB+RdQDP9J7JiiSl83AuiKgI+CntrOMts0OczwTOpynDISU0sB2AwHL5iUPhnrnYNxhq7mcHmiSHoDu1ZzwgMp5Uz4Dwxq9kvQBUEJLMmf06uHI+Eeca7NBA020yAcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ujDTfmjc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ujDTfmjc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE9C4CEDD;
	Thu,  6 Feb 2025 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738836495;
	bh=E2508b/GCdCAyoL0CDQ70hruAORn3fsVj3PUigCHy6k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=ujDTfmjcuS5pC0uyAxn9oYYbU8BWBkv7dMpiq4x322H8oR+vRgo2me5ZuOIiRS0tB
	 51msBDqMLgkJAJ8HCNdwJi0ezF7ufURw9FyWd4VQtHQtzfop0s4pB8OvUem8Auq+e/
	 cvlEcNJVyMB43keXTjDQkN3PogJs8nlTHYCmud3Y03S7pRbMvRZBM1AxROBtO/zWd8
	 hkbMtDuxg6jwodUufgSo9nzIwvzojHkBodafqC5PIfsngPeaP12/Y7sPUNSazjG7ma
	 Ln+6FJesO2E8PcnKzL8piApEU1aMwF0R26Z0uXceNEyK/a7KVU7c8x3xrpZcCD3bKB
	 bC0w5qXwfXncg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 82DA6CE0809; Thu,  6 Feb 2025 02:08:15 -0800 (PST)
Date: Thu, 6 Feb 2025 02:08:15 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [rcu:torture.2025.02.04a 1/10] kernel/rcu/rcutorture.c:1152:40:
 error: implicit declaration of function 'get_torture_init_jiffies'
Message-ID: <fac18963-b921-4bbe-a7e2-1ad0f8d6dc45@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502060922.xbvw2iso-lkp@intel.com>
 <Z6QSk8rOwlI7XDNl@Mac.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6QSk8rOwlI7XDNl@Mac.home>

On Wed, Feb 05, 2025 at 05:38:27PM -0800, Boqun Feng wrote:
> Hi,
> 
> On Thu, Feb 06, 2025 at 09:17:57AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git torture.2025.02.04a
> > head:   7b4389d6456ab5bca223c6cd4829724d984c8511
> > commit: 65c7582d8315f7f0451eac635d803b2def726d44 [1/10] rcutorture: Add a test_boost_holdoff module parameter
> > config: i386-buildonly-randconfig-006-20250206 (https://download.01.org/0day-ci/archive/20250206/202502060922.xbvw2iso-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502060922.xbvw2iso-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202502060922.xbvw2iso-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    kernel/rcu/rcutorture.c: In function 'rcu_read_delay':
> >    kernel/rcu/rcutorture.c:445:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
> >      445 |         unsigned long long ts;
> >          |                            ^~
> >    kernel/rcu/rcutorture.c:442:23: warning: variable 'completed' set but not used [-Wunused-but-set-variable]
> >      442 |         unsigned long completed;
> >          |                       ^~~~~~~~~
> >    kernel/rcu/rcutorture.c:441:23: warning: variable 'started' set but not used [-Wunused-but-set-variable]
> >      441 |         unsigned long started;
> >          |                       ^~~~~~~
> >    kernel/rcu/rcutorture.c: In function 'rcu_torture_boost':
> > >> kernel/rcu/rcutorture.c:1152:40: error: implicit declaration of function 'get_torture_init_jiffies' [-Werror=implicit-function-declaration]
> >     1152 |         unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
> >          |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
> >    kernel/rcu/rcutorture.c: In function 'rcu_torture_one_read':
> >    kernel/rcu/rcutorture.c:2140:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
> >     2140 |         unsigned long long ts;
> >          |                            ^~
> >    cc1: some warnings being treated as errors
> > 
> 
> Paul, this was due to I forgot to add one commit to torture.2025.02.04a
> branch and it's already fixed in torture.2025.02.05a,
> 
> ~> git range-diff v6.14-rc1 torture.2025.02.04a torture.2025.02.05a
>  -:  ------------ >  1:  623b52802bb0 torture: Add get_torture_init_jiffies() for test-start time
>  1:  65c7582d8315 =  2:  b8726c5aa6e8 rcutorture: Add a test_boost_holdoff module parameter
>  2:  97d7d46bf6fa =  3:  84ae91018af5 rcutorture: Include grace-period sequence numbers in failure/close-call
>  3:  d5cef65c25c9 =  4:  2db7ab8c1086 rcutorture: Expand failure/close-call grace-period output
>  4:  447bd4858eb4 =  5:  a8f7c9c4576d rcu: Trace expedited grace-period numbers in hexadecimal
>  5:  8a4ddf30d5cf =  6:  65e6ff0f3118 rcutorture: Add ftrace-compatible timestamp to GP# failure/close-call output
>  6:  4ce66a7bd170 =  7:  7acc2d90151f rcutorture: Make cur_ops->format_gp_seqs take buffer length
>  7:  df6141535848 =  8:  5d45bdf292e6 rcutorture: Move RCU_TORTURE_TEST_{CHK_RDR_STATE,LOG_CPU} to bool
>  8:  96e9e636d8dc =  9:  38b43eca6665 rcutorture: Complain when invalid SRCU reader_flavor is specified
>  9:  bd1f29829c35 = 10:  536e8b9b80bc srcu: Add FORCE_NEED_SRCU_NMI_SAFE Kconfig for testing
> 10:  7b4389d6456a = 11:  6be43acb2a6d torture: Make SRCU lockdep testing use srcu_read_lock_nmisafe()
> 
> sorry about that ;-)

No problem, and I clearly should have read ahead before replying myself.
Therefore, my apologies.  ;-)

							Thanx, Paul

> Regards,
> Boqun
> 
> > 
> > vim +/get_torture_init_jiffies +1152 kernel/rcu/rcutorture.c
> > 
> >   1145	
> >   1146	static int rcu_torture_boost(void *arg)
> >   1147	{
> >   1148		unsigned long endtime;
> >   1149		unsigned long gp_state;
> >   1150		unsigned long gp_state_time;
> >   1151		unsigned long oldstarttime;
> > > 1152		unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
> >   1153	
> >   1154		if (test_boost_holdoff <= 0 || time_after(jiffies, booststarttime)) {
> >   1155			VERBOSE_TOROUT_STRING("rcu_torture_boost started");
> >   1156		} else {
> >   1157			VERBOSE_TOROUT_STRING("rcu_torture_boost started holdoff period");
> >   1158			while (time_before(jiffies, booststarttime)) {
> >   1159				schedule_timeout_idle(HZ);
> >   1160				if (kthread_should_stop())
> >   1161					goto cleanup;
> >   1162			}
> >   1163			VERBOSE_TOROUT_STRING("rcu_torture_boost finished holdoff period");
> >   1164		}
> >   1165	
> >   1166		/* Set real-time priority. */
> >   1167		sched_set_fifo_low(current);
> >   1168	
> >   1169		/* Each pass through the following loop does one boost-test cycle. */
> >   1170		do {
> >   1171			bool failed = false; // Test failed already in this test interval
> >   1172			bool gp_initiated = false;
> >   1173	
> >   1174			if (kthread_should_stop())
> >   1175				goto checkwait;
> >   1176	
> >   1177			/* Wait for the next test interval. */
> >   1178			oldstarttime = READ_ONCE(boost_starttime);
> >   1179			while (time_before(jiffies, oldstarttime)) {
> >   1180				schedule_timeout_interruptible(oldstarttime - jiffies);
> >   1181				if (stutter_wait("rcu_torture_boost"))
> >   1182					sched_set_fifo_low(current);
> >   1183				if (torture_must_stop())
> >   1184					goto checkwait;
> >   1185			}
> >   1186	
> >   1187			// Do one boost-test interval.
> >   1188			endtime = oldstarttime + test_boost_duration * HZ;
> >   1189			while (time_before(jiffies, endtime)) {
> >   1190				// Has current GP gone too long?
> >   1191				if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
> >   1192					failed = rcu_torture_boost_failed(gp_state, &gp_state_time);
> >   1193				// If we don't have a grace period in flight, start one.
> >   1194				if (!gp_initiated || cur_ops->poll_gp_state(gp_state)) {
> >   1195					gp_state = cur_ops->start_gp_poll();
> >   1196					gp_initiated = true;
> >   1197					gp_state_time = jiffies;
> >   1198				}
> >   1199				if (stutter_wait("rcu_torture_boost")) {
> >   1200					sched_set_fifo_low(current);
> >   1201					// If the grace period already ended,
> >   1202					// we don't know when that happened, so
> >   1203					// start over.
> >   1204					if (cur_ops->poll_gp_state(gp_state))
> >   1205						gp_initiated = false;
> >   1206				}
> >   1207				if (torture_must_stop())
> >   1208					goto checkwait;
> >   1209			}
> >   1210	
> >   1211			// In case the grace period extended beyond the end of the loop.
> >   1212			if (gp_initiated && !failed && !cur_ops->poll_gp_state(gp_state))
> >   1213				rcu_torture_boost_failed(gp_state, &gp_state_time);
> >   1214	
> >   1215			/*
> >   1216			 * Set the start time of the next test interval.
> >   1217			 * Yes, this is vulnerable to long delays, but such
> >   1218			 * delays simply cause a false negative for the next
> >   1219			 * interval.  Besides, we are running at RT priority,
> >   1220			 * so delays should be relatively rare.
> >   1221			 */
> >   1222			while (oldstarttime == READ_ONCE(boost_starttime) && !kthread_should_stop()) {
> >   1223				if (mutex_trylock(&boost_mutex)) {
> >   1224					if (oldstarttime == boost_starttime) {
> >   1225						WRITE_ONCE(boost_starttime,
> >   1226							   jiffies + test_boost_interval * HZ);
> >   1227						n_rcu_torture_boosts++;
> >   1228					}
> >   1229					mutex_unlock(&boost_mutex);
> >   1230					break;
> >   1231				}
> >   1232				schedule_timeout_uninterruptible(HZ / 20);
> >   1233			}
> >   1234	
> >   1235			/* Go do the stutter. */
> >   1236	checkwait:	if (stutter_wait("rcu_torture_boost"))
> >   1237				sched_set_fifo_low(current);
> >   1238		} while (!torture_must_stop());
> >   1239	
> >   1240	cleanup:
> >   1241		/* Clean up and exit. */
> >   1242		while (!kthread_should_stop()) {
> >   1243			torture_shutdown_absorb("rcu_torture_boost");
> >   1244			schedule_timeout_uninterruptible(HZ / 20);
> >   1245		}
> >   1246		torture_kthread_stopping("rcu_torture_boost");
> >   1247		return 0;
> >   1248	}
> >   1249	
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
