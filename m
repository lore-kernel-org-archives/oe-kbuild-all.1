Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB0384A24
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jun 2024 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717407779; cv=none; b=R7mBQUDKvCrGBgz01NqcJWrZouZ/Ia7zJgmRJXplzUpgkMvFxGXvMUgnvGeY3T4aHhEYyBrFqLJzq/mb6Uif1SEB2i357wEQipr+Oq0yDqVq81w+SeK7feB6GLg0S1qM1b+zVl1UiaURKMAXITo+Spcf55mUkcsYvkXzvQvyozQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717407779; c=relaxed/simple;
	bh=ucxKbc+ObriDkdhhvwk4NrzBCm37W5LZsryYifn0rP0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dcquGN+3DDERRpF69aNR0CK6tIEWZ0mpWIo2ZKzi5E1vdg2pidLISMnDj+CNHzq0PCk1bfSBO2MXObNCuEMRs8PDU37nzO6sBp535CMkTuLSZFazDxCVxGLcTOJKxCSZpLWyJvSBWNdjhsrsns8on8C3EI9MrcNODQOtBDP99z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ROsTg/E8; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=x9+zLqiw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ROsTg/E8";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="x9+zLqiw"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717407776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gy16qnSspwmeQIfLQURUw5SSOczq3hFutpwq5ReK1I0=;
	b=ROsTg/E8ZTFR32Fo94vet7797ImnsI4sBuyKq6s/wUpj91TdAGRZlP7YREgEosloZ1U3L0
	z98xCG7zuE7wdjRn2bOh2wmmGSsUpgxlw7IcCtiUt98XGhg23TAmSX/uTFj0ZU8WHw4iJK
	D15ZqoIrmyRtHnNjJ2Nd9JBIElw4kDI+O/X049CaRGxNsYKKR9XUnft+m+mDsKyzChT/YO
	PlBr+OFAUMM1F/P6ikxpCBr6WmymamQfsmbjhkVoDZHdKXYG8IfTlfKabIgTq42JEnaCNs
	S3eZw+w5t165mYkBcZLqQJUIoc4EqB4hcHaaALOilZOp3Ns0QLeHnqSAErwvsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717407776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gy16qnSspwmeQIfLQURUw5SSOczq3hFutpwq5ReK1I0=;
	b=x9+zLqiwionq+RMX7RNK/4DZ5Wn8JgY2g6FMXzzN5LMheRzbhbjHvWAbqc+85/fqfi0bXG
	JOwxibop/9d3CSDw==
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
In-Reply-To: <202405300545.mVqyyvyr-lkp@intel.com>
References: <202405300545.mVqyyvyr-lkp@intel.com>
Date: Mon, 03 Jun 2024 11:48:55 +0206
Message-ID: <87ttiamkf4.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2024-05-30, kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.10.y-rt-rebase
> head:   6d20efa57a896036453f4b061ae22601ef61b494
> commit: 127f3e5b794bd6fa90d4649318dd898455efa6d7 [63/93] printk: Provide threadprintk boot argument
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300545.mVqyyvyr-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405300545.mVqyyvyr-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>>> kernel/printk/printk.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction
> --
>>> kernel/printk/nbcon.o: warning: objtool: __jump_table+0x0: special: can't find orig instruction

On loongarch, it looks like all users of the jump_table are causing this
warning. I will assume this is something that needs to be fixed at the
arch level (either in the kernel or the compiler).

John Ogness
