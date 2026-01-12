Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C38365A0E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 16:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235735; cv=none; b=LUc4ionKYjo9jjjzkY55kmzyNI8ZnoucsRVSHmvFdnlOf9mi6gQtqUNud9s+FelCSvOljeQ7P1KMqppP+bS6rE50cj8LX7xmmyfbzeFuNSiCEELRBoYFm/V4vQUztv4ZRd/wZR7O2Cyy6Lsiv6NWIwQScrpP3uF3wnZJh2CEw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235735; c=relaxed/simple;
	bh=zDQ6OaC3bCfxul/Uj53V6zOpJCYaYfo330m3Y5PJRj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryAi3v1oKeM+S2ZJCekRIS83ILLEKMwCfmUYDELgQhQeiRN0MyToU8YdHWR+C5pDU2JPj1HgyiQisz/hvGQEVIDDCdktHeqlORHNlHhxicTL9uuUYlvl/jKhAMhTkFQcXftlV+VtrIpkTCGFA+0zc/ozQzkDCsYz+0mOuXsO/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CklHs0JW; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=encUM2S2; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=CSwTNASA; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Dps3uThd; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CklHs0JW";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="encUM2S2";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="CSwTNASA";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Dps3uThd"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4065E5BCD8;
	Mon, 12 Jan 2026 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768235732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxV711d/eo2Zz/Rc1H4B99w3qpOnHlORxT1/e5RrWrs=;
	b=CklHs0JWLnfkTpMbjuFncwIHdI3LRxN7wpEm4cyylaBN33AIpwta9gNSgcKK3KAtd8i9i3
	ImwOaI4CGDNa+f5yJ7hzrvUVi9RG+kenVgRKhq1+g/WZ2CvUVGgRRormrYanUbdMSyLsYY
	Eeoc0aOToVcTMj7C1NS7Vt0BMzcI2EI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768235732;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxV711d/eo2Zz/Rc1H4B99w3qpOnHlORxT1/e5RrWrs=;
	b=encUM2S23KKLzj484hN+7BccaDOBuEnu2QqVqQA5Zcs9REbrIWWMJ0TeoXIYn8qeccXp95
	HXrvOQFOGMUmb1DA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=CSwTNASA;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=Dps3uThd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1768235731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxV711d/eo2Zz/Rc1H4B99w3qpOnHlORxT1/e5RrWrs=;
	b=CSwTNASA1Pb60SUeUyra4Mm3Rnx2IMY+8X1kSN27/d8sffKvDDiBo5hCrpnpjnit52qlDt
	WELO3Kgb6nfVKM0gK2BxjYlRLJ6ekMMMbSmaotZ8uNxIpJcZvoRap/7qcs6noPPGRqtluk
	A7vRcdoCRzNohHGLciNZxckew0VIQYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1768235731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxV711d/eo2Zz/Rc1H4B99w3qpOnHlORxT1/e5RrWrs=;
	b=Dps3uThdlK4PBNlIzfZQLOAse12LreQYgj88pfO5JfI7Q0xpvpzHd3fn5PrCdOvmeNGLxd
	u/siDyBcvvm2v+Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3714A3EA63;
	Mon, 12 Jan 2026 16:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C/ZpDdMiZWkUZAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 12 Jan 2026 16:35:31 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id EA0EAA09FC; Mon, 12 Jan 2026 17:35:30 +0100 (CET)
Date: Mon, 12 Jan 2026 17:35:30 +0100
From: Jan Kara <jack@suse.cz>
To: Baokun Li <libaokun1@huawei.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>, Zhang Yi <yi.zhang@huawei.com>, 
	Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>
Subject: Re: {standard input}:4155: Error: pcrel offset for branch to .LS000B
 too far (0x38)
Message-ID: <txzy4pnt3se34lsvbtpbgvndxts6xsydxx5sswdjzdrcie7zlq@63cewvtotbu3>
References: <202601121758.kA3osRht-lkp@intel.com>
 <dbed961f-f3c3-496b-9498-6821852da038@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbed961f-f3c3-496b-9498-6821852da038@huawei.com>
X-Spam-Score: -4.01
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 4065E5BCD8
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

Hi!

On Mon 12-01-26 20:09:47, Baokun Li wrote:
> On 2026-01-12 17:42, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   0f61b1860cc3f52aef9036d7235ed1f017632193
> > commit: a6d73242b8b5caa9f9a529eab49cc1e85ace9890 ext4: support large block size in ext4_mpage_readpages()
> > date:   6 weeks ago
> > config: csky-randconfig-001-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/config)
> > compiler: csky-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121758.kA3osRht-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601121758.kA3osRht-lkp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> >    {standard input}: Assembler messages:
> >>> {standard input}:4155: Error: pcrel offset for branch to .LS000B too far (0x38)
> 
> Hi,
> 
> Thanks for the report.
> 
> After looking into this issue, it turns out that replacing the original
> calculation with the macro version causes the compiler to emit a larger
> sequence of instructions.
> 
> On most architectures this is harmless, because their GCC backends support
> proper branch relaxation and can automatically promote a short branch to
> a long branch when the offset grows.
> 
> However, the CSKY GCC backend does not implement branch relaxation. As a
> result, once the generated basic block becomes slightly larger, some short
> branch instructions can no longer reach their targets, and the assembler
> reports the “pcrel offset too far” error.
> 
> Given this, one possible workaround on the kernel side would be to replace
> the macro with a static inline helper. Using an inline function allows GCC
> to perform more aggressive optimization and typically avoids generating
> unnecessarily large instruction sequences, which helps prevent the
> short-branch overflow seen on CSKY.
> 
> However, the more general and robust solution would be to improve the
> CSKY GCC backend so that it supports proper branch relaxation, as other
> architectures do. With branch relaxation in place, these issues would not
> depend on how the code is written.
> 
> We’d appreciate any thoughts on which approach makes more sense.

Frankly, since this is such a niche platform, I'd just let those guys fix
their compiler and don't complicate ext4 codebase for that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
