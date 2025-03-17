Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911EB8F5E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 13:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742217135; cv=none; b=hwKONWOCyO9bKUJCLi92dK6NuolbWT45bukpMfHXztpH/KOTpNGdUx1dpwj+mNlUc29YwfVfKIDA4pmFzdM+fBXmeCWMQBw8eWvXELHTjJzk+N+kZzU6ZE26vA2JfYVHkgCvMCaAy8qnfNy3wghUG2lcO96a9D0MdRZFWeUKPOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742217135; c=relaxed/simple;
	bh=ONmb+6ImBJ7C5ephkwQPjJvILB9xceYniYhbeCNAVAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wb1WdfDgAfphei3eidViBos47MRhs9C+jBGGWH3FpKeJZ1kPXEhRHndDifPtYzEuFukRDN/m9ud+crAN5gVV2yWqcsTeDNmJUByWxLH6OHLEr8nO21QHdv5S9191Js8aXQhA7CiN+tA6Z0pXedOwtIxJ9V5CYO9+zn3HZJcbY6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Iq8/YWL4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zxZQiJAS; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=Iq8/YWL4; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=zxZQiJAS; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Iq8/YWL4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zxZQiJAS";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="Iq8/YWL4";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="zxZQiJAS"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8B5461FEDE;
	Mon, 17 Mar 2025 13:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1742217131;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00loopb/iQuCgRs/hogu02skwxjEyJNF31hDkWb5yqo=;
	b=Iq8/YWL4/fsy9ZkPXaOTCyui3c+gKkBQFb3fiwGCapLd90+1+tHmN57MFMTMMGt0dtUxJR
	KdZEEX8/F3SBO6KEeZHJSCtveMfqdr92nZCvyeVGdG3B3ccFwhOhBapnnk69YVnrrjUYpe
	ZOpC09RingCPZCSnT1lebZbch1K0LJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1742217131;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00loopb/iQuCgRs/hogu02skwxjEyJNF31hDkWb5yqo=;
	b=zxZQiJASKZIMioXgfcxQ+VgrKeq2fWe1wxZZhn5k6CVZ2m3Sez2mYsXGSwsuIAbB8H+OQt
	LVH3sTatgFNq3NBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1742217131;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00loopb/iQuCgRs/hogu02skwxjEyJNF31hDkWb5yqo=;
	b=Iq8/YWL4/fsy9ZkPXaOTCyui3c+gKkBQFb3fiwGCapLd90+1+tHmN57MFMTMMGt0dtUxJR
	KdZEEX8/F3SBO6KEeZHJSCtveMfqdr92nZCvyeVGdG3B3ccFwhOhBapnnk69YVnrrjUYpe
	ZOpC09RingCPZCSnT1lebZbch1K0LJw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1742217131;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=00loopb/iQuCgRs/hogu02skwxjEyJNF31hDkWb5yqo=;
	b=zxZQiJASKZIMioXgfcxQ+VgrKeq2fWe1wxZZhn5k6CVZ2m3Sez2mYsXGSwsuIAbB8H+OQt
	LVH3sTatgFNq3NBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7758F139D2;
	Mon, 17 Mar 2025 13:12:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y+3rHKsf2GeOVQAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Mon, 17 Mar 2025 13:12:11 +0000
Date: Mon, 17 Mar 2025 14:12:10 +0100
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: Qu Wenruo <wqu@suse.com>, oe-kbuild-all@lists.linux.dev,
	David Sterba <dsterba@suse.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: Re: [btrfs:pr/1157 153/155] extent_io.c:undefined reference to
 `__udivdi3'
Message-ID: <20250317131210.GV32661@suse.cz>
Reply-To: dsterba@suse.cz
References: <202503151741.3rChx4vg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503151741.3rChx4vg-lkp@intel.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:replyto,intel.com:email];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Sat, Mar 15, 2025 at 05:33:56PM +0800, kernel test robot wrote:
> tree:   https://github.com/btrfs/linux.git pr/1157
> head:   ba17f60c94e718376b5573cced1493563b1d4300
> commit: 49c863d9d6690e1ba2ffa093994e03a0cefd50ad [153/155] btrfs: prepare extent_io.c for future large folio support
> config: i386-buildonly-randconfig-001-20250315 (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151741.3rChx4vg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503151741.3rChx4vg-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld: fs/btrfs/extent_io.o: in function `writepage_delalloc':
> >> extent_io.c:(.text+0x3095): undefined reference to `__udivdi3'

This is probably because of

DIV_ROUND_UP(delalloc_end + 1 - page_start, folio_size(folio));

as folio_size() returns size_t which is 64bit.
