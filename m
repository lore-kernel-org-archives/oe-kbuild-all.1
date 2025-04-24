Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961551D79A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475957; cv=none; b=IFlTZI5/Oo1NHmJgHP9B301XAFI0KeV3YCoHpDd2MhFyxphEUkWoJsIQAXO8QX5gJXI+J266pF4TGcPvKmqHZsX6VRUaowbUFLo+UJcjEss8+MBlSzasyX9tf7DwFUgugJ904eANTBk4Q+Q6unTk9bZvhNXSX9+29g9o72e3gcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475957; c=relaxed/simple;
	bh=o1/tO/xUDwEU77l8g90rokSug3TI6tcQzoEjejGkswc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTBghgStYNQbkwR+xuAvxtxuZj8NmAF7Ep53w+wAJn+zeG+/dVDoKfC4PJM5dvW3wBO9FaLVPSjwSUEIkyrvn6092C8y2OvNjyqaGAEmp8FVQx6rFvrEyqUyHGy5Dv0Cd4vUFEEKbq8N1mZjIERQ3dNAgDqLtiYjqGtnljwmQAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=r9CKNmNR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jpKITbst; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=r9CKNmNR; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=jpKITbst; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="r9CKNmNR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jpKITbst";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="r9CKNmNR";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="jpKITbst"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 995C421171;
	Thu, 24 Apr 2025 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745475953;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBe9XV6ccXf3LV11Tr3Nm7QlfankPgpVaSd3c+SDAAw=;
	b=r9CKNmNRf+ghc1lm3ZW4tzu8i27GwQ3QI8uqpeYe5mSCBcJb7IeYRqqz9V7oUICadiO8PS
	IOr5IKOPL3QeVEKnZJhqSWaPRZEk5QeRlHJY+mx/KrXYpv8zlflnwUdjCZrKOjcpyPQq3o
	Keqr1eTfH8ktcUfCfToIPh8NSs9HY28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745475953;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBe9XV6ccXf3LV11Tr3Nm7QlfankPgpVaSd3c+SDAAw=;
	b=jpKITbsthxHbnex0bbSK/wPPYX0u9c0dKr4hT0/MXUwoUpgD2pIBpYwMIGgPfy9Ya7eWYR
	BwHiEj9lJeeiKnDQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745475953;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBe9XV6ccXf3LV11Tr3Nm7QlfankPgpVaSd3c+SDAAw=;
	b=r9CKNmNRf+ghc1lm3ZW4tzu8i27GwQ3QI8uqpeYe5mSCBcJb7IeYRqqz9V7oUICadiO8PS
	IOr5IKOPL3QeVEKnZJhqSWaPRZEk5QeRlHJY+mx/KrXYpv8zlflnwUdjCZrKOjcpyPQq3o
	Keqr1eTfH8ktcUfCfToIPh8NSs9HY28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745475953;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xBe9XV6ccXf3LV11Tr3Nm7QlfankPgpVaSd3c+SDAAw=;
	b=jpKITbsthxHbnex0bbSK/wPPYX0u9c0dKr4hT0/MXUwoUpgD2pIBpYwMIGgPfy9Ya7eWYR
	BwHiEj9lJeeiKnDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7899B139D0;
	Thu, 24 Apr 2025 06:25:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7qQ6HXHZCWh4YwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 24 Apr 2025 06:25:53 +0000
Date: Thu, 24 Apr 2025 08:25:52 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: David Sterba <dsterba@suse.com>, oe-kbuild-all@lists.linux.dev,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [btrfs:pr/1157 91/97] fs/btrfs/messages.h:181:29: error:
 expected ')' before '__VA_OPT__'
Message-ID: <20250424062552.GJ3659@suse.cz>
Reply-To: dsterba@suse.cz
References: <202504241458.DGT7MuTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504241458.DGT7MuTv-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:replyto,suse.cz:mid]
X-Spam-Score: -4.00
X-Spam-Flag: NO

On Thu, Apr 24, 2025 at 02:19:12PM +0800, kernel test robot wrote:
> tree:   https://github.com/btrfs/linux.git pr/1157
> head:   10c06ead9f79886df92197deb8d5c7bc37d52971
> commit: 3050d7e09e5d7781bd9cfd8a27fc3d942afcd15c [91/97] btrfs: enhance ASSERT() to take optional format string
> config: arm-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504241458.DGT7MuTv-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from fs/btrfs/ctree.c:11:0:
>    fs/btrfs/compression.h: In function 'btrfs_calc_input_length':
> >> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
>     #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
>                                 ^

I don't understand what's the problem, it's gcc 7.5 on arm, can it be
lack of support for __VA_OPT__? I'm not sure if the other syntax would
work here, ##__VA_ARGS__ .

>    include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
>       _p_func(_fmt, ##__VA_ARGS__);    \
>                       ^~~~~~~~~~~
>    include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
>     #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
>                              ^~~~~~~~~~~~~~~~~
>    include/linux/printk.h:550:2: note: in expansion of macro 'printk'
>      printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
>      ^~~~~~
>    fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
>        pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
>        ^~~~~~
>    fs/btrfs/compression.h:83:2: note: in expansion of macro 'ASSERT'
>      ASSERT(folio_pos(folio) <= cur);
>      ^~~~~~
