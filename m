Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0610F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745476836; cv=none; b=PCbE89d0rM/zOQkl2Flew3zo+7XqCTRXO1ryyk2EaWeCAIKhf3Q21GIYTNzrcEGd9KCgB7TsY92e+EqLd/uPrqK87fOLc1JSgiwkWZmn5qRQjLKsHElQeFAsBoe4sjSFyOX/F8xnAoN5AtjtzzaRvfFs0D+IUXdnft4gAp9cQVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745476836; c=relaxed/simple;
	bh=43bJiACyHXdecJkZtMQme05G7uk4TjuucCkJR5X7t4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRi9dhkktG9gd5JWHfNpbDFR0XXfGdRyUigSG4C7t3QuVGWPrY9gk6xzIZKMbQzYF57SdBEYwoHXUO3ZUB9Vu1jtwwMVXX48JzlOy+Y9U6xiF5MjG1Zd0Y9DGbPrfPdEByciCSueVR0rihhlTmI1LZjPOZltd/1Ldcx8P0H56PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jPOsEDyf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=fwz4U95x; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=jPOsEDyf; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=fwz4U95x; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jPOsEDyf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="fwz4U95x";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="jPOsEDyf";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="fwz4U95x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 176591F38C;
	Thu, 24 Apr 2025 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745476833;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQKCsTCx5HVxNPH/F2G4y0bvlzNzDY5ugJqviZRnack=;
	b=jPOsEDyfjbBT4ezZP7/I1NLbaSJBvgtyvYRDVF5SOmJlyBQ+cWzf9oxf4YPxNKVZfI05iP
	DeWKhhhe5kEqkJO9ttMfnxesidXtymgGKrl9ekIFf3kLWnIjCBo713WANqYzxKM8RrxU01
	QIKrgngKyzgLnMXWWIsYVbJXlc0cezo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745476833;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQKCsTCx5HVxNPH/F2G4y0bvlzNzDY5ugJqviZRnack=;
	b=fwz4U95xMPiVgEvkpuIgi4krf0Apeam1OHc/pJ1Bhsepef/JoeB1pOzisfFez02rGi1oIC
	PQUYSOTf+2ABcsAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1745476833;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQKCsTCx5HVxNPH/F2G4y0bvlzNzDY5ugJqviZRnack=;
	b=jPOsEDyfjbBT4ezZP7/I1NLbaSJBvgtyvYRDVF5SOmJlyBQ+cWzf9oxf4YPxNKVZfI05iP
	DeWKhhhe5kEqkJO9ttMfnxesidXtymgGKrl9ekIFf3kLWnIjCBo713WANqYzxKM8RrxU01
	QIKrgngKyzgLnMXWWIsYVbJXlc0cezo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1745476833;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PQKCsTCx5HVxNPH/F2G4y0bvlzNzDY5ugJqviZRnack=;
	b=fwz4U95xMPiVgEvkpuIgi4krf0Apeam1OHc/pJ1Bhsepef/JoeB1pOzisfFez02rGi1oIC
	PQUYSOTf+2ABcsAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 04A0A139D0;
	Thu, 24 Apr 2025 06:40:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id H9eiAOHcCWhHZwAAD6G6ig
	(envelope-from <dsterba@suse.cz>); Thu, 24 Apr 2025 06:40:33 +0000
Date: Thu, 24 Apr 2025 08:40:31 +0200
From: David Sterba <dsterba@suse.cz>
To: kernel test robot <lkp@intel.com>
Cc: David Sterba <dsterba@suse.com>, oe-kbuild-all@lists.linux.dev,
	Josef Bacik <josef@toxicpanda.com>
Subject: Re: [btrfs:pr/1157 91/97] fs/btrfs/messages.h:181:29: error:
 expected ')' before '__VA_OPT__'
Message-ID: <20250424064031.GK3659@suse.cz>
Reply-To: dsterba@suse.cz
References: <202504241458.DGT7MuTv-lkp@intel.com>
 <20250424062552.GJ3659@suse.cz>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424062552.GJ3659@suse.cz>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Spam-Score: -4.00
X-Spamd-Result: default: False [-4.00 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	HAS_REPLYTO(0.30)[dsterba@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:mid,suse.cz:replyto,intel.com:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu, Apr 24, 2025 at 08:25:52AM +0200, David Sterba wrote:
> On Thu, Apr 24, 2025 at 02:19:12PM +0800, kernel test robot wrote:
> > tree:   https://github.com/btrfs/linux.git pr/1157
> > head:   10c06ead9f79886df92197deb8d5c7bc37d52971
> > commit: 3050d7e09e5d7781bd9cfd8a27fc3d942afcd15c [91/97] btrfs: enhance ASSERT() to take optional format string
> > config: arm-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241458.DGT7MuTv-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202504241458.DGT7MuTv-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    In file included from fs/btrfs/ctree.c:11:0:
> >    fs/btrfs/compression.h: In function 'btrfs_calc_input_length':
> > >> fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
> >     #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
> >                                 ^
> 
> I don't understand what's the problem, it's gcc 7.5 on arm, can it be
> lack of support for __VA_OPT__? I'm not sure if the other syntax would
> work here, ##__VA_ARGS__ .

godbolt.org confirms it's lack of gcc support < 8, current minimum is
5.1 so I'll fix it with the gcc variadic macro extension that I wanted
to avoid originally.
