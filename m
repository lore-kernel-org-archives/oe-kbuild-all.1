Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019B1DFC4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 15:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YvUji9dw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5O6szdcE"
Date: Mon, 20 Nov 2023 16:17:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1700493435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3luYjW4+b8eiOVyq/MgJ1GTBk4q8MbuB+R3JUqmQTI=;
	b=YvUji9dwKUG9gmCseE4F82oupuwKlYYjIKYGLEftJp9sjT/kXCv7CKvIsQ4PphrwOMU1ZM
	rLKb29ojeupexh2H7QrN84SVK+mL+11SX2jm14WwGwy1Kpc5+o6CZG67G35KubDz1RN178
	Mjyv8VZtzZFPIuobNu0wlVJt6AILWSFjnZgJLfo/59hcf6GlKL73dVBNcxQ2A96HZcq9tu
	m8GLRqlI8NcEXMhbt62TQdygsuunk4iBJl38GdgJWgbIXOnZ+vapxkSW0QHI4dcmSXH7Xg
	49Byu9fYwjEc13v8i+Q0cQ3dbeqOt0A0Pi/gTLjKw4whqRWs9GxO+I1U5bfFVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1700493435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K3luYjW4+b8eiOVyq/MgJ1GTBk4q8MbuB+R3JUqmQTI=;
	b=5O6szdcEW60mmbNfoS+J72fQnONmREIyw4rrpy/Atj6GOjDJ5aSWHt35Kc1sh9BH6b/oPO
	RvJ1pgWJentKVWDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: kernel/time/hrtimer.c:1483:14: warning: variable
 'expires_in_hardirq' set but not used
Message-ID: <20231120151714.ttaFVMK0@linutronix.de>
References: <202311120815.33YfGjzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202311120815.33YfGjzD-lkp@intel.com>

On 2023-11-12 08:52:44 [+0800], kernel test robot wrote:
> Hi Sebastian,
Hi,

> FYI, the error/warning still remains.
> 
>    kernel/time/hrtimer.c:120:35: warning: initialized field overwritten [-Woverride-init]
>      120 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:120:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
>    kernel/time/hrtimer.c:121:35: warning: initialized field overwritten [-Woverride-init]
>      121 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:121:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
>    kernel/time/hrtimer.c:122:35: warning: initialized field overwritten [-Woverride-init]
>      122 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:122:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
>    kernel/time/hrtimer.c:123:35: warning: initialized field overwritten [-Woverride-init]
>      123 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
>          |                                   ^~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:123:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')

This is "okay". The array is first initialized completely to a safe
value and then a few of the individual values are overwritten.
So this "initialized field overwritten", that the compiler complains
about, is intended here. 

>    kernel/time/hrtimer.c: In function '__run_hrtimer':
> >> kernel/time/hrtimer.c:1483:14: warning: variable 'expires_in_hardirq' set but not used [-Wunused-but-set-variable]
>     1483 |         bool expires_in_hardirq;
>          |              ^~~~~~~~~~~~~~~~~~

This is because the code using it is disabled at build time. I could
tweak the code to make look it used in the off case so the warning goes
away.

Sebastian
