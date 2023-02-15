Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E743B6109
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 15:44:45 +0000 (UTC)
Date: Wed, 15 Feb 2023 16:44:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1676475883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJ1OMkGKAhulekyGtodTofc1ueBcmHuLjislMeJF+7E=;
	b=brY7L4gJGA5EDKWfGlKgBLC+yGl/3+Ua8WyCJEaCgi7G3nWd0WlmV0KUEC3hJ2bdlrl+DF
	P15VaDjwrCUt6rxAY4WDstV8GJGLMIaj7EzNsuMXU+sU1BVu+UuIEgxGI99zFUcKgPEX0H
	WlkF+Ll0W+yCur14M/UMK0w1TNxqhi3K0bpsP0F2GcPapIG5oqoQpTCluXbS+0G1qvWCgo
	iF2q77Z5YIvgYY05zT6zn3N9uI1ampQJlkTfvAHZAyS7ylGfLWZ2W5VzErFxbCnoGcpEtX
	MxX7eTn3RyFtpzSS5syIzt63/zleESvCY4MVm/pq9qPemm90mdoUJLebFBLdBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1676475883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJ1OMkGKAhulekyGtodTofc1ueBcmHuLjislMeJF+7E=;
	b=vXOu0+WezXQiAMc9ixcM+x02Y0YHRI6fk3xREJQGogpw5I3iIycwd5fRqBsnKXO/wVuPR4
	hUAWLgeCPQdiwkCA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [tip:x86/vdso 3/4] arch/x86/entry/vdso/vdso32/../vgetcpu.c:13:1:
 warning: no previous prototype for '__vdso_getcpu'
Message-ID: <Y+z96g1rVaHGf3HI@linutronix.de>
References: <202302070742.iYcnoJwk-lkp@intel.com>
 <Y+KFYUqM5pT7iuoK@zn.tnic>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+KFYUqM5pT7iuoK@zn.tnic>

On 2023-02-07 18:07:45 [+0100], Borislav Petkov wrote:
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Tue, 7 Feb 2023 16:13:24 +0100
> Subject: [PATCH] x86/vdso: Fix -Wmissing-prototypes warnings

terribly sorry to have missed this. I wrongly parsed it as another
instance of the other thing.
Thank you for dealing with it.

Sebastian
