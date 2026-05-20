Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BBC3AB292;
	Wed, 20 May 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269516; cv=none; b=dIF6GbpdjCDMbL9refuCtWLKCgrb6/pfhXqJDZTG3+Jn5BYwPDL82JGliowu3IGphLgYFiWNTjlyvBfYUwkp7yVOYskEOj/k0o6nUcfKWKmNgb5x8oZfBTU7HrJ6sqcZdGhs95O5HIKYo5Pso7Zp7pVz1CztbPJLf/Mjxjl8GGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269516; c=relaxed/simple;
	bh=fKb9frlIlLFBchjvScymyb4+8F1UgHnbaUCNGeyil14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J67ym0rWACTDWJZhThNEoFuaE24n/azNiSU6rGTcKeWPQbA7GFfwUZzqRlwyTwiYV/t6SK8Bvcdag2BtFayKKaIWGpWw1mgYgRwLA1Lqf7p7oLz4jYTudtVtCmW16ZNeNVD1xRQi9alDgAHznl+S80VixrthcJ07M7zJ8ySvW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xcx9Y7Pv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xcx9Y7Pv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D954B1F000E9;
	Wed, 20 May 2026 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779269505;
	bh=fKb9frlIlLFBchjvScymyb4+8F1UgHnbaUCNGeyil14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xcx9Y7Pv9GZq7/wF8n0his4tsjxjcRfMpUBFMy5wicPDI252gJPxKMLJTd/BqpFz4
	 y5hfFvUrE0/SvwigUohqbvLzJ0qPobRo1WMJpZcK24nQThc23TeWLUCaEiHzb/z5ui
	 HtyCHmw1UNSZTBJEZzLb3DrRptG3BnDY8YcI7Iw01n1HyBM/Ek9IrVfcloRQXyuJy6
	 EFTVumDtw/rEDEroI0k2pyjGfhGUugINOh22O4kTCK2kpZIWNFPointHkDf0SA9wl+
	 1BF1i+JOAUo1nqTfEYHg4Q40+qmPRxigev5dLR20WRTj4unkDmr03XsEN9Dlg0fteq
	 5YG/5qGlWQrFw==
Date: Wed, 20 May 2026 10:31:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] regmap-i2c: fix sparse warning in
 regmap_smbus_word_write_reg16
Message-ID: <e01ac9fc-088a-4d98-abfa-36ba0d72be7d@sirena.org.uk>
References: <202605161621.mY5zFh4D-lkp@intel.com>
 <20260519220557.1574954-1-nissampa@cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Q0/I5bpq9mR7obNG"
Content-Disposition: inline
In-Reply-To: <20260519220557.1574954-1-nissampa@cisco.com>
X-Cookie: Natural laws have no pity.


--Q0/I5bpq9mR7obNG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 19, 2026 at 03:05:57PM -0700, Nishanth Sampath Kumar wrote:
> i2c_smbus_write_word_data() expects a plain u16, but cpu_to_le16()
> returns __le16 (a sparse-restricted endian type), causing:

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--Q0/I5bpq9mR7obNG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNf3oACgkQJNaLcl1U
h9CAzwf+KSHvns/Q9WbY7K+h6KDX8+b1vw0E3exjcHk7tKCzB+R9j+wbKUaJWDLD
JQCffBqTMez1O9HtkWbojJx0A+XgE3/iPtF2IERg8yAv2CCz2t6H565KhmWPNFwP
+t/W/IbGQo6p3p5GCK6b96Mrmeq+WTjuBX79Aoq53pbrckbdm5KfVRCCydvIDJPS
+jPJziDgALED5SJlB75vKt2IBkUSdELlvBG9yeYCl8I8+W1C8GS9AT9kG5j8DoC9
yhZMAslfVfKs6o8Jh7tisldW7ms1Hu3PynzYM4K6vdwsHaT76LPqQMxSSdPaF6jJ
OoclBupPOoXf0952Ajl3Qb3wjjGuMA==
=HnOR
-----END PGP SIGNATURE-----

--Q0/I5bpq9mR7obNG--
