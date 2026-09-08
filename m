Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7E59B687
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 19:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894675; cv=none; b=BkSVUWK4sjGhutqrxuOOAKzFIpUt6bf0DOtGgAsp1MowwC+LNvKtGmQoH9wLvmz4CRMlf1ZKuFMT1FQPQUU+0EKXDsc+CQTJxyJtTRt58fWGDEe9KTNqCV4tbohhjhPhEyrkbTjfFwwckpHtybhzXY05rtUcvfew8Ok8ITOJsqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894675; c=relaxed/simple;
	bh=e2dqBJfp21WO41AoXQ5AfxEUuhV/CZ6cVuRpaxyeOk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8cpRGLG8VF521GCyb+TcPaGnOfCNo4ze2UJ++7156fhNor1op/uswIeAqdG0MsigyBJu6MWV7TNfwYs0yeRL1hdzyT9UABmH3MifKonO/alj/XsKjFNx128qpXawUKvmuQHWBPB2Wln1sHCcW78AlzPhqnLT73V/OAZJONkb2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1hoSXBe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1hoSXBe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201191F00A3A;
	Tue,  8 Sep 2026 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894669;
	bh=skzA71Wt+K8J5EXDyMKYF+bFLHHIX8asJtaQcmoLJN0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=d1hoSXBe7NYbLYUbLR65Vfz2FyM4Ey5b54Yxm95qNVBdYKG3USF3ED/76cJzlJjWg
	 luublMVVZwhMd6Lrfy1AyQOUwWC0LmmhS3ByOPzjOCDwBp7qJlI15su7I79DMU7rdH
	 MwjuHcHDjCXoYOdskUqtd2VsDNUK2epZbYqBy+oj9Ddedy0qLVIZeOl9rka093Th4B
	 4aI88i0VtBRllgiRy/SQXCeA1e8NbuVJfmxflTMt4nv43VOizx13bUoBJwq7VmYnaj
	 A6zFc6ARwySV/DKIgKq527+cwASM0PP0ykYX2+NGYLHsg9ODMV9KbYwetdX1JSb+CY
	 t1owU48pGrHoQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5DE1CE1902; Tue,  8 Sep 2026 12:11:08 -0700 (PDT)
Date: Tue, 8 Sep 2026 12:11:08 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [paulmckrcu:dev 27/42] kernel/rcu/srcutree.c:913 srcu_gp_start()
 warn: inconsistent indenting
Message-ID: <09b85333-ddd2-44fc-8bbf-3257f714acb1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609052019.8XxNMFvN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609052019.8XxNMFvN-lkp@intel.com>

On Sat, Sep 05, 2026 at 08:25:52PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   3fe004c1cd8588480a29f9577427cf8a9daa32d1
> commit: a6b38e2d5585400c21ee2429683f2ab7ec0e1cf8 [27/42] srcutree: Add an atomic Tree SRCU
> config: x86_64-randconfig-161-20260904 (https://download.01.org/0day-ci/archive/20260905/202609052019.8XxNMFvN-lkp@intel.com/config)
> compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
> smatch: v0.5.0-9187-g5189e3fb
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609052019.8XxNMFvN-lkp@intel.com/
> 
> smatch warnings:
> kernel/rcu/srcutree.c:913 srcu_gp_start() warn: inconsistent indenting
> kernel/rcu/srcutree.c:2148 synchronize_srcu_atomic() warn: inconsistent indenting

This is debug code and will be removed, but thank you for the reminder.

							Thanx, Paul

> vim +913 kernel/rcu/srcutree.c
> 
>    905	
>    906	/*
>    907	 * Start an SRCU grace period.
>    908	 */
>    909	static void srcu_gp_start(struct srcu_struct *ssp)
>    910	{
>    911		int state;
>    912	
>  > 913		/*&&&&*/pr_alert("%s() start: ->srcu_gp_seq: %lx ->srcu_gp_seq_needed: %lx\n", __func__, ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed);
>    914		lockdep_assert_held(&ACCESS_PRIVATE(ssp->srcu_sup, lock));
>    915		WARN_ON_ONCE(ULONG_CMP_GE(ssp->srcu_sup->srcu_gp_seq, ssp->srcu_sup->srcu_gp_seq_needed));
>    916		WRITE_ONCE(ssp->srcu_sup->srcu_gp_start, jiffies);
>    917		WRITE_ONCE(ssp->srcu_sup->srcu_n_exp_nodelay, 0);
>    918		smp_mb(); /* Order prior store to ->srcu_gp_seq_needed vs. GP start. */
>    919		rcu_seq_start(&ssp->srcu_sup->srcu_gp_seq);
>    920		state = rcu_seq_state(ssp->srcu_sup->srcu_gp_seq);
>    921		WARN_ON_ONCE(state != SRCU_STATE_SCAN1);
>    922	}
>    923	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
