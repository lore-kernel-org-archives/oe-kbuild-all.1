Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDFE35B12B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 11:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305590; cv=none; b=Cv34B3rLVvFMgMViathsBvQNBGtYS56HucZCM8PkxSfutjlA+oekFZxqzHS5EbTWCElvHf7PgTNU+gXovH2oSc2jCVws6hgKkK2pxfAQsEX/pMkIZFXCqx1u+Q/KPcRPX8pGMMbQsjDvCdCRGR3eZCP5tZeXXIV9WF+VxUyyB34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305590; c=relaxed/simple;
	bh=NjWBMa2jjXNfAsOjbZaZAYP7zCKPzu/li+AWxKmNkYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ffl2nlipwmQLM5XnxNAw/02SqYdHYrIIlgPNjnCmpGmdvIKwg9MyXyrpbCAoJMz/X2rAGUP8ft/c60/NNyeb4aAcxH5zaFS6zp/XRk/HkbGjFzIjewvI5jVwUHv8r+qZFag3RtMtMH6uVmLjfbR+DZoHZHV4dvJ4nLXycEDMhi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jfJfNSLP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0Esf+ndc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jfJfNSLP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0Esf+ndc"
Date: Tue, 13 Jan 2026 12:59:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768305587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpxv6MMA4Wy69fITrcyL9dXIhJmqxlTo0Pw5fdLwFnA=;
	b=jfJfNSLPcwWG2pU2FIGoI4F/L+5N+SwLvyfarM1nhAQ0qFUWp13L5jx2kQg/wPuqd9N7FQ
	Jza5z8U1RItiiA/GDxsJ+M4FlXG50R9kZ2Uxn9152pmlVs7R2/Q8MlJWTfWvTwkiEZFZgw
	VUoTiSgclcWphGatFgs/J9NMd8xuhDMdaO0zp/xFkW1FYdQbGiESrAtCubmDYymCYYsWjO
	5CuLmiUi8HDyKXjsbk2VYlhCl8yWvbWHKEEe5Yl2vdpOf5oVJeWiZQORAfg2C5DOg+zvOT
	Dayxqmk+M15gfuvgnOsvjK53+vtUTZ6bYOaO7kvmm5qpiIQUd2K6rInp75uXBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768305587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wpxv6MMA4Wy69fITrcyL9dXIhJmqxlTo0Pw5fdLwFnA=;
	b=0Esf+ndc9oiYzre9q05RJcoEjjfc9P2UkFTXFyrpx5K09Kt5cVtkVTQzP4A3bf4kBb6Df3
	WegP9pPBy2jodCCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260113115946.L49jwJMx@linutronix.de>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202601131901.j7WJ9OeZ-lkp@intel.com>

On 2026-01-13 19:22:40 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b71e635feefc852405b14620a7fc58c4c80c0f73
> commit: cec199c5e39bde7191a08087cc3d002ccfab31ff futex: Implement FUTEX2_=
NUMA
> date:   9 months ago
> config: arm64-randconfig-r123-20260113 (https://download.01.org/0day-ci/a=
rchive/20260113/202601131901.j7WJ9OeZ-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260113/202601131901.j7WJ9OeZ-lkp@intel.com/reproduce)
=E2=80=A6
>sparse warnings: (new ones prefixed by >>)
>>> kernel/futex/core.c:505:38: sparse: sparse: cast removes address space =
'__user' of expression
>>> kernel/futex/core.c:505:51: sparse: sparse: incorrect type in initializ=
er (different address spaces) @@     expected unsigned int [noderef] [usert=
ype] __user *naddr @@     got void * @@
>   kernel/futex/core.c:505:51: sparse:     expected unsigned int [noderef]=
 [usertype] __user *naddr
>   kernel/futex/core.c:505:51: sparse:     got void *
>   kernel/futex/core.c:894:9: sparse: sparse: context imbalance in 'futex_=
q_lockptr_lock' - wrong count at exit
=E2=80=A6
>  > 505			u32 __user *naddr =3D (void *)uaddr + size / 2;

[ ] I (PeterZ) have it fixed, will post soon
[ ] Fix it for me, I'm saving the world atm
[ ] Ignore it because of $reasonable_reason

Sebastian
