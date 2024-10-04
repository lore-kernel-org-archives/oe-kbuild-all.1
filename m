Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CBD148FF3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Oct 2024 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728038278; cv=none; b=jk3i3sMzYGpLwAurz5KJl+B9Hon0qlSTckey3xH9gY7TtGmKeZNj3xKRFfO/A1t++6DKpVmttSgYLninbReBuPjJxyQKWNOKNUPJFjWvbnEUV2YfethjVqe62M++iAGLzYFlSuTUBKdLETICl76SeySkCxNy/qXo30tZGKxMk6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728038278; c=relaxed/simple;
	bh=F3ruzYwilJECqIk7N1EaAlGOlvjK/P0+2Gr9T7Srjn8=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=i/mPlxiXCQb2y3m4EPxZrAsBWdltjDSLfDieUd2KzcKnovg5UX7rxwnShce8nFonpLjdcxWXrzNkDmvOGXM5L1z8tPyZ3MMAs3lNHmDCRRgGv98+0BbUs9ccxDpjcap63b991MiHIWSAGPqa2BF1OVwVxgqeVu9aBEELxZ02pLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z//sdG7J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SjTTuxax; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z//sdG7J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SjTTuxax; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z//sdG7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SjTTuxax";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z//sdG7J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SjTTuxax"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7D5911FE55;
	Fri,  4 Oct 2024 10:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728038275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHDxy2c57k5tDiWEJFqgQ21DkrZFy+nAWge3an4beHg=;
	b=z//sdG7JPvj3as3rS3ty8sVU7vlp+WspZ0gdsAgQTZJTk0sIr5ISBi+cTwxEjgKjDFBjS+
	kAwoCfGgR30Awdyd2pbwXzQgD7AYNr2LlPFEa+jq7VrjC6jDR+joiSEm4sh8nZ+R2VG+RV
	KQHSo8ZrgWgpZTvAo98fcFpDDV55wxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728038275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHDxy2c57k5tDiWEJFqgQ21DkrZFy+nAWge3an4beHg=;
	b=SjTTuxax/EC13JqQZHKflAAXhPYzhMQCYVmt2ym879G7xEpQxBpqDDPP4OY2nNKG/uUCjx
	7GKPj96joH1G/ABQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="z//sdG7J";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=SjTTuxax
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728038275; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHDxy2c57k5tDiWEJFqgQ21DkrZFy+nAWge3an4beHg=;
	b=z//sdG7JPvj3as3rS3ty8sVU7vlp+WspZ0gdsAgQTZJTk0sIr5ISBi+cTwxEjgKjDFBjS+
	kAwoCfGgR30Awdyd2pbwXzQgD7AYNr2LlPFEa+jq7VrjC6jDR+joiSEm4sh8nZ+R2VG+RV
	KQHSo8ZrgWgpZTvAo98fcFpDDV55wxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728038275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zHDxy2c57k5tDiWEJFqgQ21DkrZFy+nAWge3an4beHg=;
	b=SjTTuxax/EC13JqQZHKflAAXhPYzhMQCYVmt2ym879G7xEpQxBpqDDPP4OY2nNKG/uUCjx
	7GKPj96joH1G/ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4A6913A55;
	Fri,  4 Oct 2024 10:37:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q/O1GoHF/2aPIAAAD6G6ig
	(envelope-from <neilb@suse.de>); Fri, 04 Oct 2024 10:37:53 +0000
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
Date: Fri, 04 Oct 2024 20:37:42 +1000
Message-id: <172803826240.1692160.2514028201460838195@noble.neil.brown.name>
X-Rspamd-Queue-Id: 7D5911FE55
X-Spam-Score: -4.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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

Do you need to wait?  Is a compile error worse than an actual bug?
I guess it will cause more complaints, and that is something you can do
without.

Kent: how soon can you comfortably get this code updated and a pull
request sent to Linus?

Thanks,
NeilBrown
