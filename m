Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B1204F94
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Apr 2025 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743954279; cv=none; b=u8AHxKsIdunDtVd2u1YoiCh0Kzm0KXkOKHpyr7l3Nj8ca7mWlSrCScszIvffATWiT0sJI/zP8wh2BuNgwQAO5KsWN0Jf0SxI1Dg78DsxByaxpq3/wnH0YFPyoBweD2daf059MXjQCw9HsuMrrezNS+rUs2j75dQfD4mbKTaNuNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743954279; c=relaxed/simple;
	bh=mRuyL15+qfLzMNbTcIm5SD/CsOWjFFN4b1YWiNAxILM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=excJLIoBNG4dkOmPK/03T+J30suucl9EkUQ8EUp5bH1cwf/k3ZOchtJ5PuE6J8xOKWX4uJ9Czi7kkYyJ32n2WAb1t7bKDJWvnMTbRwWO2PXxakA/x/Yg8YBXCDaQxI2z2Ktp41pOEN7HmeeEBL0pwR9g/FIrniQ84MFvfkvWBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PelZCHMI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PelZCHMI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54b10956398so4179067e87.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 06 Apr 2025 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743954276; x=1744559076; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRuyL15+qfLzMNbTcIm5SD/CsOWjFFN4b1YWiNAxILM=;
        b=PelZCHMIRDtjP22ySJCVm8B9QpwZj6DWBP7eKAVlL43PT8VBx8ZontfBItjxqnJ9Gw
         lTNyNDcB9eXBYYeI94sysoq9OHznd+6NDaf1D2CbyiIbBwMnKVqq4RDHEVwUko2G5G2e
         4OE3ZeoQECcXV4oyqtWoY89W1K/+dGnUsv5Bd4zztbn/IyZeysPvWVqc7tFF9CSgX8q1
         FKoUXqG4jDWJ5xqQ0QjU9b2KuQ/z5kuvuPJOm/yTbEQEicirG6JwWv+UYBfQ7JNq9Wzz
         l1JugvsQB3MUoFWZnYcbGELX1BARMzVemV9IaVOi6D2dg22XH0ikxCGbZfhFKcaHETY+
         E9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743954276; x=1744559076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRuyL15+qfLzMNbTcIm5SD/CsOWjFFN4b1YWiNAxILM=;
        b=wHhLrBkA/QF6sfHmFpJjsLlOamHZqcBNwopO6xp0jMKemsuD+CtPn+rGoU9Q+lK3pW
         tpKzvtX8s7gz/EWSfJozOsndV/6C46cSpkbgfqb4LcjdS/AdNu8FMeifxBhybugpJ1k1
         t5outMlWUcJ1Gi4g5ycbWDYcf+L8CFnSzYoactFonuQghIW0ZJ9eO0cdby2T0nG3Dwuh
         MBcpw7a6gOjJLGjV4paEGipUV/nYIFxhD4pTfv1YyRiwC2T3nSdsGJfnZ+cuZjMgjJXu
         m3vkIJTBSUWDCZkXVHDu4VTMfW6Rlec0Ib0/SXlaGgzCxS35NlKLsLKOYovutG1EDCT8
         oORQ==
X-Forwarded-Encrypted: i=1; AJvYcCUO/H7dxyGNeuc8a4ZyHG+ig2MDkwv2so4vkZTvLGhFifMUGZujfroCS5Dw4uDWGRrwjSZFNlLS9N/DQviu@lists.linux.dev
X-Gm-Message-State: AOJu0YxxLsESMy7FI571z27ZeHSaTtJH53bz0H6XUoYhbfJFco/l5rpC
	utIR6tQY3QI0GDC9ms9ihMPhwlYPiitNBTtHMC2OlxCtepGI085eLwQTogpz35uqzxNvS/f5Ht8
	eNRc7TECYADKKp5zFzCdLRIGMNdQ=
X-Gm-Gg: ASbGncuKd4h9LJ555JRsQ1ewTsHAf8V5ZjbDDopTHlMYME+BYyt2DEWPJv7/DesQ2U5
	udVNMpNKvgL847IXj97PNXKZG9ClJVSq/beOcaHB3pcATWOG8o3bBOIJMZbhtdzeOc5p8QTmwFy
	JY7oeuP0luz2rIeAphUXP9CxquJg==
X-Google-Smtp-Source: AGHT+IFceSaAdyYufyeFbKbAvYTBtafKZvM8ofa1LVQWsEdrtJ87b3IMaK2a0PxNrLdT6TA2TJUO+eBJ49WTTNpdwjA=
X-Received: by 2002:a05:6512:2c06:b0:549:5dcf:a5b with SMTP id
 2adb3069b0e04-54c1ca56dcamr4757493e87.4.1743954275907; Sun, 06 Apr 2025
 08:44:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403094527.349526-3-ubizjak@gmail.com> <202504040855.mr885Pz1-lkp@intel.com>
 <20250404015112.GA96368@sol.localdomain> <CAFULd4YrG-7DCXabke+uuLwLw2azciogG1nPGeAkMxLACw+0og@mail.gmail.com>
 <20250404190923.GB1622@sol.localdomain> <Z_CH8RAVeqTlPrDO@gondor.apana.org.au>
In-Reply-To: <Z_CH8RAVeqTlPrDO@gondor.apana.org.au>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 6 Apr 2025 17:44:24 +0200
X-Gm-Features: ATxdqUF4kX8kmgSXt_iaa2Q_MvGc0jI9rBv_l_3wHOV_WU6e8tFbrz1LjdqD1wI
Message-ID: <CAFULd4b838N-tkDH3Yiv4W1Jtee+wd1Ypgs6OC6o5PtnsVaFpg@mail.gmail.com>
Subject: Re: [PATCH 3/3] crypto: x86 - Remove CONFIG_AS_AVX512
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Song Liu <song@kernel.org>, 
	Yu Kuai <yukuai3@huawei.com>, linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 3:32=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
>
> On Fri, Apr 04, 2025 at 12:09:23PM -0700, Eric Biggers wrote:
> >
> > $ ./scripts/get_maintainer.pl lib/raid6/avx512.c
> > linux-kernel@vger.kernel.org (open list)
> >
> > Whee, more unmaintained code...
>
> I think it's maintained as a part of the software RAID code:

Thanks, let me repost the raid6 specific patch to listed addresses.

Uros.
