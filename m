Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5E39B975
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785740341; cv=none; b=Jt2pTqeDHWaT6mgodCdttRtWOaEPIV1DDBksf60LEqdJaZAACiyNQdtSs2zpFDiViG0VtA1YCZhZGlUd3Ajrh4jyp0e6oxTPwVluoQ+oR0KDkARPGX+Qdzaew+lGHOualK5AGm0Lq91rranEEKl5hZIEFJHDV++qXdulaCWYkks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785740341; c=relaxed/simple;
	bh=P0otYyrb54VfOmmdfgaPUCxTbb6AFFslmUIF6MJrYxQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I8X3IRTzGEeHxcCGZuMJQeTwVqjNjew1fF6C0SiuEX2MgR8iN31QX3H2oN48Jd986YMzQCeOvJit/K2cioDNaxudGJTq5zkC5acnPWn7ohwzOvxHfAcr9H0OXycMiOxyOUJD//vkW6qOjxcQ/LerZtx9ttGpzg3j6ZJdsl6SL00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Yh2peG4R; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lJ51tMc1; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Yh2peG4R";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lJ51tMc1"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1785740336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00R/47mG14aZrbJV38853CvjaMEhg3zRbjrYmlUX3vc=;
	b=Yh2peG4RoYBkHmbZKCstZD/UhqwwRPQOfNoskmrnAEB88AQXZQhDDRk8FqZsPHDD68t/10
	TN3WesjdFoA56RcuN1agHcFebmW7SxW+YV6ub6F1LjOF+HRzjKZJ6SI9gt3pSn5ByaZxr6
	XbKVQPhJ340YsXr3E9IuUd0SuXsN9jLS/LYFN0mUdivYQ77hGXFr1u7j7M2Etwyst1IS33
	RkPSrHI/6RSYjA8Vb8yP9KtEK0SPl4simRU9jMJVDGLSpCULf5p5QD7EVkmVgISjZtpr3a
	P+nc8YTr6qJgYlalfVzzmeIlHIT4FGB0s7OC8wsqpO+tgHPGpdJSkCLukpb6Lw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1785740336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00R/47mG14aZrbJV38853CvjaMEhg3zRbjrYmlUX3vc=;
	b=lJ51tMc1NAdxYwZ+FnbQJcfq2mtQ5YDEKzJhDDmWYoLNgKeMwCLj/N+HPzUbqCJ6+z+4rW
	+hRC19cGf6blg4AQ==
To: kernel test robot <lkp@intel.com>, Gabriele Monaco <gmonaco@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [trace:latency/for-next 33/38] ERROR: modpost: "__udivdi3"
 [kernel/trace/rv/rv_monitors_test.ko] undefined!
In-Reply-To: <202608020311.hYjqOG5k-lkp@intel.com>
References: <202608020311.hYjqOG5k-lkp@intel.com>
Date: Mon, 03 Aug 2026 08:58:55 +0200
Message-ID: <87cxvzofkg.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

kernel test robot <lkp@intel.com> writes:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace latency/for-next
> head:   984b5a36fd12d1849511a45fda32036fe2b0d004
> commit: 8da2a88383658dac97769ed8f807ef6100a69480 [33/38] rv: Add KUnit tests for some DA/HA monitors
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260802/202608020311.hYjqOG5k-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202608020311.hYjqOG5k-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__udivdi3" [kernel/trace/rv/rv_monitors_test.ko] undefined!

We could switch the division to div64_u64(), or we could change
deadline_thresh's type to u32.

Gabriele, can deadline_thresh fits in u32?

Nam
