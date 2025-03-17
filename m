Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6891221710
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204175; cv=none; b=AZK8a9qnq/aaDF5QsCBJAk9sKRCUOqcduE7EjhPkB/tTXx+QvP6dbRaWJappHlsps0QQopy4yFXSPU9A6KPF8fzzamklBLKs1C6Yg0bEuvfWc5iwSu211pkobekdDd+HmHsRP059t1ZYshvRNBfApz3kI3+3wi5H94+im5Fvh3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204175; c=relaxed/simple;
	bh=ZdFBetyv+ZzDQVo+3qysZGkEFTBu5MAPVtR/vpw7gDs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P/DC3c8c3V2o+y3Ek2Nv65KUTN/Q0Y+Wq+cQNdkqb+WgGG4zxpRJDP3rSAVU1bIhRheqd7PoTpO2Bs2hXOimEL4wASFsgmi/MRrRzSXTJdxZL+1C4mif2mJAKma1/GML7AgZ1HvssCRY7KDPTTiQRrrCuFR4VyU3qCGxnx2zrF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mu4NsAVd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLAoFH5d; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mu4NsAVd; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PLAoFH5d; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mu4NsAVd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLAoFH5d";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mu4NsAVd";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PLAoFH5d"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B091D21986;
	Mon, 17 Mar 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742204171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy/d7PuyK6M8Iq/QnaKW7p2QXCQ/sCgNQ7bjSV7u1T8=;
	b=mu4NsAVd/1tQnqEEFoOqtJ/Ip/Qm6DzRnpkSxdSWfP7Yi7uOIGC34z6/c+oC71lUdkFvTI
	iWnjtZBKYVwVBYOypeOUUpJis8XWICqrJ2I1HsoPUtuk7eKUweYwGJ7NMyhDRGUlmSeMPk
	SRlFSQHtYp7Z5FUhyjLOL5Prp+uoKNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742204171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy/d7PuyK6M8Iq/QnaKW7p2QXCQ/sCgNQ7bjSV7u1T8=;
	b=PLAoFH5dATQDWSdK4HyKLLPOjqoWqwBdd6SBpdJiMm2BFBh1W3T+6GSyFXgNHSXv7yQKUO
	q4JMCKfVzADDzcCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=mu4NsAVd;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PLAoFH5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742204171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy/d7PuyK6M8Iq/QnaKW7p2QXCQ/sCgNQ7bjSV7u1T8=;
	b=mu4NsAVd/1tQnqEEFoOqtJ/Ip/Qm6DzRnpkSxdSWfP7Yi7uOIGC34z6/c+oC71lUdkFvTI
	iWnjtZBKYVwVBYOypeOUUpJis8XWICqrJ2I1HsoPUtuk7eKUweYwGJ7NMyhDRGUlmSeMPk
	SRlFSQHtYp7Z5FUhyjLOL5Prp+uoKNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742204171;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uy/d7PuyK6M8Iq/QnaKW7p2QXCQ/sCgNQ7bjSV7u1T8=;
	b=PLAoFH5dATQDWSdK4HyKLLPOjqoWqwBdd6SBpdJiMm2BFBh1W3T+6GSyFXgNHSXv7yQKUO
	q4JMCKfVzADDzcCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8B5FD132CF;
	Mon, 17 Mar 2025 09:36:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QCq6IAvt12eaEgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 09:36:11 +0000
Date: Mon, 17 Mar 2025 10:36:11 +0100
Message-ID: <87sencdmno.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 113/194] sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used
In-Reply-To: <f9c818ef-eca7-4e83-b74d-5d32074c1bbd@sirena.org.uk>
References: <202503171139.HSG8dCAn-lkp@intel.com>
	<87h63sf6h3.wl-tiwai@suse.de>
	<f9c818ef-eca7-4e83-b74d-5d32074c1bbd@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: B091D21986
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51
X-Spam-Flag: NO

On Mon, 17 Mar 2025 10:34:33 +0100,
Mark Brown wrote:
> 
> On Mon, Mar 17, 2025 at 08:42:48AM +0100, Takashi Iwai wrote:
> 
> > > >> sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used [-Wunused-function]
> > >      949 | static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
> > >          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >> sound/soc/codecs/cs35l56.c:942:12: warning: 'cs35l56_runtime_suspend_i2c_spi' defined but not used [-Wunused-function]
> > >      942 | static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
> > >          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> > Those are conditionally exported symbols and I overlooked that
> > CONFIG_SND_SOC_CS35L56_SDW may still enable CONFIG_SND_SOC_CS35L56
> > without i2c/spi.  So please drop the patch
> >   [PATCH 08/89] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()
> 
> > Should I resubmit the series together with the typo corrections?
> 
> Ugh, actually this one is so early you may as well resubmit the entire
> series :(

OK, will do.


Takashi
