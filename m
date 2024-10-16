Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81201D415D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729116633; cv=none; b=ND9j05nCZ/yUzZ+VVEUTBigAHO2j70SD7qDuWREsefsJAcXD8tpEn3WZoaKAadRnMaGpnXQUZNPmPYsSY0faRqwVNVBp0vkN6Ia4IZSaUQpWjA2TeTHkvEbE7wcuY7zzxC7iFpPE0W+fqCsWdfjD09tT7bYm9OoglwdDKhpknLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729116633; c=relaxed/simple;
	bh=9vVA4Agfm0WSbaBtQ7P8QVyvTZdi13A+uushqRFcJ2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNVWGd268UTkjoaYmoSTg/TFzWPhkX6+hwJiVFb/drFOXWzXLAy7oDLr6FCliAloUM69upRls+P2g4yfHKxz49VxeXQVlNkHMIFV4pqZjmiTcx1GCZSMmdi+YCHplcvIJFaZVBFaX8qlBKV8baeEx2cAkVoBUQwGG4YU1NnZfBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uoLunCYL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uoLunCYL"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e66ba398so10013e87.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 15:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729116630; x=1729721430; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXS/2y3cDHrS1yNVghWeZ7jeBDzAVXN+tv3JZQz7G6o=;
        b=uoLunCYLb8l9nDlnf/zhT3wHFDO/5B9FdqqR4SF+d6EXlKp9OryK0T24uQv37VYIBZ
         RhMKl79Pg/h6ZAD0znF8ZlBc0/G1wjubQ9D4w53o4Wv4dhf3IWh+vLjYLrG4t95DZXza
         mf6rHm2V8B7Z4DSby7O/ZNf2rj8WhkohzS/pKi5wLneiMXMdvpHpCeACcvm8K4edck2L
         qDeYWV7KFIAWzJY3Y5N12tlJa/oroS3lwdGxIcXFBghPmlfWfwA8od8k8Z8FZUEe+69e
         20BOqL/3XFk+W8VaAgiAd44T+Xe4hWUDdyAZSRTbKYLFbuteS2cX4JTy3HgrnsDaeP9Y
         8zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729116630; x=1729721430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXS/2y3cDHrS1yNVghWeZ7jeBDzAVXN+tv3JZQz7G6o=;
        b=arjAxjGM+b7qqNj2+2tO8rd8zR/f7LrztfAcZ16pw65eheUitqteD2FPsX/8KYt97L
         RC6R68ZRNPGHE2QXhwsKPiVNlRVypTHH68IspEgByTLjVaaNHOYsOWzbe/HTs3pyR5tN
         /55EAqsnikySko8qQeILA5eU6djyTTiVFVcuBesslu+12BstFsUC5YrRbwCl035ghnjN
         tFMXwGfWwen5HExCkCV5tY27QkUhmoJTg8bkiDXv0BLxKQnO5LjdIydi5NM6Y4G9qHDv
         bJ/vl2JTLVuMj3V9QKjsJAvOShGARVe+ofc5KOqKY6hSVron6sn2SrwkizYeSlNii1Vb
         lopQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnBdTqDCdwpRm7ptQVR3B1n0U2T+67qnhCaOMu/M5Blp3pjEVbx5ompqmw7eki04cArtvU5qOoFYqgbpfI@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2EMLRJ4SdafM4zK4Qh0yEXY9OBjUjqX8N4wPJcH9peywhw1NX
	pUXLJ4j0FwZLUYsW5QKahkLZaX/yV2Lw5snn1bz2TaA7Jubq9qnSzWaSb8Vu1yfGTRYElpjKVkr
	kXH4UiYzf62mIFQHRVkvNo4sCHSBtyMvDrm0y
X-Google-Smtp-Source: AGHT+IGid7az1jkIvwZA3Kt0ZPHkpN0/0Zlh1FYVlYC6ShT16mDxfQbgPQEzXVlyZjm46CayfSlmNAItLI3mX+IGBUA=
X-Received: by 2002:a05:6512:3b8c:b0:539:d0c4:5b53 with SMTP id
 2adb3069b0e04-53a0d20607emr137084e87.4.1729116629349; Wed, 16 Oct 2024
 15:10:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241015-comedi-tlb-v2-1-cafb0e27dd9a@google.com> <202410170234.hthSWOJg-lkp@intel.com>
In-Reply-To: <202410170234.hthSWOJg-lkp@intel.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 17 Oct 2024 00:09:53 +0200
Message-ID: <CAG48ez050bFWVkVJMzG8b-bCPORRoZ9g=OKYGxS9S+-rOJD6Ng@mail.gmail.com>
Subject: Re: [PATCH v2] comedi: Flush partial mappings in error case
To: kernel test robot <lkp@intel.com>
Cc: Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, 
	Frank Mori Hess <fmh6jj@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:36=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 6485cf5ea253d40d507cd71253c9568c5470cd27]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jann-Horn/comedi-F=
lush-partial-mappings-in-error-case/20241016-022809
> base:   6485cf5ea253d40d507cd71253c9568c5470cd27
> patch link:    https://lore.kernel.org/r/20241015-comedi-tlb-v2-1-cafb0e2=
7dd9a%40google.com
> patch subject: [PATCH v2] comedi: Flush partial mappings in error case
> config: m68k-randconfig-r071-20241016 (https://download.01.org/0day-ci/ar=
chive/20241017/202410170234.hthSWOJg-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241017/202410170234.hthSWOJg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410170234.hthSWOJg-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
> >> ERROR: modpost: "zap_vma_ptes" [drivers/comedi/comedi.ko] undefined!

And this one is also a nommu build, so I guess it's the same problem
as https://lore.kernel.org/r/202410170111.K30oyTWa-lkp@intel.com even
though the error is different.
