Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8CA21ADB9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 07:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742197372; cv=none; b=tvaMNWjIoUTsasRfrk/liSaRKqVECB+ec/adFRYQXVKHhxEHoBouQcTyl7oR/OzdmNmMHzL8lJ9LQz+4LcvkiYtpV4CloZFdfFId/jgjyazYCmFzm+Tr4GOLLXePJXmTO30UzorsOMsay7PJI6/eVW73QkZMmrqPhc/WUZEAaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742197372; c=relaxed/simple;
	bh=9euAlTr+89hNhK+jUv7jLtGQt7bPB8Fw66H0EtsKMZo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zl8BA5Q6ugnupUCHGp1VKP/aBBTN7VR7uYkJgA+KmHCilIOwikNrASRonp06jzdvzLxD04oZlaNUGMN5TRgEUPSviD7+cqu1cyYn4x/6bcPoYtOu0IXYqW+BIOoyVDAXptYM+b+XCqvovToU5JvpD7fPTVjfwzp3xkVkx+/Zrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UOSJdLLR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WLrcOzKD; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=UOSJdLLR; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WLrcOzKD; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UOSJdLLR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WLrcOzKD";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="UOSJdLLR";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WLrcOzKD"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C6121211A0;
	Mon, 17 Mar 2025 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742197368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9152dny59GjvNjxSUhjJMpOb1KrsRQzp2vYKKOCddQ=;
	b=UOSJdLLRdxuI5iMs/sN6qp7G+RPFcZOWpUKRlhFKzY/+mFoQkZplLO5xEXaO9QGzT3osYE
	/8c5OLHF3pKrbzFdqU7h+H+9nuIpHiJg2A2+zJsxGYsZ/T69rn0MY5g/dFUbjpg7FegR2f
	eq3W5hZYlt5nWTjWA/TEvOM+aPRItG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742197368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9152dny59GjvNjxSUhjJMpOb1KrsRQzp2vYKKOCddQ=;
	b=WLrcOzKDWNAy6oMTcgkGB2AqdB4tcPDnnycf5jJJnHIwkdLJKK1UWysDiswXN2nqnZPYG3
	zpQxePxrsPke4LBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742197368; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9152dny59GjvNjxSUhjJMpOb1KrsRQzp2vYKKOCddQ=;
	b=UOSJdLLRdxuI5iMs/sN6qp7G+RPFcZOWpUKRlhFKzY/+mFoQkZplLO5xEXaO9QGzT3osYE
	/8c5OLHF3pKrbzFdqU7h+H+9nuIpHiJg2A2+zJsxGYsZ/T69rn0MY5g/dFUbjpg7FegR2f
	eq3W5hZYlt5nWTjWA/TEvOM+aPRItG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742197368;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s9152dny59GjvNjxSUhjJMpOb1KrsRQzp2vYKKOCddQ=;
	b=WLrcOzKDWNAy6oMTcgkGB2AqdB4tcPDnnycf5jJJnHIwkdLJKK1UWysDiswXN2nqnZPYG3
	zpQxePxrsPke4LBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 92D98132CF;
	Mon, 17 Mar 2025 07:42:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id G/+BInjS12cdbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 07:42:48 +0000
Date: Mon, 17 Mar 2025 08:42:48 +0100
Message-ID: <87h63sf6h3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 113/194] sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used
In-Reply-To: <202503171139.HSG8dCAn-lkp@intel.com>
References: <202503171139.HSG8dCAn-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
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
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 17 Mar 2025 04:41:39 +0100,
kernel test robot wrote:
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
> head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
> commit: 87d228cc39db9625da9b75daaed25be23ec0a667 [113/194] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()
> config: csky-randconfig-001-20250317 (https://download.01.org/0day-ci/archive/20250317/202503171139.HSG8dCAn-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171139.HSG8dCAn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503171139.HSG8dCAn-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used [-Wunused-function]
>      949 | static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> sound/soc/codecs/cs35l56.c:942:12: warning: 'cs35l56_runtime_suspend_i2c_spi' defined but not used [-Wunused-function]
>      942 | static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
>          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Those are conditionally exported symbols and I overlooked that
CONFIG_SND_SOC_CS35L56_SDW may still enable CONFIG_SND_SOC_CS35L56
without i2c/spi.  So please drop the patch
  [PATCH 08/89] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()

Should I resubmit the series together with the typo corrections?


thanks,

Takashi
