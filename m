Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487E73597A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Jul 2025 20:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751921283; cv=none; b=tRnWtuEjjFqU8a8QnQA/ryI3+sHlnEInuqXQdCzWBOxRz066SAxGBQNkjnm/gZdzTskCGABJpO6drtfVcgzuocevED+wotKopWnVyGnT58NF13VJ8J3WKjeN3BDQ58KttnhWZ5w9LKjtubBPbfrMyK5+8/dta7DD5QXlRNOLKlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751921283; c=relaxed/simple;
	bh=xJVtwmc/iK6WqebKZ4qTtDS2Kdb9R2RwXSRmNLz/nOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=is770slEQuetpqD0VAjtXZ15efvb9LBfrqVJbeVSchGvop7kI30xeQovAiknCmlw/Lyr7kLCeM7zmsOEfOTeCS7b8t07aIHjDXd5zJMlQdbGRtwdz8RztLbLaUtLbazKSTRdENCsvFbv569bAaDV/bYX5VTgwP5mwLcswFDSDy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbfCzvH1; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbfCzvH1"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8986a25cbfso2724792276.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Jul 2025 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751921281; x=1752526081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTZfTlmBEIK7Q+Z0xK68TlVvd/e06jW2J6dQiNg6krg=;
        b=XbfCzvH1wxNyy3zq2gXn/akMWSasSWtZ8mFKb/9ZV2i3le1xFW4iZayyTTXXm2ioCv
         Q6w3Vi8SXOZVKYIhzvgYR3UYO5OpR4CtEnOV8fjCKIqS1ct1TL9FXDOPPF1QXJGYa/vP
         yK04Bjd1dIjSU32tpnphvo6enkbx8javmrUSwa7gI9xqtAMnjObW6nONQIA/Acon0YJs
         wjzrnJnjFV/IqoiTVLCZiXyuf9bsKCZXHhgACPfK6inFpUcTt41166OrpB0OABeHWzdZ
         LMrcqnd2AFRcBvoEZeW9nPHveUkXDoxCGf13mQBfYXzpk9SdberMPepXOQVIGHZuxKy4
         T8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751921281; x=1752526081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTZfTlmBEIK7Q+Z0xK68TlVvd/e06jW2J6dQiNg6krg=;
        b=LqrPxC90AY1u5ohP2nAb770aSJqbQF4jb+TgAvdMhKUUWz14eAU7ChzKo4QLKPhyq7
         KK8sMzt5Xb0TrYiQ7Fra0D/CNMJ9zCzVWAcBLFLm8OWs9DHRwe9BQyHx2EQ56kihPBNx
         dbiObyxMRGzwpng/Njm8LxOKoi4g+kn/efk1w3C+pc2p2x3WLt3rPFmjKVV5Z0EqB8/f
         wORD3G4fr5YAPVDendYhlsVEW76zOR09y0bzWcjRuDWQWX0JL4wLGWkBKhqjYGDNTykF
         gFHL2t2A80x4+zYlPjWfHQZU0zsqZAkxou+rT9/OPszHZmt9VPsq6UIyH4/5RQV9y5Ld
         gRFw==
X-Forwarded-Encrypted: i=1; AJvYcCVQqqDcFDckBp5IJPX0exA53JpK5JS5J1sCuEhthVfB65KejDgH57bPPqP9vT+IyQzwVc7zrPv44E2dB/Ai@lists.linux.dev
X-Gm-Message-State: AOJu0YyOXjDKac+OMu1n2gYuMQt52MwY8d7BbQX+MJNi756bxwZjvu9F
	5BHkHlvHl8LNPCK5aNE4m0Bj9JTTYLBy6CcGM7KuMij9t+Nocvl2Fj5T7HyhyJrZxz2q+alhAQd
	vWRpgOaRQlRaBEZPNhYLxafFjnAqY5fI=
X-Gm-Gg: ASbGncukX63Wmx6DeGoNzdyNgJE8UHRu0h1W2TPhT6TCv7KPgFSxPNjRdOvdy864lmu
	FVAwKLysPZ/F8U0HcaiXQv2ug+LudzCltC8sy20D4/8MpFkveF1a2CkPCgea1814kCJz8LamZrg
	m0zn4yqzHvhpUz+AMQYcq8xOZm0o4ZjnCSG8ZEhaMbyWCvb6soAHOf1ubvW2juwFflUUY=
X-Google-Smtp-Source: AGHT+IHWxLzF1XOgg0Mvh9rrnM+tU/Df1j+N31sIXa44sA1tQCOEDRPX9sKv0BiyOvyazV5xtA1UF0jHJJNPuiCbwdk=
X-Received: by 2002:a05:690c:f10:b0:70e:1771:c165 with SMTP id
 00721157ae682-71668d47310mr192088597b3.29.1751921281170; Mon, 07 Jul 2025
 13:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250707003918.21607-2-rosenp@gmail.com> <202507080426.3RX5BOHi-lkp@intel.com>
In-Reply-To: <202507080426.3RX5BOHi-lkp@intel.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 7 Jul 2025 13:47:49 -0700
X-Gm-Features: Ac12FXxnYnizo5pcZVLFOw4eNbzaqe2Xe-OqD4rjrt8Ta0IeWk0gI-_xVQvF8YI
Message-ID: <CAKxU2N83JjTG19_GD-9LPJfe=aY4tU+7dFjRhFqGeLDn6beGKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
To: kernel test robot <lkp@intel.com>
Cc: netdev@vger.kernel.org, Paul Gazzillo <paul@pgazz.com>, 
	Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 1:25=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Rosen,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net/main]
> [also build test WARNING on net-next/main linus/master horms-ipvs/master =
v6.16-rc5 next-20250704]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/net-ds=
a-rzn1_a5psw-add-COMPILE_TEST/20250707-130922
> base:   net/main
> patch link:    https://lore.kernel.org/r/20250707003918.21607-2-rosenp%40=
gmail.com
> patch subject: [PATCH 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
> config: alpha-kismet-CONFIG_PCS_RZN1_MIIC-CONFIG_NET_DSA_RZN1_A5PSW-0-0 (=
https://download.01.org/0day-ci/archive/20250708/202507080426.3RX5BOHi-lkp@=
intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20250708/202507080426=
.3RX5BOHi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507080426.3RX5BOHi-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC =
when selected by NET_DSA_RZN1_A5PSW
>    WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>      Depends on [n]: NETDEVICES [=3Dy] && OF [=3Dn] && (ARCH_RZN1 [=3Dn] =
|| COMPILE_TEST [=3Dy])
>      Selected by [y]:
>      - NET_DSA_RZN1_A5PSW [=3Dy] && NETDEVICES [=3Dy] && NET_DSA [=3Dy] &=
& (OF [=3Dn] && ARCH_RZN1 [=3Dn] || COMPILE_TEST [=3Dy])
so it's probably better to do
depends on OF && (ARCH_RZN1 || COMPILE_TEST)
to match the pcs driver.

not sure it would fix this error though...
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
