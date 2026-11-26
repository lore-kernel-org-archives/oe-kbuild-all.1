Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691299;
	b=NW5EcSlrruyl6Rb50Di6LOZThNU4nfm9+V6AiIDb9QvKUhd5zsFjhSSQkwspBPCgPrph
	 dZgiUDUbiKI2QLgnebGgRxzvRzpNOo1F1QixnlJSA99er8vSf9NzGR2CzqIHFosBzRMop
	 UmrNkHK6HQiD0AErz7sw6BqFFnzAE3Y0PO/5/TyKycrTwuLYHtDqaKhtq0pPcFVnj6ofF
	 l9IlGQQKh0UyGK1wYxb+x/wPNlHKkZ9QZgmIsoBvSYva7KL5bD0/NYVrGdvl4usp0vpw0
	 c7FYKoFTKdCQW1jhVsGIX/N6icqTEyzSoA2o9ZhNNkg/Tb5daZCHCqXKy52+pBwwGMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691299;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=Kmf9u4R6SMsK2oJZBBuB4ZZPXP2Acp3Pq7UI/bfXnfU=;
	b=SWJujHw2vqpcCGGsQ9/dHQPr6MfkBvbpSHWRg4PUWcSx0zXhM/G2G50zdwCIcGkEB20N
	 PABxH0J8TMngxRBIH08YIp9T1w6cUwrJjifmFhvNafmjaZklvaTX+QmuTu5paTki4Qh/q
	 PpLDa5cEW3KYpjxFaLovg4di6eHOtscg570mqIVuZhH/Ea2T+eD/gJYdUPUHc4neBm2Yw
	 S7jmJjv5GtA7OLEu81Tok0EPKNE7A4Rhw9utWHhmyRRg999zIlfgM3QjH1WgPevtUswrt
	 pJUGIaKYTtfUYH56arvsinhsK4UebdMEQ/j75+sVZ8bKMvPXDppQorb55/Na8EPUVqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b="rioYndF/";
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="IiZFcSQ/";
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b="ySkd/umk";
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dONGJxuI;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98721606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 11:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=rioYndF/;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IiZFcSQ/;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ySkd/umk;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dONGJxuI
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D6F541FA9F;
	Thu, 26 Nov 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795691291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kmf9u4R6SMsK2oJZBBuB4ZZPXP2Acp3Pq7UI/bfXnfU=;
	b=rioYndF/CNpouzggovg46cw4DGhoB4Ka8yqeE61hZvohv2jz05CEWV1hLfg4m6/BABlmPa
	UMISE4xymzJhZ1X3YSNk5CTlGmkyN1Ra8t1mpLPGieCwQuIWhqG/OttXfXaqlRS0sIQ+Cf
	3SQuNlZkVOQGdNCmGc49inxXLvwaVN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795691291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kmf9u4R6SMsK2oJZBBuB4ZZPXP2Acp3Pq7UI/bfXnfU=;
	b=IiZFcSQ/98BGXzxLHj6jvpPzX+mhOtzA2lbJf2Nj3Wj3jCwhMvg5uOnXvY+KYKXTxqjX82
	4tpRt3o/ABwd+XAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795691290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kmf9u4R6SMsK2oJZBBuB4ZZPXP2Acp3Pq7UI/bfXnfU=;
	b=ySkd/umkwJJJbUov2/IeeLF+cDwhdwoWuToZtCCg02mkImffZHgYwYNrGqsAQ/THJdf8Vv
	cWFWrVOxDPW2QkzbmNoJfWVzVhq0bAtrbydaJoPSYfn0j5iFK04auXu2ZP9ByplQjuoPK7
	HiUvteR1nCbsZFwAT1FNLx09BpC7pTY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795691290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kmf9u4R6SMsK2oJZBBuB4ZZPXP2Acp3Pq7UI/bfXnfU=;
	b=dONGJxuIb36JNgRbx4vbNz3CcFAaeohmKWLAzR0hHuxx15jLgmklSni1+XaB7xXUtJkVJ/
	bneI3E7IvMuutuBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A9FC9134C3;
	Thu, 26 Nov 2026 11:08:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id kMpKIRoTCGtTTgAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 26 Nov 2026 11:08:10 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 371C027DDB; Thu, 26 Nov 2026 12:08:10 +0100 (CET)
Date: Thu, 26 Nov 2026 12:08:10 +0100
From: Jan Kara <jack@suse.cz>
To: "yebin (H)" <yebin10@huawei.com>
Cc: kernel test robot <lkp@intel.com>, Ye Bin <yebin@huaweicloud.com>, 
	tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, jack@suse.cz
Subject: Re: [PATCH v2 2/2] ext4: protect ext4_acquire_dquot against freezing
Message-ID: <u5j2wzkkg32il2gwhuqss6eh2r45xjbchmq5lmon2qp5his7l2@7yibuej6qwe5>
References: <20261125111055.3672233-3-yebin@huaweicloud.com>
 <20261126015002.1lcIDaq1-lkp@intel.com>
 <6B07CD46.8060109@huawei.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6B07CD46.8060109@huawei.com>
X-Spamd-Result: default: False [-12.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-Spam-Score: -12.80
X-Spam-Level: 
X-Spam-Flag: NO

On Thu 26-11-26 14:10:14, yebin (H) wrote:
> 
> 
> On 2026/11/26 1:58, kernel test robot wrote:
> > Hi Ye,
> > 
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on tytso-ext4/dev]
> > [also build test ERROR on linus/master v7.4-rc4]
> > [cannot apply to brauner-vfs/vfs.all next-20261124]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Bin/quota-Forbid-Q_XGETQUOTA-and-Q_XGETNEXTQUOTA-for-frozen-filesystem/20261125-191054
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> > patch link:    https://lore.kernel.org/r/20261125111055.3672233-3-yebin%40huaweicloud.com
> > patch subject: [PATCH v2 2/2] ext4: protect ext4_acquire_dquot against freezing
> > config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261126/20261126015002.1lcIDaq1-lkp@intel.com/config)
> > compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126015002.1lcIDaq1-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/20261126015002.1lcIDaq1-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >     fs/ext4/super.c: In function 'ext4_write_dquot':
> > > > fs/ext4/super.c:7165:13: error: 'freeze_protected' undeclared (first use in this function); did you mean 'freeze_processes'?
> >      7165 |         if (freeze_protected)
> >           |             ^~~~~~~~~~~~~~~~
> >           |             freeze_processes
> >     fs/ext4/super.c:7165:13: note: each undeclared identifier is reported only once for each function it appears in
> > 
> 
> This is a bit strange. The ext4_write_dquot() function hasn't been modified at
> all, and the nearby functions don't seem to have been changed in the latest
> version either. It's possible that the patch wasn't generated based on the
> latest linux-next code, causing git to apply the patch incorrectly by matching
> only the context and line numbers, thus targeting the wrong function. I'll
> regenerate the patch and send a new version, and I'll also CC linux-fsdevel
> this time.

Yes, I think the the patch just misapplied in the test infrastructure.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
