Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3A03D9DC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790325374; cv=none; b=txGmxg6ApqHfn+/s6aJdaWc7YsJKlE2UFmRvIba72/njixYEeyPVT82jMx2PqmzntkIXkAF+dDETL+JEeLMjDiZQBijyK96UYr5MRjEms5dtmVjlMaekph1zrSe5i59+9NYECLi1MA4aGRgtuYiYQO3Gmi6AXuAZ2hunuCUvgBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790325374; c=relaxed/simple;
	bh=B9Mo0diluirv1ofRWtc/xjnW4chj1td2blSc2NVjWfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sT/pFNoJjrwDme2AFWmlAvPaUEgZx/1QMVY8AraLCngzHbJ35jQ2qcOR4/AaB8+tYVgF89UXz5dWyvLShb6xOrKRjaWy7P19Abam2X6hrmE/ajFp1TZ5tXlQgJ6/ot/D1q7j6Rh3R/C/Vhg62U0yRQQ0lLPcu4xSiz1vW4lMDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XuW417eu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XuW417eu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 983951F00893
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 08:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790325372;
	bh=B9Mo0diluirv1ofRWtc/xjnW4chj1td2blSc2NVjWfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XuW417eu+q54miKcfxsODFy26pNLV32LjlZaU9JBnKCGxXI4m3jbq7W7/hFtLrLi5
	 nC7pMub8sAWb5pbJL1VRJ1S9fiTeLRnlG4ckPh20+FgQ2S0dhitsdzzkZkD97eK3Ct
	 0myn81J6QtDsuiL68MA104gIN2yc4vnztbJiiXZZc0b0wDCsRTG4lP4lARNPOLTuPU
	 bNbAL5wZ9D/j3wSl1YmAVfmhlo8sgu9wQyXHnr6rHf9F5f/kjSVP5LTkCSbyV2VJjZ
	 2A3OU3gb6NXkAd02JRqLuSQwD/slMXRIaJGjm1KssISJQ7aKoZRDh84uuo5a1XfVJn
	 cJJVgIKZ059cg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb39a8edso139852e87.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 01:36:12 -0700 (PDT)
X-Gm-Message-State: AFuF++lNVoREY3IDPt6bUfOp7NWEAxJcIRTsCOaL5e7IuRKWwpqu9NOp
	Utb7UUSetNa3g7Cybbc8dmUGI8UZu1epzi5jMRSHNYlix46afO4xM+D/evZUxMkhQrjr6swNwsw
	RY4CGU/LAZ/Wv7Su8vFlg60Sme/z8q9I=
X-Received: by 2002:a05:6512:10d6:b0:5b7:58c6:d808 with SMTP id
 2adb3069b0e04-5b8df0c6a59mr1742890e87.35.1790325371312; Fri, 25 Sep 2026
 01:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202609250440.xDQgbeHJ-lkp@intel.com>
In-Reply-To: <202609250440.xDQgbeHJ-lkp@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 10:35:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLnZV1G-tGAFOTAyA6eo89Y9U-1ZY19gCQtxiG9Ksz-PFg@mail.gmail.com>
X-Gm-Features: AclHuK_FIG9uLcdIA0kVGxdm3Gw5M7oKqTYKYo5kpl4RMMQ_0wYcyGFQZBR7wq8
Message-ID: <CAD++jLnZV1G-tGAFOTAyA6eo89Y9U-1ZY19gCQtxiG9Ksz-PFg@mail.gmail.com>
Subject: Re: [linux-next:master 6790/9480] arch/arm/boot/dts/st/ste-href520-tvk.dtb:
 msp@80123000 (stericsson,ux500-msp-i2s): '#sound-dai-cells' is a required property
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 4:28=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> >> arch/arm/boot/dts/st/ste-href520-tvk.dtb: msp@80123000 (stericsson,ux5=
00-msp-i2s): '#sound-dai-cells' is a required property

This depends on the binding which is merged orthogonally through
another tree.

Yours,
Linus Walleij
