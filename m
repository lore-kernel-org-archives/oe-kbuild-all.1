Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE30238C11
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Jun 2025 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748806517; cv=none; b=QNCOkFMdps012NcdYXGutl0KbxvpB+j8mEPfvHn/negNbE93StTcEBU+tRhu6UnpM2eZd7JsnI8xEhswD6lZYv/xe6AubjRwBFOqXAeIJStOChU1l0rf6g455BlD7fAC6mK8UmzA0x1SA5+Bp8phMN2JCKS8RgVmTOk35xTrA9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748806517; c=relaxed/simple;
	bh=WVoaEROUAHJAYbz2btjGZGoziyN8q/E3OUK90hq8QWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5nvysp7HWHBpEtbJyyYR5ttX94oqC85BAPRLo+aypqcivjh2Cs3bsO/v6OfDu8P+wBz2qAAEDOgQzcD0FY4O5zeDXCOh79AuNOHzKmr1j7pRPXGSWjorZ6WJjeAy49LaXpY3VhL41eb/XO80ltgnpMLAowBlZnOCCeYNbj9P0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Y3cYvrOe; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Y3cYvrOe"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acb5ec407b1so599596166b.1
        for <oe-kbuild-all@lists.linux.dev>; Sun, 01 Jun 2025 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748806511; x=1749411311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ/NxMx4TNmqLFdTtur9WVJ6g3FpZTsUsegECdU0e8A=;
        b=Y3cYvrOelzac06BfC63WS6N7K1U6Wjr7ErWlhN6/yRfDQW5Z09qlrcjAGZEkUWrI5Q
         +SJGwPOWwheajbwEZJt5RWKckJTABmHaR2M6LmymBlFro1gpps1sem+qGDzW2uOU737n
         D0xDR5Hg9quKjiIkLK+ajmojhaGBJo/IsyeCWkPe7AB67Rd0c2rgfjxGbpu1a4Jkpg/u
         /6NE6qXGdYfhenIOhUfVuS0cfSMX10O6JEQpZLZVQAzv9OVRtvOyFsC/pjgCfcxntcWk
         c0wvx1z3NvIqSTFw4IiscniazLmhaVszCdqsP16T0W3+2rj2dnv9FNpSJKUp9PCRZ8df
         w5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748806511; x=1749411311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ/NxMx4TNmqLFdTtur9WVJ6g3FpZTsUsegECdU0e8A=;
        b=vlcYUmZm4CuYSMiVRihkQoXUheWUAa6YfuaGFcRePLAD8gZacvoaW127BJNlkPK0zO
         siU2nJnp5CNn86pS5fQsw7Iq7AzFFAHwMsN2rEk5j0iHoT9ckqX175VodMqs/ONjNV8/
         LDBLTVPbckPK2mAXM23Nkqk0rQS0Ozfdth1l/IvDfmlxhQyhhqbp1yeUH68wndsAUKac
         0c2xFTH2+KWlw/qt6yI6S8uQOtfeGhZb1sNEoYjBMOERrbhdim8gjCPWhkjYt9sOKPzN
         azVTTLObF3RkFHwGzzQAzpXQ+y3LSTQwm66nOokmKRACZznl7YmtMz9U9OFLs63v2RiP
         UeYQ==
X-Gm-Message-State: AOJu0Yz95cwAmAPMv1ckjkUrmiFSF8EtM1yElP5AzBNK7kZabgrJPVM4
	S9xT70cv6LdZqQ7gaTj1ipFj9356rL0NLlXruZCJ+e3Rl4oPyFmcmVDM//KD2TRbkgU=
X-Gm-Gg: ASbGnctyjsrWQwA1dyVmRIyrn3OWoJqQVc07BS2+aipJY5TqjYMLKgg0v7LaAOS93IS
	FHp0+ophAUNTGU0UvA3cdH9NuyRHF6nO3hv/fNI8q+I1u9hB0PspzmTMxc4em1bECNonM0BgDJp
	YyPdZeLG40t29RrlQf+eOfuBDpPDkZfFrswbBTMP7+ZbU9DsO7pfIKT82MEQ+yIN99H0a4JC0WX
	W9hdRd3Hr+RLFPDEHudfAHOFJPTo/eEptTTZH5mklxOxJzbHR+JXoG8glHh8+hFWT6+cvqbuXG2
	5eUy+cZmK4YSgWZJ+3nNQ5lxm8OlTxWQHh6Xrg+wk+rsc/PXH+/vPIHm
X-Google-Smtp-Source: AGHT+IGQs05kGUEBGWFs5c8PJDP4R0arLxPOoywNzR4Wo0eKwTqynH3blLsUMWCMJMPg3uA3WJ/nSg==
X-Received: by 2002:a17:906:6a1d:b0:ad9:adc3:20d4 with SMTP id a640c23a62f3a-adb36b230b5mr1012114666b.4.1748806510897;
        Sun, 01 Jun 2025 12:35:10 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ada5d84f2easm680151966b.84.2025.06.01.12.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 12:35:10 -0700 (PDT)
Date: Sun, 1 Jun 2025 21:35:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [linux-next:master 856/13944]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff111000
 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <q24t2n5nr3d4euofwri6ykssgyvd3qomrwja7rrk6fwfv7j46o@vevfmfvq5sbi>
References: <202506010242.qKzuFlI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f7fkaepzcgtaa4em"
Content-Disposition: inline
In-Reply-To: <202506010242.qKzuFlI0-lkp@intel.com>


--f7fkaepzcgtaa4em
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-next:master 856/13944]
 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff111000
 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
MIME-Version: 1.0

Hello,

On Sun, Jun 01, 2025 at 02:21:56AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
> commit: 144616a8088974477480ddf736897f5cacc4c0c7 [856/13944] ARM: dts: so=
cfpga: Add basic support for Terrasic's de10-nano
> config: arm-randconfig-051-20250529 (https://download.01.org/0day-ci/arch=
ive/20250601/202506010242.qKzuFlI0-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> dtschema version: 2025.3.dev27+g32749b3
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250601/202506010242.qKzuFlI0-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506010242.qKzuFlI0-lkp=
@intel.com/
>=20
> dtcheck warnings: (new ones prefixed by >>)
>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:90.20-96.5: Warning (simp=
le_bus_reg): /soc/base_fpga_region: missing or empty reg/ranges property
>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:563.40-567.5: Warning (si=
mple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property
>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:714.18-732.5: Warning (si=
mple_bus_reg): /soc/eccmgr: missing or empty reg/ranges property
>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:823.13-827.5: Warning (si=
mple_bus_reg): /soc/sdramedac: missing or empty reg/ranges property
>    arch/arm/boot/dts/intel/socfpga/socfpga.dtsi:934.19-938.5: Warning (si=
mple_bus_reg): /soc/usbphy: missing or empty reg/ranges property
> >> arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dtb: pmu@ff1=
11000 (arm,cortex-a9-pmu): 'reg' does not match any of the regexes: '^pinct=
rl-[0-9]+$'
>    	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#

Just for the record: I didn't reverify, but when I created the patch all
the new warnings were just triggered by the line

	#include "socfpga_cyclone5.dtsi"

in the new dts file. So while these warnings are new since the blamed
commit, it's not this commit's author's fault that they happen.

Best regards
Uwe

--f7fkaepzcgtaa4em
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg8q2gACgkQj4D7WH0S
/k6fIgf+JAHey4CJIYaXsZdE9zpHLCXt44s1oMex6ZNkGcsbx5mtxdR8/gNkpfyO
uNx4kVhuwcP7SA+8Dzvj/AxKIrbJndfR9mZpeEXdO0z/kKAQGCxaVD4a9h4fRZJ3
YKM/Tho3O3hNn/QETKaEnZVgAuB/9Pexj2gYsS+7pBxjY5so2mdAgQ5d08RcwAit
huT0Euj7ucyMFq+UE1NV//4izkD3rDhXUQ07cA5pHXyKIC913UcfEpbA+0L/fWeH
Ibz6NaCwdrX0zYDAAAY2+jXmqYU9Uj9keX3KtGrH6+tTWqyEQTPVho0HAHE9LXGy
w38hcwnNdUTcp4nRZnTBcw2HN7CkeA==
=9voE
-----END PGP SIGNATURE-----

--f7fkaepzcgtaa4em--
