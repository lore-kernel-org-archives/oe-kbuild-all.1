Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90D11FDD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 10:58:00 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1677841079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGvZ1E9SBGGCi2EjmK+Y9NWo8ZTjKt02Cq8b17elzVM=;
	b=UJtdRKzJRsCqzrMRFhmlQOnqz8Wza2usAegzPyQHADLo78lmMT/xvMyUKDFLmIDhqPAmhm
	Pjew+2cuPrsZGREQhit62/ywIGFQ5ZnKENWS4fdMSLh3Z6n9i3wTeo8EEF56+48rbfMNTe
	KIO917D0ApAx/cAksUI6qs1XCLd19xJDOhjY3qQQw01ecI1UG5xXPenCDy5mwWWrBiEEkb
	JcoSrbbvN5ufEVcbZ6ZqhEhezlQv6Tr1PhNW1L59VMHSPU/IxaIOFG/jy3qBZCfb88Rkck
	o2YHVYLLIHN+d6kMSxddDh1pth476fJagJQd8IOfYCFYuBPE4IKSbbS1nvnpAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1677841079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rGvZ1E9SBGGCi2EjmK+Y9NWo8ZTjKt02Cq8b17elzVM=;
	b=rl8Zl7Uy2SY8oJLZTHw2wAjDnS+fVh7WODokzCPu7z0prA59nvvZ5dmMN5HpjFMggww+VD
	qOkwYMgLst7ErYBA==
To: kernel test robot <lkp@intel.com>, Petr Mladek <pmladek@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk v1 11/18] printk: nobkl: Introduce printer threads
In-Reply-To: <202303030957.Hkt9zcFz-lkp@intel.com>
References: <20230302195618.156940-12-john.ogness@linutronix.de>
 <202303030957.Hkt9zcFz-lkp@intel.com>
Date: Fri, 03 Mar 2023 12:02:35 +0106
Message-ID: <87jzzyw1b0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-03-03, kernel test robot <lkp@intel.com> wrote:
>    kernel/printk/printk.c: In function 'console_flush_all':
>>> kernel/printk/printk.c:2979:30: error: implicit declaration of function 'console_is_usable'; did you mean 'console_exit_unsafe'? [-Werror=implicit-function-declaration]
>     2979 |                         if (!console_is_usable(con, flags))
>          |                              ^~~~~~~~~~~~~~~~~
>          |                              console_exit_unsafe

This macro needs to be defined for !CONFIG_PRINTK as well.

diff --git a/kernel/printk/internal.h b/kernel/printk/internal.h
index 60d6bf18247e..e4fb600daf06 100644
--- a/kernel/printk/internal.h
+++ b/kernel/printk/internal.h
@@ -147,6 +147,7 @@ static inline void cons_kthread_create(struct console *con) { }
 static inline bool printk_percpu_data_ready(void) { return false; }
 static inline bool cons_nobkl_init(struct console *con) { return true; }
 static inline void cons_nobkl_cleanup(struct console *con) { }
+static inline bool console_is_usable(struct console *con, short flags) { return false; }
 
 #endif /* CONFIG_PRINTK */
 
