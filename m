Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C40219E5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708095083; cv=none; b=VhHP4eSM1E9qYRBS1EozjyTUPkoTheuCbPxcnxiYCmj3A1moqoIwwXNmXfku1zEARXGsVR22UbCaTTXY58NnvQsnGrgeBELD9lLYi3PZKUVYGwuvLztmpScvho4uk9Fqu9UpkqLF9vvfvyd4RP1QO3IevSrJfTslm8TNV7cKKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708095083; c=relaxed/simple;
	bh=SGwVA7jMVSbvvDHTffwv5oCa/6gX4jfOg1di2egfBnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWElCo9T2G2qUrRSvgTkx0bB2SmPYdDMUJm50OHWA0y4oAEk4d7KsHexy8K8ysi7A4sC1nHNY632J5KEFnAZBO1ETJQvB4fs7Z0Kt/6xrSqdgYDNclDPHqBienwvMcD5Wke1F5St+46Aiwj5GU3wUguYU/4QTg/Lh0rwk19tAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kvtCmIQr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3/hli3d9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=slBOHnvz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7oVGm0YR; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kvtCmIQr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3/hli3d9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="slBOHnvz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7oVGm0YR"
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 154562228F;
	Fri, 16 Feb 2024 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708095080; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9VDQzybE+AB48V03Evvf+HDBXrkVAl5buF0XjJQVx8=;
	b=kvtCmIQrxAWv4mH8OydUTOM6/mPa7HW8vTN46ngeg84emPs4pflz93LrDhR16m8DYnifrm
	iNCawyZ6Qo65y0D7b3oCwpUTZ3P/cpF/VA8DLCRg7v48es7dSMAFV3Z+OsLfy/ypV6W9mE
	FApXInAozR3b6HhynQxODFbiJykcc0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708095080;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9VDQzybE+AB48V03Evvf+HDBXrkVAl5buF0XjJQVx8=;
	b=3/hli3d9qe0yAGViKS9t8d2ikWsUogeCuwp8d/7BS1xRNxAlcXhc+CKVBKQFSguPK6hNWv
	3sD0Msmgn4LoL7BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708095079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9VDQzybE+AB48V03Evvf+HDBXrkVAl5buF0XjJQVx8=;
	b=slBOHnvznVulzwihlfttbpUFsrwHZ8KdyYXbygKK/mmFpCcznleRFbUsmxSU5t5l12jTEH
	DxMeMqaTsUnrx/h8ZQ3xunkjY3h031tGIG5z+TZmG11bQqI6zNqTytoivNvGvzJO1wy+iC
	hSbuTi+y2wB2VoLFxfEaDDk2wCkWsFE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708095079;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c9VDQzybE+AB48V03Evvf+HDBXrkVAl5buF0XjJQVx8=;
	b=7oVGm0YRF/2MUD3XS4znDS9T8DftMF11+zFntIiFAiXqefmxZd3KdLPTJMJI7sw81PgXdc
	GLAbG43EjF4VstDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id C055713343;
	Fri, 16 Feb 2024 14:51:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id KJlELGZ2z2WFPQAAn2gu4w
	(envelope-from <osalvador@suse.de>); Fri, 16 Feb 2024 14:51:18 +0000
Date: Fri, 16 Feb 2024 15:52:28 +0100
From: Oscar Salvador <osalvador@suse.de>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6971/7658] mm/page_owner.c:860 stack_print()
 warn: unsigned 'nr_entries' is never less than zero.
Message-ID: <Zc92rFbBLLcp5gl6@localhost.localdomain>
References: <202402162252.FpEa3ZUY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402162252.FpEa3ZUY-lkp@intel.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.94 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.84)[85.24%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -0.94

On Fri, Feb 16, 2024 at 10:26:36PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   d37e1e4c52bc60578969f391fb81f947c3e83118
> commit: 3a6bc36161369a1772af565b59c6e290ee189afc [6971/7658] mm,page_owner: display all stacks and their count
> config: x86_64-randconfig-161-20240215 (https://download.01.org/0day-ci/archive/20240216/202402162252.FpEa3ZUY-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402162252.FpEa3ZUY-lkp@intel.com/

Thanks

>  > 860		if (!nr_entries || nr_entries < 0 ||

I'll add a fixup.

>    861		    refcount_read(&stack_record->count) < 2)
>    862			return 0;
>    863	
>    864		for (i = 0; i < nr_entries; i++)
>    865			seq_printf(m, " %pS\n", (void *)entries[i]);
>    866		seq_printf(m, "stack_count: %d\n\n", refcount_read(&stack_record->count));
>    867	
>    868		return 0;
>    869	}
>    870	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

-- 
Oscar Salvador
SUSE Labs
