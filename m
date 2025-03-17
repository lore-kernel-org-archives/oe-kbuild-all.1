Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E13885270
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 08:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742201250; cv=none; b=QkGfLa5j/rcKErPHu7PPyKTcXUrbJw3kp1B/W0CNWxyhmDksb+7nNkpTFU0FbQ+X5bBbWAHciT61WIKxDrTDQrqg3db8TdghTIoWs+3IciFC8YCe/QZcu64ixCuQqVi7bPY7HBuT/u/h9xLduleWqvLnrOfNq6KY588+YvqnBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742201250; c=relaxed/simple;
	bh=zu5GQdTlgdBOKJm/8teJnWOphpl/GTogZKoYGW3xjWU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gAUPh9d0VsN8o++KG+ZlUOxHaKsuYpwwABOj90pr0tiaa+UXBrEOsnzpujjeyTeYeJSPZhpc3BKvUoV735eNiQTzkP5u0VVdrdrriT0jEAvOpaFKA9YeibbycTwt34xv7pdiYyTCICIoZeRMYzGkEp8rDdn9BegnlBeKI7+ubxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MkfrNHTa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zuC6z8cL; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MkfrNHTa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zuC6z8cL; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MkfrNHTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuC6z8cL";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MkfrNHTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zuC6z8cL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E982201ED;
	Mon, 17 Mar 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742201246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8id/b3O94iRK7bCQSoUcQjsMJZ7LNyo1ywVhN6f0SL4=;
	b=MkfrNHTa0Naz405GKBF6vfWBRMsv3VigHmxyGO7aPqomL8XZTrCo8pHbz1jehL9dpThCXY
	UHfimCckss2hahcBudm3IC/bbKvld9744ODhIGnQWYcKQSvdP4Ncm6hRwpnsVcpsmtdpTF
	KH5Y4MYbVDL1gN8Q/l2v90nf355Oa2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742201246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8id/b3O94iRK7bCQSoUcQjsMJZ7LNyo1ywVhN6f0SL4=;
	b=zuC6z8cLYqnvR9R4bjFgc1bxuSWfdd6PRRH/Yxdgx48AGfKOuS59/G6GmCj6zLLnC3zOw4
	5HRTYjP+cGUtvMBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MkfrNHTa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zuC6z8cL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742201246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8id/b3O94iRK7bCQSoUcQjsMJZ7LNyo1ywVhN6f0SL4=;
	b=MkfrNHTa0Naz405GKBF6vfWBRMsv3VigHmxyGO7aPqomL8XZTrCo8pHbz1jehL9dpThCXY
	UHfimCckss2hahcBudm3IC/bbKvld9744ODhIGnQWYcKQSvdP4Ncm6hRwpnsVcpsmtdpTF
	KH5Y4MYbVDL1gN8Q/l2v90nf355Oa2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742201246;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8id/b3O94iRK7bCQSoUcQjsMJZ7LNyo1ywVhN6f0SL4=;
	b=zuC6z8cLYqnvR9R4bjFgc1bxuSWfdd6PRRH/Yxdgx48AGfKOuS59/G6GmCj6zLLnC3zOw4
	5HRTYjP+cGUtvMBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4FE1C139D2;
	Mon, 17 Mar 2025 08:47:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id GRBUEp7h12c4AwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 08:47:26 +0000
Date: Mon, 17 Mar 2025 09:47:25 +0100
Message-ID: <871puwf3he.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 183/194] WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
In-Reply-To: <a5353ff0-c906-42cf-a8e4-e5b6e62419d6@sirena.org.uk>
References: <202503171311.Y0CltFV2-lkp@intel.com>
	<87frjcf5z5.wl-tiwai@suse.de>
	<a5353ff0-c906-42cf-a8e4-e5b6e62419d6@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8E982201ED
X-Spam-Level: 
X-Spamd-Result: default: False [-1.99 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	LONG_SUBJ(1.52)[203];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.99
X-Spam-Flag: NO

On Mon, 17 Mar 2025 09:42:55 +0100,
Mark Brown wrote:
> 
> On Mon, Mar 17, 2025 at 08:53:34AM +0100, Takashi Iwai wrote:
> > kernel test robot wrote:
> 
> > > >> WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
> > > >> WARNING: modpost: module snd-sof-acpi-intel-bdw uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
> 
> > My bad, I coded in an old way with a string for namespace in
> > EXPORT_DEV_PM_OPS().  The namespace is no longer string.
> 
> > I believe I'll have to resubmit the fixed version.
> 
> No problem, please just send the affected patches (should be amd,
> xtensa, tegra, sunxi, stm, sof and samsung) - everything else should be
> fine, non need to repeat review and test for the rest.

Many patches had typos in the descriptions (e.g. RUNTIE_PM_OPS()), and
they can be fixed, too.

But it's your call - let me know your preference.


thanks,

Takashi
