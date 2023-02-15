Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25767B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 16:35:42 +0000 (UTC)
Received: from zn.tnic (p5de8e9fe.dip0.t-ipconnect.de [93.232.233.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 55F701EC06DA;
	Wed, 15 Feb 2023 17:35:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1676478935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=OxKmQpCgCVhEDWenHsFBSK5EqAaCfpygxteLse9og6I=;
	b=k/r5yuzxIK0NXpAz5GfgvP9w8HBNyzXG6oo85jaQOPVdV/i6rwXo5Wtg1TcFFM9WDzNiCl
	fJsasWalw8iTjt+KGSCMWg7c20ys67OYrMb7Tsa2euczCMDvqUI44UFxc0OHHyMzTQGpN2
	1nPbCn8YHKMHBBOIwOfIXzjYMOdZvQ8=
Date: Wed, 15 Feb 2023 17:35:31 +0100
From: Borislav Petkov <bp@alien8.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:x86/vdso 3/4] arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1:
 warning: no previous prototype for '__vdso_getcpu'
Message-ID: <Y+0J08MATJvayTaE@zn.tnic>
References: <202302070742.iYcnoJwk-lkp@intel.com>
 <Y+KFYUqM5pT7iuoK@zn.tnic>
 <Y+z96g1rVaHGf3HI@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+z96g1rVaHGf3HI@linutronix.de>

On Wed, Feb 15, 2023 at 04:44:42PM +0100, Sebastian Andrzej Siewior wrote:
> terribly sorry to have missed this. I wrongly parsed it as another
> instance of the other thing.
> Thank you for dealing with it.

No worries - I'll do the easy stuff only. :-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
