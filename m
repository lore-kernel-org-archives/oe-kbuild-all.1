Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F422D5C97
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366495; cv=none; b=UrJOtWPpw5wN/ruQk8kZ3H3fyn/Gc92HCHuHAhgSmKwqqjZNbHRU/Mv1V8hlwBXn5cDrMJLCY2F+NxVI2En23NGG7og1KAQ8m7diQCIuCefvTd3dRnBL7vfA6z+01HCD+eeIKuYZMNLYPm5yRWnqlsnk525eeKZv/OTUJBiaksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366495; c=relaxed/simple;
	bh=Asb5cZNPrho+8Hb9XBJfdBFkV+TeOHxFbPRHAGORCxY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MK/YChbbc4ag3MB7LiIaWb+oszkx3TqSinu3LW3B02RWC2jZa5+CJfs1V/JXAYtIYnmFTWYl5/PM+4jNzofHxJ6Pg/s/rj+0Bfef1WGaYhesY+ZiHQLXU/7ovGKc4aNUNgD5dj03Cpf/Jz4FonwYMwcKGVYonBfoaY9XOLB91ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OjGIfwMh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OjGIfwMh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753366314;
	bh=KdQt8Nxgh2aN9YSityNLusuZDY0zAH8Q6g+ZVkIVo84=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OjGIfwMheC0coMfpBj6d4+WLFsXxcxD0P9M9JCSl+Yuygd8mvGSjlg+slTirBtJcY
	 IhLlx8a0rRsazxdMi56LUkAwP1kXPhNQXDn+7/e13zOR7f7xTcG2hiP65uxJAhy8Xe
	 FBsOYWiMtzMRQKYFxOaW2n1ySbyXQRaJc8vT482VpFeigf5hXkhg/bzghkXkR45EUX
	 Wukku9/L2ZBrNdITh48MupGyIZT7YD1nUaPCSOOam9IJNBvknuOF8td+Yj026QAGS0
	 3yDtuBioB0x4BEuzFLAofxhnTahbcujEG4TSQN9f0OJvMhq6ZUvNR2GmBbSDVvOvSE
	 VBmJZ8axDZogQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bntGx0Mnkz4w2H;
	Fri, 25 Jul 2025 00:11:52 +1000 (AEST)
Date: Fri, 25 Jul 2025 00:14:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Carlos Maiolino <cem@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 oe-kbuild-all@lists.linux.dev, Christoph Hellwig <hch@lst.de>, "Darrick J.
 Wong" <djwong@kernel.org>
Subject: Re: [linux-next:master 11803/12139] fs/xfs/xfs_qm.c:506:17: error:
 implicit declaration of function 'trace_xfs_dqreclaim_dirty'; did you mean
 'trace_xfs_dqreclaim_done'?
Message-ID: <20250725001445.552b09ee@canb.auug.org.au>
In-Reply-To: <uncwpbkjp5ymdrk76augrq3bxjvqsciyjcg47dvp5fo4px5o4w@vt6psvbnoqa3>
References: <Nk-H2GdoynYmAv3_b2PyJSULw3sGMOU6eBOzBYWOfHMmIJXl_FrPPUp6oLSDTOBeJA6xZDe8i5EISmnsCwgohA==@protonmail.internalid>
	<202507241747.dwTWz8Ig-lkp@intel.com>
	<bwmvu3t3uw7qo5kcv7uwrrcvkhyhyb7ys57qcgsgpal7r3hixy@qjxiqn2ef4ni>
	<uncwpbkjp5ymdrk76augrq3bxjvqsciyjcg47dvp5fo4px5o4w@vt6psvbnoqa3>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TNLw+Aqks7RtB=9buhaCNjW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TNLw+Aqks7RtB=9buhaCNjW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Carlos,

On Thu, 24 Jul 2025 13:58:02 +0200 Carlos Maiolino <cem@kernel.org> wrote:
>
> So yesterday I made sure xfs-linux/for-next had all dependencies before p=
ushing
> it  and make it available for linux-next. I'm not exactly sure how this
> build failed. If the patches were applied out-of-order, then it sure
> would fail.
>=20
> Does the bot make builds out of order? Because the HEAD mentioned above
> points to the same commit described belo at linux-next/master, which the
> bot says it correctly built.
>=20
> I'm not exactly sure what the bot did here.
>=20
> Stephen, perhaps you might know what the bot did here?

So, I don't know how this bot actually works, but it looks like to
tries to build after checking out each commit, so (as you say) if the
patches were applied in the wrong order, then you might get a failure
part pay through the tree that you don't get for the tree as a whole.

In this case if you checkout that commit (1edc170bb240), you end up
with a tree that has the call to trace_xfs_dqreclaim_dirty() still
present.

The commit that removes the trace_xfs_dqreclaim_dirty() call is in
v6.16-rc5, but commit 1edc170bb240 is based on v6.16-rc2 ... so you
probably want to rebase the patch seires from Steven Rostedt
<rostedt@goodmis.org> (1edc170bb240^..10a957e43f28) on v6.16-rc5 and
then merge it.  And, in fact, commit 1edc170bb240 has this:

Fixes: d62016b1a2df ("xfs: avoid dquot buffer pin deadlock")

So needed to be applied to a descendant of d62016b1a2df.
--=20
Cheers,
Stephen Rothwell

--Sig_/TNLw+Aqks7RtB=9buhaCNjW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiCP9UACgkQAVBC80lX
0GzM0Af/ebhyaFIPDvKP1gzYFMgRcgxHphvCpaDPs+zbUyWEIwbucLrE8J5PA+Mg
weDbb/wSF7kwnxP2j2AWAiOO5mu2Aig9QXG6OwflvAJjfDadW7MZyHbcQ4fsOJoz
8LI69ebuoUvElHqKa3kwh/uWwTCzOG2mx73Vuj52mgyZhJOf+6WZLDz79PCviFKl
MZ5cxQ92eLQf0eITc6I+ZkMVjYFvFeHBkzhR81LZxMGpxVHex77nBcGaqK13MFZo
TsTW9WSiCMF48IGjdQcWmouZooZZYeUMwFDS3homIqOHET7mkV0O2T1kLP7gMmb7
j9Dsf7KLtL8fUzmix84Rxg4U4h/hNQ==
=xwee
-----END PGP SIGNATURE-----

--Sig_/TNLw+Aqks7RtB=9buhaCNjW--
