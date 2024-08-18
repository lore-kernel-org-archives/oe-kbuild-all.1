Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87414F70
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 07:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723967173; cv=none; b=SuN6JGEb9QA+ywOtYAofxnNo42/+Qc9Q0VyxyhE/hkU9kD/TBy2ElZiKtKaFC21G2VWDSduCRj8ryw9dl8JY8yqUCvFsv1tuKPd/W8tveRAXIrMOatO1Dk34+GZkzQMbFZlhn7g4FsmNshlm5XLjoXV+lYNiEQGW800jqy/Rn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723967173; c=relaxed/simple;
	bh=W/Lm7KrDHEh0rrSBSpmWLY0Vn7+mnzELkdlqyf2K8Ag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QlqX+tbCU5h9J5Ua6kYbBXBqkeEvPRBJ8vpwg++7UaqDcZPBq4J0M9r+3RMdWSX1EuEgtVL4BAcVQ9+QJ6Jxy3IdwAHNJ4lLwNQ0ilUxhQEAa6gd0wFbqAIb0R7Ixmh9O4zCezdgh6yKB77ezCqpXKkhsaj4lBkXJOpKpSctJ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jtvhHhSL; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jtvhHhSL"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-492a09d4c42so1216427137.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Aug 2024 00:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723967171; x=1724571971; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAvjJXjZn/M1UFHTVDjEXTa7UKeEb5l9wox/vLEuT9k=;
        b=jtvhHhSLcb6MFPwgbmXPwNk5D2VR0XtWM94Fx0m4FjP+34uw1KyjEkESW5GLzvzLsC
         2jp6945cntIkbnITxQgQh7Yt7A4yaXPAh6fyKvqMMNnqtwQr2tM3tgRM6I6dRSzBZZEn
         aKqOI8jsjb22SedDNWOtfjvgudvl7gE8ZHq3aKA/yaRahDJewk2EkW//aoHipM83PSR1
         rcUHIgrfnCN97c30AzCW38L6ICxH/EC1AKifWaQMwwv3SUJjTbzJSGnsC4naP9W4Cu1P
         5qPpLE/nSuBY+LQk2f8UmC3vLV3G/trt5qVoRdrj0mviqCEkT3owoNmGAsxML1YwxiBZ
         tAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723967171; x=1724571971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAvjJXjZn/M1UFHTVDjEXTa7UKeEb5l9wox/vLEuT9k=;
        b=AHKbeQTybVWIuh+sbkPHTTPNaM9ZiUqB1VjFR00JUdc4Gkx02H4v/MtV5Db8tedpuZ
         xEVt3bBob0X9mse2R9Yhv/5YEEjcBmoXbas+7PH5xDSeC6GOuXtVsp78VM7BCmAJlhZn
         btPea1tyYV7bkIY4gTW3vKzLJJT3kdvlg83X6M4y5xEwSV94h0l6bf4Sc0JnFv3DL2Gf
         Zvs4/SpcmipqYw+hdmya5wuDvRdgdjDA9tB7E+bIQHslyqRqv7VhQZ6hN4FvSUzYI9st
         afgW9Vy1dJHbJ+CWb6ZpGmepptPS08UX7vok5kE6KBw/h9oCLn43ikorgBx5sHt3KhWe
         2XHw==
X-Forwarded-Encrypted: i=1; AJvYcCWe5t35BGX82vjyoHmUjMO+IXO+nAXfumCYwPOn2NkW9lvwhFelSAyQ56JkmlqNz9X2mAnA9sPk3xzQ1nYZakrvBLiyXTAZj/se+PHhlA==
X-Gm-Message-State: AOJu0Yybtfdtjuii9TPAoKzYIDvCnETE0mn7Z170PFy1i32RkahZhg+U
	ghv+G8h/VTUNtZZbK9SY0kSnFXTy1K01qRmP/3/FVYpB0wcTbIqX8M2XtigsJMSQO7Q7wx6jAmf
	cZHXPcC90jvxSDJiw5jvzkM404Q0=
X-Google-Smtp-Source: AGHT+IEKL4gMV3p0eKY4nYvTpM8TFYfkrNVFvtZvOsrm4kDB/YSfYSjZJMAPikLTM43m8TmeDSsf7cL+f5RZDwa2ZCc=
X-Received: by 2002:a05:6102:370d:b0:494:560b:6c07 with SMTP id
 ada2fe7eead31-497798fa046mr9382717137.16.1723967171177; Sun, 18 Aug 2024
 00:46:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817050921.18462-5-kanchana.p.sridhar@intel.com> <202408180729.M6uZh634-lkp@intel.com>
In-Reply-To: <202408180729.M6uZh634-lkp@intel.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sun, 18 Aug 2024 19:46:00 +1200
Message-ID: <CAGsJ_4ye5f9Jecr4tH0hNwQAbCytDM99S9t=DCNK1G3-aa22-w@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] mm: swap: Count successful mTHP ZSWAP stores in
 sysfs mTHP stats.
To: kernel test robot <lkp@intel.com>
Cc: Kanchana P Sridhar <kanchana.p.sridhar@intel.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, hannes@cmpxchg.org, yosryahmed@google.com, 
	nphamcs@gmail.com, ryan.roberts@arm.com, ying.huang@intel.com, 
	akpm@linux-foundation.org, oe-kbuild-all@lists.linux.dev, 
	nanhai.zou@intel.com, wajdi.k.feghali@intel.com, vinodh.gopal@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 12:04=E2=80=AFPM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Kanchana,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 7c626ce4bae1ac14f60076d00eafe71af30450ba]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kanchana-P-Sridhar=
/mm-zswap-zswap_is_folio_same_filled-takes-an-index-in-the-folio/20240817-1=
31053
> base:   7c626ce4bae1ac14f60076d00eafe71af30450ba
> patch link:    https://lore.kernel.org/r/20240817050921.18462-5-kanchana.=
p.sridhar%40intel.com
> patch subject: [PATCH v3 4/4] mm: swap: Count successful mTHP ZSWAP store=
s in sysfs mTHP stats.
> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/2024081=
8/202408180729.M6uZh634-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240818/202408180729.M6uZh634-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202408180729.M6uZh634-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    mm/page_io.c: In function 'count_mthp_zswpout_vm_event':
> >> mm/page_io.c:178:17: error: implicit declaration of function 'count_mt=
hp_stat' [-Werror=3Dimplicit-function-declaration]
>      178 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_=
ZSWPOUT);
>          |                 ^~~~~~~~~~~~~~~
> >> mm/page_io.c:178:53: error: 'MTHP_STAT_ZSWPOUT' undeclared (first use =
in this function)
>      178 |                 count_mthp_stat(folio_order(folio), MTHP_STAT_=
ZSWPOUT);
>          |                                                     ^~~~~~~~~~=
~~~~~~~
>    mm/page_io.c:178:53: note: each undeclared identifier is reported only=
 once for each function it appears in
>    cc1: some warnings being treated as errors

i believe this has been fixed by Ryan's latest cleanup
https://lore.kernel.org/all/20240808111849.651867-2-ryan.roberts@arm.com/

Kanchana, is your code on top of mm-unstable?

>
>
> vim +/count_mthp_stat +178 mm/page_io.c
>
>    174
>    175  static inline void count_mthp_zswpout_vm_event(struct folio *foli=
o)
>    176  {
>    177          if (IS_ENABLED(CONFIG_THP_SWAP))
>  > 178                  count_mthp_stat(folio_order(folio), MTHP_STAT_ZSW=
POUT);
>    179  }
>    180
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
