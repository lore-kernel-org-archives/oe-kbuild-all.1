Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA331F991
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777885699; cv=none; b=Zq7LItymuF4o1Qh1nNEkCy7d2aZKIdhZAi7v0wXF+nFEpCbwU1jKlzAEL8luob08WNeH92eVqxdmZCpJRnlZCzMafc3gMyykf34O7g28LcucLBCW44zBSP9haq2BcQWdjqM5rjb4hjCfvxmCIs2Y3gNPbN+WIhE2UUK0JWRb42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777885699; c=relaxed/simple;
	bh=04i01+4s7p1T1DW+YXo4VhZu2WF5QYa5Aso+HESw4Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARUKh9kJZNSSWwT4ZIpvBgJOqzhkAnh5RcofxMl7Qr9JEVOfXZwUQeS0sRYOhPYM7QMaAFtoztusfn/Y/GIVuax10UY63io7nqlp6XUvsjs+tE7AfBX1bhVYUD2qEdWGWnrkZ3DnIfTJEwQbU2P/wQKLRiStSTvSlASKlK4Tm9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=eeCYdVyc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+JUuDPkq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="eeCYdVyc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+JUuDPkq"
Date: Mon, 4 May 2026 11:08:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777885696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFn4ndPtC7YyH1CwdKF8EBrBtoca3wcCGLA1iZdHQjA=;
	b=eeCYdVyc6PKnXU6KC2HwEmC4F1ANPYfE+fPmrdyXz//LrLBx84MSYkHC3HpkKwoXlzFlPN
	YuHsc5xVgp+/nSeFtMghtps39AYvtONkI9gw6pP3kur7YtsX5T3D+VjS9uch6e2ZhtGMfl
	mrq3m7WwxaEbKgLx++sI3QRe3KnkfPGoqEb85H6cY9OF0r8ExJCuMEIXpp0xU/XLxoNll1
	LJJKEiFJppFOAxA5PdKlDLwt1H/I1qyOEtOf5Vj+RHc6YDEJA2PZWvAc8W8qKClrP3SplK
	uXiTe4tq+2h0gh8+wq9XxNHxY7wUnBodGQhZIQLB5LNaKsUioaeM+HbzRNPpNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777885696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MFn4ndPtC7YyH1CwdKF8EBrBtoca3wcCGLA1iZdHQjA=;
	b=+JUuDPkqkpKaWResz1d3+1f7hKSwtWxbDqevL57eruAnhIL5VYSWIKWDuSK8RT89Qberae
	9GcH22gr6xpGw1Aw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, MD Danish Anwar <danishanwar@ti.com>
Subject: Re: [mda-next:icssg-dev 1/8] include/linux/if_hsr.h:58:19: error:
 implicit declaration of function 'skb_ext_find'
Message-ID: <20260504090815.AtyOwpll@linutronix.de>
References: <202605031429.Vd6jaWrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202605031429.Vd6jaWrJ-lkp@intel.com>

On 2026-05-03 14:31:41 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mda/linux-next.git icssg-dev
> head:   a5d36e904451db02a17787219fd06b6d2ba16f1b
> commit: 756ed4bc4a527cdddc3f9f09240637ceb3408645 [1/8] hsr: Allow to send a specific port and with HSR header
> config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605031429.Vd6jaWrJ-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031429.Vd6jaWrJ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605031429.Vd6jaWrJ-lkp@intel.com/

This appears to be an older version.

Sebastian
