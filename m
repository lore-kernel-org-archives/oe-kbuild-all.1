Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD92161E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 23:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245534; cv=none; b=JuaAbVhp9wp8Rt0toJMxu8ow/3MpHcCaw1pQV532zj98hKiB9JXwqeMhqUMPGOeSw+M3AmGDXFeeWKX+AAkyiEFMqTaVVE0hlMiQdNudylODI7WXjAlVc/V5Lx5B+3DhngXenshSUGIPtW/tU2eCcwjInATSQeZ2Ux4JVnKLub4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245534; c=relaxed/simple;
	bh=Ycbkc4m/UIWmd0ZdeIIh0OkgvSRaDSYxnr5Q854vKVw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oXTFQhiG/nqcaFLggKVASANIG+W7ohZ0l0Hvr+t4uOII6U/T3CKkSzCqKR2HtHvy6jkGRpvy2DsvTObePycUEViLoEtfnKRVQe6eo+gFnC5pHnIMjfGpmjGZOcPA4SaIGNJOFlBuYXCPXKdyEURAD9iMCOwj5KYgsC4mVitezgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=f6SRuWHS; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cyk3ivoE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="f6SRuWHS";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cyk3ivoE"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730245524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SKzoyvgjA9WmjdrV5ZU+Q+v9Fmi6jIi6GAdTufk86QM=;
	b=f6SRuWHSWuB6OI9pcA8Zw4o8MK37RGdqECUypnOy2B1Axer3cU/EY7MnKPtg9vudW/HVqp
	5I0gPKlV3CVi0WvbOprNZnR5C6H6rdzCyFo9QMKcce2NWOV6INDnaczYGDRplCehLuuXDS
	5ZAINcjIGDKM2u4/q64jE8p+QWl589mxl1UgiUj2N9A6KekIVyA+0jG+vcBb6bBf5qkdk0
	I5K2PpLyBHlq/b3ANIPw29tpF3kf+d5y6OEAyTV004kwOOUfYOashWKNlOMxpvQs7nNjoZ
	PDUNONTSi6m5r8Tb0wwjWAKXOJj+O4aoTmAloz98b2+lB5wIoOhdhJnRiugG5A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730245524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SKzoyvgjA9WmjdrV5ZU+Q+v9Fmi6jIi6GAdTufk86QM=;
	b=cyk3ivoErAo0W7MgG2IUrJ9a6WjE0DA+tRoNqxTwrePWGe8THbU7IX6BW6LSVi+7KJggVI
	bsBLWHRIIUwXW1Dw==
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [tip:timers/vdso 11/13] include/vdso/page.h:15:39: error:
 'CONFIG_PAGE_SHIFT' undeclared here (not in a function); did you mean
 'CONFIG_LOG_BUF_SHIFT'?
In-Reply-To: <1d6a10ca-3d86-452a-bdba-03a1204dd232@app.fastmail.com>
References: <202410290639.TBG289SO-lkp@intel.com> <87ttcuzjy7.ffs@tglx>
 <1d6a10ca-3d86-452a-bdba-03a1204dd232@app.fastmail.com>
Date: Wed, 30 Oct 2024 00:45:24 +0100
Message-ID: <87iktazd63.ffs@tglx>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 29 2024 at 22:05, Arnd Bergmann wrote:
> On Tue, Oct 29, 2024, at 21:18, Thomas Gleixner wrote:
>
> Part of the problem here is that this simpler patch
> then just causes different build failures for the
> same configurations, since m68k kernels cannot successfully
> build when no platform is selected.

But that's a problem which existed before all of that PAGE* changes,
right?

Geert, can you please take care of that magic Kconfig maze in m68k as
I'm completely lost how that is supposed to work?

Thanks,

        tglx


