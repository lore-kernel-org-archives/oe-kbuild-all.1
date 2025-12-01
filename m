Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30973168E0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 14:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764599283; cv=none; b=sFjgF6Cts53vtEnnZDECZG+KcKtYOzNllztaHV5Z4y9JtAfQN15Ny6q8am4ZDLkPGFXKHVeNOdNjXVQXPvDmQrxRo/WvvXQzGHshrrGsa9IOPw4CHYdOJ/jCXr5KByQakw8FcDFk8L15HNNMGoEl/R2IbJ6kLk4Gt1uDyEUXcFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764599283; c=relaxed/simple;
	bh=KpAWqqWEKdihw6TVSEzhPu5amMKvgKhW8KvMNYvPVII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwCkl0ERSWlJm+GYr9PAN+2gohdOrHStt+AnwLT2VVBjRtZIw3ZFsKibzA2CU41cZT9DAJLflxiFkT047bqY7gQDKqdmIU8VkcfwwPZO/U2Ix012Bxag5AMTejRr68WTKioJvmpOKz0I641SgVxQH4TR9qXl6y/AKr2oxSsh3+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z2OSDdx8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z2OSDdx8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04D26C4CEF1;
	Mon,  1 Dec 2025 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764599282;
	bh=KpAWqqWEKdihw6TVSEzhPu5amMKvgKhW8KvMNYvPVII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z2OSDdx8unWk3tZ2ZBBW04s+2F0KO1urduw36mNVBCEIO+Lt+gPSBZ6zPDoUlAEkc
	 PkhQo5ilR/w6epY2CzxLoi+qWo+cLDk9MDyAIfYoTD/0sGsplYVJCO4ozbnerBlxPQ
	 N08o3n7BPnGmLnnCp1uG6iXp2XsENpkLdvCsVK1iuu49cGZAAr7z5vfLtrIOe6z0yl
	 TEt0uvou9wrk5FksJtLcLd+iJTqa6/T5iMJqkTI7Ckv6N97mKnVZB4FnsTbfM0K2Wv
	 K3r/uWiqBSzSeZPJsD44h3I1m1NgwQpQP4o7EvYVXjmjuyWRS/bAJVnZjRhFdHXO5Y
	 jbXBotxPILx6g==
Date: Mon, 1 Dec 2025 16:27:58 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [linux-next:master 12420/13171]
 include/linux/compiler_types.h:602:45: error: call to
 '__compiletime_assert_293' declared with attribute error: min(burstcnt, len
 - count - 1) signedness error
Message-ID: <aS2l7ojcVl1K5ero@kernel.org>
References: <202512012040.BkoYgkkr-lkp@intel.com>
 <20251201124256.328f4f35@pumpkin>
 <aS2ljp-MWo_7ZTjJ@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS2ljp-MWo_7ZTjJ@kernel.org>

On Mon, Dec 01, 2025 at 04:26:26PM +0200, Jarkko Sakkinen wrote:
> On Mon, Dec 01, 2025 at 12:42:56PM +0000, David Laight wrote:
> > On Mon, 1 Dec 2025 20:18:45 +0800
> > kernel test robot <lkp@intel.com> wrote:
> > 
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
> > > commit: 9ce4f8e56bd2ed2bd473572bbd4c1a7f8863487c [12420/13171] drivers/char/tpm: use min() instead of min_t()
> > > config: xtensa-randconfig-r123-20251201 (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/config)
> > > compiler: xtensa-linux-gcc (GCC) 11.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012040.BkoYgkkr-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202512012040.BkoYgkkr-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    In file included from <command-line>:
> > >    drivers/char/tpm/tpm_tis_core.c: In function 'tpm_tis_send_data':
> > > >> include/linux/compiler_types.h:602:45: error: call to '__compiletime_assert_293' declared with attribute error: min(burstcnt, len - count - 1) signedness error  
> > ...
> > >    drivers/char/tpm/tpm_tis_core.c:456:28: note: in expansion of macro 'min'
> > >      456 |                 burstcnt = min(burstcnt, len - count - 1);
> > 
> > I hate compiler differences.
> > Usually the:
> > 	if (burstcnt < 0) {
> > 		...
> > 		goto out_err;
> > 	}
> > a few lines higher is enough to make the statically_true(burstcnt >= 0) pass.
> > 
> > I'm not sure why it doesn't here.
> > 
> > 	David
> 
> It is already part of PR, which I've revised already once in order to
> drop one patch:
> 
> https://lore.kernel.org/linux-integrity/aSnQZ4pRWqJai6FW@kernel.org/T/#u
> 
> Since I don't want to end up into a cycle of iterations with this I can
> at this point drop the patch, unless better suggestions are available.
> 
> I.e., I'll update PR one more time dropping this patch.
> 
> We can revisit this during rc cycles. I'll hold on for a while before
> taking action in order to leave a bit window to respond. Just need to
> address this quickly, that's all.

I did try to see if I could reproduce the compilation issue but
unfortunately Debian does not have a per-compiled toolchain for
xtensa so feels like a huge stretch to do anythin (quickly).

BR, Jarkko
