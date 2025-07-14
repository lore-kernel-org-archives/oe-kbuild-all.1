Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476EE6ADD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752523700; cv=none; b=D3GYWR1QRGdU28y1XpjR2VokoGuVK4TOKU5H74VS6VZNEls+Vv0JBKiGS3xrvqktohVbHy2kfpeyNja7UzIl+uXb4JjEXq5V06kdmrek5NdxKuWnu26hxd08MPJcLZONiyiKa2SYOJ0okicW0JItr2w4rTDQyBLwEsoGyAY+jeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752523700; c=relaxed/simple;
	bh=0zDSlRkiOlS0QSI3YIJVzMXfvMcRVm9iZvEXCz8nZYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvob+CClbn3DHvg9cFI089zwOi6LwYWhgSZGURruhqNyC/KdiA2crMeiBeCHpxbbeVdd3ApNZecotQEfaTbKNxAeBRz0aZVrzIxj4O9/eE3antmD9PXZW3gJvJEdgAeF17RHYLTlxG81/5Jy2TDHSqqMTE5E8NXbu3P4rzKZMvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ecYJ6W2G; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ecYJ6W2G"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7490acf57b9so3378452b3a.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 13:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752523698; x=1753128498; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdX6wuJVyhd+STM969KIAF+7bNTfgsWX/rffAcR7Ohg=;
        b=ecYJ6W2GkpJzSu8DhK3WsEHyScwLyK6nA88qPcW6wcmHNdPXhpkbwqzIFiL+hbEWNY
         Zm1uKeawVNC2j96ch1UgjnHUgF7n0yBubxUOzwwD5+e+dVYG65J8UrZEh+0FC/h0OwQ7
         48caL9HdNf+aSvs+Ds8/YiYZSL++uI5Ej3MjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752523698; x=1753128498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdX6wuJVyhd+STM969KIAF+7bNTfgsWX/rffAcR7Ohg=;
        b=uaxQ6Akj2MBMJpOwawSMvxp0URvhDzioZwU/zkMBx3o2Iis3QMNQXoH36EjlCiKvF7
         KPzHGj0af/LY+g+2Wg6TMJEKYrU6uEG2NVsto5A000m/nc7H0GYOedmF5qMVJc8PT3cI
         O2uyNBRGZgZQMPdgNlFtoaXvBBWXrBZPes/CElgLY/pPqdzoeSm9WfRpsSdgSoWI+Thl
         1JOA0nfuEE2ZiSyZpEQjQDNpPFHRl7H0lpK2K5Yccxv44nnHzVnO6uVjJ21B6hsqYR4S
         qcuwjN2HSSKDLVDFQ7iWGhtnyCVbGO29QQUTH2Y5lzDBoqzrlltVwZQwY0lv4KTxuTCz
         7kjA==
X-Forwarded-Encrypted: i=1; AJvYcCWuhcmWcAmoq6Ad+kRE+ReA6hmeYyjQdqYWLAkpcleLS4UlO4f986+uqQAZZO9rL3O6IM3cIZiWUrwl8us2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc/XeslGQvWwrVFhnvqbqAiHvdGwHKHu7+Y/WsqXBefyslL5a/
	uiK30xH8tMBwBCjTeWFI3KcHG9cc1bjObbWxjLd5sidQh/HbRHaToJgi6ZtoAgwBkO5IrRh1x7G
	bpsg=
X-Gm-Gg: ASbGncuHyZJpMnh60K3YS9p6v4/jhB7fG9aPKiydD35Y60rjx1E1rJNqG/UlLx/AzF4
	RCeg0qPnm8J7hsEYM0JdkQ04bKayHXdgrEMKDUC9rQtLlYf+lPdTMeAEMMPIaUB4kJ0HVHMqktb
	BRXxrixkm3cNNpwmnBg4Ers7Bh/LwnxMKrvusGtWiN5lOOz5Kzgq6uuGo/CrqzM7Il/JPIpkn1F
	K9XkshOXpixoTYDn9pv4Zyx9PvtC0XxzmAuiGMklJZDEtqdnnmniq1U2FNUGngTMcPg/6T9Lmne
	BwU5K4Tm6j+s1aKW4YfMNHBtPm43/65RSu485ub6QX1Zvzrm8NQ+zF1bM0ZWn0gvFg325kVG8PL
	Mcss/r9uUkJCfrqGxBbSaG+KOa5dV/C1UeOfWFYIQFRLeIeXXZGVNKm5J8sqqeA==
X-Google-Smtp-Source: AGHT+IGYrSCfc5bYR/7nsuQauy6HrXTVHyiIJVSHvVnDRE2QtSgYTNpnl7iRoPK2Aoj63E60A4suAQ==
X-Received: by 2002:a05:6a00:ace:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-74ee3629862mr22405015b3a.21.1752523697695;
        Mon, 14 Jul 2025 13:08:17 -0700 (PDT)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f46479sm10973786b3a.109.2025.07.14.13.08.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 13:08:16 -0700 (PDT)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31c38e75dafso3975425a91.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Jul 2025 13:08:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQU9KCDiRoyyDI8eGVuVhhfkO7cpEOhpAdyoP1JbLN5aJ1F8jQLfvt9IcGflXp5+AebiHxy1VwcOoWHCtB@lists.linux.dev
X-Received: by 2002:a17:90b:5645:b0:312:26d9:d5b2 with SMTP id
 98e67ed59e1d1-31c4c972577mr24053371a91.0.1752523695994; Mon, 14 Jul 2025
 13:08:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506301704.0SBj6ply-lkp@intel.com>
In-Reply-To: <202506301704.0SBj6ply-lkp@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 14 Jul 2025 13:08:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmY1Hm7H9R1uT3nAcWOC9XFYA5YZUFWj_-xZTX335ZNA@mail.gmail.com>
X-Gm-Features: Ac12FXw2vJl6mE_r2r8DlAbddESOYuqs5UPn3qfeXrUhF4FOOKAlHOvJs75MGjg
Message-ID: <CAD=FV=XmY1Hm7H9R1uT3nAcWOC9XFYA5YZUFWj_-xZTX335ZNA@mail.gmail.com>
Subject: Re: drivers/gpu/drm/bridge/ti-sn65dsi86.c:1376:2-3: Unneeded semicolon
To: kernel test robot <lkp@intel.com>
Cc: Jayesh Choudhary <j-choudhary@ti.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 30, 2025 at 2:14=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> commit: 55e8ff842051b1150461d7595d8f1d033c69d66b drm/bridge: ti-sn65dsi86=
: Add HPD for DisplayPort connector type
> date:   5 days ago
> config: s390-randconfig-r061-20250630 (https://download.01.org/0day-ci/ar=
chive/20250630/202506301704.0SBj6ply-lkp@intel.com/config)
> compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146=
a88f60492b520a36f8f8f3231e15f3cc6082)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506301704.0SBj6ply-lkp=
@intel.com/
>
> cocci warnings: (new ones prefixed by >>)
> >> drivers/gpu/drm/bridge/ti-sn65dsi86.c:1376:2-3: Unneeded semicolon

Posted:

https://lore.kernel.org/r/20250714130631.1.I1cfae3222e344a3b3c770d079ee6b6f=
7f3b5d636@changeid
