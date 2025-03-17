Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D61A21ADDB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742199922; cv=none; b=L268tRNR67GERZ8KtCfbu4JaSSYgIGaEp/oI/0/dP3b2ci5c2Fv7tFeZf63WyTDzONNGwB8ItEqGkwWDoYloWEDzInRlcmdnMbBPDSN0gz928pY+dngvi3+ZTzB6VlCm6oa9IsahXBiUKeoXb9XaSZg7yA1U76cyt1X8NBGS49k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742199922; c=relaxed/simple;
	bh=IEHRwRwEskz1lFchmKCDgAe6ECHDuzi/PxS7W10Ysqg=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i2f2DNaNk7ATMJWtZwFRO1ZVhw0a433l4hbpuxhqcZjEQVVX41lN2hK2Z5QqxnDiks/gf1hKCbq9VtPT0O/jEnm6M9MfLZ/Km5vMQeVSJzLUZEDgJv4KW0niPn4jl4pih9AvjvRr4MQMvFAoHspc48jGiyTeYU9lg4Fy6mNuf9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VkKpyO7P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dIAFOxYe; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VkKpyO7P; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dIAFOxYe; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VkKpyO7P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dIAFOxYe";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VkKpyO7P";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dIAFOxYe"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1B4332014E;
	Mon, 17 Mar 2025 08:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742199919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94UaMAlh0itiBsZivwCcQfCMrW88Q9C5rEr7mvLnRX4=;
	b=VkKpyO7P96b317BCGXjTxhc4oCnHNq2HrYFcLs+pxzLr29rLvXkZNFGbbs4aympubt0XDO
	32nXIHgbPj16EXMsKymJ9Lo7s9MO5yxGoIAbVB4/HH+yDQ5PYn17+e2gl8UspDQEi/s5NR
	5js4nu1pAnTI3K5n14+7karRx+EpC3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742199919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94UaMAlh0itiBsZivwCcQfCMrW88Q9C5rEr7mvLnRX4=;
	b=dIAFOxYe2SK8kw3HeVW0hcaaCBaBOcNsmuZkWBIh55xruXlJcDX7Fcxp6JxZPrbbOescVA
	fFuJ+UzoaVWOPuDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742199919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94UaMAlh0itiBsZivwCcQfCMrW88Q9C5rEr7mvLnRX4=;
	b=VkKpyO7P96b317BCGXjTxhc4oCnHNq2HrYFcLs+pxzLr29rLvXkZNFGbbs4aympubt0XDO
	32nXIHgbPj16EXMsKymJ9Lo7s9MO5yxGoIAbVB4/HH+yDQ5PYn17+e2gl8UspDQEi/s5NR
	5js4nu1pAnTI3K5n14+7karRx+EpC3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742199919;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=94UaMAlh0itiBsZivwCcQfCMrW88Q9C5rEr7mvLnRX4=;
	b=dIAFOxYe2SK8kw3HeVW0hcaaCBaBOcNsmuZkWBIh55xruXlJcDX7Fcxp6JxZPrbbOescVA
	fFuJ+UzoaVWOPuDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E203D132CF;
	Mon, 17 Mar 2025 08:25:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xtvVNW7c12fFeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 08:25:18 +0000
Date: Mon, 17 Mar 2025 09:25:18 +0100
Message-ID: <87bju0f4i9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 183/194] sound/soc/sof/snd-sof-acpi.mod.c:15:33: error: expected ')' before 'SND_SOC_SOF_ACPI_DEV'
In-Reply-To: <202503171532.ACY3MdB1-lkp@intel.com>
References: <202503171532.ACY3MdB1-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,intel.com:email,01.org:url,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Mon, 17 Mar 2025 09:07:55 +0100,
kernel test robot wrote:
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
> head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
> commit: 431bdad71028cf4ad9958a49c76b8b54081930f2 [183/194] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503171532.ACY3MdB1-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171532.ACY3MdB1-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503171532.ACY3MdB1-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from sound/soc/sof/snd-sof-acpi.mod.c:2:
> >> sound/soc/sof/snd-sof-acpi.mod.c:15:33: error: expected ')' before 'SND_SOC_SOF_ACPI_DEV'
>       15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
>          |                                 ^~~~~~~~~~~~~~~~~~~~
>    include/linux/export-internal.h:45:28: note: in definition of macro '__KSYMTAB'
>       45 |             "   .asciz \"" ns "\""                                      "\n"    \
>          |                            ^~
>    sound/soc/sof/snd-sof-acpi.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
>       15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
>          | ^~~~~~~~~~~~
>    include/linux/export-internal.h:41:12: note: to match this '('
>       41 |         asm("   .section \"__ksymtab_strings\",\"aMS\",%progbits,1"     "\n"    \
>          |            ^
>    include/linux/export-internal.h:63:41: note: in expansion of macro '__KSYMTAB'
>       63 | #define KSYMTAB_DATA(name, sec, ns)     __KSYMTAB(name, name, sec, ns)
>          |                                         ^~~~~~~~~
>    sound/soc/sof/snd-sof-acpi.mod.c:15:1: note: in expansion of macro 'KSYMTAB_DATA'
>       15 | KSYMTAB_DATA(sof_acpi_pm, "", ""SND_SOC_SOF_ACPI_DEV"");
>          | ^~~~~~~~~~~~

The same issue as the previous, the namespace must not be a string any
longer.  Will fix it.


thanks,

Takashi
