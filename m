Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB9C144
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 02:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726021985; cv=none; b=F03afZHlOnAlcrwhIElLmOcux0oAhljJHoEC36EDCKeJJ1/nmUhuHs/AzjS5jYPicrhpi3SEQQPtPp8hggDO8jfkHFli3JoU0CE1wOkavAoVyhwhQsjAppQFvh11ficM26RMltG9RkHW9PnfT5G1/XdpP8xuYJomB9cqCJyNCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726021985; c=relaxed/simple;
	bh=8hO/axrA/lMAmDfYuGbd68SOHCMTKb4E5KAqw6+jF2I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LCzKJzyQP7YhRPC/SE2v/BgAerTG74bRibnR5hmkLLPCXfu6HU+iRv/A0U3OKoMyhkBMCTxXJaAhnSlYb9KSqgle03yJJ87MwhERr+l7YoSV7pIoBZ4xmlG3eWEyKh2BoE+919Yj266ZB2/vmDBQwrz4VV8iLVqcV+ZJ1pEbrHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cv5XRmwQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cv5XRmwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726021977;
	bh=8hO/axrA/lMAmDfYuGbd68SOHCMTKb4E5KAqw6+jF2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cv5XRmwQstaQkQduYTzHaq6FzPnbW6IDG4kii8xz7Nc0Waj8aKdu8+cqKTMscnYrQ
	 XH/xdz8rHiRcEXOQHxB4GEKNUBVCsERBc1WpHp7sn/uxbHCohUfFw0uXVKc/K9fwWt
	 rTiZUrXOEQC90/uysbI0u736HqWytj5G5FjfFguTZGe6T6f5Iyq08uwLhMQc8mrBK0
	 18tSQ6+NyviGAOkG4XbUrGDr0w67YKEPj6Ay4etWwKxXx9n8HpPmpXM4GNV7pGdG9g
	 fJ/igh0pZLUSwnDneJ52oUUmVaHKObXz3t9zMmAvk7jgKBcIHOiX4rD6+U3zVe6maN
	 ruFMB6Mzngg7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3PkK37w6z4x3r;
	Wed, 11 Sep 2024 12:32:57 +1000 (AEST)
Date: Wed, 11 Sep 2024 12:32:56 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Huang, Ying" <ying.huang@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot
 <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Linux Memory Management
 List <linux-mm@kvack.org>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [linux-next:master 10352/10516] include/linux/mm.h:101:35:
 error: 'MAX_PHYSMEM_BITS' undeclared
Message-ID: <20240911123256.230a5b19@canb.auug.org.au>
In-Reply-To: <87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
References: <202409100913.RxkfrKU6-lkp@intel.com>
	<20240909204555.ab57c729531c83a0685cfa8e@linux-foundation.org>
	<87wmjkyshl.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<20240910104056.343d7154134fb7fc6942075a@linux-foundation.org>
	<87ttenvw0i.fsf@yhuang6-desk2.ccr.corp.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pCVTpDHM_UXuDxu=20o_NJ0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pCVTpDHM_UXuDxu=20o_NJ0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ying,

On Wed, 11 Sep 2024 09:06:53 +0800 "Huang, Ying" <ying.huang@intel.com> wro=
te:
>
> Can you use the patch above as part of merged conflict resolving patch
> for patch
>=20
> e2941fe697c8 ("resource, kunit: add test case for region_intersects()")

I will apply your patch to the merge of the mm tree from tomorrow (and
I have sneaked it in today in another, later merge).

--=20
Cheers,
Stephen Rothwell

--Sig_/pCVTpDHM_UXuDxu=20o_NJ0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhAVgACgkQAVBC80lX
0Gya5Af/Zm3VVnSH6NE40nxILGR19NQa9WYIxvo9guhbbzQKY1QnShkqDltXqPje
daEo05M+IceqPz8y5jEiw0ueNMGD2ra8qwTog/JcrM1skKmhrkINcjdgVlpACbeQ
wspWJgac9e4T8vadjos4ICoqJRVzqo6DNyaEZnXm9qUQpQImDKBhGkgU1vZP24Pl
A2y0mii65XWAAwh0Rj8jxLgkpVJ7VnrsFRQPn3wIu3MVaGclgZJbVfyHWODrZhNr
uSL3Foq3rQdQrkLqtt3OprKtQVj9F0exDan3oingoBhjDOFZGuymI26Dxhn07BOn
mTmitAgwM9mYV49i3lKkkcwcvdiGVA==
=yyyi
-----END PGP SIGNATURE-----

--Sig_/pCVTpDHM_UXuDxu=20o_NJ0--
