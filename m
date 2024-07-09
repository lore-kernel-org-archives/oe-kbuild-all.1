Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2415573B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Jul 2024 15:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538012; cv=none; b=nzvJgEl11N9kPtY3gbK79tvPWqUwjLLEKNnoNqn4pbUuiuezEYl3tbB5UcT7KiNI/+hwTC/3cioS3EIcXJDanlKtpCEC7kRiMRnTzaEK1S6Ae6K8Jg52SmQKO+8KTj4RuT28zAh89UMRHmAKK8U3oTNE/UBhaKBfGelnGk5A1ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538012; c=relaxed/simple;
	bh=Bv4GniJA/sj8UsDp9l+RW+trQ+0mazivTmVqArHdQLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gND9tamJKmulbV3QWfztPb1OzZDVekSKhvbRfXHy3p8KSoGMReDRwqtMltBujbmytMv/eer3AtKO5tpudrfXwRGsG3oeCYR7k97fiwbaGB5Dj+m9bAY/coqqnrLXipn4xYdrUl4doEV3xmhtwjAVyy+ePI1Y/sZ/BOTWVavpFpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=iBMBSNK6; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="iBMBSNK6"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eebc76119aso2568561fa.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 09 Jul 2024 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720538008; x=1721142808; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0+8oXKbZHWt9fS8V1upPHfv28NABY6xBNNKsQNZ9WA=;
        b=iBMBSNK6z2Evg+NUeMjLpvUqomHVwT1E8UBO1FBrv9ik/p8i8qQazARb74YAWa4jwZ
         /SS91giAcZaxrn/MNQCHGopz41fubnNZXf0mSuRA/o45dgeWni5EgatCva7Shz9FZtMJ
         iRR8OqBMSx29Gm345t7nFFdQ8LQSiB7pWN+YZgDsdnBKqdvaabIbVSYf1fgB+GCc+hzf
         xpiOy/OxUvTZKEPpljr+4o/rocPv8eG2Wg1u8J6g0Pe3BW6qPMUM2OKtutUslgQppznF
         NYF3L/ZwxsS/qFOPuuIYbX6VdhPK2pXHVsSG9s+MiqS/xXCQZH20lcY7idIcB+AhrLNA
         jH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720538008; x=1721142808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0+8oXKbZHWt9fS8V1upPHfv28NABY6xBNNKsQNZ9WA=;
        b=qqcj9ZtzCVcISImrGTI48EWyrIXQbRFy8KYaaEOQOvRu7CE7WRMA4cdvQZlbHwt39v
         jplHJXhJAl7VJpTznet7PTnNE9tir+cSM/+6oubLYHnzUPjOjxi7gxvRreWRQnrYK8sE
         3gFzitpDwdt4nhBgxOWGbqxYKE3hG+KddGW9hnZdlp2MaR+ijEPFTRV1R64GYFiC89nj
         xXpXhuQgPHRs1c7cWATVzdsM7EA2ZfHyaKfsdnd9W5JoKmW/4yptE4cjR6NznvzVmDzX
         oy4/VSIY0gwiAlXacqtNVI3lv4sqrYp6/fjuARxt/hhWTkeJRROJA8NxelooKMEBtdws
         1OgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJPdvH1ENOQ4mKZNaOR5Ux0KrT09G/7k0SDDR6JNFQVQY/wOzQG0wNaucc3wujs9yyDMbIEJlGugxSWsLOPQa7+i+mTBSeH4kt3O3AbA==
X-Gm-Message-State: AOJu0YwjvWTL2PWDnTcsQJPGbaHR0BGD1kU1RmdODfqeKaLrdEQrfMG7
	YNmuQMJIyPdLGZEseJSWFgruJTKu8U77vobltROeF6A3OBgMZ7zeTTO9GzgXKAhExHHM/1lJRUo
	FPWU2CmySSbacSUx0ithyEby2xU4sZ4eNkZjnvg==
X-Google-Smtp-Source: AGHT+IHgYMXg/ILH+Z1RFkRd83+nynSuzeIb7DgXToJ/UUOD4UjAR2FZCHBNgvwgAGTUIzwaSBYjtVIo+NzISepySXU=
X-Received: by 2002:a2e:9dd3:0:b0:2ec:51b5:27c8 with SMTP id
 38308e7fff4ca-2eeb3171537mr19395601fa.32.1720538008481; Tue, 09 Jul 2024
 08:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407092245.BPnW2mr6-lkp@intel.com>
In-Reply-To: <202407092245.BPnW2mr6-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 9 Jul 2024 17:13:17 +0200
Message-ID: <CAMRc=Mf_j0qTk8_q37uvbRyWHK_5M2D-dF_6hiELSBRGcy5KKg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 38/38] drivers/gpio/gpio-virtuser.c:400:24:
 warning: variable 'trimmed' set but not used
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 4:22=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   337049890b8cbbb4fb527c58976ea19f4dc747a0
> commit: 91581c4b3f29e2e22aeb1a62e842d529ca638b2d [38/38] gpio: virtuser: =
new virtual testing driver for the GPIO API
> config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/=
20240709/202407092245.BPnW2mr6-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240709/202407092245.BPnW2mr6-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407092245.BPnW2mr6-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpio/gpio-virtuser.c: In function 'gpio_virtuser_direction_do_=
write':
> >> drivers/gpio/gpio-virtuser.c:400:24: warning: variable 'trimmed' set b=
ut not used [-Wunused-but-set-variable]
>      400 |         char buf[32], *trimmed;
>          |                        ^~~~~~~
>
>
> vim +/trimmed +400 drivers/gpio/gpio-virtuser.c
>

Fix sent out.

Bart
