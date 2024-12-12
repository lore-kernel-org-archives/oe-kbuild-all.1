Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DC018FDA9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Dec 2024 19:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030769; cv=none; b=DCE8qpgqCaX/L3kqhRBUZMZWWzSYXGPE/g91owrnNL1jaouPGlb+emMIorMnIuh7ly6b+tRbR/r1xO/YoDgHdgrMny+y3tLwEUNKF5S/ZzUOEdHx9wM1dJ1zX9prfjufWtbcvJcjRH6R3sxrQF9MY9Hi4536h72BG+Dl+vq8I0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030769; c=relaxed/simple;
	bh=fXRbRd9mFhltXa6cEbpTSurT18QX8NVOCaFgvB99qPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0YArvQEa+nD3yTOtwqTVoBlRdGfnZQCvcTGcgcmBh90q37/+TP66gB7LmspdIgXCuEpmregTIlSHGSXptehwqRaewASMtbQrEh/g7hdj75fVUXo0V7CeEXegFNwck1XgTW0Kbn1VDhzOyQgiCBQ0CCU/CiT1a7uzLIldT3PNdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlHRFnWh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlHRFnWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13077C4CECE;
	Thu, 12 Dec 2024 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734030769;
	bh=fXRbRd9mFhltXa6cEbpTSurT18QX8NVOCaFgvB99qPE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=YlHRFnWh/koyrqXvj9ETkwtSbhN1ZIp9onzJXiHNSWxp5YMTln1NwtBqWdSeAe2OI
	 epGP8CF2w3Bk56pisLl9whBgyQXMiBF7f3uo4Z3MdXH7jnZ0LO3bk6N1TLd7LZ85vT
	 OgRFB2nmke195ZTTQeiOhiv2uzZ+c6vSQ7PBVOgKlABnQjEwtED2vp9aCdqaFQbNzy
	 L0ea40G4VDNpAoXDpY4dMuaZsjYfoAnLKTLp9JZKHpi6bTb94JrLbIB3CItpqyNMQZ
	 LYMpFMASOJ4MR/PvTbkYzZfQ6hzNCS5LBfO/AN6MqTDabf3lDENYi/obSrYvscStp0
	 LiGto93jDfLuQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id AEAA1CE0DFC; Thu, 12 Dec 2024 11:12:48 -0800 (PST)
Date: Thu, 12 Dec 2024 11:12:48 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: lkp <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>
Subject: Re: [paulmckrcu:dev 51/57] ERROR: modpost:
 "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <04cc44ba-0b73-4a69-ad90-9acbbaa3ec99@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412120535.T5YZArL9-lkp@intel.com>
 <12f955e3-bbd8-482d-83dd-b9ac00bc2f68@paulmck-laptop>
 <Z1pmSSnUtMmhowqb@xsang-OptiPlex-9020>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1pmSSnUtMmhowqb@xsang-OptiPlex-9020>

On Thu, Dec 12, 2024 at 12:27:53PM +0800, Oliver Sang wrote:
> hi, Paul,
> 
> On Thu, Dec 12, 2024 at 07:46:09AM +0800, Paul E. McKenney wrote:
> > On Thu, Dec 12, 2024 at 05:55:36AM +0800, kernel test robot wrote:
> > > tree:   https://github.com/paulmckrcu/linux dev
> > > head:   58b186eb8049230c475262f8e9eab34299677b8a
> > > commit: 9133bc2bf728593225932a2574688beeb602b1ef [51/57] rcutorture: Include grace-period sequence numbers in failure/close-call
> > > config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/config)
> > > compiler: sh4-linux-gcc (GCC) 14.2.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241212/202412120535.T5YZArL9-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202412120535.T5YZArL9-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> > > >> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
> 
> above two ERROR are solved by the patch you mentioned below. thanks
> 
> Tested-by: kernel test robot <oliver.sang@intel.com>

Thank you!!!  I will apply your Tested-by on my next rebase.

							Thanx, Paul

> > > ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> > > ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
> > > ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
> > > ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
> > > ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > > ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > > ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > > ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
> > > WARNING: modpost: suppressed 2 unresolved symbol warnings because there were too many)
> > 
> > I believe that this is fixed by the following commit, which I will likely
> > fold into the original.  Does it do the trick for you?
> > 
> >                                                         Thanx, Paul
> > 
> > ------------------------------------------------------------------------
> > 
> > commit c2cf9cf59e746aa60badcb07f58b09b7f604c19b
> > Author: Nathan Chancellor <nathan@kernel.org>
> > Date:   Wed Dec 11 12:43:01 2024 -0800
> > 
> >     rcu: Use IS_ENABLED() for Tiny RCU rcutorture definitions
> > 
> >     The rcutorture_gather_gp_seqs() and rcutorture_format_gp_seqs() functions
> >     are currently guarded by "#ifdef CONFIG_RCU_TORTURE_TEST".  This fails
> >     in kernels built with CONFIG_RCU_TINY=y and CONFIG_RCU_TORTURE_TEST=m
> >     because in that case there is no CONFIG_RCU_TORTURE_TEST cpp macro.
> >     There is instead a CONFIG_RCU_TORTURE_TEST_MODULE cpp macro.
> > 
> >     This commit uses "#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)" to correctly
> >     handle modular as well as built-in rcutorture for kernels using Tiny RCU.
> > 
> >     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > diff --git a/kernel/rcu/tiny.c b/kernel/rcu/tiny.c
> > index 1971683f1a82d..b97c64e99a905 100644
> > --- a/kernel/rcu/tiny.c
> > +++ b/kernel/rcu/tiny.c
> > @@ -257,7 +257,7 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
> >  EXPORT_SYMBOL_GPL(kvfree_call_rcu);
> >  #endif
> > 
> > -#ifdef CONFIG_RCU_TORTURE_TEST
> > +#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
> >  unsigned long long rcutorture_gather_gp_seqs(void)
> >  {
> >         return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;
> > 
