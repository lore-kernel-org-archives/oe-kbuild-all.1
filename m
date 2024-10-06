Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1916F8E9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Oct 2024 23:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728258322; cv=none; b=krc7BuN8ZAEGRIj9iaFFPhST8lu3mYkYjU+oXFsWtz8e87tS9QZ9ToGD+YuRTz4JLo9aGcz3/zUICt+j3TevpGxdJYNgV3dikqEvHJJ7vPBLsDtgabfA3QVIpAQwTqJOcug1ARtTQgB0/s+NpKAdBiCdVBWZM6CQE7iO2TAGgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728258322; c=relaxed/simple;
	bh=TO+OZP2lSXkNWdfkfu3LKSEvRwoB8doxGmRHKGP5y5Y=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=cGbikOv3Xo3n5g5GNCi52V4VR1OEgQmuHnOjwLvo0DRB70neLXLazenT0SNLFbwcIM2y3O1SyPanon42vux9BztY9QRGb3i+b6oOWohXpWumk3BldLKFMu5wcsRx7VlS/PaJCZiHO0QH0AiIbexvUma7xre25mm80Xyo0SmkC7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zVMElSDA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sdPI6Vm+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zVMElSDA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sdPI6Vm+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zVMElSDA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sdPI6Vm+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zVMElSDA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sdPI6Vm+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B4F321EF0;
	Sun,  6 Oct 2024 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728258315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPIwm6COgo7a8dq2IXD1Pnuuof4ik8en2bwN4VaKpIY=;
	b=zVMElSDAw4mjGEKMD5wUG5oGA80SiHVkmRO7ZBdWdhEl8qZDy8mUBBldh9+OPemx4B4c1p
	OJL2Pbp6X/DrCJeDTSAjc/EQSg2PrCxAYytUzv4JgRsLyU774v+VM+vjepyvM+p6wsDmP+
	r9PxQ37PBFU2xmsJE+wbTFO5SAzudTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728258315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPIwm6COgo7a8dq2IXD1Pnuuof4ik8en2bwN4VaKpIY=;
	b=sdPI6Vm+IxQJiHV+rHj+nZy912KfQTUNvVv+0eNK2j1xXhhG/2/127y7XBljYBDcdIfeTT
	izawDN1QJ8aYQwDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728258315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPIwm6COgo7a8dq2IXD1Pnuuof4ik8en2bwN4VaKpIY=;
	b=zVMElSDAw4mjGEKMD5wUG5oGA80SiHVkmRO7ZBdWdhEl8qZDy8mUBBldh9+OPemx4B4c1p
	OJL2Pbp6X/DrCJeDTSAjc/EQSg2PrCxAYytUzv4JgRsLyU774v+VM+vjepyvM+p6wsDmP+
	r9PxQ37PBFU2xmsJE+wbTFO5SAzudTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728258315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UPIwm6COgo7a8dq2IXD1Pnuuof4ik8en2bwN4VaKpIY=;
	b=sdPI6Vm+IxQJiHV+rHj+nZy912KfQTUNvVv+0eNK2j1xXhhG/2/127y7XBljYBDcdIfeTT
	izawDN1QJ8aYQwDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4BA7B13240;
	Sun,  6 Oct 2024 23:45:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lSl2AAkhA2fZaQAAD6G6ig
	(envelope-from <neilb@suse.de>); Sun, 06 Oct 2024 23:45:12 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Peter Zijlstra" <peterz@infradead.org>
Cc: "kernel test robot" <lkp@intel.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Kent Overstreet" <kent.overstreet@linux.dev>, oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
In-reply-to: <20241004100111.GM18071@noisy.programming.kicks-ass.net>
References: <>, <20241004100111.GM18071@noisy.programming.kicks-ass.net>
Date: Mon, 07 Oct 2024 10:45:10 +1100
Message-id: <172825831037.1692160.12644305359648113303@noble.neil.brown.name>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,noble.neil.brown.name:mid]
X-Spam-Flag: NO
X-Spam-Level: 

On Fri, 04 Oct 2024, Peter Zijlstra wrote:
> On Fri, Oct 04, 2024 at 07:28:26PM +1000, NeilBrown wrote:
> >=20
> > The compile error mentioned below is caused by my patch, but only
> > because the code is wrong - so the patch causes wrong code to be
> > highlighted - which is good.
> >=20
> > Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes hash=
")
> >=20
> > introduced a use for bit_waitqueue for inode->i_state and __I_NEW, and=20
> >=20
> > Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")
> >=20
> > change inode->i_state to require the new inode_bit_waitqueue().
> >=20
> > These were in independant devel branches and this would have been caught
> > in -next if my patch had already been present.  Sorry I didn't do this
> > earlier :-)
>=20
> So what do I do? Wait for the bug to get fixed?
>=20

The relevant bcachefs code has been rewritten for -rc2, so were should
not be an compile errors introduced by my patch now.

Commit: 6b63a948a73b ("bcachefs: Add missing wakeup to bch2_inode_hash_remove=
()")

Thanks,
NeilBrown
