Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1CF36E467
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 20:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790798694; cv=none; b=C7ViPjqYvTwHKKEYF96nzf98HpvRnngzizVFBtanYBmSk4BGJJGcGp/iqXQfqUE1nl5w5MMb9OJXVeXDOpKdsCdOvzen2q09XDDr/rwU6xxMne8bw3PsAuawuIBiLoS0dUjJgsHFyhlay9CrW8dP4pLQ9jsGYLIv0psdBeBJfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790798694; c=relaxed/simple;
	bh=zMDsOTd7TIIaVxdxffCquEYOeAg2Qeg3CDOX1WkQnHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpRoYkiOICFgFshFvx8FfM+cWpHU9gdN+v4q7xoxrFmLuzJoXV3sVMN0GFXDgDFm2t3LRaRPiANZ//WfGWGIH6FZKuDZrB+7J/qOYzDy70p15qncTctAzXafPmpK9UPf+9/WhMpBxwDFanSSz/8umHzZJUMyrc/oo069cG8IMjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QkZzqkgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QkZzqkgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293E91F000FF;
	Wed, 30 Sep 2026 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790798693;
	bh=4pdO+5y4EIZH6nW6kZuvDy6PyzfPpXVeRNjCBihXb5k=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=QkZzqkgZ+xTF+XHUiI9ie4TjLiH3O5wiFjyFyppuAP5NJJd8GqZE0LH+Ywyu5AGe/
	 GLV835OwnjNBq8sEhiMt9OCpzMDQP86+nHLAxtuRrqP/foBgiWdCP4dimN5LuIOZcX
	 7ToDyqVYvi4+KFGFWSxTagTDnTTBYrPnBuI8pcu2noyMaXCTnCrHgHuF/DyfwMC08Q
	 Edd37KS0mjI4id1WOJ3ihrD0ddXLyvaJdj6A0NWdmduNwLhOodgEeAiy1hKskGKGRI
	 bnTx7uuhn8Ceirx/7Z7VH4AH8rtjF3DgufC1M6QYvLkFrzTywFqWklfbpRKHzillgz
	 X/naNlslDiOxA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ADFB7CE097C; Wed, 30 Sep 2026 13:04:52 -0700 (PDT)
Date: Wed, 30 Sep 2026 13:04:52 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2026.09.18a 24/34] ERROR: modpost:
 fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8' undefined!
Message-ID: <ada0517c-3917-4ea2-a72b-99a7afc9fcd7@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202610010054.roP05vYH-lkp@intel.com>
 <D067807D-352D-4B55-AEE6-B1334711EBD4@mainlining.org>
 <ce4ed8b6-cf07-44c4-b4e2-9cdb2b452772@paulmck-laptop>
 <F871853E-8AB8-4BDC-BAC8-10B56C4AE330@mainlining.org>
 <77b3d63b-4a41-4415-969d-a043ced63304@paulmck-laptop>
 <50436E31-D2B5-4DF7-B6D0-36E23CCC14C6@mainlining.org>
 <4cecf5e2-3d35-45a9-8632-6d77ffc9b85f@paulmck-laptop>
 <21858FC2-A5C3-4DCD-B8CE-F3F2F41E7215@mainlining.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21858FC2-A5C3-4DCD-B8CE-F3F2F41E7215@mainlining.org>

On Wed, Sep 30, 2026 at 08:14:38PM +0100, Bradley Morgan wrote:
> On 30 September 2026 20:11:50 BST, "Paul E. McKenney" <paulmck@kernel.org>
> wrote:
> >On Wed, Sep 30, 2026 at 06:54:02PM +0100, Bradley Morgan wrote:
> >> On 30 September 2026 18:51:53 BST, "Paul E. McKenney"
> ><paulmck@kernel.org>
> >> wrote:
> >> >On Wed, Sep 30, 2026 at 06:41:08PM +0100, Bradley Morgan wrote:
> >> >> On 30 September 2026 18:39:55 BST, "Paul E. McKenney"
> >> ><paulmck@kernel.org>
> >> >> wrote:
> >> >> >On Wed, Sep 30, 2026 at 06:07:46PM +0100, Bradley Morgan wrote:
> >> >> >> On 30 September 2026 17:48:44 BST, kernel test robot
> ><lkp@intel.com>
> >> >> >wrote:
> >> >> >> >tree:   https://github.com/paulmckrcu/linux dev.2026.09.18a
> >> >> >> >head:   90599c372e13369d11f6c1a01ff0094b16f72cf8
> >> >> >> >commit: c98d10b438b5626edb3f4e06f4f62bcb6ed6fe90 [24/34] lib: Add
> >> >> >two-byte cmpxchg emulation function
> >> >> >> >config: xtensa-randconfig-1001-20260930
> >> >>
> >>
> >>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/config)
> >> >> >> >compiler: xtensa-linux-gcc (GCC) 8.5.0
> >> >> >> >reproduce (this is a W=1 build):
> >> >> >>
> >> >>
> >>
> >>>>(https://download.01.org/0day-ci/archive/20261001/202610010054.roP05vYH-lkp@intel.com/reproduce)
> >> >> >> >
> >> >> >> >If you fix the issue in a separate patch/commit (i.e. not just a
> >new
> >> >> >> >version of
> >> >> >> >the same patch/commit), kindly add following tags
> >> >> >> >| Reported-by: kernel test robot <lkp@intel.com>
> >> >> >> >| Closes:
> >> >> >>
> >> >>
> >>
> >>>>https://lore.kernel.org/oe-kbuild-all/202610010054.roP05vYH-lkp@intel.com/
> >> >> >> >
> >> >> >> >All errors (new ones prefixed by >>, old ones prefixed by <<):
> >> >> >> >
> >> >> >> >>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol 'cmpxchg_emu_u8'
> >> >> >undefined!
> >> >> >> 
> >> >> >> What?
> >> >> >
> >> >> >My bad, allegedly fixed:
> >> >> >
> >> >> >2395ec347553 ("lib: Add two-byte cmpxchg emulation function")
> >> >> 
> >> >> Have you merged 2395ec347553 ("lib: Add two-byte cmpxchg emulation
> >> >> function") to your tree?
> >> >
> >> >Yes, it is on the current "dev" branch as of yesterday afternoon,
> >> >Pacific Time.
> >> 
> >> Cheers, anything you want me to do today for it?
> >
> >And I just now refreshed it to add fixes for the bugs kernel test
> >robot found.  Still the "dev" branch.
> >
> >846dac459e05 ("lib: Add two-byte cmpxchg emulation function")
> >de32e93890c5 ("sh: Emulate two-byte cmpxchg")
> >
> >Please look at these and call out any needed changes, supplying fixup
> >patches as needed.  (Or calling out changes to the commit logs.)  One
> >question that I have is why the "(uintptr_t)" casts in cmpxchg_emu_u16()
> >instead of casting using "(unsigned long)"?
> >
> >Then please send patches for the other architectures.
> >
> >Then the ARCH_NEED_CMPXCHG_1_EMU to ARCH_NEED_CMPXCHG_1_2_EMU name
> >change (for the full set in one patch).  This must wait for all the
> >per-architecture patches to be accepted.
> >
> >Then, if you wish, a patch changing the cmpxchg_emu_u8() function's
> >"uintptr_t" to "unsigned long".
> >
> >Anything that I am missing?
> 
> Tags. You are missing all the tags.
> 
> David put tags. You were meant to add your tag.

I have a note to add David Laight to the two patches I have queued.
I have my Signed-off-by on both patches, so that is set.

What else?


							Thanx, Paul

> --- Thanks!
> "I'm not a very positive person" - Linus torvalds
