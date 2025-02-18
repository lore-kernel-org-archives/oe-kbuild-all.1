Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4571EB5D3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908429; cv=none; b=kh2lVbaGNr2NUpzR4fC0CNaPriSoqWCwcIJzg+s0Lwbl9bm47LTfGxIBN3cMtO9uiSaBScZHBQftI3V2uIYhMExLSc9kTm9bYOMJM8UH8OpIY+E3Qr65tnvkz/Nj9e1ELsYlOArtV7P3sLsHV5F8W8geKYm53xztOHAk9QNiTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908429; c=relaxed/simple;
	bh=etJYd6VC24ah8kdBhkG4rqY+vIZaUIDWL/AZdFtvCOo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IH5lV3W0Skx6Mw/W8I5h/oJnWCxyvEthaBsAbiYQa2Fl6p4va+2mHpEMdD+1Bl5yOYPDMYZSdk64zcWRs2qVYlNDTFRNk17ME2WR0+9cAYeb/Lz0hf2BdgYZZSz1Hh4g1gqaPc0SRkNiwvWIG/fDwf9WWTZaWpqc11KYkwfsOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKkWQQiU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKkWQQiU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so41190915e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 11:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739908426; x=1740513226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYMHtedu2RkDcedr/ZB86DaCSOrnLAFrvmqyAZWKjac=;
        b=hKkWQQiUwHXVVzV1g8se7dXPPdzRoVEFi3U7aPTG02E9EXm2VAx0tvGZDiPMKHw/ng
         Znm3Qzt79UqvE0a1HOBgEM6ukuWAw36R0+NQSSfK5C9S8T4VW8JYMEShZlvDFCRe9pqx
         iuc7h7cpidb6g+BwntL/sYczYg6M/xwYlI4WgoNOVvHKYAatVoVxygdzeJEg/Lzy+1zu
         Cm7IRZM8udOXVc3tdexe+2ZuiEgoXs7xFsEgVgDy1fpknSEj+ZgBixI+dQzrzayBTOCC
         aNlhJWBSpcJRmYHCcT0V7v582kVz4wkwhouAjWx2aguubAnKKckyOMPqgKmeqd+b9wpa
         chyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739908426; x=1740513226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYMHtedu2RkDcedr/ZB86DaCSOrnLAFrvmqyAZWKjac=;
        b=NuhRoYP3QOQa7hFjXekZlYLOR9+o8QET3EvzA+7tpncM0hDeITufuVOVdf+POl0VdO
         nZL+YxDItIozTx5jGpj8nQ07oEotJ+xtXwrqdiCB253s/Hl6ryPIHaPFSATdGSW7n4gb
         U+a8u3yCm5hT+MK/9q0b3W/iEcOu9rSmltcvNuL3dOKjK8QRkAv7kcTpiMRAywS2usCV
         lMOix5H5SYD4Am4T8CxY9TJ1GS2dmLMXlgFlsNag76hHLva+EmSsBkmRYay2R63Chdhf
         0CkgSIdnfte1XVqClz+U3C4+4SxYJQVSdR41rwXlPIIhDdiETj3Jf0AoNtKB25wEQE06
         vEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/4Si1JKxK33jsidgZXVY0sXU0kT/laJr+rCryDxxN1iDEu1qj+CE50C55bo/Il//MQ9dsiO1DK7j0xH95@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi1xO1L0zoEOia0nhSkD/Tu1+QMM2tSk/ZZodldRJ9El9rJ0Go
	ub9JPZ1YkIBI1YacLx0jx1P/cXxd0vnsqaP3WuftUwYb6ywFYFAl
X-Gm-Gg: ASbGncuVlkoRhocmP3k/EAlbK0IhmoGDINPbxx3Z7XTBBOgDD+8JG1L+xWMsgPH7Jge
	xCsRXTNpfhXa019bDEJ7j7j4HAdk8KCyAZGCmHf16doyRdeeNVNOTdwI/auUtcg14BCUWUY8mwK
	8qU52pXMFgRNInq9GWLM+oUHn+QTxsbWSKvV8lEPg82A8I3w+lYHI8PJr7jMkWkWoI3bUq2oft3
	Xmizh5vfHVunIsujf0YJC8zpSTUVdpp5qP/LpHta5s2PnXY6V5SaQXJc5KZIGplKe9DSWdiG5O+
	My0I2e8EEcD0s7iWD9uQhfOhY30aikQPhdc9Hhe7CwMnsjJ5eEDDaQ==
X-Google-Smtp-Source: AGHT+IEVzhGLDFw0m2CxrU8xE0NL3g5D882Hv0CJvkZ5WneGTfQV7aWsK7afVUQ8OMm7xDV09B8LJA==
X-Received: by 2002:a05:600c:3548:b0:439:8e95:795b with SMTP id 5b1f17b1804b1-4398e957b86mr60901585e9.31.1739908425796;
        Tue, 18 Feb 2025 11:53:45 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5f4fsm15885782f8f.78.2025.02.18.11.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:53:45 -0800 (PST)
Date: Tue, 18 Feb 2025 19:53:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Christoph Hellwig <hch@lst.de>, kernel test robot <lkp@intel.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Carlos
 Maiolino <cem@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-riscv@lists.infradead.org
Subject: Re: fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x'
 is never less than zero.
Message-ID: <20250218195343.10fa6eb9@pumpkin>
In-Reply-To: <a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
References: <202502171326.j4Xd3I0j-lkp@intel.com>
	<20250217092445.GA29568@lst.de>
	<a14347d2-6189-49bc-a1cc-e5959e76e6c2@ghiti.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Feb 2025 13:06:49 +0100
Alexandre Ghiti <alex@ghiti.fr> wrote:

> Hi Christoph,
>=20
> On 17/02/2025 10:24, Christoph Hellwig wrote:
> > On Mon, Feb 17, 2025 at 01:53:08PM +0800, kernel test robot wrote: =20
> >> New smatch warnings:
> >> fs/xfs/xfs_buf.c:1534 xfs_buf_submit_bio() warn: unsigned '_x' is neve=
r less than zero. =20
> > Looks like this is an issue in the riscv virt_to_page implementation
> > which also shows up in various other places.  Any chance this could get
> > fixed in the riscv code? =20
>=20
>=20
> To me, the only test that could give rise to this warning is the last=20
> part of:
>=20
> #define is_linear_mapping(x) \
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((x) >=3D PAGE_OFFSET && (!IS=
_ENABLED(CONFIG_64BIT) || (x) < PAGE_OFFSET + KERN_VIRT_SIZE))
>=20
> But given that the config is a 32-bit config, it should not be evaluated=
=20
> at all.
>=20
> Could that be a false-positive and then an issue in smatch?

It's not managing to try to build when:
#define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
is zero?

I think that is supposed to be (near) the user-kernel boundary.
So probably 0x80000000 or 0xc0000000.
(or 0xe0000000 for some old sparc32)

	David
