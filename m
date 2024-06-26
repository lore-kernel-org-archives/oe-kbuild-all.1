Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3339A190698
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 20:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719435567; cv=none; b=R4MrDqlrqdr75qq0OXv8nWykObuyHj+xAMoADNKGrCOorU01dFpaFFfTa7nN3A2vuXrPBIkhr+j5JojUHnUWa11KnV1PydggwUXw3+D+/QKL66uDX6F414V4wG5J07RaRvDCNLbmlkRV0076WDZhEReDNWYIqwISJq/eETwPnpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719435567; c=relaxed/simple;
	bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DlEWeeGkgH5Nf63BCjlYrqZrSTp0QsyBqaEgdt1iCNcnYpAF6pM0vvZ716AAaMXOcSWb912aVh29jhr0W7ixuReeuwhHpDdG/fB7Ev8kXGh9kp1YUmtnglSTUNCx0ixOtAucFCPFOVPjrRZ1bcRhsO8vshcDeAI1USk21TDuSpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxJhgpgb; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxJhgpgb"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso1984652e87.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jun 2024 13:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719435564; x=1720040364; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
        b=cxJhgpgbmp+zcsXIVTZ1zxPGuc7rt341sGBfVdyDVUrMCEnTJU7UEdZN2yGuBr6fup
         1wWOtgVuG7GORieYRw8vBtHljqPyl7vKejrLfqandRvlDvXSuYuDpwH4GZKh7fCI/72U
         DRsuTd+VuO8h4xR9cM6ISc110dzHsGc3aOT4MvDLpfxLWL4N+X47z7EHdB66Z2+9d7IS
         5p3Z24or2Nek98R6//demaprFdGJws95dhwHB+OABZUAFx/2lVTVZ0vzqEcwS1EuCnbD
         DYsoIpQrve3lbAq7k5qlsx5pCpM7DlVXYqRPA6ofPAzBqPnM+3Tfi+ZjGq0tTBJT7Xj1
         +VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719435564; x=1720040364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=96OyJIYZ6kFoOzCuSrM2f3jAde8CM7fVKLs+CUWcIds=;
        b=xPAcxxxn5Z4u8mjF7OfikUS59C+/SLWhZKwtRCJYMXMW9Kooqi8h9tKK/9seRagiBY
         xmtPehrskOeqhd8TGacQeSRVT6/YhM8f4AKfId0Jm3Zwg/p52ZvtW7b9iWdbjGM7PFf0
         Rxl+vSbY6nI8CH55sJZg9QOHL7RtF6czQxXJgZgxLF3nqK7BoylEo+AoE62r0vlMUg9m
         FDfdF0HLVdgKF1kRhRCk/J2X5895u76LDoR1bslp1CADv8O9l+M5deF9h0bNhF21QVjl
         dGeQ5xz44SYX2fyNSmUQ0AFTfhsgebfdRgaftKPdcCTjyuUmdxTmRpa+YyrXI1/TDQkw
         MQag==
X-Forwarded-Encrypted: i=1; AJvYcCWPRiMPhnf8wQS8e4NaOnOb3H5p/nDxLuI1NG888MxrInSyYGKQJ2PXwsse91U2mY2f1/3mpWaIgH533+vaac3/Km9f7MWhbGpwFB+OLQ==
X-Gm-Message-State: AOJu0Yz7XY2nAOCOLRK6oed1/Y6ZJBc3KfkjDajTMiGqUjQLnBiXc364
	TcwVN96HxbVCwJL2EG+uMrzPJgDEdAjDjScSV9tNcSWgeTca5+P7cUOymggCTwRJXnOoSbCYWsZ
	mY9zU+8eTuBX8V5pMacGeQgYSzatFeCJd381xcA==
X-Google-Smtp-Source: AGHT+IGrTd4cIzRSRIXqqDuLILkPD1S/dVkHkeQdYhChs0LMTJ+8Aq5s53BLlJ7clCzY9u+1vmR2P5wcJjkV73+JlcI=
X-Received: by 2002:a05:6512:205:b0:52c:cc38:5e1f with SMTP id
 2adb3069b0e04-52ce0641433mr8913241e87.47.1719435563137; Wed, 26 Jun 2024
 13:59:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406260432.6WGV2jCk-lkp@intel.com> <20240626172154.GA50752@fedora-macbook-air-m2>
In-Reply-To: <20240626172154.GA50752@fedora-macbook-air-m2>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 22:59:11 +0200
Message-ID: <CACRpkdaXd1sosdWzWOpbtin1h2NFS88Dc3ZfXhyix+t1uC1L8A@mail.gmail.com>
Subject: Re: arch/arm/mm/proc.c:82:6: error: conflicting types for 'cpu_arm920_reset'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:21=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> Hmmm, it seems like the prototypes of the reset functions in
> arch/arm/mm/proc.c are incorrect? This builds for me with the original
> configuration and allmodconfig + CONFIG_CFI_CLANG=3Dy.

Incidentally I fixed it earlier today!
https://lore.kernel.org/linux-arm-kernel/20240626-arm-proto-regression-v1-1=
-089c23ea13dd@linaro.org/

I added you on Reported-by for now.

> +void cpu_arm7tdmi_reset(unsigned long addr, bool hvc) __attribute__((nor=
eturn));

The attribute is not needed on the prototype AFAICT?

Yours,
Linus Walleij
