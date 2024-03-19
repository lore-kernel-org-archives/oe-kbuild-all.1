Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D86208DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Mar 2024 06:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710830117; cv=none; b=tZq56T3Batwo+C+Ch3srrC84PaRicu1LJhANmGKTJ5DzQ6upev6W/Z6eJkDhzNiDNvSBKA210aPh/s9cvORx7T4lhkcyOuA7UC6RtV2B1rwEh9dPeodneXEa5uDhjdV9YwaZDrDQ5PpvM+PeXRYcOUkDmdLOqc81IIpHcJvZvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710830117; c=relaxed/simple;
	bh=LpQdJF8r/03qO4youFP2qUUU+sADJhH/TOdqiOnwRFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DmPc7QpKypQCoB9IxffMF6hXXRdN5yvXuOhbzbyOVu2LSOsp8ZLpD5fHbh20pfJYVHgITpCfTfRvgCSNYKQl5EToSbh3SvZRR8vlNOP8uCUcklFuO3BvRAY9fmNI3Tw7C5B5TJwapcrU8/Xyhm/iAbbDPWT7yE0eaGEtI0L4Wv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lykj9Sic; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3JjXetvp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lykj9Sic";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3JjXetvp"
Date: Tue, 19 Mar 2024 07:35:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1710830107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7JYiigJHueo5OBes8typorgQDP1x1yoOlTiHCpzms2o=;
	b=Lykj9SicpXMkd3o5qUo5KLTYWIKhzON/HJSEzILYAbmn38on9WARkH+W5Hmzweg4OiqPXg
	Bp2Hf2QeYIGWjGUxAwtJyjBE1MNgYDWU0jD3zclNPomKKUulf+6vq3Fl94fzDIcQmjmgZE
	wri8bXPAVL3IfbceBsLC4xjz8KJeVxHEfUDnfsUuvqE8bKhdVicM11QRhN+rAOzwmnWcTY
	SIsz+hp5mmNPzdhpFkS8U9oWhZnwdU+rKCYB2E5jRe1VuIWG1MjWi8i9MdJSho0g6qmxPL
	narS1Lw652omjH7M1Q5j5H3jUmreCLKtOAvcS6UWUf+5z6XvOTutM/U9gNaMvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1710830107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7JYiigJHueo5OBes8typorgQDP1x1yoOlTiHCpzms2o=;
	b=3JjXetvpwAdTvUyjZUee0MHpNb+xgPUyTQchWscVVsgA5op9UuDz6RbqC1/5CV3n97YR6S
	N/Nk0Q5l3vchoOBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Cc: Ben Hutchings <bwh@kernel.org>
Subject: Re: [cip:linux-4.4.y-st-rt 1008/22725]
 arch/mips/include/asm/elf.h:228:23: error: initialization from incompatible
 pointer type
Message-ID: <20240319063506.AmxvUePC@linutronix.de>
References: <202403191433.fX3nKbft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202403191433.fX3nKbft-lkp@intel.com>

On 2024-03-19 14:08:35 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.4.y-st-rt

Could I please get excluded from mails for the /cip/ tree? There is no
thing I can do.

Sebastian
