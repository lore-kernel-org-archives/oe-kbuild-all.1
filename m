Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38C3A8CA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Feb 2024 13:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707743780; cv=none; b=lzZUynnw57j+6SwLy/hezneLZzl4CiXMno3oXTswSkSkcF2xKxps4gIniJm8DUj/AmrbQqqZLB5eEl+J9ohcmWc9x44tYS0j18OTflVu6XYvKBp+sPDPpu5ecP5BHS0jISd9URmTBs+mPDM7RTH2GR1E9IEvqnbcd1GtPrUZ/Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707743780; c=relaxed/simple;
	bh=8WDn2y3esEouOQRxB2X10ysoMb4+1ndC1NxTR71Xur8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fB7JokIfzsgfH+gRZ3//Mhp40p/A/04wRiELGIiQDMkA9NFZuRer5YaU9uNvUYvmADJpWib0N6vGWJ/NtIdhddMWoL+pg46Co5YrwUYyuv8/qUwOUFo4d+Qt8DW52ACELNIXPvtckOdZ15+PLxGrjZVfjlSj2wpxGjPpoz+HBHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=p0hNICz3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=co54wxp9; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=p0hNICz3; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=co54wxp9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="p0hNICz3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="co54wxp9";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="p0hNICz3";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="co54wxp9"
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5DAA61F769;
	Mon, 12 Feb 2024 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1707743776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpSEHaxVFAIewm1jeS4IHGrZLRDnyfU8mnHSJMCPqP4=;
	b=p0hNICz3AJhRbtqK2erwU7YJWlLeGniywlWfMf8jJz7Yc9OgkJJMK46YkbzAxab9iA3AhB
	sS1b1Idoo9t8z++/ZD8W4dZ6/2n2NX9jZSfVpCEMNtFCUwT3gfwrVGXkDUMnMf73CdAI+Z
	hEsevt8/IBFv23C1oitY677WMk8um3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1707743776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpSEHaxVFAIewm1jeS4IHGrZLRDnyfU8mnHSJMCPqP4=;
	b=co54wxp90xiKlHySt+U0dpiEcZHJwdrVp2mvVs1r37qXVMgI6wKF0/hzBgj0M3/Sexqg1t
	d1RY9nYAdhlFOMBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1707743776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpSEHaxVFAIewm1jeS4IHGrZLRDnyfU8mnHSJMCPqP4=;
	b=p0hNICz3AJhRbtqK2erwU7YJWlLeGniywlWfMf8jJz7Yc9OgkJJMK46YkbzAxab9iA3AhB
	sS1b1Idoo9t8z++/ZD8W4dZ6/2n2NX9jZSfVpCEMNtFCUwT3gfwrVGXkDUMnMf73CdAI+Z
	hEsevt8/IBFv23C1oitY677WMk8um3c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1707743776;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cpSEHaxVFAIewm1jeS4IHGrZLRDnyfU8mnHSJMCPqP4=;
	b=co54wxp90xiKlHySt+U0dpiEcZHJwdrVp2mvVs1r37qXVMgI6wKF0/hzBgj0M3/Sexqg1t
	d1RY9nYAdhlFOMBA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 53A2F13212;
	Mon, 12 Feb 2024 13:16:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id 0+ZmFCAaymU7MQAAn2gu4w
	(envelope-from <jack@suse.cz>); Mon, 12 Feb 2024 13:16:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id F07A0A0809; Mon, 12 Feb 2024 14:16:15 +0100 (CET)
Date: Mon, 12 Feb 2024 14:16:15 +0100
From: Jan Kara <jack@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-kbuild-all@lists.linux.dev
Subject: Re: fs/quota/quota_tree.c:674:8: warning: variable 'blk' is
 uninitialized when used here
Message-ID: <20240212131615.6jvnwweivkydv3j7@quack3>
References: <202402101306.SBcbZx79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402101306.SBcbZx79-lkp@intel.com>
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -0.87
X-Spamd-Result: default: False [-0.87 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.07)[62.56%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,intel.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 MID_RHS_NOT_FQDN(0.50)[];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

On Sat 10-02-24 14:01:32, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git for_next
> head:   71b12545f603de39a967b52287c29ede3f85ff2f
> commit: 223bfb57631b10036e55579ecb5718123fa41c8c quota: Detect loops in quota tree
> date:   19 hours ago
> config: i386-randconfig-141-20240210 (https://download.01.org/0day-ci/archive/20240210/202402101306.SBcbZx79-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101306.SBcbZx79-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402101306.SBcbZx79-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> fs/quota/quota_tree.c:674:8: warning: variable 'blk' is uninitialized when used here [-Wuninitialized]
>      674 |                             blk);
>          |                             ^~~

Thanks. Fixed up in my tree.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
