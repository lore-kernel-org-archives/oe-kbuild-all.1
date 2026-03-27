Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95FC347FEE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Mar 2026 09:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774605202; cv=none; b=CiNntubAymWkgQNiEBT9swt7VkojsI3Xr7uFt6OesFdkeVpwLyeBw6JDxOFnWL8vl0AEsprFaSzTS2NegcO9mDlkCAGyvhaUyO9g9NWusJNwjcLR+uicFtvNrBZv+hiBvitTjlylDZNDxsM4+aBD6UYK+Y9gd1wdb1P+tafdFRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774605202; c=relaxed/simple;
	bh=a0+C+r48lnFXSI/hQ4vr2P6zw45N+Hwo8ElGgF81vGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=To7l5P4o8KIDSdjmR4rB1I01Lce0BdE1Y0oDndQxDjVcKkpwObZWXMvQn52KZ3LLv+312IiE6AMea3ZmhXWwDJaxsPz/XmGeDMAiTMeURJQ/qaDXzAnZOa4WaMhvRunrGDdd4C8XSKBE2rNJgj5xJqSt9zJdTSYifliXS/YyeoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvIig167; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvIig167"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D31C19423;
	Fri, 27 Mar 2026 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774605202;
	bh=a0+C+r48lnFXSI/hQ4vr2P6zw45N+Hwo8ElGgF81vGU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=SvIig167JuySveEeuvYBMZAItd6HL59G/ef+KPZOFoku2vV73JaRj7UVzstpCnU49
	 HsMsdwp1FD4yEDGk0rR9KTvIkUsi5RkPpRZ2NPg1yw37d6vIjmhXrMvQrciAWxUBxJ
	 FiHPp1dQVOpY+/qRCj/T7j4hsLJ2eDthm3SdVsOkMJBhRznx62ubAnqkKPT5TeMka+
	 WxwofDXB6FCuq/HW98OMlr20k2cNZbxak1DoorIOR5vnrKNtOwCaUB9wmsewo30BBc
	 p32Y2YFgsn7CYg1EdKg08REDkT6QTNWBsZDptmel+0NoPzoACFGPscNO7kVQyZy3DD
	 bwC/FQPJWe9PQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 024AACE0C96; Fri, 27 Mar 2026 02:53:19 -0700 (PDT)
Date: Fri, 27 Mar 2026 02:53:19 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 25/27] ERROR: modpost:
 "torture_sched_setaffinity" [kernel/locking/locktorture.ko] undefined!
Message-ID: <1e106e7f-145d-4e82-89cc-505d3b33a10a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202603271720.pkB1CgQm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603271720.pkB1CgQm-lkp@intel.com>

On Fri, Mar 27, 2026 at 05:46:11PM +0800, kernel test robot wrote:
> Hi Paul,
> 
> FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> 
> tree:   https://github.com/paulmckrcu/linux dev
> head:   bc9d500f1f9bb52f09c7b085c08fd0319ad756d3
> commit: c34dc928341480ede82702b6ee0e594b06e9c07f [25/27] fixup! torture: Add a hazptrtorture.c stress test
> config: i386-randconfig-003-20260327 (https://download.01.org/0day-ci/archive/20260327/202603271720.pkB1CgQm-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603271720.pkB1CgQm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603271720.pkB1CgQm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
> >> ERROR: modpost: "torture_sched_setaffinity" [kernel/locking/locktorture.ko] undefined!
> >> ERROR: modpost: "torture_sched_setaffinity" [kernel/rcu/rcutorture.ko] undefined!

Good catch!  But this time I beat you to it.  This *should* be fixed by
c34dc9283414 ("fixup! torture: Add a hazptrtorture.c stress test"), which
makes this symbol available to hazptrtorture.c.

							Thanx, Paul
