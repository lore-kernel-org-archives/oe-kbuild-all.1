Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808D51F4168
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080643; cv=none; b=pQyFbjswccukSb2tvu+UhnA1pKuwIUCNrPaUxzUyQOEtFV7jTAD/s8FMlDeFknMlRMCPYdQsxnXenWvQHw7VW0f1QDCGKIsNfbhoPMbltF6gw0pdY8AM+uIYsdLqgHGtoJLUXPseW5olZlde2oawJ9XpTV3f1uhR/PgETH33eJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080643; c=relaxed/simple;
	bh=Set7ARbDGtVl+rypiAdzKX+Nu1RI6OmX9rgnwmZ6y4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6ooBsBESd/gisRzIae7l/Lm5MSeFLj9x1xR4fgmgvKO/k3hxuhFlrWxnxOeZy1kNR4tocMKUpkZ1phwBfDja8fFJEig9n1e5rYouOLdyIEw+ek28HjcExI+DEuLHdSrcXXEqv+LBXMVJYzU6GjM7E83mG4NSEGd5H8OYw9foMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tNsoX51O; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tNsoX51O"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3105ef2a071so45529501fa.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 06:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750080640; x=1750685440; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpFwILv4epGn2GHEmYFKtiL50L1fsQYq7PF3nsB89Ng=;
        b=tNsoX51ONB4q2tFZB6RwNKNjacRvhx0A/WpKMr2HRDm/5wEC4Rmt3KgEed+82MaZIL
         /kx901dyvCaNdZtsmk7Q9fr1j2iew9lHYA9rEYOptKRU00NTi0kp+Ds2V39opIyknzPc
         8DZIAzMhFionmLo/VuTg9DpAlC8eEg3Pw90ht2fKhRglRHTv44rx5VIYOeG1sDyXHQlo
         x+FwA8mVyxy0wbfStp/2HRzOjd6PjeiYPOSeJgiZMpjVW8NGFaLDuI9uGe9n1DqGEIIZ
         xGu+3azqkQmm8gez7Z97jR2TE1H8H8NhlwY9Dzc6pNTlyTBwNK0yp16W5f0YX33VM8Na
         dY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080640; x=1750685440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpFwILv4epGn2GHEmYFKtiL50L1fsQYq7PF3nsB89Ng=;
        b=mMAVzKviANyVLdIj6+rz7x2MeW9ItqPt9PQiH8Jng2BAsqIsgD4aPaDdmF594KSiTx
         MgryquOiU0sIthdKIt0dIXlKwZN9SpAVXl3/S3T47ioRjYhGY1/qcuziPSpZV8l0z2ZK
         nrx8oDk3vBkkDJltiXuibrlsvsNPYByxj7VWHDIIThZyNeLD6NH5t4d9jfd7Z6wh60KC
         UPvHX8f39clW4qwqY40J3HojrBDJjn7EoLsks2EcqYnt3MFp4o9BO05N2NDfe+wnPCs5
         YO8de/VTOK00jgzqNsAUDcqPfB8pJKLU2ab10J6lVtjwrTwyOXclVLqTzzXU7fWuQkuZ
         mkkg==
X-Forwarded-Encrypted: i=1; AJvYcCXXYXgg4m34KpmVi5VaGrflfbMUR9lTEduZPzwRqWSJtfsD1WKU/7OM5kGrh13bxkp1c3NXzmyH1oHDcpMH@lists.linux.dev
X-Gm-Message-State: AOJu0YzfroApTb4c1ycZ2TTCWvCfSn4pDwoPhP2QP213K5xfg0IIEAzt
	KJazMs1Ss61vV06nWMVNr6KzHI9XSPnkquLVVxj8X9FG8vcto6piwqLDCQV/KyYGSOw791Nx4tP
	gp/+XK8TZ+4miBJM9SsUCZwj5kolQJyJgCYwq5MVT7g==
X-Gm-Gg: ASbGncs7FOwhoobVlLCe/cciZCeh40OwYc8oJTF2TvvzrSSOw0v55Jjjv7n9sZFnLhv
	w3IbTKAynuTP7q/wwlY4yJ2/Ul6jN1purtvJDqrMrPo0xpZl+SfA+j4j67b/MYXtmCCcwUG2G7y
	LtJ7aJPC/X39JVR+DisiCZU8n8VNmIur1DAW0gkFKmg3vpdJxiLrMYLgcWy0EcfIhHwXEwnwQRb
	M/5yXnuRBqqBg==
X-Google-Smtp-Source: AGHT+IGDpPwrY/qezNWazK+rw//fC7hH97md4nyqXriaZInw5tKf/dsV1dwP+FB3JvLuRVtC7OZOgXl1b9/GYt16THo=
X-Received: by 2002:a05:651c:1505:b0:31e:261a:f3e2 with SMTP id
 38308e7fff4ca-32b4a2e35f0mr24206531fa.1.1750080639525; Mon, 16 Jun 2025
 06:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250616053209.13045-1-mani@kernel.org> <202506162013.go7YyNYL-lkp@intel.com>
 <ji3pexgvdkfho6mnby5jumkeaxdbzom574kbiyfy4dcqumtgz2@h4nmwjvox7nl> <aFAZL1GgEH9l-zj9@wunner.de>
In-Reply-To: <aFAZL1GgEH9l-zj9@wunner.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 15:30:27 +0200
X-Gm-Features: AX0GCFsuPlvNCKVZ42nqFo1y-oTylnUFxw211QqxqFtmolpwWlFQJ8VvyOnirMY
Message-ID: <CAMRc=Mf=Z+d3UKdwEXkw1Xm9G=qVwh6=fXsfgS6JiOM6Z7H50w@mail.gmail.com>
Subject: Re: [PATCH v3] PCI/pwrctrl: Move pci_pwrctrl_create_device()
 definition to drivers/pci/pwrctrl/
To: Lukas Wunner <lukas@wunner.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, kernel test robot <lkp@intel.com>, bhelgaas@google.com, 
	oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>, 
	Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 3:16=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrot=
e:
>
> On Mon, Jun 16, 2025 at 06:07:48PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jun 16, 2025 at 08:21:20PM +0800, kernel test robot wrote:
> > >    ld: drivers/pci/probe.o: in function `pci_scan_single_device':
> > > >> probe.c:(.text+0x2400): undefined reference to `pci_pwrctrl_create=
_device'
> >
> > Hmm, so we cannot have a built-in driver depend on a module...
> >
> > Bartosz, should we make CONFIG_PCI_PWRCTRL bool then? We can still allo=
w the
> > individual pwrctrl drivers be tristate.
>
> I guess the alternative is to just leave it in probe.c.  The function is
> optimized away in the CONFIG_OF=3Dn case because of_pci_find_child_device=
()
> returns NULL.  It's unpleasant that it lives outside of pwrctrl/core.c,
> but it doesn't occupy any space in the compiled kernel at least on non-OF
> (e.g. ACPI) platforms.
>

And there's a third option of having this function live in a separate
.c file under drivers/pci/pwrctl/ that would be always built-in even
if PWRCTL itself is a module. The best/worst of two worlds? :)

Bart
