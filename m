Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D93156CD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 10:11:07 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1695204659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya3oA5m+S3IRTj3mSgGoWHt1HQa50CRux3q/MVbDByU=;
	b=YgfjXfrg0d2ZFS5QHtSG0RuG/UKysA6sbXXWkb9+GWXXZmQsf5fJolDrvnj6C5ao9tZLtj
	7OMisTDRIWWccdTrR2oHXgvg405svYfuHPD9fjOmARmpFoWdoCR4OG0+0WZjM4ooNHhe6k
	Swf1xhoE0JgwFKhrGi6NZ4Y1c3tpRm8boJp2DhkTNVxCAnFUT4UvDQyalUuhv5FKiIsOy3
	wOmGcaN5/aNof9JmIAQz/fOr5fjwj1QthNiEJAhcjaQHB9DZUI6PiwV6W829cfF4Hpvwnf
	wa4TSZ08apN9RuV1REIX6/4u9Nk9p58M8bKJdmGss6sX2a42bOxPu4AjG/AABQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1695204659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ya3oA5m+S3IRTj3mSgGoWHt1HQa50CRux3q/MVbDByU=;
	b=bx8Gzjo0WxwSg/rfyMwX7Sa6H7T6gPRloZ8oNizOquCqwPAjPVN+m7uFCYwk8cPs30ynLu
	Wsv9Oy2p4iIcvXBw==
To: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Petr Mladek <pmladek@suse.com>
Subject: Re: [linux-next:master 5670/6619] kernel/printk/printk.c:2871:24:
 warning: array subscript 0 is outside array bounds of 'char[0]'
In-Reply-To: <202309201724.M9BMAQIh-lkp@intel.com>
References: <202309201724.M9BMAQIh-lkp@intel.com>
Date: Wed, 20 Sep 2023 12:16:50 +0206
Message-ID: <87a5thtas5.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 2023-09-20, kernel test robot <lkp@intel.com> wrote:
>    kernel/printk/printk.c: In function 'console_flush_all':
>>> kernel/printk/printk.c:2871:24: warning: array subscript 0 is outside array bounds of 'char[0]' [-Warray-bounds]
>     2871 |         char *outbuf = &printk_shared_pbufs.outbuf[0];
>          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It is crazy all the things that get compiled in !CONFIG_PRINTK. We
definitely need to fix that after this rework.

As for this warning, anyone have anything against something like:

#ifdef CONFIG_PRINTK
static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
{
   ... implementation ...
}
#else
static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
{
        *handover = false;
        return false;
}
#endif

John
