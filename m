Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF5914F9F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 07:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742198018; cv=none; b=s5yoNfKOgJ6xSnzTVNm153tIj4OTCEfFVunYibtrIwLuKOrb+xOoPsD56gNuc5Rzig6iJA2SGeA8BmnLc0hKqSMOkr+BzL+1jo75UQ245guo27yCkfKdvaw+vVS4NVRowSsARIoaT/sp0y1Jg0JAdV5kvLqlwB0+9p6uuwWTOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742198018; c=relaxed/simple;
	bh=3eFqag/ofhcS4wZuP0GGNzlUDA5fJTjchCvJkiZ5EFU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rK0mQ26Gc4yTs9T5eysL60WPQNvMIra5BQiXU0zfo7H87nLDF2JSwnugKRJMCUSbGh9jLZM+o2xMTGw4OgPG2/1UaUfc151Xfpng4VU5y4E46B+TDp8c8Me1nf8J2rn4g4HxNIMiUZOyeibIxqneY6AFWYQUP645MqQR9X5QwMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BFc3pQJY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2QyhPgrJ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=BFc3pQJY; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=2QyhPgrJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BFc3pQJY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2QyhPgrJ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="BFc3pQJY";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="2QyhPgrJ"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A21641FCE6;
	Mon, 17 Mar 2025 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742198014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxFeBngT4QKTPifCa383ZN+XGwCiB8gzbWyZvInWk5g=;
	b=BFc3pQJYFL+xqwN5Au5Xyp8JQwzDuHJUKDGmrF/p6xTFFxWwXsb77XoFX7KinzVmWb+KI/
	/f1JlF2sXncCCUlHriYMQVDp1zGrvpamG+UrdSp61uIra1/mpozaJnxy0kjMmzgG6W9Tyl
	O901rcqzflr3r0bL9n8BV1hmZS/DcJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742198014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxFeBngT4QKTPifCa383ZN+XGwCiB8gzbWyZvInWk5g=;
	b=2QyhPgrJRI5SLNsdvPoJl/6ugoTliScZAhwsj0upb3iN3QhWGmrBtCkI15dd9yCuKOCsQU
	8j5qI7BuiODq5VDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1742198014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxFeBngT4QKTPifCa383ZN+XGwCiB8gzbWyZvInWk5g=;
	b=BFc3pQJYFL+xqwN5Au5Xyp8JQwzDuHJUKDGmrF/p6xTFFxWwXsb77XoFX7KinzVmWb+KI/
	/f1JlF2sXncCCUlHriYMQVDp1zGrvpamG+UrdSp61uIra1/mpozaJnxy0kjMmzgG6W9Tyl
	O901rcqzflr3r0bL9n8BV1hmZS/DcJU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1742198014;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxFeBngT4QKTPifCa383ZN+XGwCiB8gzbWyZvInWk5g=;
	b=2QyhPgrJRI5SLNsdvPoJl/6ugoTliScZAhwsj0upb3iN3QhWGmrBtCkI15dd9yCuKOCsQU
	8j5qI7BuiODq5VDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C11B132CF;
	Mon, 17 Mar 2025 07:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 4SIWGf7U12fybwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 17 Mar 2025 07:53:34 +0000
Date: Mon, 17 Mar 2025 08:53:34 +0100
Message-ID: <87frjcf5z5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros 183/194] WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
In-Reply-To: <202503171311.Y0CltFV2-lkp@intel.com>
References: <202503171311.Y0CltFV2-lkp@intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.78
X-Spamd-Result: default: False [-1.78 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	LONG_SUBJ(1.52)[203];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 17 Mar 2025 06:54:05 +0100,
kernel test robot wrote:
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git 20250313_tiwai_asoc_convert_to_modern_pm_macros
> head:   9a2c84a9570fadf5fa15f3e6ca13a7ca23a6fb4c
> commit: 431bdad71028cf4ad9958a49c76b8b54081930f2 [183/194] ASoC: SOF: acpi: Convert to EXPORT_NS_DEV_PM_OPS()
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250317/202503171311.Y0CltFV2-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250317/202503171311.Y0CltFV2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503171311.Y0CltFV2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
> 
> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
> ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "devm_clk_hw_register" [drivers/media/i2c/tc358746.ko] undefined!
> ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/tc358746.ko] undefined!
> >> WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
> >> WARNING: modpost: module snd-sof-acpi-intel-bdw uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.

My bad, I coded in an old way with a string for namespace in
EXPORT_DEV_PM_OPS().  The namespace is no longer string.

I believe I'll have to resubmit the fixed version.


Takashi
