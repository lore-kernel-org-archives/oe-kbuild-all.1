Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD121D5A2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742204077; cv=none; b=dfvYUPHgKgg1FPIHuc2r0x1VN1hLYnUoCOf7h2dN7MB4fN3dvUxWsVuRbXN+6SqjrD4iAtWinbGmcYPqlT4FiU3XvaiS0OT2/9NkKXEekZgkqr5/1L873ZhUfre+X+bYVHSgLbuFju/Vw38sOd975HrVsi8ybi80CTrynHoqP4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742204077; c=relaxed/simple;
	bh=7ExRGdoayiO2wD5UHPKkymtNxDaHGVYdjMZMnRp/HtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2VOrUlKPeU7HsHZvYgEJW3RZVc5rWhIq7xbaAfVMCb8v/VvPcOmYwcwK1GdHOLQU5ZeJbkh244D9UAzs/39bc+2zxAjJGn5Nri2X0wYf+W3r8Vn+5vUK1kH4czRw1dY2gQ65WqWDjrHnHc/88V44F2kinl3cKzRSHKV3UAn7Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nvr0LFos; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nvr0LFos"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B00EC4CEE3;
	Mon, 17 Mar 2025 09:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742204077;
	bh=7ExRGdoayiO2wD5UHPKkymtNxDaHGVYdjMZMnRp/HtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nvr0LFos4x3E5WgQCGEaqq8jkrbzZEo8ouIDhrDgIR3hSkiGrrpcz4KvX9R+WSvLF
	 QJWQLN3Ao7jM501ypz1j2Q/SZ+jCJS+uroCzwJLE1vQhxYHi2YwF9sCzbRou+IMQys
	 hvn2FYx7MANC1qbM1YwsQcYDXQ1VsLk1LnChptFBDg0x1el58+NlC4hV9BJSypxUSI
	 dJDbYq79Sov3CmNDhELv/NbTWntoU5fRdskHETJCoChIIReXl9lZsneyqTHyxyQZN/
	 X3IFXp8PWOc25w8sivR4sScVTxWPADurFekHjAfR00V43ZMo3C5UBu1Vr69yWoWe0h
	 BOB+5ylbDO3BQ==
Date: Mon, 17 Mar 2025 09:34:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros
 113/194] sound/soc/codecs/cs35l56.c:949:12: warning:
 'cs35l56_runtime_resume_i2c_spi' defined but not used
Message-ID: <f9c818ef-eca7-4e83-b74d-5d32074c1bbd@sirena.org.uk>
References: <202503171139.HSG8dCAn-lkp@intel.com>
 <87h63sf6h3.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K5fmPVYrEohBNl4Z"
Content-Disposition: inline
In-Reply-To: <87h63sf6h3.wl-tiwai@suse.de>
X-Cookie: I know how to do SPECIAL EFFECTS!!


--K5fmPVYrEohBNl4Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2025 at 08:42:48AM +0100, Takashi Iwai wrote:

> > >> sound/soc/codecs/cs35l56.c:949:12: warning: 'cs35l56_runtime_resume_i2c_spi' defined but not used [-Wunused-function]
> >      949 | static int cs35l56_runtime_resume_i2c_spi(struct device *dev)
> >          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >> sound/soc/codecs/cs35l56.c:942:12: warning: 'cs35l56_runtime_suspend_i2c_spi' defined but not used [-Wunused-function]
> >      942 | static int cs35l56_runtime_suspend_i2c_spi(struct device *dev)
> >          |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

> Those are conditionally exported symbols and I overlooked that
> CONFIG_SND_SOC_CS35L56_SDW may still enable CONFIG_SND_SOC_CS35L56
> without i2c/spi.  So please drop the patch
>   [PATCH 08/89] ASoC: cs35l56: Convert to RUNTIME_PM_OPS()

> Should I resubmit the series together with the typo corrections?

Ugh, actually this one is so early you may as well resubmit the entire
series :(

--K5fmPVYrEohBNl4Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfX7KgACgkQJNaLcl1U
h9C7Gwf/W+nqSUKT3LifxU/uJo7Wdd1d6eLAzKP949PJ85MIa6XJsCFkw0oV+AjO
JtzuvUETFR/MNXaj3hd7tuy4e5j9mvnr/QpBRtQLMKo4U5HnUJr14IniafvNZCNm
hjpYjDSOL1JSLCH9zLaWzQHmNVg73fzxhXERxR+/TRnMuqJ9Z1DT1K0QAO27bNj7
+BPv6NhYY8JhPrakjQbf0YSVR+RsRGxRNYfVAYn9S8Tt/964wy4T64bIRFLM6QB4
nE5BVQRU3ejX9S5nLiGsIAIO7sxPXzLNNOlmp4cbJPBBXAHPgA26eKxqVMn0+9b/
0uTMfuCjjgcEXmqVi+54kZoIL9bZ/A==
=mWPd
-----END PGP SIGNATURE-----

--K5fmPVYrEohBNl4Z--
