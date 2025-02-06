Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F552BE49
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738805913; cv=none; b=Dgz82JdZkfv8IXblQ8ee+6pHwjwe5Amlgmrb+JiPLTEhQIv2TcvYKW3S0Ru7+rZnwsfZOn9rGiymxpA/89UmMgSZVlYrqMryL4x/pSUiKtVj8T/2nDsWnyeYzcnflcBM67VtPEoVO17JI7BsGA0K++xBot6EoZaKRAEfOBpJwO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738805913; c=relaxed/simple;
	bh=9gK2SD2x2P3u45MDxbeTkZ/5f7+7sQd840lwaKlYojQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AutQD/+Q8UaTHnnwqEsw5CTfj7rwRYIUQkfZYA6xkcofPpyLWF7d4d3tLsPKoCzBVgfvpCk8zmwNz7QVUYXnRRHXOscQSggIEVSl/G8v/5H3ojVvN85/Q2C1/Y92Tm0uh6AvNNFhvzjLiXoYV1wRvJ8EV5rFLVX3NR30kf61q4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MqHDTq7r; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MqHDTq7r"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46fa734a0b8so4490711cf.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 17:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738805910; x=1739410710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AzUsbVt2ogLtxA9mufO2sCxR6GSKwEtn4zd5MiXWhps=;
        b=MqHDTq7rhAdDRHYKgize2a7g0voquBvwxOQL98nsmuHhFBN8M5QqyVfqKQxqt9XlD6
         LRyHl6TBBHiGa2GZTlWAPxmdxoBt0SnY0icsBAmQptBHiMi+7M17t9/OVq0HnbH5VFUo
         +RsyzGyX72+/2UD3waXrKdwG5XM0bFwy904mA4xL4Bgvj4zdvi2FERR0ZacYG7zsosKW
         5Unx8wrKZTwkLaKdiNBXqHABHJSNiDFCb51TCAjryqPfnBWKNMBbxckdMpSdx1q/wtj5
         ShBw276wK4nTTfe1xD6NahbL4oSQbG0n9OxSus5HgmzWAdqTd5xkmVhGnWIRkPXl3Hl6
         YMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738805910; x=1739410710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzUsbVt2ogLtxA9mufO2sCxR6GSKwEtn4zd5MiXWhps=;
        b=uY13uDmV63lQ5dAqJiob84UWgL9iFFhmIqYkw3voLF/T0fWQ6A3VZZmsqh1nefnVl1
         p34otlLRQOF+T/tFZMSmfTBWTsFmn4dSvxBZbwZlL54d02tV8srci7iLRNojfhnM/3dy
         uGvkVBIjFuOAG06gOZJvhq+ioz990siw+o6i8bJfm1uW7rgfZEtKAZQww98dRIkmWwcr
         3caQlMyodAGPv6o6pERifzqys2r2b3lAOa1CM+BtD3Y0dqSRulxPOgIiZXQSPU0XcbvK
         4jdsr/kGnGOKD6syOc0hqWb4EmzrTn+6rksy/iu+ELvlWuAxfwtFy+Lmkn1qLH56s81Z
         ADjg==
X-Forwarded-Encrypted: i=1; AJvYcCVI8JbthAApZVWXbO3MfLjH1X+JwTWU1POv2mbASx5IHTv780uiWJAtTnPt/63Bz9y6LY5KSgr5pbhVfuUI@lists.linux.dev
X-Gm-Message-State: AOJu0Yw980zskes4RPBYGwL0zSlC1keK2BP6YTJg1QAYtEwSpLmDHdA7
	MJA6DWsX3vZOwveH3kMUExsdQpMzjAU88vA1UqN5cw3ngpfsUivP
X-Gm-Gg: ASbGncs6F6zm6sAA08afaheaQ1fJUsbLMLcHV35rTDPevgYA91U0Qlyetk1tSv59l17
	K/fV3uIf2FQn8+whlDawJtKwe2eXqz7F7n5O7NY5IG/DxqAv3TKs7qmfTb6MFhWeNVgoU1l/KDk
	WTltafebbi/csJdzSTfiIMSbNX9s66pcPAuuhGqLQml4eagMYTvAVVlRXO+S47ANr6IF2/1ID/4
	x+MTNY4g2f3JtGtl5JWrAF5MwwRYHeGNWXobA+RJ6FJdBC6Kk5oxxv7QmsIL2c/dj8myvsB3Tv7
	09SLyr9RVKm645Cz8dy72C7NZ0UghPyHgSE5mrXMKzOj3gYb2q5diS8d9uqPjiw4TK5agD8brQK
	McJn+jA==
X-Google-Smtp-Source: AGHT+IEuz/jBwFVsaAb8GII3N7kWXC+sL9paBEr34audomOt3LmScmKUKFn7KBUJyWnz+FkIWf47xg==
X-Received: by 2002:a05:6214:2269:b0:6d8:916b:1caa with SMTP id 6a1803df08f44-6e42fbdceebmr84009246d6.27.1738805909832;
        Wed, 05 Feb 2025 17:38:29 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e43bad5ab2sm994096d6.116.2025.02.05.17.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 17:38:29 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id E78841200043;
	Wed,  5 Feb 2025 20:38:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Wed, 05 Feb 2025 20:38:28 -0500
X-ME-Sender: <xms:lBKkZ0eOAL-XQwY9OhGUmKlA6WvY_YUsjIZm3upg1ZVT5u4UCPsP1g>
    <xme:lBKkZ2N6etYhnqD0xgcXEzEL0q0k94UQRh8PCK6qwCluzzqJAt5rmyDTvn5ML1BWI
    I_M_SB2NAqhCStKpA>
X-ME-Received: <xmr:lBKkZ1hmvwBa92K2HhptN1rhGpTLIXbTICfZRNtn6b2avmUJl5dVM0fpfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepfeffudehveduteeuffeutdetieeftdelfeel
    veffffevteeffedtteehteegkeegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptd
    durdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonh
    grlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghnghep
    pehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhkphesihhnthgvlhdrtghomhdprhgt
    phhtthhopehprghulhhmtghksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehovgdqkh
    gsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepsgho
    qhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:lBKkZ58PdTV9ilWmIQ2pg3PE03oaXI-leVKkKYehGx8YgexCAVHT5w>
    <xmx:lBKkZwtFuHNrgpnopMX3xojmkPggSeqlTXYKUggI4bQXKtY0_FY7Aw>
    <xmx:lBKkZwHkh4RVxrpAnj5lfxujta82zzLceEqFHsJ1CTh8UNIN9tWsOw>
    <xmx:lBKkZ_OLPgadH7GkC8wlvFku_vxtk9siFpFejN0Nq66TBNK2CP9tVQ>
    <xmx:lBKkZ1O1EqEHVObk2UTOX03FKbxTr1o1LdSnwbqkhMSQz_GnqoSjPMiS>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Feb 2025 20:38:28 -0500 (EST)
Date: Wed, 5 Feb 2025 17:38:27 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [rcu:torture.2025.02.04a 1/10] kernel/rcu/rcutorture.c:1152:40:
 error: implicit declaration of function 'get_torture_init_jiffies'
Message-ID: <Z6QSk8rOwlI7XDNl@Mac.home>
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

Hi,

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
>    kernel/rcu/rcutorture.c: In function 'rcu_torture_boost':
> >> kernel/rcu/rcutorture.c:1152:40: error: implicit declaration of function 'get_torture_init_jiffies' [-Werror=implicit-function-declaration]
>     1152 |         unsigned long booststarttime = get_torture_init_jiffies() + test_boost_holdoff * HZ;
>          |                                        ^~~~~~~~~~~~~~~~~~~~~~~~
>    kernel/rcu/rcutorture.c: In function 'rcu_torture_one_read':
>    kernel/rcu/rcutorture.c:2140:28: warning: variable 'ts' set but not used [-Wunused-but-set-variable]
>     2140 |         unsigned long long ts;
>          |                            ^~
>    cc1: some warnings being treated as errors
> 

Paul, this was due to I forgot to add one commit to torture.2025.02.04a
branch and it's already fixed in torture.2025.02.05a,

~> git range-diff v6.14-rc1 torture.2025.02.04a torture.2025.02.05a
 -:  ------------ >  1:  623b52802bb0 torture: Add get_torture_init_jiffies() for test-start time
 1:  65c7582d8315 =  2:  b8726c5aa6e8 rcutorture: Add a test_boost_holdoff module parameter
 2:  97d7d46bf6fa =  3:  84ae91018af5 rcutorture: Include grace-period sequence numbers in failure/close-call
 3:  d5cef65c25c9 =  4:  2db7ab8c1086 rcutorture: Expand failure/close-call grace-period output
 4:  447bd4858eb4 =  5:  a8f7c9c4576d rcu: Trace expedited grace-period numbers in hexadecimal
 5:  8a4ddf30d5cf =  6:  65e6ff0f3118 rcutorture: Add ftrace-compatible timestamp to GP# failure/close-call output
 6:  4ce66a7bd170 =  7:  7acc2d90151f rcutorture: Make cur_ops->format_gp_seqs take buffer length
 7:  df6141535848 =  8:  5d45bdf292e6 rcutorture: Move RCU_TORTURE_TEST_{CHK_RDR_STATE,LOG_CPU} to bool
 8:  96e9e636d8dc =  9:  38b43eca6665 rcutorture: Complain when invalid SRCU reader_flavor is specified
 9:  bd1f29829c35 = 10:  536e8b9b80bc srcu: Add FORCE_NEED_SRCU_NMI_SAFE Kconfig for testing
10:  7b4389d6456a = 11:  6be43acb2a6d torture: Make SRCU lockdep testing use srcu_read_lock_nmisafe()

sorry about that ;-)

Regards,
Boqun

> 
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
