Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3C8823AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 11:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713527043; cv=none; b=AhGcNx1KvqR3BzagBnDlbFu6uzoyUEOFmZu4P2cKC28qU+bRmdbZC75oGp+CrAyf5GwRBVoWmkZS81tiAfcIv8dV2QKv802jMAzRupIT178/NHYnItu7wULTYzuX/M25JSM2L2onHM+wIXRayu4t6U5wfWk8wx72aUyUr7XaPuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713527043; c=relaxed/simple;
	bh=xf0XakvsGvN7+Qa4npUJSoQzOdXU1KaM5tESEFlJRpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsRFVo7eWzQnnMvh4nwXGT2yuiYv7coiQXMkeOiaQ35UEBp5Ho2G1kDncnRjGRSahgCTMmZUCsW8AOfhl4Ovty6bwjo5EiKai0p7rmW4e/RW+8oJJ3tm1OPl4HpAEe7KUmuFFS4aYKuM71uVRLHXuHpGPLd/UbxAiLzDL2rdhVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XMxxyWXm; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XMxxyWXm"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2a526803fccso1332133a91.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 04:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713527042; x=1714131842; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvDwn2pX8ZqTMkyCwFFbipgt+oA/bwucP9JR31znzpE=;
        b=XMxxyWXm3gE1ls8niKXBdMj7gyn1B48X7ZUKQh5hD0MPicgcLiDk9QLmpw4hfbiFxK
         w95Kwh2Tiu5z48XouQ3FFbdO5+PhMZ2vr/Vdh407QrO3ogxhQD4Schfn0k6owmpC/HX0
         GOlU+pnolWzTeSz65cGVte8ktkrrvnSeCVxdBvJLYvn/ntIIrmsQhwkD0ssfQDW+JvTn
         /v1q5oyfwDTahnQ/wWJURH0jIzhdcWJcHWI1MCCnlGIp7ULp4caH/nZjGFHZZMpkGWQH
         0lHSJBWasNawj8JbiXVEGPxyEclmEWVU5Rh82p+m2FxRgTlyOmx450xqqxR4ezz6FX0b
         tvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713527042; x=1714131842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvDwn2pX8ZqTMkyCwFFbipgt+oA/bwucP9JR31znzpE=;
        b=im+dLZ8ZpkBYajEJQeP8p9UxJ7Rtq31ChkLwDZEaW+SECQAf2m/Is1GFabeAZODSFs
         kB7HFTm+7n2FNurbvoqN51CFJqRGo/gINkPWnsOshNsLXbN6aMlgtvy1ayp/ifjyE8Xr
         4cb51FJRvjgWBbyG5IpjZWu5sUR8/X0LNo3AVLVC6o+rBXk6sSIVz/uRszfUh02V2yBK
         q0wA1ZSJIpMErpMkjIAsJIqT43QcWzEhmAXAlZE/0LyMNjC7GuYMgFnjDpRKxRslDYX6
         GBZTvn+zPd63u2ABD8rTZWYOKYBtLIkqGz4lh/Vnju0jNnePerr4rZi+jStLZtu7Q5Sq
         miFg==
X-Forwarded-Encrypted: i=1; AJvYcCUYbLYSIz05b/xDVo2HU3IpulfVnx+8JJUlWoGmBcYub62XeL9AVieJ0RULHeVY/R71Mm3dHUcwD/H98lIXV1g5qHiAmBfL5Ptj11PltQ==
X-Gm-Message-State: AOJu0YyrvScCRNBRKHjG71iB2QNQgOM62HiXnM1otWfcQ5yJo3ShXPOA
	OD30Rihmbistc09hgDS1Rk6tuO+ArAJwyoVeFbHscVGn3JWjpCexip4UdY/0EDSR1PDIe1UhJGk
	BPArCXEpQdxw4aUmWYTCYKk4ahBM=
X-Google-Smtp-Source: AGHT+IER29uPb481Dz1d3DBvkhLSrTEzkSUGNhTw0UT5y5p+m3n/UECqSkHaBaIGLrOPVVaG9uQmpYulMmM2GVT/xb4=
X-Received: by 2002:a17:90a:a085:b0:2a0:4495:1f3d with SMTP id
 r5-20020a17090aa08500b002a044951f3dmr2270252pjp.0.1713527041718; Fri, 19 Apr
 2024 04:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404190103.lLm8LtuP-lkp@intel.com>
In-Reply-To: <202404190103.lLm8LtuP-lkp@intel.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 19 Apr 2024 06:43:49 -0500
Message-ID: <CAHCN7x+Ot=y1bZHGwLLHihNzvwJWzgLu30dG2tSp09smAMV8Eg@mail.gmail.com>
Subject: Re: [linux-next:master 1892/6937] kismet: WARNING: unmet direct
 dependencies detected for PHY_FSL_SAMSUNG_HDMI_PHY when selected by DRM_IMX8MP_DW_HDMI_BRIDGE
To: kernel test robot <lkp@intel.com>
Cc: Lucas Stach <l.stach@pengutronix.de>, Paul Gazzillo <paul@pgazz.com>, 
	Necip Fazil Yildiran <fazilyildiran@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Vinod Koul <vkoul@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 12:19=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   7b4f2bc91c15fdcf948bb2d9741a9d7d54303f8d
> commit: 6ad082bee9025fa8e0ef8ee478c5a614b9db9e3d [1892/6937] phy: freesca=
le: add Samsung HDMI PHY
> config: arm-kismet-CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY-CONFIG_DRM_IMX8MP_DW_H=
DMI_BRIDGE-0-0 (https://download.01.org/0day-ci/archive/20240419/2024041901=
03.lLm8LtuP-lkp@intel.com/config)
> reproduce: (https://download.01.org/0day-ci/archive/20240419/202404190103=
.lLm8LtuP-lkp@intel.com/reproduce)
>

From what I can tell, it's because CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY
depends on ARM64, but the driver that selects this doesn't.  Unless
there is an objection, I'll change the 'select' option to 'imply' as
there is no build requirement here, but enabling
CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE without
CONFIG_PHY_FSL_SAMSUNG_HDMI_PHY won't function.

I should be able to submit a patch today or tomorrow, unless people
would prefer something else.

adam

> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404190103.lLm8LtuP-lkp=
@intel.com/
>
> kismet warnings: (new ones prefixed by >>)
> >> kismet: WARNING: unmet direct dependencies detected for PHY_FSL_SAMSUN=
G_HDMI_PHY when selected by DRM_IMX8MP_DW_HDMI_BRIDGE
>    WARNING: unmet direct dependencies detected for SC_GCC_8280XP
>      Depends on [n]: COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=3Dy] && (ARM6=
4 || COMPILE_TEST [=3Dn])
>      Selected by [y]:
>      - SC_CAMCC_8280XP [=3Dy] && COMMON_CLK [=3Dy] && COMMON_CLK_QCOM [=
=3Dy]
>
>    WARNING: unmet direct dependencies detected for PHY_FSL_SAMSUNG_HDMI_P=
HY
>      Depends on [n]: (ARCH_MXC [=3Dy] && ARM64 || COMPILE_TEST [=3Dn]) &&=
 OF [=3Dy] && HAS_IOMEM [=3Dy] && COMMON_CLK [=3Dy]
>      Selected by [y]:
>      - DRM_IMX8MP_DW_HDMI_BRIDGE [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy]=
 && DRM_BRIDGE [=3Dy] && (ARCH_MXC [=3Dy] || COMPILE_TEST [=3Dn]) && OF [=
=3Dy] && COMMON_CLK [=3Dy]
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
