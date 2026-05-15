Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A869348A2AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857481; cv=none; b=UkouAWeo+Te4duQx7YH7LH+ZI3To9AnnH9CLPvniuf9ZaKtanp5jOw4Z8hQxVNn/aukNWfmamlzfYZf+EausiU5S3f2d7PM7rUzsPSPzvFFglotUgGtGRttk5JKNm3c7xVqIzyD/9p3i/OD91Z1TPM2f+g2GeDbFvUmmpKgKinI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857481; c=relaxed/simple;
	bh=0rhPte6OpAcXBY7Vp3eqIsBds8OnvcdYmcldHcE9e2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzTeDv0xFXYZ+gkGYw0AfBDh8hxPnymliVDADYqm9RSyBtPIBxMnY4mMZQlPodOD2dp/r9Q9CXc475aUNo1+FZYpa2jb3MZwoLc3iLiYziDjPFmINklwu2Pvan+lYYx8751lr9hTnIZVDUe0krM9QbEX4QeNjwnfo4hmCv/v3po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sP6gG375; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XPRbAPev; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=sP6gG375; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=XPRbAPev; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sP6gG375";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XPRbAPev";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="sP6gG375";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="XPRbAPev"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C1AA56B338;
	Fri, 15 May 2026 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857477;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6oqi8A6egC4vayuWUpfQzJ7ykbu0SOOpm2X3B+zO/E=;
	b=sP6gG375GzVBi5VYBGdT5QWBlUGvHocNOQkuUAcmVKDSloJMHRS21NcK/sQLlZcaB+2PHk
	pK/riM4lJdONTwqpakY6G6bhmgVpvjy95YeGPkvB29mLymRXYqi8Cb8fwQF0kcJYmC+BIj
	0kkYARMsnwBF4dkWsFYFpU+le1Hz60Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857477;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6oqi8A6egC4vayuWUpfQzJ7ykbu0SOOpm2X3B+zO/E=;
	b=XPRbAPev7gK+nlSrM4GZmOqrp8NnSbg4nq+uX9NkZTMpO7xGBXvHz2z4w/8HIqqP/tVLxL
	2D7D628PSyq229Ag==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=sP6gG375;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=XPRbAPev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1778857477;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6oqi8A6egC4vayuWUpfQzJ7ykbu0SOOpm2X3B+zO/E=;
	b=sP6gG375GzVBi5VYBGdT5QWBlUGvHocNOQkuUAcmVKDSloJMHRS21NcK/sQLlZcaB+2PHk
	pK/riM4lJdONTwqpakY6G6bhmgVpvjy95YeGPkvB29mLymRXYqi8Cb8fwQF0kcJYmC+BIj
	0kkYARMsnwBF4dkWsFYFpU+le1Hz60Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1778857477;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+6oqi8A6egC4vayuWUpfQzJ7ykbu0SOOpm2X3B+zO/E=;
	b=XPRbAPev7gK+nlSrM4GZmOqrp8NnSbg4nq+uX9NkZTMpO7xGBXvHz2z4w/8HIqqP/tVLxL
	2D7D628PSyq229Ag==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9612593A9;
	Fri, 15 May 2026 15:04:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id g4cjKQU2B2ruSQAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Fri, 15 May 2026 15:04:37 +0000
Date: Fri, 15 May 2026 17:04:36 +0200
From: David Sterba <dsterba@suse.cz>
To: Daniel Vacek <neelx@suse.com>
Cc: kernel test robot <lkp@intel.com>, Josef Bacik <josef@toxicpanda.com>,
	oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>
Subject: Re: [kdave-btrfs-devel:ext/dv/fscrypt 32/43]
 fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return
 expression (different base types)
Message-ID: <20260515150436.GS2558453@suse.cz>
Reply-To: dsterba@suse.cz
References: <202605140957.DjseWRNF-lkp@intel.com>
 <CAPjX3FduCSJWY_Qx53ADfh1tpvsAjM7XCa=j1JjL3OYF8B4D7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPjX3FduCSJWY_Qx53ADfh1tpvsAjM7XCa=j1JjL3OYF8B4D7w@mail.gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Flag: NO
X-Spam-Score: -4.21
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.21 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:email,suse.cz:replyto,suse.cz:dkim,suse.cz:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: C1AA56B338
X-Spam-Level: 

On Thu, May 14, 2026 at 05:53:48PM +0200, Daniel Vacek wrote:
> On Thu, 14 May 2026 at 03:51, kernel test robot <lkp@intel.com> wrote:
> >
> > tree:   https://github.com/kdave/btrfs-devel.git ext/dv/fscrypt
> > head:   4c05f02641d57f578a685f7e8d27b9cb18d17cc7
> > commit: fda37caa264ff597b0fc03039dc95e392432bbc5 [32/43] btrfs: implement process_bio cb for fscrypt
> > config: alpha-randconfig-r122-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/config)
> > compiler: alpha-linux-gcc (GCC) 8.5.0
> > sparse: v0.6.5-rc1
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605140957.DjseWRNF-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202605140957.DjseWRNF-lkp@intel.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> fs/btrfs/fscrypt.c:240:34: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted blk_status_t @@     got int @@
> >    fs/btrfs/fscrypt.c:240:34: sparse:     expected restricted blk_status_t
> >    fs/btrfs/fscrypt.c:240:34: sparse:     got int
> 
> @@ -238,7 +238,7 @@ static blk_status_t
> btrfs_process_encrypted_bio(struct bio *orig_bio,
>          ASSERT(orig_bio == enc_bio);
>          return btrfs_check_encrypted_read_bio(bbio, enc_bio);
>      }
> -    return btrfs_csum_one_bio(bbio, enc_bio, false);
> +    return btrfs_csum_one_bio(bbio, enc_bio, false)? BLK_STS_IOERR: BLK_STS_OK;
>  }
> 
> This should do the trick.

Please use errno_to_blk_status() as btrfs_csum_one_bio() can also return
-ENOMEM, which is BLK_STS_RESOURCE.
