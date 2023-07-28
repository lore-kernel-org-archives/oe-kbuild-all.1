Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A44D305
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jul 2023 09:10:05 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1690534818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jnmY0M8OuuhSiSh/x+he+nRFbUG1l3nvKg0ZHWRzi+Q=;
	b=AY5tD1omkM4ZkaDNWVQYQWflmux6ksKh4Bth/5nsZrIvkJP5e8qM5dxJOSTAcyQ7WAVCbN
	qZJvhv8k3KIwPZ4tK92bOAsMZiMmB4dfOV/dQ3Vy3zr/NJtedfJDUC09rtolx00mx9z73c
	Fsb9AwihdB8umuwQBEa2M938uGBl3Ot42Hojfb0kOorMzRPtfvZBz7HD2gwSOCzLl4ax8/
	W0bRqntrVzPLhCB9EssYPj1DHg/4dXfMDLFYEln/Tj4oWnPWoQsYqw91VtCU+vqGru9+jj
	zet/GVo53+t+07bEU4Pw+mGOy+tcCzsbjUjuE/DnY4fjY4cQnn5myDLAnSa0qQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1690534818;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jnmY0M8OuuhSiSh/x+he+nRFbUG1l3nvKg0ZHWRzi+Q=;
	b=/fIDc4E8awRRUfh41aqLOsBZVfoRbacCbBLYyVy6kaXs4bY7rAZFXjutjNxHH8ZiHQ8mWC
	ZZcN3ute/jY2mhDw==
To: kernel test robot <lkp@intel.com>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v2 5/8] printk: nbcon: Add sequence handling
In-Reply-To: <202307280939.4IPb76dh-lkp@intel.com>
References: <20230728000233.50887-6-john.ogness@linutronix.de>
 <202307280939.4IPb76dh-lkp@intel.com>
Date: Fri, 28 Jul 2023 11:06:17 +0206
Message-ID: <87bkfw1kda.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-07-28, kernel test robot <lkp@intel.com> wrote:
>>> kernel/printk/printk_nbcon.c:168: warning: expecting prototype for nbcon_read_seq(). Prototype was for nbcon_seq_read() instead
>    kernel/printk/printk_nbcon.c:182: warning: Function parameter or member 'seq' not described in 'nbcon_seq_force'

Thanks kernel test robot for spotting the 2 kerneldoc errors. I will fix
them for v3.

John
