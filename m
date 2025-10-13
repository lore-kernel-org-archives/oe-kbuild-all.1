Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB11310779
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369794; cv=none; b=IUTEe6WFBQZjP0qronbAtrRgbAj/p59KB4gco36uCJQ/+ARjAiClJQmQG30Qr7dyr/28I0cq4X/xXKATo+BF5jzrzvXwv/tkaHzFKCgqb7Fdt6ZKiXCcZY0bZdlFUz88BKr0o2JBEqAVdTnJtOtyDWTDzKAON4Fng7Jsm/C+kZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369794; c=relaxed/simple;
	bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVciDuRgmhH6n7st/b73MFUtlJfM9NEDVX8zBxdwLkuQP1mBjU+3hU02ko8Lla9MSq2HNd7/TllKNrCcfoGasWLKG7zK75gc1Qf61PKcuD57X2yNv2oTsARJpxFx8yhjVtOEs1S4NBD9oHizs8b+OSKAPSin8mxBrStw7+GGgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t4AdJXsS; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t4AdJXsS"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-57e36125e8aso839118e87.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760369790; x=1760974590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
        b=t4AdJXsS47otGZR1U4IGyy/ep1NmQFRMgybJ/IaxGWXvrWux4uNjK56R0mTZ1dFIhC
         xSV+HvvjF8264frXRSZxA8zXOTi6hRDTuwAjvbI0gO5uNNAg1PlbQNJW+a6UFONRWtdC
         o/4Yd9rWLeHm+TXvHDakqjZtxsjWTkqlXZ9omMFGYQJBMjeoeZp5wgMRUyFYGh3RTRAO
         oc3k8klZIdpz1jOCLRvDjbhu7G9UwGNKHI9QTZlUjEBmqq5D2kdP32ZtUMWdtw3W5/4W
         uCqqKZAphMX/6en4I2W/dAKk5FjVuDs0vL4ODm3S2nGxExPlQHOaXP+tXThr4VuX9w8J
         0Uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369790; x=1760974590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/34SsKoG/6bV6uURhJVsCgg19owKXxRxZ52oO599XOg=;
        b=chW7DAvQoT2JelQY2v/7rec0YxuLOdxnZtf1W25a2wdompt8zSO9jw6gVkCLlfOwZ4
         M1acx38VY/9Sr8/nW/qGhkip0CHyP1qTV0EAs9MVObc+zNsWIcFAXkqvTFpUV7k7i7Tq
         1LAAeFDDukxGrH8tgnZ3myV0W5eCm+JT3+JOGZ/GDCr9NcNroLv7U4nmbsp1mkJLiuQC
         vFRHt3vOfo+lAvFKApU6CbPyQvX/wjRXvu7UpJAOjgRfMamQUxjN7qNbGJkOOyinVLvI
         xmmkEdZYoe+bNXQSBzwfMIP6YMJU+q/YxBdyTtWr1kkz9YQE2+2wEf+UTnbUkj3AOXCm
         GzTA==
X-Forwarded-Encrypted: i=1; AJvYcCUfwj/N7aPY2GJ0C36MEEwwex9dXVUqt+nsqRYUoefVoWCJf5qM7CJu3SnuaaI/dhgoMMKmPf1Qlb4rtzcd@lists.linux.dev
X-Gm-Message-State: AOJu0YzhW7e3MmjGQMxB6BmpMMpA4BudJ5HnEpIwPCfM5COhFKeyMDZv
	287nfJCCRfM4PJXfZUlxc5ofwVj+7S+IMXexRr+lnbGZMtK2Ocl0q2CsCAEIgOh58NT3TOXlKLH
	Q4ghYzirdk4Mlgqux/BOa8xKMhokGaaqfEdFjk8/C6A==
X-Gm-Gg: ASbGnctEl1L+3Qxpsr5FCC65I0KLmlRxLZqdCHNe6QAJGHos4SB/FaG5QVOmQjy13e0
	60+VO0E5IW1lpKBUQb4l71XRKAyszd+fdEX1cO1YcR28HETP3DTXOM3HDdaHFPVc3UQ7hxW1hzD
	Z2mclSMdR6n+Uee/zhHzwkHJI7qMj6IIVq6Ek+TnMe2RJliU3peTGDA0/JwDrg7yQFptruvgrU4
	1xsuuu32qvE5KSIWwW+8QMF+GiqBmy/4mfttFPQhLAhgeHMSA9hTXfK0Cz/tcvQoZ4F
X-Google-Smtp-Source: AGHT+IEuahRdxwUYdEe3j3t314tqJbvK3NPohmOLxq78et6HAw5OamSBWRf0ocCVmzW08vRS2Q98sONX0xM4QZnYHpA=
X-Received: by 2002:a05:6512:b89:b0:581:9295:1b02 with SMTP id
 2adb3069b0e04-5906dd532a0mr5076544e87.27.1760369790343; Mon, 13 Oct 2025
 08:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010105338.664564-1-vaibhavgupta40@gmail.com>
 <202510110924.dUQeeRV6-lkp@intel.com> <20251011122612.4fa7c97a@barney>
 <aOpAO7j0Uyo6FPcu@gmail.com> <CAMRc=Me2ABQUXVeHyfsDR-etyT9mdX-kqxfQDnh3msfZiS6ccQ@mail.gmail.com>
 <aOzcasDutRtw6JP9@gmail.com>
In-Reply-To: <aOzcasDutRtw6JP9@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 13 Oct 2025 17:36:17 +0200
X-Gm-Features: AS18NWCS775f_XPZ9bfFwHEq9JFeheP3CufCDeskY7F9RXxobjY-1lCptyshHG0
Message-ID: <CAMRc=MeGbFi10f94GmmAMyLqBWWw7VmPcjaXQWDEtFgS=hvWdQ@mail.gmail.com>
Subject: Re: [PATCH v1] driver: gpio-bt8xx: use generic PCI PM
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: =?UTF-8?Q?Michael_B=C3=BCsch?= <mb@bues.ch>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Bjorn Helgaas <helgaas@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 1:03=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@gmail=
.com> wrote:
>
> On Mon, Oct 13, 2025 at 11:41:43AM +0200, Bartosz Golaszewski wrote:
> > On Sat, Oct 11, 2025 at 1:32=E2=80=AFPM Vaibhav Gupta <vaibhavgupta40@g=
mail.com> wrote:
> > >
> > >
> > > Hello Michael,
> > >
> > > Ah yes, this macro somehow got overlooked by me. I will send a v2.
> > > Thanks for the review!
> > >
> > > Regards,
> > > Vaibhav
> >
> > While at it: the subject should be: "gpio: bt8xx: ..."
> >
> > Bart
>
> Done in v4.
>
> Vaibhav

No, it was not.

Bartosz
