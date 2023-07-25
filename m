Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8F1F173
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 16:21:22 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5221f193817so4755475a12.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 09:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690302081; x=1690906881;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQ1JJZA4GThkoE4/Cz7k+1DGdmZ6yMPdgW7Euy20CH8=;
        b=sQfv/4QHTbos8bmSh9UYF56je+S99om+H2gKx8j9w48p/oT7R1J/GBwJ4g3ohtO0Cb
         BL22GzLzcxAT0jSnnQj3TDOTZ8IUsaFPLSJBl2GhiDx5fO4RTfKEDEWEII2afZQDOdaA
         8eDLhM+RHdcYcgC+KYjnbEofU+YlcDLz1mTGYPRoPD1Okjef4fI4BQBgH9w0dy/9YBGJ
         N7vItLiPFWb11w/6gYiUw1NTK9xkk5+F32JrxEsYpZAQTalbE6RGM+5c1AGx0C11sI4V
         h0IrdtIgJVPqD5eGtBUTWi4Po2N9s0P01wBFr0nz2FJAYUAicF9mJBKRU5jlFSu3st4L
         nGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690302081; x=1690906881;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TQ1JJZA4GThkoE4/Cz7k+1DGdmZ6yMPdgW7Euy20CH8=;
        b=WZLKGrvTEflqejH2KzFdeui6dguFLw5+SEeRq3G8iXa1SnMkySCpvxpjsRZDlXL+QY
         DU+TPQSXly/TuF54IKi4AF0238EURvpZLAkQXUV6iks9VLSISVW2L9x5YEYBiw8tcqcr
         GKDqozMdsALee3rK2uUTy0+AVbvvIoDfK3Hb7vHEaScIZc2uyOleTUSuWD2gcDc+XJOM
         PjlJZTI+zNvYfPsQwxbPgDYB7+OvknaiKim0xY1UlrI4dq24h5Y0mwVcWv4gLoKDKQZb
         o1YJik18LvsTNjng8gyTkE69Exz65Bu0D0DTZuTDjCWhdy2mKHw238EzPF/q8kiRzYx9
         A5cw==
X-Gm-Message-State: ABy/qLY5irdfNeKlygnNEi+Wgn7C6RAYUVMK9tU8A1aYxe/epYWFXiHs
	EBMCXsJb0yTVpMoGyKlEKIs=
X-Google-Smtp-Source: APBJJlGZpGERatKzh35+ALl5dKcKF22+g94KBwNl3+wfFYy+1bAOV/m2l0zgJ9OvCCflF1b9mYxfNw==
X-Received: by 2002:aa7:d3da:0:b0:522:214c:516 with SMTP id o26-20020aa7d3da000000b00522214c0516mr6324327edr.42.1690302080905;
        Tue, 25 Jul 2023 09:21:20 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d15-20020aa7ce0f000000b0052238bc70ccsm2319037edv.89.2023.07.25.09.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 09:21:20 -0700 (PDT)
Date: Tue, 25 Jul 2023 18:21:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: pwm-rz-mtu3.c:undefined reference to `clk_rate_exclusive_put'
Message-ID: <ZL_bEBGNb73wbpRF@orome>
References: <202307251752.vLfmmhYm-lkp@intel.com>
 <OS0PR01MB59220756AD4F8184ACF34B238603A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1nG26Lhuxqqc7sfI"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59220756AD4F8184ACF34B238603A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)


--1nG26Lhuxqqc7sfI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 25, 2023 at 01:51:38PM +0000, Biju Das wrote:
> Hi kernel test robot,
>=20
> I have fixed the original issue by adding dependency to COMMON_CLK.
>=20
> But I hit below error which related to m68k compiler/arch specific.
> Can you please fix this issue?
>=20
> /home/user/0day/gcc-12.3.0-nolibc/m68k-linux/bin/m68k-linux-ld: section .=
rodata VMA [00002000,009a758f] overlaps section .text VMA [00000400,012a08f=
f]
> make[2]: *** [../scripts/Makefile.vmlinux:35: vmlinux] Error 1
> make[2]: Target '__default' not remade because of errors.
> make[1]: *** [/builds/0/rzg2l-linux/Makefile:1250: vmlinux] Error 2
> make[1]: Target '__all' not remade because of errors.
> make[1]: Leaving directory '/builds/0/rzg2l-linux/build_dir'
> make: *** [Makefile:226: __sub-make] Error 2
> make: Target '__all' not remade because of errors.
>=20
> Note:
> You can reproduce this issue by
>=20
> diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
> index 6210babb0741..eeecf249f372 100644
> --- a/drivers/pwm/Kconfig
> +++ b/drivers/pwm/Kconfig
> @@ -506,6 +506,7 @@ config PWM_ROCKCHIP
>  config PWM_RZ_MTU3
>         tristate "Renesas RZ/G2L MTU3a PWM Timer support"
>         depends on RZ_MTU3 || COMPILE_TEST
> +       depends on COMMON_CLK

It probably doesn't change anything about the build issue, but I think a
slightly more correct dependency would be:

	depends on HAVE_CLK

Thierry

--1nG26Lhuxqqc7sfI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmS/9n8ACgkQ3SOs138+
s6HCahAAm4mljjEiowzQcfV+PM/gJkBoR+l8hkHZbHAPzUsBcORf6bSKHo1Tr6VE
mXH3lLdKHFjPj7YpHqpSG8uOlxKZk+Dy105VSHHWa6OTsca+qJETzdSLLqgcSMYI
m2XO2sHdp9Le9i4nn9Ss7NH52TTPm9dpHbr64mxLAHZ1ma0KfBQ+Yfs8/MSd7IyU
hzZl35dmLn+mLpVsVJQNaeSDS3ZosszmIi98bL/LhbQqwFOkgW1P2U9zRjUi5MYi
U9/Nv76haVw1JjLWpCJm6KcGZPq9IJD5D4MtEbCRi91qnQDmsApkqxu7RggHvvUe
CEpBQiCIwbnq8qFkwsykxvcwz2I3spgjbx16HscaJNAqjbqFrFgDDrAwIkeBZTCk
aDE0tVknn9B6IkVmMj7iByFlhLxwKi7jBXOuJgGqSPid1g59sqJXjM66XxePMT5+
uB9OPtFPAfr7jtzZ0uy7TDcTbG+p35yuj6XrwpfSsONygMkNWehqkoqIPY9KXUHb
V/Uhjvpp+qWJdjKMbSdUJZRYQvkH+2MHHOSdKfxaFK6wP1tJiqwlPrgGfuAQxMo/
aaw3AfvT+opFLU7BfLRIjcW4XoMzRfdWKqXs8U+ezqh2BkFccDY8uGjF86+imcqE
9fkGoMZIaDDAYgyj/akYUZ7lwKhCNsuJ0MhOyQZgMQoiyO9zoCQ=
=mdEU
-----END PGP SIGNATURE-----

--1nG26Lhuxqqc7sfI--
