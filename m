Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99002352004
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787573251; cv=none; b=m8R4NKSbreUNLblqrnq3ridBrsrBeX2cicq0C+1PLiyWhTRv9aUBuPNH5O46lrkWH5oGs6ydtx3q/FfaKWkMnj+HK5o1fu8TQOC2WaZy4wYEgH1vk6SWb4XqVr/YMTV2jI406pYBs+abFKQkEVgo8aIbUZZOwTDgG9hp2MLvR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787573251; c=relaxed/simple;
	bh=wGivh1EG7M9Aa6nG+JRvdFtKIHYMw3puStywZVxdFhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnXUeoIe2AzdozqOUnilVbe0NMRnTM9Ucg9NyflAP9jfI04AepCnOn5uXtxNCIp1AtHUvM4mvaq6Nj0fskT3B/VWpnvJF7SRwXLdBymPf9U/2BiSijnO4WsWWNdZxqhONNo/HeMMnqSVtVtxP5xg/9+7LCfdhdVbEQ0WLVUJ09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=vbSjYkZf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O7Fo5fJ9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vbSjYkZf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O7Fo5fJ9"
Date: Mon, 24 Aug 2026 14:07:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1787573247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8d7IhavWRSYddeM7+HpmScMO7Py4QMomBtOaPS3nsE=;
	b=vbSjYkZfzi/x4FTBGR5yscwthSquFNxi3ph2S+uBBoHTgzJiuQqjLLXs8x2NHTAucuWuUl
	eJz1vGF0mtVfKhry6t2eIL/5WsjNZh+njgvdjz3sYgli1IdkR1JPnuEoefli+VC+fsq7M6
	AlXfzZ6XfT+OaczZETe0gklQLz/V6DjwTY3rxfYasfGneyBB3vrhWqEGFCyK0sKdM0iKDB
	qSL+JgNsBaZuba5L3iEdSkd/QOpShwRVvdhBwTtGdFXhwhoOlHLyUOmxrJQHWcLMN4w534
	1+NdDm5gkvY0GL69h08+mzvDsh0BRhnDhusLIJih9lHKUhjYqmvGmCOc7AqNNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1787573247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v8d7IhavWRSYddeM7+HpmScMO7Py4QMomBtOaPS3nsE=;
	b=O7Fo5fJ93Hi3bEldfMK5OSh8XdF9vb8WHp4XSOXbFuWH+tbxgdLuKa82T/nOyOCJW1DRyR
	VB6PhQt1KYkowvDQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: arch/x86/include/asm/timex.h:10:7: error: call to undeclared
 function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <20260824140556-6c558e8e-5a28-4e8c-9830-5159788b63a3@linutronix.de>
References: <202608210426.fkFfnASG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202608210426.fkFfnASG-lkp@intel.com>

On Fri, Aug 21, 2026 at 04:49:41AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   cb8a75eec0877810b50aa1c5a833f929525cd2ee
> commit: 3ed403bbc967a3138b8e37566510e9b062751372 treewide: Remove CLOCK_TICK_RATE
> date:   5 weeks ago
> config: um-randconfig-r053-20260820 (https://download.01.org/0day-ci/archive/20260821/202608210426.fkFfnASG-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 935bfc708590c60147a79c7df145bb6e68b1d388)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608210426.fkFfnASG-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 3ed403bbc967 ("treewide: Remove CLOCK_TICK_RATE")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608210426.fkFfnASG-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/um/kernel/asm-offsets.c:6:
>    In file included from include/linux/crypto.h:18:
>    In file included from include/linux/slab.h:17:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:22:
>    In file included from include/linux/mm_types.h:16:
>    In file included from include/linux/uprobes.h:18:
>    In file included from include/linux/timer.h:6:
>    In file included from include/linux/ktime.h:25:
>    In file included from include/linux/jiffies.h:10:
>    In file included from include/linux/time.h:60:
>    In file included from include/linux/time32.h:13:
>    In file included from include/linux/timex.h:67:
>    In file included from arch/x86/include/asm/timex.h:6:
>    arch/x86/include/asm/tsc.h:79:7: error: call to undeclared function 'DISABLED_MASK_BIT_SET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>       79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
>          |              ^
>    arch/um/include/asm/cpufeature.h:52:32: note: expanded from macro 'cpu_feature_enabled'

(...)

For the record, this is handled by [0]. See also the discussion in [1].

[0] https://lore.kernel.org/all/20260819-uml-timex-fix-v1-1-f690b514fc9f@linutronix.de/
[1] https://lore.kernel.org/lkml/20260823201521.2576344-1-fabian@isomorphic-ai.com/
