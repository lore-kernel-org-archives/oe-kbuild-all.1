Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CC0154AF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 11:11:12 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2AE471FF6A;
	Wed, 20 Sep 2023 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1695208265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G8Oa3m+ynfPIOA5G/28k7a2pfw1DzdpOi8F9BUM0ysg=;
	b=YBlMVlscaK0o6dNfq8Bqt1KVMsksHco8u6voaxf+8yBA/YaQLi0+3Gr1Yf3Io1ASrRwmd4
	z/2ugYatYb1vwMa6hU4YfHPnC3+AJY56yUQeKKmCGYIB+nw1oarRZOGo1S3eZB0q2b5rrK
	khcCw+BELW0RH9tSp/68ta1T1E4cw7Y=
Received: from suse.cz (pmladek.tcp.ovpn2.prg.suse.de [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id C7F482C143;
	Wed, 20 Sep 2023 11:11:04 +0000 (UTC)
Date: Wed, 20 Sep 2023 13:11:04 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5670/6619] kernel/printk/printk.c:2871:24:
 warning: array subscript 0 is outside array bounds of 'char[0]'
Message-ID: <ZQrTSImvuKq6gq68@alley>
References: <202309201724.M9BMAQIh-lkp@intel.com>
 <87a5thtas5.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5thtas5.fsf@jogness.linutronix.de>

On Wed 2023-09-20 12:16:50, John Ogness wrote:
> On 2023-09-20, kernel test robot <lkp@intel.com> wrote:
> >    kernel/printk/printk.c: In function 'console_flush_all':
> >>> kernel/printk/printk.c:2871:24: warning: array subscript 0 is outside array bounds of 'char[0]' [-Warray-bounds]
> >     2871 |         char *outbuf = &printk_shared_pbufs.outbuf[0];
> >          |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> It is crazy all the things that get compiled in !CONFIG_PRINTK. We
> definitely need to fix that after this rework.
> 
> As for this warning, anyone have anything against something like:
> 
> #ifdef CONFIG_PRINTK
> static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
> {
>    ... implementation ...
> }
> #else
> static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
> {
>         *handover = false;
>         return false;
> }
> #endif

Looks good to me.

Best Regards,
Petr
