Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5344F1EA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 21:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710021335; cv=none; b=S7ZAuzmN/8otdWB+9VpdysGcDEGRIGQ+m+OTAYbiCs0ZgCqT9ljFqpir5CDtW64QEddmS1Gjf7PNluuSpUX4HlgmHmrQgAZJQ9kTC/bo2uC/NL3eiZUo9Yvq4WBsVXVBoOidFothxcpMA6DTGbpdOyO5Uh8Tw2ZWtaLtsfZQW+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710021335; c=relaxed/simple;
	bh=IiqrN6Whgdy/TDhQ75u0sue8qCF+o0dNSgXnc5EDx1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EmbouNsyHA9FSDSFrGlsIa3DSMn8v4FkTURqQZV2Tm/DkKTzKn4P2dHzG07eyamU5TqgRemrtlPEAgJ58t7NSEhStLqwtADQCjxUUL7K7+qZMQ3iJ0h7khBSSHeU3LT3fsSyUf4CwZ/BCyJg57+m//gKy9xYk5O93vZE+7EjC88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSs0tKmM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSs0tKmM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dd6198c4e2so20627745ad.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 09 Mar 2024 13:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710021333; x=1710626133; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3fh6seMxXGzLhwFzi7a/9+gyv1BHleUgGLliu6rJJc=;
        b=aSs0tKmMiyeMjdPSBga1WEb25PvdPS18bm3iHNsZDuV7Q7q5QXEY7vykevdKre601O
         8bV3d8sj2NmkIth2BCfa6CsDZVxEi5xDLhgDjaQ6VRu9xLDoVHuiflX+bxCY5CbJRGhP
         oFxr89ehTKnpyed80GyLKDINUh1Pip/2kwYHvd/W0HZBygz1rxUIhPooyOl/bzyMw5Jh
         Fil4xjF0rhz4tsgCx2FNVW1IQqv30u3kemxav71fYugC3cckty2k9+a4LFwtUYmBK8L4
         7te6TLaYMpiZzlpeu61gdxTIc7wMHQARBKP+5w8gI+l6O8968gSJCjwpVkA84TL7X0dU
         99uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710021333; x=1710626133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3fh6seMxXGzLhwFzi7a/9+gyv1BHleUgGLliu6rJJc=;
        b=ANHXGtsLS8E8aXV5oAqHN35buyMiOLTWUXfrVbnxLFBaOxcrIhfvIGmOMMib3rqJII
         mtnY6InQT8a2x76e6Vr/8iLa9XlO23xnGx9A3rPsCgIIilfKZqJykth+MhZHxMvyIbjo
         s6kADx8UUzKYNkPt/Cr8Oy+TAdTSZyvPogk50JHazXzQCCv39JO8edXJFy19Zbs8wLEd
         vRG+1bcERtSTSiKzyuQ2dtFcewdkq6rK7KCqbYJFJ3zsQQ7xOkeGgkdeSfWpu2xSWg58
         nN8rlc/1tctinHNtzvBf7ZJy5bI4wLnpn0YkE7kqmpCy6U1rOIRG6EblpA7Z6A2bQM2Y
         wKjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1C0aq9gVkcsymd/M5DosJ2CtzD0oLbSN0/xnjdKgZVdA/gS1ptJxZms7eMk7UE9MeI2TVoS4bbejSnWe/MoL0y4nqym9lMyxebkAJPg==
X-Gm-Message-State: AOJu0YyGowBuXCqeSozGVaWL9yiv+UCmuTODVuMC6dcJSqjq1BQFIp+9
	sZyQBqnxLgDgiTfFQaff/XGyMVI16I8JcfPJESq0zgMDfXvZUgdwpjMoqhUWgEs8gHDzo+XKkxo
	bIg03u6F8OE6Y/BdLrsdHaeiPvhM3arEYJ0lLKQ==
X-Google-Smtp-Source: AGHT+IGOMiDSgMRfEiL7YHirZbMM3lwBXrjkufUPUnZBxxAmkp6PA4SjSHvwNDmYGcDvOGIDy++2hs253153xqbdnYQ=
X-Received: by 2002:a17:902:ea01:b0:1dc:b531:839 with SMTP id
 s1-20020a170902ea0100b001dcb5310839mr3968684plg.25.1710021332637; Sat, 09 Mar
 2024 13:55:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403100351.AEy18IlC-lkp@intel.com>
In-Reply-To: <202403100351.AEy18IlC-lkp@intel.com>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 9 Mar 2024 15:55:21 -0600
Message-ID: <CAHCN7xKqiaSms4xEc_QkE1jAs48ErPQbZEPDJNEtri+GMbGFZw@mail.gmail.com>
Subject: Re: [pinchartl:nxp/v6.8/compulab 10/20] sh4-linux-ld:
 phy-fsl-samsung-hdmi.c:undefined reference to `of_clk_add_provider'
To: kernel test robot <lkp@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, oe-kbuild-all@lists.linux.dev, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 9, 2024 at 1:31=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.g=
it nxp/v6.8/compulab
> head:   baaf6f492f51fcffbad4ab0e8d43731d2f3b43b2
> commit: 010f4175dffe95ebabb2078b34ea802d0db1df65 [10/20] phy: freescale: =
add Samsung HDMI PHY
> config: sh-randconfig-r063-20240309 (https://download.01.org/0day-ci/arch=
ive/20240310/202403100351.AEy18IlC-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240310/202403100351.AEy18IlC-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403100351.AEy18IlC-lkp=
@intel.com/

Laurent,

I think you may have grabbed a slightly older version, because I
submitted an update with a dependency on COMMON_CLK to address this
build error.

That latest series can be found:
https://patchwork.kernel.org/project/linux-phy/list/?series=3D830441

I'd love to see what your bot says about that build.

adam

>
> All errors (new ones prefixed by >>):
>
>    sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in functio=
n `fsl_samsung_hdmi_phy_remove':
>    phy-fsl-samsung-hdmi.c:(.text+0xd0): undefined reference to `of_clk_de=
l_provider'
>    sh4-linux-ld: drivers/phy/freescale/phy-fsl-samsung-hdmi.o: in functio=
n `fsl_samsung_hdmi_phy_probe':
>    phy-fsl-samsung-hdmi.c:(.text+0x2ec): undefined reference to `__clk_ge=
t_name'
>    sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x2f8): undefined referenc=
e to `devm_clk_register'
> >> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x2fc): undefined referenc=
e to `of_clk_add_provider'
> >> sh4-linux-ld: phy-fsl-samsung-hdmi.c:(.text+0x300): undefined referenc=
e to `of_clk_src_simple_get'
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
