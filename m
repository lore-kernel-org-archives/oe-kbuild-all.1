Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD184BAA6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Apr 2024 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712908173; cv=none; b=D2W2fd0w9mgPbU1m5aqamQablAh+tn7gus4KQ4ofJbB+Y1UdHcRpj1RLI1LbdgLiX7UztC1YQhgu6xOO3olvXerCkr6R2zQG8eDZIM+mwylKUabH3DDFFgsVVfh2f/2HaCWrDoXotwetk3/kogV9S+s4d44lCllLOKRvgDFivUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712908173; c=relaxed/simple;
	bh=iafyJ2t0YtPLlkTTLOF2dIVlDz0MAdGeN4ZaLjasAXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4+ybNEqqXKmwEOhuOccbhuIswARkRZUKY2BSB2s6EKP9diByTgiVw7pf8ijS/MAORX5Kqg1DZ1WZCcLtwySAKr0LB+Oxyq9RL89sF/2G5Uzz2Mh2dQ62B9YN1wiFAPHA1xBNV6cytyniBebDqo4DmnY7z0XgE1h0JnfT9bg2Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=e4lT+SQe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="e4lT+SQe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A39BC113CC;
	Fri, 12 Apr 2024 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1712908172;
	bh=iafyJ2t0YtPLlkTTLOF2dIVlDz0MAdGeN4ZaLjasAXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e4lT+SQeEd8sMs6JuvEAQyJY9Bm5RwVeS3t7wzHvrA2zSzJN/zE2DVk4HwH16bwYI
	 jhxus51IrAV9OsV3DhoZ7QaJib/D2LibWsVXOgIfBxEVV5htx8IJ3bKjj5mkyCDe1f
	 JLCt7EZcCCSwzgF7+xCgOLzFzBk/gw2IWvQ1mS3o=
Date: Fri, 12 Apr 2024 09:49:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	kernel test robot <lkp@intel.com>
Subject: Re: [char-misc:char-misc-testing 5/20] drivers/uio/uio.c:446:
 warning: expecting prototype for uio_interrupt(). Prototype was for
 uio_interrupt_handler() instead
Message-ID: <2024041202-curve-frozen-7c4a@gregkh>
References: <202404112227.mIATKoTb-lkp@intel.com>
 <f3f2124e-31b2-4598-b2a6-44480afc33c3@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3f2124e-31b2-4598-b2a6-44480afc33c3@alliedtelesis.co.nz>

On Thu, Apr 11, 2024 at 08:29:02PM +0000, Chris Packham wrote:
> Hi Greg,
> 
> On 12/04/24 03:04, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
> > head:   dc806bd48abc1b8a4ae72709a37e65db42a32048
> > commit: f8a27dfa4b82d442af1c0645a5acc70cc97c67f6 [5/20] uio: use threaded interrupts
> > config: sh-defconfig (https://download.01.org/0day-ci/archive/20240411/202404112227.mIATKoTb-lkp@intel.com/config)
> > compiler: sh4-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404112227.mIATKoTb-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202404112227.mIATKoTb-lkp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >>> drivers/uio/uio.c:446: warning: expecting prototype for uio_interrupt(). Prototype was for uio_interrupt_handler() instead
> 
> I can do a quick fixup for that. Do you want it as a v3 or a new patch?

A fix for on top is fine, no need to respin the whole series just for a
comment fix.  That way you can properly credit the kernel test robot as
well.

thanks,

greg k-h
