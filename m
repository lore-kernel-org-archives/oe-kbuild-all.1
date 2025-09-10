Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787169463
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 13:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757510162; cv=none; b=Lum1s/KLXO+ibrCJAfEpyiEBRZgiP8/1gTkje75w9O5D03R1Sj5bjLk+1BYiQ2PIOj93aRrbu/bvuavtbgf8R2lxhcKkdxRJqjodMYuJNHjVZR6T4313pibr45hV5pMjvewpSX3l6oj6Z+uY+pp8EubUTkipSWTx/h1vC9lCslI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757510162; c=relaxed/simple;
	bh=yo7Oay2v74xec488RZqxezoj+sNijMpCAf5uHiFSGPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgAt7/+3Kb1A2vFpDAgVFcwB7sDcqH8HEwfrRDhVMtQO97BsgztuIqrJ6pQPS78Gip0gdeJ1NAUH0Z0WscpVOaHQVliyBs48BNs38qVlZ2TXCDGwoELJ+x+WVwxF/R7537LNYmWKdjG/gCEwYz2Znl/a1GzmIGD5EatP/bU0gIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SGxWM43S; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SGxWM43S"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso51145121fa.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757510158; x=1758114958; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Peu4zI84KpRcObnkHpqIQWTW+16o2UvKwBzcfExZiyk=;
        b=SGxWM43SkLPeR1XqzaIx/TugBtefvTu1b0RTk2YujDQnZylTA1CNKmiHAYOn1hzcna
         qamhI+MQavGs8t+f3BrKmrbq0AS7CjFGEIQ++EKNe14noLtWPLjOKf1HwpPO3oJqOhjf
         MqllD/U88SkGDHuGcmEJHjDaKboUh0CP9jn+X58Lpxzub7lcW6RLTi1UaOR5EU9MyJ7+
         V38tpAEV9qHxxMQY1aYJvaB13lnqSYe//XPEulp3cxlceZgRT/soT0IvkQol5fZqpF3S
         bNXr50t9bHm9v9nUNtvR5DKkHJvqjyyVSEfgNDWxli+R73jxzH+EUl/aDbR3SzMD9Gm6
         BPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510158; x=1758114958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Peu4zI84KpRcObnkHpqIQWTW+16o2UvKwBzcfExZiyk=;
        b=t65MjatOSxwuz//09diPEN3DeDeilDT0wblPdHOArhoDSu2iQVkRtmYxwNk0BkpQzW
         QsgrWg4f2vN151PwLQfkuvW77sPHbr/hsk2slfJxhaljETuk+7ozgUApOfRv5iznnngw
         WYHrmwyuhellAfMNrZXxnJT3E5h0K84vZcOZMuDG3ta0izsLYC96NAdXk4m+sVIoRWQW
         qKid2XsWhADE4gyKEQrMrfrsOEiXghx/+0nZbgTaIDiI+u7EVByQsPK9WzCaEgh30I13
         F7LCnfgCLgzHkaJtk1QpMoqX3+4e30t7TQghh0JLxZMonJBufon3vllFfhQyG68YbJt3
         9aQg==
X-Forwarded-Encrypted: i=1; AJvYcCVxZGtDnAFRXACU480gRdkUZrTJhMpSGk5A01RSXOG5tPHsBHYMe1x7/HMwbWbGxm/XiPNLGpdf3NRyB7+D@lists.linux.dev
X-Gm-Message-State: AOJu0YwZgUnBk7YBm5JhWIyx9YCKZGDNhb2Pnfss6bY5UB77Cyc7HHbs
	OF7zRLFd3qvRVBAP60xwpFcE0qb/de5Vx/aabmgmwz4biyW8Qq6Kz0+jP0W6x2KIGbl+8PHN4RG
	gVXtsZgPmp51g2EZg/PT1y7LFrl9XmiDTWEsdVlJGJg==
X-Gm-Gg: ASbGncubGYk7g4Y+U3Gv4bUwMKmvaFOtM9JrQa4dxAwuP+NW5oeBxJd7JZ8MGuAJxVt
	eGiy80Sxuokrz0/AtCtS93IhwZeDNO/g+6k8wja6zBYt7OmzLhC709imKx5sWM4zlELlHebjmmd
	FXuDzEUejmnAuVMuYdjmXuCsummS5ybxlTICmbc29RvkMb7g8UyZgBFdDiX+JUkxHGyzt9x02rY
	ZN7bSqPGrvsWWkDZTNUHaPqBkDb1scvIJErYxJeg95ko1EOkw==
X-Google-Smtp-Source: AGHT+IEnayP778KTGlDRKFGcnE7OiZz5Ap6nrCq5CUhddnBoMttgXnm1cRJ/L73LzdvJ7nxyXI2sQjhe/45Ih3WDiuU=
X-Received: by 2002:a2e:be91:0:b0:33b:6384:128c with SMTP id
 38308e7fff4ca-33b63841617mr51366531fa.18.1757510158259; Wed, 10 Sep 2025
 06:15:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908173804.3816149-1-mstrodl@csh.rit.edu> <202509092305.ncd9mzaZ-lkp@intel.com>
 <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
In-Reply-To: <aMFzTaO7zGVgWNRK@ada.csh.rit.edu>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 15:15:46 +0200
X-Gm-Features: Ac12FXyQUcE4PEKS9I4klpj25TQWTsxm52DQhqCNvgW7RhiFrEgsQd7rQ7d9w4s
Message-ID: <CAMRc=McBdJ16RYvJM_R7pL+u3zcs_+A0nj5_5twP7KxWhW6VDw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: support bryx radio interface kit
To: Mary Strodl <mstrodl@csh.rit.edu>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev, linus.walleij@linaro.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 2:47=E2=80=AFPM Mary Strodl <mstrodl@csh.rit.edu> w=
rote:
>
> On Tue, Sep 09, 2025 at 09:32:09PM +0800, kernel test robot wrote:
> >    drivers/gpio/gpio-mpsse.c: In function 'mpsse_ensure_supported':
> > >> drivers/gpio/gpio-mpsse.c:211:25: warning: format '%ld' expects argu=
ment of type 'long int', but argument 3 has type 'int' [-Wformat=3D]
> >      211 |                         "mpsse: GPIO %ld doesn't support %s\=
n",
> >          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
>
> Oops. Turns out this is m68k-specific weirdness. v2 will convert the
> result to an int and use %d.
>
> I'll hold off on posting it because I'm anticipating there will be some f=
eedback
> on the actual code changes that will need a revision anyways ;)

I cannot really give you much feedback because this patch should be
first split into smaller chunks that explain what each change is
doing. As it is: it's so complex, I simply don't understand it and
don't have enough time to try and decipher it. Please try to make it
into a series of smaller patches.

Bartosz
