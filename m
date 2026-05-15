Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0E43E4AE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 15:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857358; cv=none; b=EG8BjE2ndOQNCFpfZOHu0mz9HUhvWL++h4KMjf9TM1P4z6MQ0wzgUuZT6tgpIa5meART/4285iWL8vPZQP9TPoUATD7TRL602M9CokY3jIZp4qAm7lONcWVo1JkHqLcR2G0Z/7nh2QU+xmE23IaWUcmMSdlnngwBG2uvgPXFpUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857358; c=relaxed/simple;
	bh=Zw897IMMqNbocF+ht13s0U078xefs2nAY+mHTqPBoZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xwz52xAR0LHRBwwxVMPe352URYjtAC8oDOvtmujQzCkB888Hd9n69fKrM1IjXv9d49ClO4/somorBVSWCiERWSwGaGxdF8LS1j6oqE2zbgtCOEZ/wyBlkI1RwP9A/AFfXYX0DZc8l5Vg0CWdvIwfCNKKsNlbkpSoBUCQ/rpgGN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=xqASSHIa; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=VHwWWi3b; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=RBENEJVe; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=ddOpRfJH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="xqASSHIa";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="VHwWWi3b";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="RBENEJVe";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="ddOpRfJH"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AC8116725A;
	Fri, 15 May 2026 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857351;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et2C0FRiyAstIDBNtgKLZyUPYgjN4vNuT6YpvR9xX44=;
	b=xqASSHIayn0KwFGzsH8dRYK7sg5e0HjPuRVyESaG9HiK9NXmnsmap2LmUufMcPkapD6JEx
	+rKZ93FbCbclDBcYByra94/CXvM6WUH8I9+Ft9rWAE2LEHiaNMjG7vFd7qxvt4V41ZKT0S
	KFSPsNBrclg5b5VRTNsFN2l9kHtOAfM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857351;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et2C0FRiyAstIDBNtgKLZyUPYgjN4vNuT6YpvR9xX44=;
	b=VHwWWi3bZxWyUq7lV5hbFiUlq/zUB8P+T7euKB8fjDgPH/rmmPwWgy/wE34UqHXCVjQ3Gw
	aUzYCzT0vaTrz3BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857347;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et2C0FRiyAstIDBNtgKLZyUPYgjN4vNuT6YpvR9xX44=;
	b=RBENEJVeSWt7BGsfmdthCIJKeE9hRTXJvmtZhp5ZTLn/kw7VDV8OrzBuNZvP3gMOEZE1uO
	4BckzdFiG/jxZbCst7cV3c2EEjaGSi7mf4JCsH1qsRcCeGaTve8JVN4zk1KzjiaUVw7J3K
	kWHYMpNWKKQwsb6cmayXNtlRI8uZFZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857347;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Et2C0FRiyAstIDBNtgKLZyUPYgjN4vNuT6YpvR9xX44=;
	b=ddOpRfJHdNoJ3vWwsA92iPxELP7u7QdZfTFEf654btQA1uyjyuHJ0+Zx1eYv8YeMgWCVkM
	3VtUhA1HQQUre/Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9EFFF593A9;
	Fri, 15 May 2026 15:02:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id TkueJoM1B2rcRwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Fri, 15 May 2026 15:02:27 +0000
Date: Fri, 15 May 2026 17:02:22 +0200
From: David Sterba <dsterba@suse.cz>
To: Daniel Vacek <neelx@suse.com>
Cc: kernel test robot <lkp@intel.com>, Josef Bacik <josef@toxicpanda.com>,
	oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 34/43] fs/btrfs/super.c:659:3:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <20260515150222.GR2558453@suse.cz>
Reply-To: dsterba@suse.cz
References: <202605140955.Dr60lOTF-lkp@intel.com>
 <CAPjX3Ffy5eThg4tDhvLYh-Vb3gzbSMzhkL8pJfDgtt-YD6CTTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPjX3Ffy5eThg4tDhvLYh-Vb3gzbSMzhkL8pJfDgtt-YD6CTTA@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.cz:replyto,suse.cz:mid,imap1.dmz-prg2.suse.org:helo,01.org:url];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -4.00

On Thu, May 14, 2026 at 05:34:20PM +0200, Daniel Vacek wrote:
> On Thu, 14 May 2026 at 03:28, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > commit: 69bb73593025c83c008129a68acd562e97870998 [34/43] btrfs: add test_dummy_encryption support
> > config: nios2-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/config)
> > compiler: nios2-linux-gcc (GCC) 8.5.0
> > smatch: v0.5.0-9185-gbcc58b9c
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140955.Dr60lOTF-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140955.Dr60lOTF-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    fs/btrfs/super.c: In function 'btrfs_parse_param':
> > >> fs/btrfs/super.c:659:3: error: a label can only be part of a statement and a declaration is not a statement
> >       int ret;
> >       ^~~
> 
> And here we are. Old gcc also complains. Though it is less clear :-/
> So this?:
> 
> --- a/fs/btrfs/super.c
> +++ b/fs/btrfs/super.c
> @@ -347,6 +347,9 @@ static int btrfs_parse_param(struct fs_context
> *fc, struct fs_parameter *param)
>      struct btrfs_fs_context *ctx = fc->fs_private;
>      struct fs_parse_result result;
>      int opt;
> +#ifdef CONFIG_BTRFS_DEBUG
> +    int ret;
> +#endif

Inline ifdefs are an anti-pattern and should be avoided if possible, so
the statement block in case is fine.
