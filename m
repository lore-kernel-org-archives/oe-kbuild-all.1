Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F741F3BA4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763664695; cv=none; b=mx0FyYGUDaPrJwQnvVgRjpTve81izDeBL1g9HMB3MCk5OSVqKtx0e98rfbqNCSvoFk3pUq7r0M0cWyv7PDtNRW0IFyevU5dJcO2MVxU2B4aG2udRhYSoJ2El0kUaFSCHxMjmA+FID4BckK+u04SbcY2LiQhqadsOAZWR9wL8CvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763664695; c=relaxed/simple;
	bh=L06JMK7n+oxsx9dHjUt3ALR0/CMNNsuE/8RunGlhWeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sVh0sWZn4bqOXscihrRKbvr1ELrTtH0gCtW0Q8q5LwZyMWZkQi9qUZbBP+Jzdq1JU5Kv5zfQPeMoMDe/WKxWCnsRFbc9MVMOi3XE0edseA9K1Saskx8Wr37TjsA9LwJ4nVRGcleKq5IbhZJ0FIp9QI3v2QeINFHxfIBXu4uz6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4FvFg33; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4FvFg33"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4ede6b5cad7so5035471cf.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 10:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763664692; x=1764269492; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L06JMK7n+oxsx9dHjUt3ALR0/CMNNsuE/8RunGlhWeg=;
        b=B4FvFg33jeFlfBQf43QSy0zdvpT6/HKJHdLCHF4CBxW64hNbff6gvbSyyKG7X2AOZF
         t/KgyawSxJhHofsVk4tPCQ13+i+o0pt0IpOQEXtEubph4+gt+5qX2rqj6Q2KxRCvM69a
         tbpmR06cd2YYKAKV54fFIx3GkAWX9ePbzvaND9Jbe3pPLgPXWwPkwaK7Mc3Pr1ct0L/D
         nH/J6vDqPxTptxVkA7KIQk8eAtISey+vZPDG3Mgz+KaaCvXwyV/izcKrLXagPn3RmPyp
         5/UONA2D1CtHrjRfJCyVT7NEJH0MYh2sdVswjQQFJMUGQEYK3mM2V6oBdHWMIDmN4GwO
         HvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763664692; x=1764269492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L06JMK7n+oxsx9dHjUt3ALR0/CMNNsuE/8RunGlhWeg=;
        b=wbv3ue69UaY8wgQGJy3WABGEPRy4VJmmJ3ScW/jxgBVb+IHGEVHtt+52FPZSs/Kokq
         OgJxmOYvoXkYllaWA11biOBQsFOvTs5F9pJ0UbHMU/FDy0V9twyNc9X3a2j2Ad1JuPhz
         ChfT23+EUYCt5kHahl5kCLo/i/ypk+MOP1p6ATHyEESV9GHnNdDQkfBO/xT4GJ/x6pzA
         DwabKtw0zIZ0w/WFkse10RLsgwVVR9ZwQzGT7fxZa4rKADV3rxeF5myOK/qhAxJqTYzc
         0V0eb15qPmsHp8lczQhuUnTRWC0zlgysAJUop7ieHytoM0g4CLOdnt3PNa1IfFrvTqpD
         dczQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAiaw1WWS8mvjuYLJkk4MIURkeZJmAtGAlzx5cEwlckwe3R2te/WxCrtQBuSv0Ft2HC5Y8GL1aJGJd5JAi@lists.linux.dev
X-Gm-Message-State: AOJu0YyJdoWw/fjxA72Hz6PYYFGndLykCEPoLAGdGNj6W5STclJNncvQ
	xSHlLh0ti10W4HkqzSunSCnzjt2yAa5dzAJf3CAHtLDnsAyIYo1fa2m2ngxmvBdHFGzHa9qMKyI
	r67RSVIWvFU+ukai3CJhnd9iX5k16YJA=
X-Gm-Gg: ASbGncuaIEISYqj5pHTmmlgnPCiQD1ezT6R+O0UVwriU9nrgdki86flBvGwR6q81nJu
	2X96Egl1+eTnXt5zU+aUhYoyAUIQhiAnVzPKw7VNO4/L6heCksIviai6Fs2wkQDEJBHt9IWoIKw
	mdwC1cPYOuqC76vDZp9HrM/N1tAm+p4NgEVYDBYF2Tm+Y9bdz5JafWSxL+VyxEu9cs85PI8sKXm
	qc1FYVdnPgO7DzrOpaGIlPoHtVxMuSvaJ5K+PPdDdaM1VLpBgTDl3zmCvaAMCm0W4MSow==
X-Google-Smtp-Source: AGHT+IFw8Dpv3tkO2+kXpx9Zh9KmZutH4pzz3luNAU10uHYeCPFN9BnBalwRCs8bfDQ0oh70PYu8nKEF29dPDnAfxmM=
X-Received: by 2002:a05:622a:1914:b0:4ee:275c:28eb with SMTP id
 d75a77b69052e-4ee496f999cmr51069791cf.62.1763664692398; Thu, 20 Nov 2025
 10:51:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120184211.2379439-3-joannelkoong@gmail.com> <aR9hiE7WB5ex9ED6@041890d37db4>
In-Reply-To: <aR9hiE7WB5ex9ED6@041890d37db4>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Thu, 20 Nov 2025 10:51:21 -0800
X-Gm-Features: AWmQ_bnM6WF9Ao6Azi1-LbqWgG5lKZvGrcYWd8-etWcCRdBPZXei57dbGBJiagI
Message-ID: <CAJnrk1aiZPrHeWf8WZEJopvGUC4hXZ8HN_BvyuK_vaeiuQE_PA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] fs/writeback: skip inodes with potential writeback
 hang in wait_sb_inodes()
To: kernel test robot <lkp@intel.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 10:45=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi,
>
> Thanks for your patch.
>
> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>
> The check is based on https://www.kernel.org/doc/html/latest/process/stab=
le-kernel-rules.html#option-1
>
> Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to ha=
ve the patch automatically included in the stable tree.
> Subject: [PATCH v1 2/2] fs/writeback: skip inodes with potential writebac=
k hang in wait_sb_inodes()
> Link: https://lore.kernel.org/stable/20251120184211.2379439-3-joannelkoon=
g%40gmail.com

Sorry about that, I thought it was enough to cc it in the email. I'll
add the stable cc tag to the patch itself from now on.

Thanks,
Joanne
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
>
>
