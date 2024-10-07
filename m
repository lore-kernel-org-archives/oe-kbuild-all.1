Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FE915A8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728260147; cv=none; b=nD+Lf6JbB1twjgNsH1Jq3IB7T5CvAJFTVhPMLGovgM7qOeXfJTrjOYI07DK2iFsvHZkO5eOx6hVpX9QdSl14pNsXDBHJ/dS+xwAhJrgFEMl3FFvRML0Xconyp5SsJbnxAIh2l40GI0Tj2vo6PLueGP79jhXDvdvCVkkpBJcx0aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728260147; c=relaxed/simple;
	bh=eG3uW4HAq+4Lvip0gWXsVtG51RzThF0lBtZs6PUm9gY=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=GcC87PNG8Y3bN0kqx7hXI1byhj15Ryd0ijBll2smRrPU2+O/mif/0kHStyfHmVccn0akuF8WN4dvnVsk8/QfWLSdD8bGmyeWn2cS4YTy07Ts3vtzOtiZWUiPxQpn6vUWxrcfH7NKjmRb7TQKYpxeR9Md7NAyscJ6wd6BijRpMLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nHRMzlH+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ThYsbeng; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nHRMzlH+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ThYsbeng; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nHRMzlH+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ThYsbeng";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nHRMzlH+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ThYsbeng"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 348871FCE1;
	Mon,  7 Oct 2024 00:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728260144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+I7XHS1Sz5Xa0Btk2hnhszeGmXUy4Qbik4FCoNmivfs=;
	b=nHRMzlH+SsgTYppHsRjJFy4Z1drbiTqDB/mDPkcAa2mI6ZeLXhibjtjOxgd8/Sj7bPfhDM
	vhu7nltjRF5zIDIEsvFsWyymb3cIEuDeWIcjeLQzcq3G4lRGNL6WG9A8u4VqKCEE+vy7U6
	yTViJjoGmrwsteRqsvEyTbGjUZ4o7Jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728260144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+I7XHS1Sz5Xa0Btk2hnhszeGmXUy4Qbik4FCoNmivfs=;
	b=ThYsbengz4TtdQ1NQ9UQsRJMpvKlzdFIBEeiktk9hpuY/nQnVhu+4Y2otqjEMYwDiTj1ha
	stBYnlXJs6LOk7Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728260144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+I7XHS1Sz5Xa0Btk2hnhszeGmXUy4Qbik4FCoNmivfs=;
	b=nHRMzlH+SsgTYppHsRjJFy4Z1drbiTqDB/mDPkcAa2mI6ZeLXhibjtjOxgd8/Sj7bPfhDM
	vhu7nltjRF5zIDIEsvFsWyymb3cIEuDeWIcjeLQzcq3G4lRGNL6WG9A8u4VqKCEE+vy7U6
	yTViJjoGmrwsteRqsvEyTbGjUZ4o7Jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728260144;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+I7XHS1Sz5Xa0Btk2hnhszeGmXUy4Qbik4FCoNmivfs=;
	b=ThYsbengz4TtdQ1NQ9UQsRJMpvKlzdFIBEeiktk9hpuY/nQnVhu+4Y2otqjEMYwDiTj1ha
	stBYnlXJs6LOk7Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6E6BE13786;
	Mon,  7 Oct 2024 00:15:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qaG0CS4oA2ftcQAAD6G6ig
	(envelope-from <neilb@suse.de>); Mon, 07 Oct 2024 00:15:42 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Kent Overstreet" <kent.overstreet@linux.dev>
Cc: "Peter Zijlstra" <peterz@infradead.org>,
 "kernel test robot" <lkp@intel.com>, "Christian Brauner" <brauner@kernel.org>,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/core 1/8] fs/bcachefs/fs.c:181:28: error:
 passing argument 1 of 'bit_waitqueue' from incompatible pointer type
In-reply-to: <hwwxnu4j5ypn7dgafpue2df4u7ec7kg4k4vu4gipeda7raefru@cyttqcthsfrs>
References:
 <>, <hwwxnu4j5ypn7dgafpue2df4u7ec7kg4k4vu4gipeda7raefru@cyttqcthsfrs>
Date: Mon, 07 Oct 2024 11:15:35 +1100
Message-id: <172826013556.1692160.664802213088046938@noble.neil.brown.name>
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_FIVE(0.00)[5]
X-Spam-Flag: NO
X-Spam-Level: 

On Mon, 07 Oct 2024, Kent Overstreet wrote:
> On Fri, Oct 04, 2024 at 08:37:42PM GMT, NeilBrown wrote:
> > On Fri, 04 Oct 2024, Peter Zijlstra wrote:
> > > On Fri, Oct 04, 2024 at 07:28:26PM +1000, NeilBrown wrote:
> > > >=20
> > > > The compile error mentioned below is caused by my patch, but only
> > > > because the code is wrong - so the patch causes wrong code to be
> > > > highlighted - which is good.
> > > >=20
> > > > Commit: 112d21fd1a12 ("bcachefs: switch to rhashtable for vfs inodes =
hash")
> > > >=20
> > > > introduced a use for bit_waitqueue for inode->i_state and __I_NEW, an=
d=20
> > > >=20
> > > > Commit: 0fe340a98b58 ("inode: port __I_NEW to var event")
> > > >=20
> > > > change inode->i_state to require the new inode_bit_waitqueue().
> > > >=20
> > > > These were in independant devel branches and this would have been cau=
ght
> > > > in -next if my patch had already been present.  Sorry I didn't do this
> > > > earlier :-)
> > >=20
> > > So what do I do? Wait for the bug to get fixed?
> > >=20
> >=20
> > Do you need to wait?  Is a compile error worse than an actual bug?
> > I guess it will cause more complaints, and that is something you can do
> > without.
> >=20
> > Kent: how soon can you comfortably get this code updated and a pull
> > request sent to Linus?
>=20
> Fix is in Linus's tree as of last night
>=20

Thanks a lot Kent,

NeilBrown
