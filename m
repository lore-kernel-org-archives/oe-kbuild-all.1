Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861818470
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 10:32:58 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687861976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zOTCgjwbPFduHnWFSeQycvP6HLaL9H+HU9A7nMeqmGo=;
	b=vSNN4uR+wXv2zpg4KtPFNxJYBHIrAP7zAXJ5SKiksOn7Vu5jeIfEKOvaLiY2M6aSLb5b0B
	zUN4YVZbWVTQi8DOomJsmReSdmEB46NUYPxfqxrbLutyEN/Pta7Xr5IU0LjG+GbAyVslSq
	IXVfE9x8gpO2w1wrUgXJY6CcW5rOcucB32+7DNFXu40SFDpKkw20NC0PkmjuVpV6OC3JLa
	5CVEQ0BsNzY7H5CTtE4PCFuO2SViN4eFcUkQ3c1t3XE1gZ4k6Ygl14q5xwfMcVY98AS5gP
	GuobKQCgNUu50GTvXd9tWGbo6WB2Ku6Pjj0CEs0E2ztFYhp/4uBobju7ptQGjw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687861976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zOTCgjwbPFduHnWFSeQycvP6HLaL9H+HU9A7nMeqmGo=;
	b=FzduVT2P80lOSYRGoOhrunyKWj24L17iHCikObRSUQKvpgjnWqeTcBOnAdDnyFmdPTZpkJ
	wVjhlfXTOgQmVYDA==
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, kernel test robot
 <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.4.y-rt-rebase 49/83]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
In-Reply-To: <20230627100426.SDCiho1V@linutronix.de>
References: <202306270413.VuF8c38c-lkp@intel.com>
 <20230627100426.SDCiho1V@linutronix.de>
Date: Tue, 27 Jun 2023 12:38:48 +0206
Message-ID: <87edlxci0f.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-06-27, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> I'm tempted to throw the diff below to make it go away. But then the
> CONFIG_PRINTK=n builds don't boot

CONFIG_PRINTK=n needs to boot. I will create a proper fix for the next
printk update I send you.

> and I don't even understand why we have register_console() in that
> case

It is a historical mess. We plan to clean it up once we finish with the
printk-rework.

John
