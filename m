Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F24B171CF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jun 2023 10:04:35 +0000 (UTC)
Date: Tue, 27 Jun 2023 12:04:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1687860268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnAc0qn5dr9YyR1APaCxKjp+lkOIU+8IL/r2BbWTuD0=;
	b=JnEfQn2LdtKg59SC1YPsvisVVZQ230jmea0JeJnuTK/3EMz337/hlzcWOJN0T0SNx18TAE
	uN403jHBO+trtWEQ/fY09fi/fDyYB5ZF9S0XkuqigZu4Mpc1qYzP2iuzU/KFaqALj14ftr
	274WqwBLixwWBNJ+4ozyI16crisbxrWqrUOw4fMJ6PKUx8WOQ9pjQlLxJ49gpgDMCtGST3
	icQTOmmaJb2Lj6FmW0L9RCWRymqJ8MorVms6ZRY5B1LoM7bGL5Ahuhxmb4gyf/Fmx617Ns
	u4SStHyQv0N4ubwl4bINZFf2ieGkKn1N4mTIgxHAruGf2+gmGjOVDDsY8K2YsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1687860268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vnAc0qn5dr9YyR1APaCxKjp+lkOIU+8IL/r2BbWTuD0=;
	b=wdIViPPpVS34Mh4235TORFA3lZxz3ZyKFepJ2vECAv6M6TjE4d6E5NYRauZVgW2H5OpzuK
	Wr/tRwXPawn1RuAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: kernel test robot <lkp@intel.com>
Cc: John Ogness <john.ogness@linutronix.de>, oe-kbuild-all@lists.linux.dev
Subject: Re: [rt-devel:linux-6.4.y-rt-rebase 49/83]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
Message-ID: <20230627100426.SDCiho1V@linutronix.de>
References: <202306270413.VuF8c38c-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <202306270413.VuF8c38c-lkp@intel.com>

On 2023-06-27 04:21:33 [+0800], kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
=2Egit linux-6.4.y-rt-rebase
> head:   af81296843894057eaa7e1054b5d8ae77d2e25b1
> commit: d16247f05c66d83c413856b7b6aadc96bd61aade [49/83] printk: Add thre=
aded printing support for BKL consoles.
> config: arm-randconfig-r001-20230626 (https://download.01.org/0day-ci/arc=
hive/20230627/202306270413.VuF8c38c-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230627/202306270413=
=2EVuF8c38c-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306270413.VuF8c38c-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> kernel/printk/printk.c:3361:6: warning: no previous prototype for 'con=
sole_bkl_kthread_create' [-Wmissing-prototypes]
>     3361 | void console_bkl_kthread_create(void)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~~~

This is due to CONFIG_PRINTK=3Dn and I'm tempted to throw the diff below
to make it go away. But then the CONFIG_PRINTK=3Dn builds don't boot and I
don't even understand why we have register_console() in that case an=E2=80=
=A6

--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -459,8 +459,8 @@ bool have_boot_console;
=20
 static int unregister_console_locked(struct console *console);
=20
-#ifdef CONFIG_PRINTK
 DECLARE_WAIT_QUEUE_HEAD(log_wait);
+#ifdef CONFIG_PRINTK
 /* All 3 protected by @syslog_lock. */
 /* the next printk record to read by syslog(READ) or /proc/kmsg */
 static u64 syslog_seq;
@@ -3302,6 +3302,7 @@ void console_start(struct console *conso
 }
 EXPORT_SYMBOL(console_start);
=20
+#if CONFIG_PRINTK
 static struct task_struct *console_bkl_kthread;
=20
 static bool printer_should_wake(u64 seq)
@@ -3390,6 +3391,9 @@ void console_bkl_kthread_create(void)
 	 */
 	sched_set_normal(console_bkl_kthread, -20);
 }
+#else
+static void console_bkl_kthread_create(void) { }
+#endif
=20
 static int __read_mostly keep_bootcon;
=20

Sebastian
