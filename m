Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3BE263F41
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 19:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751915237; cv=none; b=hs0wV9gWfD4jHE/VkFyrWSqZYdlJwFDCITO5zctISqWlsf6JY3g0K59bsKL8F0gwTDARWJH8rg56rsxCf0xvCfnPCOwbTfNMj0MhmuJ4epAMKxp9zZVspinK1PRVYPWbdKjfrHQubuNOFLawUJoaXjnVFVbdty229tWc6r7eFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751915237; c=relaxed/simple;
	bh=oRLESEOrbtlj+GCz/s7MlgKgYbdNWhVPX//pXiJslSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rcYK7tYIxCjMcNIUruRzUxZ2dF4kwq8TRFvztBTheCLlYXPv9q4tjAYDHLS4TXqew+bXG/00jW9DWOn5+S0VoT8SpbifsatYy9UFhOvuuTaZSslxSk4Ah5PMPgpbL3BNk0XMXFMZofhcAEvaNrlLJjbR5IwiTDBRx/lA4NvRmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qoSrGqcV; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7bdXXdOo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qoSrGqcV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7bdXXdOo"
Date: Mon, 7 Jul 2025 21:07:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751915232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mfy+PjqlWqBDu6WSeXo56GDjxlA+z2QbS0JGifpwJ6I=;
	b=qoSrGqcVc4VE10dnCKaVJ/chkcbF32MYspEQKhkr7q9v6r6W0pBLettzDSlQ7V1rI2nlMC
	VhNUdmqJg4c5FsLjZexeag5eHGnBDC/S7NGU1Jtq+j7/I0bJc1vbKXaboZCzl/tDFuPf+z
	T1F/2VHzWCS7FAubewkC4Hl+IAmvtkjrX6vXl+PVzX0dX/NuYFp1RyWu2RJ0hNnIGv8ZKg
	bmlLrunzaFDPujwdM4PmcKcLz0pMR10t9Cd52gQgdnJWYUdqEhUJ+tdfg/fFLCuTwkthmw
	X1asyb+ju9TF42FTHscc9Mp/yiT1qQPlG+U3VucIxAWwVOudiR0V1K0rr/qp7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751915232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mfy+PjqlWqBDu6WSeXo56GDjxlA+z2QbS0JGifpwJ6I=;
	b=7bdXXdOoOE0ezIYRSHaJPGXa8/btsv55KjOdKu3AmsFWh0RoOlJxnpm059pXVdjQkQqmQT
	v2GhfM58HWwC9qAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [bigeasy-staging:futex_percpu_ref 2/3] kernel/fork.c:1063:13:
 error: void value not ignored as it ought to be
Message-ID: <20250707190711.ty1hFv37@linutronix.de>
References: <202507080103.ZnxNjVVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202507080103.ZnxNjVVa-lkp@intel.com>

On 2025-07-08 01:49:46 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git futex_percpu_ref
> head:   68087bce4b1dfad7de82a55bcc27fec3a19df65e
> commit: 059f406972f3667040329c749c456120d9e05542 [2/3] futex: Use RCU-based per-CPU reference counting instead of rcuref_t
> config: i386-buildonly-randconfig-004-20250707 (https://download.01.org/0day-ci/archive/20250708/202507080103.ZnxNjVVa-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250708/202507080103.ZnxNjVVa-lkp@intel.com/reproduce)

That is odd because HEAD 68087bce4b1dfad7de82a55bcc27fec3a19df65e does
not have commit 059f406972f3667040329c749c456120d9e05542.

I had this commit on HEAD 6ad1191ec43369855279c9a48c6d3639546d9dbf just
briefly before I noticed it.
Sorry for the trouble.

Sebastian
