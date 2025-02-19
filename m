Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFDC1C7013
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739958940; cv=none; b=pteP3HR/EKB0ICo8s6ANi9HEnsNw0iHuolVFMvMLDqd6Mq42WtrPjwLl/hEf/5aoieIlPyDne3y7PM6YE6hja8U7zFddygFrDUfWx358wFF0DlLwYXHhqTwWE108rrrodCLqlfUVy+OByO7zfBHwIiYceIMp7mwA2zQ6lmbwnN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739958940; c=relaxed/simple;
	bh=XfgjO5JffOLafFQn5ca4WAlxHH5UNe/agS8RJHfrt10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nuId48qdpZhJnFyG9nNMqadJ6o/fZKViDZxDyIwNPJk+iy0Tsw2TKgpOu68lAufXU/r92ET2l5iesr+JmDFHpH1l5sohn+QRR6FtxTUhEEpmEFiQV7Ka8gQhgBmR9+xuL13riJkZD/GmIy7gva+FWPNPD2eByuNXkRUSuvFciyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=fail smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OrPY42s+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bPke+1rN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=OrPY42s+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bPke+1rN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OrPY42s+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bPke+1rN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="OrPY42s+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bPke+1rN"
Received: from hawking.nue2.suse.org (unknown [IPv6:2a07:de40:a101:3:92b1:1cff:fe69:ddc])
	by smtp-out1.suse.de (Postfix) with ESMTP id 00DF721185;
	Wed, 19 Feb 2025 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739958937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWOzKHlJd0Tx7cilSjlnarbibqkqDv9kgfoq44xSml8=;
	b=OrPY42s+Iz0DDp7jQ10/IgWUAKYG2TmOYzGo/n8uTvyOvSsqMc5r6NA+jVxp9pS/6vIu1L
	+SLSg5OQ13sk/9ASsxsgdIVKJAXLoc0bU+btZQRCScU1sTkvMDdW5cYr3FBQNL2Z2QKdul
	hXQOVbhtp54M8ZkL3Cl0xLls16jnNf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739958937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWOzKHlJd0Tx7cilSjlnarbibqkqDv9kgfoq44xSml8=;
	b=bPke+1rNdmap+obVN5mdP1owQdTmz1xbylHWuKLoQ2JMpy2btU7YFyuknXQ06MyJBoVjlD
	1qF9suTBVr7lapCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=OrPY42s+;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bPke+1rN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1739958937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWOzKHlJd0Tx7cilSjlnarbibqkqDv9kgfoq44xSml8=;
	b=OrPY42s+Iz0DDp7jQ10/IgWUAKYG2TmOYzGo/n8uTvyOvSsqMc5r6NA+jVxp9pS/6vIu1L
	+SLSg5OQ13sk/9ASsxsgdIVKJAXLoc0bU+btZQRCScU1sTkvMDdW5cYr3FBQNL2Z2QKdul
	hXQOVbhtp54M8ZkL3Cl0xLls16jnNf8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1739958937;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mWOzKHlJd0Tx7cilSjlnarbibqkqDv9kgfoq44xSml8=;
	b=bPke+1rNdmap+obVN5mdP1owQdTmz1xbylHWuKLoQ2JMpy2btU7YFyuknXQ06MyJBoVjlD
	1qF9suTBVr7lapCw==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id BF0EA4A04B3; Wed, 19 Feb 2025 10:55:36 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: kernel test robot <lkp@intel.com>,  oe-kbuild-all@lists.linux.dev,
  Palmer Dabbelt <palmer@rivosinc.com>,  Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [linux-next:master 3383/4377]
 include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast
 truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
In-Reply-To: <CAHVXubgqm=E2qm_EKtYX4m8WHmt8Fjj0CZqh3Qxio0x_0G5EjA@mail.gmail.com>
	(Alexandre Ghiti's message of "Wed, 19 Feb 2025 10:38:59 +0100")
References: <202502191201.7fARkW7m-lkp@intel.com>
	<CAHVXubgqm=E2qm_EKtYX4m8WHmt8Fjj0CZqh3Qxio0x_0G5EjA@mail.gmail.com>
Date: Wed, 19 Feb 2025 10:55:36 +0100
Message-ID: <mvmjz9mxnqf.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Level: **
X-Spamd-Result: default: False [2.59 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HOSTNAME_UNKNOWN(2.50)[];
	RDNS_NONE(2.00)[];
	ONCE_RECEIVED(1.20)[];
	HFILTER_HELO_IP_A(1.00)[hawking.nue2.suse.org];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[hawking.nue2.suse.org];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.987];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DIRECT_TO_MX(0.00)[Gnus/5.13 (Gnus v5.13)];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid]
X-Spam-Score: 2.59
X-Spamd-Bar: ++
X-Rspamd-Queue-Id: 00DF721185
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO

On Feb 19 2025, Alexandre Ghiti wrote:

> I don't get it, everything here is 64-bit and commit "riscv/atomic: Do
> proper sign extension also for unsigned in arch_cmpxchg" introduced a
> cast *only* for 32-bit values.  Could that be a false-positive?

Yes, it is.  All the arch_cmpxchg macros are type-generic macros, and
the path that casts the value is never executed if sizeof(*__ptr) == 8,
but sparse does not understand that (and gcc doesn't either when it
generates the -Wpointer-to-int-cast warning).

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
