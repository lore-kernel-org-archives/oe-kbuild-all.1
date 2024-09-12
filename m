Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A2E18EFFB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 09:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726134414; cv=none; b=UpYJpC0mDrTj6fAL7JdwPihJWvU0V/UN+KBYQJqsdLj9VBPZe6mmkcSBGsl8yrTkl/L2vdPqRwn5gsAZCW0Mil3Yj4VX3vSwz+mSKCL8qcdsUXr1gq4Ee8JMg0QfxK7lhl1k+YCPIa7b2YHvld1qQteVP+nQwcxTMFaYlIw9ZVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726134414; c=relaxed/simple;
	bh=zks+xz5Vek7mdu5bVU0tXQ8ulY82typr+65ea+9MGKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyBbq92TuQWde2gRHi13LjZirGsRXbK9HoD2a+uphqMcv/Zoe6/KKutqpIJ7HZgclWVBhwxVwT1RnpkYlUsfsNrv/7CME0GkAMW9L/DEJwng3miKEkUFA04QVmhmghpgEri4LeMSEmLhKA588q/ZJDh50g1ga3Je8306guP7QOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rxHSvDCN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5RThT/bT; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=rxHSvDCN; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=5RThT/bT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rxHSvDCN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5RThT/bT";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="rxHSvDCN";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="5RThT/bT"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6923A1F76E;
	Thu, 12 Sep 2024 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1726134410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjqYXLeX6jDX6MeFgNLd5a3RJUBnqDbux8HPOmf+iE8=;
	b=rxHSvDCNyw+LUeBEdU2jmQ+ykrDiDMjKdzirUpzZIFJSWOcVlbTZ2Cfp9DNWO595TjiVMR
	PJHV2cxTs7FJIXBpbmsbTDuNy1aVE2PW2wab0ST5Kg6zZo55Tu1wZSK39tRUALMFYYBHD2
	lYPmHidmHEZQUlaeKmtI+LKAd2QWGyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1726134410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjqYXLeX6jDX6MeFgNLd5a3RJUBnqDbux8HPOmf+iE8=;
	b=5RThT/bTyGIvxGSduTQNkv7xIJFzhDXie2f0qESKwCluEaSi5RL4d00fm3SGo5pTUsRxCI
	5x4/+ybXtQXbS5Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1726134410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjqYXLeX6jDX6MeFgNLd5a3RJUBnqDbux8HPOmf+iE8=;
	b=rxHSvDCNyw+LUeBEdU2jmQ+ykrDiDMjKdzirUpzZIFJSWOcVlbTZ2Cfp9DNWO595TjiVMR
	PJHV2cxTs7FJIXBpbmsbTDuNy1aVE2PW2wab0ST5Kg6zZo55Tu1wZSK39tRUALMFYYBHD2
	lYPmHidmHEZQUlaeKmtI+LKAd2QWGyw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1726134410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjqYXLeX6jDX6MeFgNLd5a3RJUBnqDbux8HPOmf+iE8=;
	b=5RThT/bTyGIvxGSduTQNkv7xIJFzhDXie2f0qESKwCluEaSi5RL4d00fm3SGo5pTUsRxCI
	5x4/+ybXtQXbS5Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5E09A13A73;
	Thu, 12 Sep 2024 09:46:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zaPuFoq44mZ5KAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 12 Sep 2024 09:46:50 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 0FF57A08B3; Thu, 12 Sep 2024 11:46:46 +0200 (CEST)
Date: Thu, 12 Sep 2024 11:46:46 +0200
From: Jan Kara <jack@suse.cz>
To: Luis Henriques <luis.henriques@linux.dev>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Subject: Re: [linux-next:master 5690/11210] fs/ext4/fast_commit.c:362:21-23:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <20240912094646.brhe2exsizgwzlai@quack3>
References: <202409120149.GdjqoVYQ-lkp@intel.com>
 <874j6lcmih.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <874j6lcmih.fsf@linux.dev>
X-Spam-Score: -3.77
X-Spamd-Result: default: False [-3.77 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.17)[-0.849];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

On Thu 12-09-24 09:19:18, Luis Henriques wrote:
> On Thu, Sep 12 2024, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
> > commit: ebc4b2c1ac92fc0f8bf3f5a9c285a871d5084a6b [5690/11210] ext4: fix incorrect tid assumption in ext4_fc_mark_ineligible()
> > config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240912/202409120149.GdjqoVYQ-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 14.1.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409120149.GdjqoVYQ-lkp@intel.com/
> >
> > cocci warnings: (new ones prefixed by >>)
> >>> fs/ext4/fast_commit.c:362:21-23: WARNING !A || A && B is equivalent to !A || B
> >
> > vim +362 fs/ext4/fast_commit.c
> >
> >    332	
> >    333	/*
> >    334	 * Mark file system as fast commit ineligible, and record latest
> >    335	 * ineligible transaction tid. This means until the recorded
> >    336	 * transaction, commit operation would result in a full jbd2 commit.
> >    337	 */
> >    338	void ext4_fc_mark_ineligible(struct super_block *sb, int reason, handle_t *handle)
> >    339	{
> >    340		struct ext4_sb_info *sbi = EXT4_SB(sb);
> >    341		tid_t tid;
> >    342		bool has_transaction = true;
> >    343		bool is_ineligible;
> >    344	
> >    345		if (ext4_fc_disabled(sb))
> >    346			return;
> >    347	
> >    348		if (handle && !IS_ERR(handle))
> >    349			tid = handle->h_transaction->t_tid;
> >    350		else {
> >    351			read_lock(&sbi->s_journal->j_state_lock);
> >    352			if (sbi->s_journal->j_running_transaction)
> >    353				tid = sbi->s_journal->j_running_transaction->t_tid;
> >    354			else
> >    355				has_transaction = false;
> >    356			read_unlock(&sbi->s_journal->j_state_lock);
> >    357		}
> >    358		spin_lock(&sbi->s_fc_lock);
> >    359		is_ineligible = ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIBLE);
> >    360		if (has_transaction &&
> >    361		    (!is_ineligible ||
> >  > 362		     (is_ineligible && tid_gt(tid, sbi->s_fc_ineligible_tid))))
> >    363			sbi->s_fc_ineligible_tid = tid;
> 
> This suggestion is obviously correct.  However, my brain found it much
> easier to write (and understand) this logic if written this way.
> 
> Ted, want me to re-send this patch (or a fix for it), or are you happy
> leaving it as is?

I think I've already seen a patch for this. Yes [1]. Frankly I don't care
much but I slightly prefer the shorter variant.

[1] https://lore.kernel.org/all/20240912090722.4e7o4l462y6hccau@quack3

								Honza

> 
> Cheers,
> -- 
> Luís
> 
> >    364 ext4_set_mount_flag(sb, EXT4_MF_FC_INELIGIBLE); 365
> >    spin_unlock(&sbi->s_fc_lock); 366 WARN_ON(reason >=
> >    EXT4_FC_REASON_MAX); 367
> >    sbi->s_fc_stats.fc_ineligible_reason_count[reason]++; 368 } 369
> >
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
