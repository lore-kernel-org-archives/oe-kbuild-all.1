Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F3A2D4B51
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752570010; cv=none; b=dJf2vs+6vNtAjhpBi9y9VPio19pCHMjSjM576+fta6FK0IDZg60o0yTpI0taDx1dhYo0Qc56nkMG+qnl/oTignPZMFoNNPbwIKCdn/nm+jiFVff6S/cR8uHy98h7hn+u91R+DOpXPMiq8RsFRtxPqxQi4eCtlxPM3JW6UsLU+3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752570010; c=relaxed/simple;
	bh=BKETLAXRDnC5m24RMKN8pw8eBYyHTBZXnsvSUHoBQg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciwuaB1aamsulQf1naZjG4AbWMnVP2ce4FhDoJRMNEkhUD3KrEZ3KS4X0Y75+CiEnnuDhN9mKc5snTNbsBHN2U6/7PfzmU0i1ut6lTSBvKF1CDUGH5wHmipADQ6sAURqHJIlUh2Bw5mf0K0Pf6XjpAgiaV/DuDQhkLVyw+nquac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UbevkT71; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UbevkT71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VPqf
	bmT/2ffMbW1WX+QDYy4Wp44tbstcCGdK05U2umA=; b=UbevkT71x4Zf//dMeBZS
	DFKmTCMTx4Ypq96UXKFbz8mghY2AYQoKYPmUopdg7AXruFgN6fbFPvL3Htm5Arij
	r00WwfvC5uHt9u2p9gqt4ESdoOwJC6l/R/GTgWD9vS5/8MI1HMUjodgo62aQfjQU
	95AtdIjNXyFRiy+FK0X1vViZn7JYWfybXjGiB0+P6yH8kuZOT9fAaAAre4aQWKN0
	WUrF0f6sDlO8UAdZ/VbSfoOAtpOHgHbozxdnu4u22xxqkdajC7Te2IWtQqmTTtnX
	Hl0hZvrs4o59jpDTR9jQWtRGeBR5C4ajYhGvAm4lvTeopRL1Aiey4qxQcZVIDPZr
	/g==
Received: (qmail 2815614 invoked from network); 15 Jul 2025 11:00:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Jul 2025 11:00:06 +0200
X-UD-Smtp-Session: l3s3148p1@kT6uAPQ5mukgAwDPXx+vAAkEB0lWxGP4
Date: Tue, 15 Jul 2025 11:00:06 +0200
From: Wolfram Sang <wsa-dev@sang-engineering.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [wsa:renesas/g3s/i3c 14/19]
 drivers/i3c/master/../internals.h:57:16: warning: passing argument 1 of
 'readsl' discards 'const' qualifier from pointer target type
Message-ID: <aHYYlq11L3Y7cvVV@shikoro>
References: <202507150507.zP6CCoji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507150507.zP6CCoji-lkp@intel.com>

Hi,

> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507150507.zP6CCoji-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 15.1.0

So, it is SPARC...

>    In file included from drivers/i3c/master/renesas-i3c.c:26:
>    drivers/i3c/master/../internals.h: In function 'i3c_readl_fifo':
> >> drivers/i3c/master/../internals.h:57:16: warning: passing argument 1 of 'readsl' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>       57 |         readsl(addr, buf, nbytes / 4);
>          |                ^~~~
>    In file included from arch/sparc/include/asm/io.h:5,
>                     from include/linux/io.h:12,
>                     from include/linux/iopoll.h:14,
>                     from drivers/i3c/master/renesas-i3c.c:19:
>    arch/sparc/include/asm/io_64.h:265:41: note: expected 'void *' but argument is of type 'const void *'
>      265 | static inline void readsl(void __iomem *port, void *buf, unsigned long count)
>          |                           ~~~~~~~~~~~~~~^~~~

... and I wonder why SPARC does *not* use const here while every other
arch seems to do that? Doesn't look like I need to fix it on my driver
level, or?

Happy hacking,

   Wolfram

