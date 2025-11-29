Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA36121FF55
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 20:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764447692; cv=none; b=nyE0p4Fxc21wUoETe5E2B4vf8W6JY/eKlbhhpA5/otG5TSfHhtsi0zMoM6IqisV0A1SYMCioE7ox1PKmuw5+ahsfNRZwjQzd2EtEGj1TpobGQXAZVg/G84R2fFpUKZ4g2I6vJmNAz0GjGsLZGcnptDPwuuKX4E0J2jnSoLlcIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764447692; c=relaxed/simple;
	bh=7da8x67zR6MolDbwSEJuqUZQzuCfTjbFirgHAuOtiv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHpJQ598c4VRWuhCSbPgV9+6s579uPTe9IRbVvpBnm/cvNbpwdRpfLYQouY6tQPrYM8GopHk5TfYX67iJdBH4DgVJhfWxnAIdX5V4fCp6TI/A+kr674E8heihCjqqLEeH34LKv0K6FQRYfyiirxpoCdRvMWjYaDqCvSuqByRrZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=jyJh8sG5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="jyJh8sG5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso5681142a12.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 12:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764447689; x=1765052489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XHR7HkGUh307NcvDolSi1iT1WNmg9xX4qNTaJW490g=;
        b=jyJh8sG5FBAU/q4qbWR09y1hM7CtY92Si4+RU3YVNvgqwxC+sVThVCnCZb3SWa/E0l
         ofogJWBN1hL+DlW6NrWPj4uyGRr8Dmse+IX1pE8Gg22vBV4R+Ph9fzt83vrvebzvVTtr
         8El6Uqg3oZHs0kpQojHOj3ilUYfBn0A6CkntTD6CH06QoSqnkWzaM7xeGcErjYwTHiGc
         bVz0xwY71H93HlMPVQiVnc4g2F/ymynA8vXkT27ZHtbRKvDhEQSXvFuD2HoDKIxn4gQV
         lbZtO/3zH+syGxcAN3RZWtp07MvEQQD3OehyyelxecTiq9sFbrP1SQEi1bsUJ4YsHNiD
         iKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764447689; x=1765052489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/XHR7HkGUh307NcvDolSi1iT1WNmg9xX4qNTaJW490g=;
        b=qieN4h23QX+5qYAN9hKkMuN8MswpyW66g2+0+SOxduSNO7Ee4tfBam7+pyHiXThrvQ
         PX69uwuMY7KW4mMb2mwzAUm6emgebHDWUfYH9qNPpoRAnDMOfqGzksUOFTtTpd19s8+w
         tdrxJzSv/Dvfg6O1JegaMG7O7ppvGyDwQPnhPZvkm0P6n3bIdeQMR4IEGPDN9Wqfd4we
         o0XARZ8Bommdks9AqnSv9K38zSlAkOAalmLT4b3PD879+/+qdldfUAwhhpuC3LQ2ICse
         BArBziaBycNyYkX4X6700Ibkt1XgHAHWtfEWcJQxiIaLa5IIFShAtBeU43hcgf9sdX10
         e6pw==
X-Forwarded-Encrypted: i=1; AJvYcCX8cvrNUZrIj/KVMnpQdKucBt/ZPSa3LEigV2cLytjKqJ8gpLyRzpaqWvTf7VbC3bGh2BSA0LGraDuGp5Rd@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc8oCYuqkhWYJ46B+mfddVj+uQt4o9VXqBmwnOdsQ9LpBqd1uy
	QCyiOLPDIP34BjWmWw5iNwHb+17YHzjJLOd+DeL9Of6fp1zG6lpRfS+INrF8/w+wZHAW373PWQZ
	ld92kXaLcACUsa8Zp3xo/8QkoMDb0jY/LQ6/q/oxIhw==
X-Gm-Gg: ASbGncuqrYLmk10FHcyUAafqMcpSJKgW6DYqIqcKpbqFY6VKal/w5x9NtwGVYu3Yola
	5leoxzLl+3hw7eCMwCk2vUnhVdXCWH2b/ofn1yCF7EaZ1/4fjW3ZMFzuPrVWz3G6mQTOYZeXiI5
	+pWbF34DPBQObxNlLc5DP2RJzvJN2qqhkJQrQF7qk24EjrocVcZI3LDHyCGOHHh4+UJ0t9X588N
	4uDbTE8GDxbBWbMBj7j3u1qH/nN1rz8Bmre4TgGxIp2FwGhF08dJLbtxTAF4GFwo3QW
X-Google-Smtp-Source: AGHT+IEL4C5AnQpblZ1dvvo+ajN+xWYGrZZ8Ar7Vxav7Gzlsu3+rsZciLM6uVqUSKHBwC7MdMFToICZgC1zz+1jAtMk=
X-Received: by 2002:a05:6402:1462:b0:640:b625:b920 with SMTP id
 4fb4d7f45d1cf-6455508090amr32009897a12.6.1764447689219; Sat, 29 Nov 2025
 12:21:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511280300.6pvBmXUS-lkp@intel.com> <CA+CK2bCmp4gjpyND2=Chdz-EfRAF20unYzO2dwQb+ZTEihgk3w@mail.gmail.com>
 <20251129120040.fb60e8a35d54d66c0bdbdf33@linux-foundation.org>
In-Reply-To: <20251129120040.fb60e8a35d54d66c0bdbdf33@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 29 Nov 2025 15:20:51 -0500
X-Gm-Features: AWmQ_bmWLua5FxNRY82NS-hj8ivGSs3L0IY3KtCuQNzfBMcPL-qi-s2DnemZlOY
Message-ID: <CA+CK2bBJmj3nK4QhAC5pr+5nS0vRv_5cOxAr_mohC+YreiZPcg@mail.gmail.com>
Subject: Re: [linux-next:master 12118/12398] kernel/liveupdate/luo_core.c:402
 luo_ioctl() warn: unsigned 'nr' is never less than zero.
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 3:00=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Sat, 29 Nov 2025 14:51:28 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > > smatch warnings:
> > > kernel/liveupdate/luo_core.c:402 luo_ioctl() warn: unsigned 'nr' is n=
ever less than zero.
> > >
> > > vim +/nr +402 kernel/liveupdate/luo_core.c
> > >
> > >    392
> > >    393  static long luo_ioctl(struct file *filep, unsigned int cmd, u=
nsigned long arg)
> > >    394  {
> > >    395          const struct luo_ioctl_op *op;
> > >    396          struct luo_ucmd ucmd =3D {};
> > >    397          union ucmd_buffer buf;
> > >    398          unsigned int nr;
> > >    399          int err;
> > >    400
> > >    401          nr =3D _IOC_NR(cmd);
> > >  > 402          if (nr < LIVEUPDATE_CMD_BASE ||
> > >    403              (nr - LIVEUPDATE_CMD_BASE) >=3D ARRAY_SIZE(luo_io=
ctl_ops)) {
> >
> > This is a false positive. The logic is designed to work generically
> > for any base, similar to how it is handled in session ioctl and
> > iommufd ictl. The warning only triggers because LIVEUPDATE_CMD_BASE
> > happens to be 0 in this specific case.
>
> This is a difficult situation.
>
> In some cases smatch has found a bug, in other cases it's just being
> irritating.
>
> I think there is value in smatch occasionally finding bugs, and to
> support that we should try to rearrange false positives so that smatch
> doesn't report on those.
>
> Perhaps there's some way we can do that here, without uglifying things?

Yes, we can make "unsigned int nr;" signed: "int nr;", should be OK.
Would you like me to send a fix patch with this change?

Thank you,
Pasha
