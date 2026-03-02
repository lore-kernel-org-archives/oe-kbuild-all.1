Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D6623E334
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Mar 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452834; cv=pass; b=SW4lw4x8dJDoviqBeWk6tOelmZrdpRZfMnTKVLX1qN9qHH+hMTaX2Of1nuu6RNdl5k6zty+r+iTLnn8DZrJzsqj5DwVkQHFtUKVkDA2yTMrW6yQCegBFP4LsynCdPMy227+L+GjVZ2i17UvS2XrarlYZetBJHW6RAHdcS1yy8d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452834; c=relaxed/simple;
	bh=8LmPtxyT3YMtIL63fEHFCEyYwnCRKHRTqMjhB0pBD88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAKN/DR4TsKOaXgd62BAvLwta8LRiWqxuwUJA0c0LYDlGk/Oo2d7PwxDPiseesH8KCsINlXXaIS5ZMnMBgBKp8NAn513IY0ppqbGxRUtYcXn9G5zWIXHxuKO0/1Dj2D02NajBBNuj+luqdnmidDiUuK5wYCAPbcK2nDNrGJSGzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=JosaQN1M; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JosaQN1M"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso19914645ad.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 02 Mar 2026 04:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772452833; cv=none;
        d=google.com; s=arc-20240605;
        b=VlU61aJVEH1Z7/wv1g79nu+qKp67NRzdHDpILe51jDbSRuhtD1CEWMOfj7GrbLPV6n
         JXj6+9KTS8/5Sp2ikyiCOkvfUb448oPDluJKSNMtuW243zha5wpO9HeuUq1HsUSrR601
         TARlOVeRat3NVjl7b3oBqey5HYC8/gzcMO4Do0NDstSl5jhw5EHt7oSoZGMMBE0Cr1VH
         Br/g3PwfV3FaYAfStsrLgT647YY13A4ua+y3C+x3yjmxElk6vT9tnNe6IhPp++HPnlg5
         XaY0GGrehJvdCsyxr1q29kwhboT3M5W8JXHbju4Yl6FBRZUgR1ThrsdDPvx+gPj24eqg
         tFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        fh=3yYJTGXoK68sRFWhPe48ZPl3NAhTcj2FmDuEAapmMIo=;
        b=NWLEVWKRfIVwbmCCa4gVvahRgwu5OR6oVDCazB+vasnl7FmHVtEyedQco4ANvH1Nm5
         P6OGHYAEaO1Us9kB3t/ODdBFXrYne06BxiwqyTGPyDSuv0ZFwZEzGHomrZG5wOfvS3Xh
         Uq7Up9aHdw7Zy1VCOj0cxE07Q9A2ZoG4gbcL6PIgeNmjDOtZ2zXfyeXsm7FhyPqHBcxp
         qemSG/t/GMhmilbDdNW3M5KrHOqCfgbAL3VL1cjtBkcPFTPtt/WnmGnIeV0EXPrjyF/v
         s+1EsaLAZ94+tLcsH8v3BXp4lmFaIeBtrX6k9Axcnrq2Ezk8v+L/KW0uTRCvjhUsDJhb
         ErGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772452833; x=1773057633; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=JosaQN1M5RwdJlJOcZDab+1YF1ktL7LqlXfxzjRNlEqoGWCCKlrs7GApy15+Ifmjxg
         urRXqzzDoqW4tKYsVlLQwwXFCLSFK8BdxH2b21ZzJERjGm0cQ70nbiSNNwuWHiT7Rfbz
         hadIM9Jhik5DKxUGsviEE8+ePPR82sgr91Qe4bieIHX/p2Rz6JL9tTpR2S1hY1JLSK2d
         DQXjsYVFcmgVsZRvCWy2HI/T4yyBiam8tXXMgF12ifXQkIb9ACZq+OWQvsYenVxqG3r1
         +PQOfio/ipkrF1qRt2YeIOnXZYM2pbTqjNHNKawgj9QnkcddJiz8BDkVgUXFf+i+61xh
         J5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452833; x=1773057633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ArgC6tchR6EEgYRqqpyMGswMfqPtVUgik7Fa59Flxok=;
        b=mjntrgx5Me/iJ4CelQWkYaqMwwEi6pFTbvhxn7a0JTwulw9Yxv5Dtcbsd9SKoHkPhL
         UsgS+glK5PnMnUp00OPHacqmnRn7xRN+W3LxUbNNXBaJnpEYlO3CWMT26xFYSLWPkNPD
         8kTo9C3FDpFer4IzAPZ8TTOQu6bsyQEeZuNjCc4qTxUsNQ/6YsUrIofEpDRJjzt+ng4y
         /8jLhW+C1XRouBNC4wlI2vITgiNBBshf9+yqWAZMGj1Cu5njLr1gdIiBN6WrG3bAA9kM
         6gHRXn4fhlW+6PbUf41uMS1SD6bFJDX07Jg+VQlGsZ2XNti9fPy7VOo75opw3zL+3G9b
         0/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVl49FM++cV+GIkEkgMbuDQJ1pD24gSDCu9OvDfj3flyEQ0J/OzlEGmio2YAEtM0idyk6yR/5u6Ra8fTME@lists.linux.dev
X-Gm-Message-State: AOJu0YzUdMphOkL3MT6Yb1dfzM2ntPWj6A30sHZLWK5ybWbNxLK7cuwO
	UVliRbwT+TsTOVrk6rT/6HxsafwHpy3kFkTwqSfIne4UUBSBRgsJHIxBxvhBAn6/SUu7BBnKyxR
	HHnRKFt+RXDBy02Jh4W/46aXQJDNj1+o=
X-Gm-Gg: ATEYQzyjyCTkFJIIMjguTSHHQgpzLwD6qKD3XJKFukgUQDYkP1nmn6JCx7zWODnEY0Z
	4OQWIlvGJTCsv74B/I5pnifwd0wQoryhfCyVoRK4AYtyFrl+29Nxem0qIamSMTXxekupDzTGmIU
	IBErtSPELGAUp4EfzF0rwhs0GWScB6vNhdbb8P9mhIOxnjhJp4y8zcxDaFRmH4focwMG3jsnVdi
	FpaA/CUChqbrA2E5T85Kkk+h+ljlUATu53pctz7KXCOq1praUlIXzu8Eoz1DORcZwW1bttUHx77
	/pfLfRzJ68f40keKxdXrmp5d/UsMN3BFg6vamZDx
X-Received: by 2002:a17:903:2b0b:b0:2ae:5a44:ea73 with SMTP id
 d9443c01a7336-2ae5a44ff28mr9115965ad.30.1772452833138; Mon, 02 Mar 2026
 04:00:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260228065840.702651-5-nick@khadas.com> <202603010009.VfPuPoeI-lkp@intel.com>
In-Reply-To: <202603010009.VfPuPoeI-lkp@intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 2 Mar 2026 13:00:22 +0100
X-Gm-Features: AaiRm506ikB27OOPsiZaHy57remzQl6Z49Wi7FBnTFU4vfPVcSRrRPvLCZYsf3Y
Message-ID: <CAFBinCDBR=cgQjhv9VxYLFAmTp2p+Fm_mWCZ5o5P_SA=Rb0R+A@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s:
 add Function key support
To: kernel test robot <lkp@intel.com>
Cc: Nick Xie <nick@khadas.com>, neil.armstrong@linaro.org, khilman@baylibre.com, 
	jbrunet@baylibre.com, krzk+dt@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-iio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 28, 2026 at 5:16=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Nick,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on jic23-iio/togreg]
> [also build test ERROR on robh/for-next linus/master v7.0-rc1 next-202602=
27]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Nick-Xie/dt-bindin=
gs-iio-adc-amlogic-meson-saradc-add-S4-compatible/20260228-150346
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git tog=
reg
> patch link:    https://lore.kernel.org/r/20260228065840.702651-5-nick%40k=
hadas.com
> patch subject: [PATCH v1 4/4] arm64: dts: amlogic: meson-s4-s905y4-khadas=
-vim1s: add Function key support
> config: arm64-randconfig-001-20260228 (https://download.01.org/0day-ci/ar=
chive/20260301/202603010009.VfPuPoeI-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9=
a109fbb6e184ec9bcce10615949f598f4c974a9)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260301/202603010009.VfPuPoeI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603010009.VfPuPoeI-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    Lexical error: arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1=
s.dts:50.18-24 Unexpected 'KEY_FN'
> >> FATAL ERROR: Syntax error parsing input tree
It turns out that this series is supposed to be applied on top of
"arm64: dts: amlogic: meson-s4-khadas-vim1s: enable LEDs, Keys and
Bluetooth" [0]
When applying this series on top of the other then there's no more build er=
ror.


[0] https://lore.kernel.org/linux-amlogic/20260228063750.701887-1-nick@khad=
as.com/T/#m2f4d30878fc8252f853bdb3005042c3aad97961e
