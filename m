Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828509;
	b=M7Ai8JZMwBwYN0m41TUja9oP+b1IR8Wci9UHFdf3J8kE7AkzW0LxyNZZQVcpKazPDIFV
	 YBv8TjElyjZ/rTjW74p+C6w+La+TzIi9j5qes0PA30+H6j2eJxM0bUR0UYh0z4UuX5wul
	 plUf859iPhzXHhg8WfDPHLoB6jtL/DwUz+jgudSky6WxUzUn3z3J+iIkG8sVLLXs93Jth
	 fBs63ITz3QETsc8wu1KASQhWIxzWUHQWv5wMty/jIoY0AgGNHgsy1HXPrd47FBjwXNnVV
	 sfLpnGJigCo9FsL4nXFgJ0O0LCZIMD0u2rMI4gqIRjyHovLCXx6sSQIBDmVtR4e1dIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
	b=y8CTcgtX5ohfS6DPwDQhgkNCoF9hRp/7BDb25jPutlFVlbee0zP67JS0+nlJDnv7zt4w
	 UnnDlimjQ2yFZFnu14Mzzp2JnYKb0zWUXCwUGqzdHmSLxMCp/9LZLLp0ZMpwafZhbnTjx
	 WJgFPlqFdNP13D3fBwh215GKjIP8NA88N3fE1aee2rj0lIdKiamhHOXRmUlrtNK3q2P9P
	 eh/owu3S79ciNac5mJnhEgTYFic+v44Z6ZV46wOnvPOtkeK9zdEiu0IjzvCfSPV5U0AAI
	 NCbqYzyQziHBfacTdQRIS700NUrYTY+NrDHDHbV9Kf53jqJtUYEGUOkpEndQKBzvzlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OYFEy+Tj;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BA1606A795
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 11:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BA1606A795
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=OYFEy+Tj
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so7457275e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 03:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794828506; x=1795433306; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
        b=OYFEy+TjftV22w39sQRkfs2vLcUIS/5nyrLBuqWYUCHMJtxH5wU6H/7f+wREK600J4
         th0jiv1oiFVRJyKpknmpEoztwJd9uC2xHS8KU2xx7EF03cZvqb9gRIA3Ss8yTfQ6zykm
         oK4nXZG5VKxU94CxCtd/6WzhDh+Pf0oN3LqH7GE+v48MvPf5dgZP3agX7iSZ6V4alLpO
         7joDx54InZlfuiNlZ7tNiqVWRV3TermKpQVjQGgD7pe/guujH4AJO2h96P60+wLNQMj2
         C4tgvaqggrGhVk3ztdq4I4ybH87HkJji9P0dv9qIjJ8/gRYiyULaTiHRsG3iCLL93uqq
         qHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828506; x=1795433306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0JL4wR1lGs+QPvkNjJXfpba0XDMYzbIwMDG29YMLDPQ=;
        b=xhjDD0lVwfmN+J3IVeibHvcwA5Xgq5zdor0sftM4vajucl6oT174tvktI4+f0UniZg
         3lpschdPb3K+hoM6Heo4OrHXMCXvklhYEVGc7ldMpUWBD+QoCt+YzQNq1PzAaumZdjUm
         EEpQcbk4TM2/XGrVcCKatNPFE3drrXJ9K38N4pj93oXmKk8sQNAEqIRROycQQ1lfTI+O
         O6OZ/04dir7HtZsdknvmwOCdIpsccwlDb8DJUpwYrW+kO7Eged9vqs1z5SggcmfiNlG6
         o2UmhnHoFYVI1CKk3Y7gaBHhuQfK4toZRiuVukaXmVRdNOscTBd2KwOJinJs2DbsY9J0
         5rOA==
X-Forwarded-Encrypted: i=1; AL+hErHC/We2sPOFkySiTQaoHn31y7V/VmrkV2VO6CofT8ekygwpgXoWVlDa/ZiW82hZZ608pi/7urpL/NLW9O63@lists.linux.dev
X-Gm-Message-State: APuU4Z8MKfWCSXT7Mp9N18PabGoV4oyQt43/cjUC/hBuN/Msq1vDzOV2
	biEhDT5YJmc2LRDVsUCsCm8Yyumxx9cMlLXg3L4L++V7QqE1zlgJMT9Tzk4qYfhN0Yw=
X-Gm-Gg: AYBFou3QPZjq2tHeTS6J+ElrNqCQ5RTRfDsliiU2qKeV7p6ZID8duCk2rMd41yc4kgQ
	018rspuYLkUvc4qwDdFzlM7w8lc615kvhC6bQ1ETvGDmfBp18CjFuLo+GmTbZJinnkS3vrK8Ohz
	LENqE0suMZlYbaHg22DECJUKjZZNqPTBR7iEAVtqDRiM/b1q6yd4aoBBz71xRpIY6zJH1JwRH1q
	882O1oJNiI4kYPpzZlGF49yQOhGYQQU/pgP+YIgLL9y+yBsAQ9aqOUn9CdYJelZB9ouDz8OoOt7
	3KhYWrI/8tKTN5esJwysIPb41pLVkygiq91NrU1ODTINNpS+AAA79gnZC1IPRLC/vZLiTtKEfQV
	cVlcLSXRI/F0hlmDT69QmSC+UzgK+V4sNTUTqyIXc0yn3nDfcEB+K0Iawak88zoDYSK6QxdsqTH
	GGbUlgOf12nBEWxq8Lauy3FrSoxRuLzMW1HGftlJOCwuk7d3uSX6mKD7GSUYCyVHuvDzyx20OIj
	HFufXDTMbxEUSbqErpv18gRK5MPM/vSAOrnlaHen8U5PadC0OT9UV/nZlgVOsO71BnEDMSFee7L
	o7ephxiNAb4AfDsPN6SSQE69FoNTsQ3NoyZ+gBUULaNNSZ81AiuHwBvRlCFLVu+sAzwF0dSobrd
	4umkLdPqc7sGwjb64+Q==
X-Received: by 2002:a05:600d:2:b0:4ba:761:c0c5 with SMTP id 5b1f17b1804b1-4bb55a581e6mr164572525e9.5.1794828506130;
        Mon, 16 Nov 2026 03:28:26 -0800 (PST)
Received: from localhost (p200300f65f19a9042c263c0c153a4e28.dip0.t-ipconnect.de. [2003:f6:5f19:a904:2c26:3c0c:153a:4e28])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49d673ce75fsm15469466f8f.55.2026.11.16.03.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:28:25 -0800 (PST)
Date: Mon, 16 Nov 2026 12:28:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>
Subject: Re: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
Message-ID: <avroMXSm8hiG1W4N@monoceros>
References: <202611160947.NOrZmI1p-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5folxt6ljtu6yeis"
Content-Disposition: inline
In-Reply-To: <202611160947.NOrZmI1p-lkp@intel.com>


--5folxt6ljtu6yeis
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-next:master 3784/7428]
 include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds.h'
 file not found
MIME-Version: 1.0

On Mon, Nov 16, 2026 at 09:45:42AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   84abb955b1015477aa11a96e2f3ac1b938b77f48
> commit: cdfdbc11552b99dbc5c45c55f62a76527ffcc73d [3784/7428] Move struct =
cpu_feature to <linux/cpufeature.h>
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/2026=
1116/202611160947.NOrZmI1p-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c=
a14e3d05c4e63d6e8103945c86b958ed2f55d5f)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261116/202611160947.NOrZmI1p-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611160947.NOrZmI1p-lkp=
@intel.com/
>=20
> Note: the linux-next/master HEAD 84abb955b1015477aa11a96e2f3ac1b938b77f48=
 builds fine.
>       It may have been fixed somewhere.
>=20
> All errors (new ones prefixed by >>):
>=20
>    In file included from scripts/mod/devicetable-offsets.c:3:
>    In file included from include/linux/cpufeature.h:30:
>    In file included from arch/loongarch/include/asm/cpufeature.h:13:
>    In file included from arch/loongarch/include/asm/elf.h:9:
>    In file included from include/linux/fs.h:5:
>    In file included from include/linux/fs/super.h:5:
>    In file included from include/linux/fs/super_types.h:7:
>    In file included from include/linux/list_lru.h:14:
>    In file included from include/linux/xarray.h:16:
>    In file included from include/linux/gfp.h:7:
>    In file included from include/linux/mmzone.h:20:
> >> include/linux/page-flags-layout.h:6:10: fatal error: 'generated/bounds=
=2Eh' file not found
>        6 | #include <generated/bounds.h>
>          |          ^~~~~~~~~~~~~~~~~~~~
>    1 error generated.

This is the issue that Sasha Levin already reported and fixed in the
thread about cdfdbc11552b99dbc5c45c55f62a76527ffcc73d, see
https://lore.kernel.org/all/f610c07f39df15f3e7ebdc63bfcd759ca7a687a8.179423=
3316.git.sashal@kernel.org/.
Nicolas claimed to have applied it already.

Best regards
Uwe

--5folxt6ljtu6yeis
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr66NYACgkQj4D7WH0S
/k4pswf/RmI//KlVDYKhdyuKWPtJ8WKGW/CM2ZYfKGXlld02zgqVsK+EA/ksXDlw
gd6BggceGEfqs9InvoyIG7ZapDAmELpajI50WK5No3w0J3zbpkx7iMC8jZPjQjxH
rgoYPYv+RpJlHqMv46xf5nMqImnlCTftBX8dJZIiI5DrvOSYtRiu20rEJwb8uo42
IvgRCeQF/0Pm0cNz0o+JiCXI+LvnRpiQ1FtNGP/cPTG/68K9l0pZzwhar7XzNqON
SjdZeRAIp3RZxloqoFWDUcOB/nxokRYA4bIDVgV2CDtCZJ50ZsndddwVuzcD898P
9ioX7+hQ8XdCT3MKDynkU4Zi4Rg50g==
=TLBX
-----END PGP SIGNATURE-----

--5folxt6ljtu6yeis--
