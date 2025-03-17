Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041AC8634E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Mar 2025 08:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200980; cv=none; b=Pcu0nG/y8VbFQodSt3uMO9ctGg2oQJjCVXGt/o3PaUaoP2jbW18eL5Zn/YuHyppYeZJY27QjareH6wZnW7Ezp6Y56qfeQvOl0KLJKnaSN9Ae8FgxLX3Fjka/p/yAvpMUqR7IqoASeVZ9rBfxPbJ/MTeLLg9YPYlsUrySUQoldo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200980; c=relaxed/simple;
	bh=aMsAmHQK6GSO5/BawEH9UKDLwoCUeZvRYFDIs4ArsE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUK2kZjBG0qdM1r4ecAbP+nORj4tIXlvoVBIbRZmVRf6L4E1iwVQziQh25wFJ6kE8X0NoUMZaf2SlQ/2Irm4X0KM633BnNVQkIngkaQAtI6sbTcqdwclom1u44R+0pS8XHNNetzc9gmOkBYRyDfytTRCKwhhzwD3kF+ZwMH9Q88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFClT0de; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFClT0de"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DAC6C4CEE3;
	Mon, 17 Mar 2025 08:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742200979;
	bh=aMsAmHQK6GSO5/BawEH9UKDLwoCUeZvRYFDIs4ArsE0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFClT0deVRJlFWC9G1es7G5VJKZldF37+7piiOHPppJ5LuS2cNaBa/ObvebaJYuWB
	 mHSuM7fY80iMvrZSQEE83Z9O+ssEBtlJpWmH9ZOEHK4C+ngNJGIFNMCQvVNIlggzpT
	 J7Uu3HtUkLnG1RXYXKLa0yBMgKuonWTyP45n3St9y/tNR65Zr9kwrFvO9jKvW7MZZ3
	 y/qRmHEE0QFJenPOdN79yAgFFsPJTDTZPc6FaldMxylVx2D5g4wP7Os2fUuyaNlZH2
	 1U0QzbanEcehCIlhASKl+YBtB6RfyEqTNlmOtV1Jq1Vc2WDmVBPKSlXURTAToF8FeF
	 InczQ0YKmknsw==
Date: Mon, 17 Mar 2025 08:42:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [broonie-ci:20250313_tiwai_asoc_convert_to_modern_pm_macros
 183/194] WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol
 sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
Message-ID: <a5353ff0-c906-42cf-a8e4-e5b6e62419d6@sirena.org.uk>
References: <202503171311.Y0CltFV2-lkp@intel.com>
 <87frjcf5z5.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hMIUpHiwhkqImRwf"
Content-Disposition: inline
In-Reply-To: <87frjcf5z5.wl-tiwai@suse.de>
X-Cookie: I know how to do SPECIAL EFFECTS!!


--hMIUpHiwhkqImRwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 17, 2025 at 08:53:34AM +0100, Takashi Iwai wrote:
> kernel test robot wrote:

> > >> WARNING: modpost: module snd-sof-acpi-intel-byt uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.
> > >> WARNING: modpost: module snd-sof-acpi-intel-bdw uses symbol sof_acpi_pm from namespace "SND_SOC_SOF_ACPI_DEV", but does not import it.

> My bad, I coded in an old way with a string for namespace in
> EXPORT_DEV_PM_OPS().  The namespace is no longer string.

> I believe I'll have to resubmit the fixed version.

No problem, please just send the affected patches (should be amd,
xtensa, tegra, sunxi, stm, sof and samsung) - everything else should be
fine, non need to repeat review and test for the rest.

--hMIUpHiwhkqImRwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfX4I4ACgkQJNaLcl1U
h9Dwkgf/V8z1inON+XESlKrS+62pZklOCYQXeHCGkumDnMCN7zicYBSnQkS0jx2O
Vyo/3JcHqzEDL6xm9P4vGUcnrSU250lmlskViAfNA5ZR05ztvt+Ge3W7t6BlA0rK
n+TuBBbNmxEtWR38k5DvsyyxgKsRc8RrWNdwEwDmOmy9QbBcyXtl1Zg7I0v32SUF
zdcsANde8EvPOu5yBwbMi8V8zpJdIg0qbnln8cIeQ55lahQ4IevdHdKRtGe5rbUf
eiabhdqZExpodpWNI4EesfuqGt4hw8uRoZ+hzNS1JZb9J+BlK8PiP3v1NLssaZJc
Vi6F0ueoaP0we3Tg6XSifjnrvWC/bw==
=uKhn
-----END PGP SIGNATURE-----

--hMIUpHiwhkqImRwf--
