Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151091C2F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 09:07:52 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1693904864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWRrjrUEtylXDv3pxSFOM6Z4Sh/7jFmkYLcNS+9RmWQ=;
	b=HBCdebEzsdhO44DbT5rW2MCHknV88PeoEPmrI6dkJyFY3rKCJWnpN/8cZjdF6PUPJjzr/O
	F5MQ/BJ8gYsfFtvq/xUyFjhjSv5o3qFjhpFD/7XCtIM00LHeFUN7leX6UlFwaVJk0QIEFy
	4Mb6eXDbQUeaLqF6A4A+jd4yOLFPp5Kprx3NUEnLoCW3Ienv5A0p6GI9e5Y0PSYxdKb3DM
	rheJ4Jk6u1aqA+wgx5guN2TZ/yvZAbY/mvDRfKSNgOg0yt0kmcUR7ldGkpxayEmkjJthR+
	r/suoIVnXvGjKbXqwXTOhRZmoDMDaWWlWUgjoxdbECiHAhQMHv87kl1hvMQhTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1693904864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PWRrjrUEtylXDv3pxSFOM6Z4Sh/7jFmkYLcNS+9RmWQ=;
	b=fQLpM0DNFpkO5jlfm6tKoVoGoTWW6pFYUdSuTxry2OkrY6TJlOsGaqR+iLnVKsfDZgF9U4
	bZBMjibhoqETGfCg==
To: kernel test robot <lkp@intel.com>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v3 2/7] printk: nbcon: Add acquire/release logic
In-Reply-To: <202309040038.Cn1kd5bN-lkp@intel.com>
References: <20230903150539.245076-3-john.ogness@linutronix.de>
 <202309040038.Cn1kd5bN-lkp@intel.com>
Date: Tue, 05 Sep 2023 11:13:43 +0206
Message-ID: <871qfdxa1s.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-09-04, kernel test robot <lkp@intel.com> wrote:
>>> kernel/printk/nbcon.c:392: warning: expecting prototype for nbcon_context_try_acquire_hostile(). Prototype was for nbcon_context_acquire_hostile() instead

Thanks kernel test robot. The kerneldoc will be fixed for v4.

The function was renamed for v3 because it now always succeeds. There is
no need for "try" in the name.

John Ogness
