Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6711C175546
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718965138; cv=none; b=iM4C6HKxi7Vzk1eiMSz4ccqPXEREVnxT1tybzm+ShtKNT/ys8mUUQpv4vTA4vW/gw/AhiSarPcwyH0G7noFQdOIyr45xmeS4lv+JbXdI7cFXbkqUyYwV5f7gJ8GTWMUgBCF++Y1JcOHvkWH1GvBIu5lJzFtkFw2N8sjj4CuWFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718965138; c=relaxed/simple;
	bh=Irh6LKeHFMit3xI3LCk0mLIKhIax0dw+R2mZ1n2BkN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtuNkWDlLVbcXOP8+nF8IY0dL8REMZFW4rC1XgnGf+dw1cy9CZi701QW/eSMYVgz7xTNLeiTwxzE8DNOYrIyzn84mPuls9sS8xXGKPmGcz2mAwOIAY6c+TNUPnGxJXc+mZ/H7DA+t4ysE5sXwRn19bqzrl7MfAbw1v3mYZr89tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o3g7ug/n; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o3g7ug/n"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f70fdc9645so105975ad.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 03:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718965137; x=1719569937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IU1bg2dMVQ265vEPTNKmS8g5kwwQUrFLWWoCI3lVA/k=;
        b=o3g7ug/ntD/pkHYZrMmkPYIS6xCTE66UyfDOkoTQJs+c5bABg92HlqUwkNy9SJg5It
         EAv6rHGAHLB193+/cZHixD377mZnIIgA8PE+ZYndMNEZ0ula1aiEefZG3OzSyN2pX48y
         h8w8zMi5KjX7DYeToWwwGAftk6qspEa7BfXaolmCajfmrHTQiovD7Ka8AyL5lk1UnavS
         Y7uh009uw1CI8ljMdWwdFIddpn2aaKQKot8VwFVox4WZZMJTrdQVISKJazer1mdHCEfS
         YtzSeStWYCFyql5ubEvEnINMyc2Fm/2QPcVaKCzACXJ2J59JsXUYddc2bnWY1x4WHnDG
         x/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718965137; x=1719569937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IU1bg2dMVQ265vEPTNKmS8g5kwwQUrFLWWoCI3lVA/k=;
        b=JpxTfyx09pYMx/NIvCjmyRl25a/9TQE3fi2XxPTw5Q195rUdU8r7QbZalxBW7bmVvf
         3VItRIJKRuSfCkfdj0K1SfEURZamYvnqDGLcMCUiuN4x8azgXVmrUXOOcsb+cHwX+Ksq
         0vlZtzj7/y3TYA7bHa3Jg6xOda8JLXoC3+MfER8zy80BcK9OjZ573GVw+XhS2shnimT4
         7L5mDVU6vcQMKhkj11GiEmAPEmF0h15V3azJ9hsQ5gGDTSE3ABgvn/EFdk1TZ8mBqaJo
         6kwoOxbZmiA042CAJ2n96PaJUc3oTDSVteMmlM9ZdBZiIHU2FP5gMFHWarUxtZrc6VWi
         iL+w==
X-Gm-Message-State: AOJu0Yzu5kmv3QZVKEF5pabYwfZqQrkej+AVwCbVPPaxVQ1uxjkvd1od
	VgrZdOx9UUoACewXjVubJDV3D9G2IIxmuj4lTSp97H4jr4yOC1QxlvSsRKUreP+7RUCfPYti7gm
	ZwHSduZlPLDm7tufI/Fsd0uzvWcZECvcEWd9l
X-Google-Smtp-Source: AGHT+IHBJXlLTJPiymH4cuxAVsfUWreoKvT/nu29ZPC0PHACuKcDP0Sp21CPPYTfVUgc3FyAkwe3NO5WwDh83Ty4pvk=
X-Received: by 2002:a17:902:6a8c:b0:1f7:1c96:d2e8 with SMTP id
 d9443c01a7336-1f9e7f8a31fmr2557535ad.10.1718965136334; Fri, 21 Jun 2024
 03:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406201538.SMBucNWT-lkp@intel.com>
In-Reply-To: <202406201538.SMBucNWT-lkp@intel.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 21 Jun 2024 12:18:44 +0200
Message-ID: <CANp29Y5Nz_nf1HPfr_dY4Nrg=S6w0gJgWe0uS1d90GLDZsd0ZA@mail.gmail.com>
Subject: Re: kernel/kcov.c:635:32: error: 'KCOV_MODE_REMOTE' undeclared
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 9:53=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   e5b3efbe1ab1793bb49ae07d56d0973267e65112
> commit: 01c8f9806bde438ca1c8cbbc439f0a14a6694f6c kcov: don't lose track o=
f remote references during softirqs
> date:   5 days ago
> config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/a=
rchive/20240620/202406201538.SMBucNWT-lkp@intel.com/config)
> compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240620/202406201538.SMBucNWT-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202406201538.SMBucNWT-lkp=
@intel.com/
>

I was unable to reproduce the problem with the attached config/script.

> All errors (new ones prefixed by >>):
>
>          |                     ^~
>    include/asm-generic/rwonce.h:55:27: note: in definition of macro '__WR=
ITE_ONCE'
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |                           ^
>    kernel/kcov.c:363:9: note: in expansion of macro 'WRITE_ONCE'
>      363 |         WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
>          |         ^~~~~~~~~~
>    kernel/kcov.c:363:21: error: 'struct task_struct' has no member named =
'kcov_mode'
>      363 |         WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);

It looks as if CONFIG_KCOV is not enabled, but
1) It is enabled in the attached config file.
2) If it's not enabled, the kernel/kcov.c file should not have been
compiled in the first place.

>          |                     ^~
>    include/asm-generic/rwonce.h:55:34: note: in definition of macro '__WR=
ITE_ONCE'
>       55 |         *(volatile typeof(x) *)&(x) =3D (val);                =
            \
>          |                                  ^
>    kernel/kcov.c:363:9: note: in expansion of macro 'WRITE_ONCE'
>      363 |         WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);
>          |         ^~~~~~~~~~
>    kernel/kcov.c:363:34: error: 'KCOV_MODE_DISABLED' undeclared (first us=
e in this function); did you mean 'KCOV_DISABLE'?
>      363 |         WRITE_ONCE(t->kcov_mode, KCOV_MODE_DISABLED);

This looks again as if CONFIG_KCOV is not set (and there follow the
same two conclusions).

--=20
Aleksandr
