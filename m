Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3693171C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 12:48:43 +0000 (UTC)
Date: Tue, 27 Jun 2023 14:48:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687870121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8vCxWGwFfkFUI3v90r1NOkN0TNhgjeNZ0Er2GFbfkk=;
	b=vz1o5J7VrVcEaxv5Xa+fMS5ZXlR+3wqMyxv/bw5KaIP3tmPIS5Ro8lAcsYVNvdUcKJZ0Io
	LA+FQ13h+6HTR4q1Nvt4HZKitA18eXT+MPUzTCCCjmvs9InLnF/0PvnKWmajcgLv4luwY7
	FT8v+EGV6DkPxYC5NxAdeVVlIppUzaXeSUoJunQ+Rif0fVDAwKCsM3CK92Na724636uNRR
	HkvYkYO2BikEwoJyqeBAHtl5zn3lr7QiqSSGWK3a8iZkc8k7UVwPD+fApdsEu+8uM22vux
	IOrPYVR3h2rhThztjzlA+HxYL95OqGW/3nyoXkeZB9GHcnAs55+k3uvmTcLO+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687870121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L8vCxWGwFfkFUI3v90r1NOkN0TNhgjeNZ0Er2GFbfkk=;
	b=dBzGyrvRy20Lipt7ZwgwkxnFXimxaBbWVpw8EFQqqeoGE23t9eqOa8b1lLPX9hJODo+bjS
	TelF4EiVJYKdhvCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: John Ogness <john.ogness@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.4.y-rt-rebase 49/83]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
Message-ID: <20230627124840.SendZkic@linutronix.de>
References: <202306270413.VuF8c38c-lkp@intel.com>
 <20230627100426.SDCiho1V@linutronix.de>
 <87edlxci0f.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edlxci0f.fsf@jogness.linutronix.de>

On 2023-06-27 12:38:48 [+0206], John Ogness wrote:
> On 2023-06-27, Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> > I'm tempted to throw the diff below to make it go away. But then the
> > CONFIG_PRINTK=n builds don't boot
> 
> CONFIG_PRINTK=n needs to boot. I will create a proper fix for the next
> printk update I send you.

Okay. In that case I wait.

> John

Sebastian
