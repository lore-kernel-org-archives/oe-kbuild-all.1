Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07F4223DE9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753532651; cv=none; b=Y+JuC5PEvkFMZD5G0AhC6A4ejP7EZbqbg4W1wd733g+FlPOz2lmrtWjk81YL+YZYVqvbrCE5DiBSAWzqD1FL6Q7zM8A7kTK7xhcrj3VsZ5+i24kTAjgPQPf1G+Xo9rkjV2ltKtENGn0HGDFhyk5LRcRfH8zg+Vq5JlZr1xaNOKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753532651; c=relaxed/simple;
	bh=4RO+X0MCjEa+OKFRKc8CjfHHv0wAiDV9NUkqZ6BX2Ro=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZjSD6D1NrHEkv9SVyClkn8MYEFRKW/eshD/pBACJOnOD2I3EdcTVPoph9X1viMXN76yMbRlMLXd5dTAxDGGQlxYRC2i8Wru6DOaCv7cYFbPucuKjxRZedowrUWVYIE43K53qoiSCsDwufgLqd7yShaLOI7WEyhaJhZd30jknzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t4u567UQ; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t4u567UQ"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-55a27e6da1cso2483748e87.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 05:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753532648; x=1754137448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZamO6uSuYHqsGewjp3Z4H8PqpofAIlsY9yfSvX7Viw=;
        b=t4u567UQF0eHf4ZuJV0I5Ylb8GoBv9HnOdzVkFT7uncmINbvrQcBEtOT5KZtvVm0Kr
         BkaP1M9ABoG5O1NjtI2VPba4+sfM/nIFZ7qwO7C2mIRqKHxw6k8cQjL73C5Ll5YJ068k
         DOG3tAwvuBkafcg87Hsgz9rffdP1gp5j4BnYifj6T7sMwVe+8jphMOmnSfwPIyWtwcEU
         394vpIb++AkggdNSdpKWe3ufAf0qA23CwbSFDLEfd9plJnHXTSEF26ViZSPNZWuTVp23
         cT+eB6rfzQaB36XM4j3sCBnn2v7FNNRCRGgYpgsByRNqUEH5u3x6/bU3EUBWgk0i7IhW
         2Y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753532648; x=1754137448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZamO6uSuYHqsGewjp3Z4H8PqpofAIlsY9yfSvX7Viw=;
        b=WkQIVYFJMsz4tqsTRn++AtUBZH85jJiWmrTFI/+Llh4+tLrwhCgCSWgx53+3UGHMDi
         6ERnyqh+Ots2DLJd+DMYyjRTRwnSzLsxQ5zWIj4/YJQrYP0jd5XHCfXh/sAlgBNauvRM
         XBaUCEg6Bdf1DteoC77Zo+yNJbjcjUxJ5vODLjw35TSM8HG2jws+pmH4ODdX1cG7Ihma
         1msdDQ7uqgIOIA6JSYFEV62I4synJ12rPJKEHcLUH7yRIBmsHK/aBAD6HhGhkYGdgmVD
         UywdFmRBElKEc7a/nSwVMMXcXt928LLn9NqdI3M3Lag/xz5Ke7bHM8KZo2q5WiZElHo0
         Ta0g==
X-Forwarded-Encrypted: i=1; AJvYcCVCxrIFIgDVNxlGhuHETuej/59/u7gEzQGg8K+i3iU1P9kzq0uzc9qAvDtFswyCtS2gXcH4Nphv7JSntcN3@lists.linux.dev
X-Gm-Message-State: AOJu0YyMiH3SwratHavt1+H9+JvYlJNQfSnr1C3Q0dMkT7HVOnD7PJx1
	Qwm9YGgvQEsBy+KEx2dg+LreFjbroBP9mRiGybB1fg7am/ADQrJyfy4K8tdyuvvNNaqvXB/rw6e
	nGGX1Pkkur5vhtEi3lPx9vF6CoxhrgyY7ZGhICD4NNg==
X-Gm-Gg: ASbGncuWrcKtBV/1aU89zlA4pE1T34k3w0vCXufPZfAxf0k68zVGjG1CETf1xIEtZSX
	CePgye9RN6cnQG9vEIHd/dM1Psb0hJf7MRDIzxaozS4uB+d5/jWNBbVjWxNmsW4t9kDCitMndSn
	PZQMiz1TXQRKfnhcxRkffJLNtTxYpt8mTfmFoCEk2sOLidjMzySU9dx8c18khrV139N5iWBX7rD
	RzysGlugYzf3pQlXPM749MxqmnOz2bQeg6z
X-Google-Smtp-Source: AGHT+IHAO2HpUiicTjB/e7lp5YYcq+3bearETShDDIE2Hj4VKla6gTWJ399wpgZnZHYCukcyPgZ0pyiK6hL5SLKjmvU=
X-Received: by 2002:a05:6512:3ba5:b0:553:202e:a41c with SMTP id
 2adb3069b0e04-55b5f4c86c2mr1359964e87.28.1753532647715; Sat, 26 Jul 2025
 05:24:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202507261934.yIHeUuEQ-lkp@intel.com>
In-Reply-To: <202507261934.yIHeUuEQ-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 26 Jul 2025 14:23:56 +0200
X-Gm-Features: Ac12FXxav7BPVEwUSpS3g008iRm910sqnc5pYM_YTF74VKIYK1ExRFPB-KnDvhw
Message-ID: <CAMRc=Mc95SMBBjndi9EPUd+d0AftGaovfn0-uhoWQ+cf7SJ9Bw@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 4/5] drivers/nfc/s3fwrn5/uart.c:147:15:
 error: implicit declaration of function 'devm_gpio_request_one'
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-kbuild-all@lists.linux.dev, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 26, 2025 at 1:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gp=
io/for-next
> head:   4740e1e2f320061c2f0dbadc0dd3dfb58df986d5
> commit: 678bae2eaa812662929a83b3de399645e9de93ad [4/5] gpiolib: make lega=
cy interfaces optional
> config: um-randconfig-002-20250726 (https://download.01.org/0day-ci/archi=
ve/20250726/202507261934.yIHeUuEQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250726/202507261934.yIHeUuEQ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507261934.yIHeUuEQ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_parse_dt':
> >> drivers/nfc/s3fwrn5/uart.c:100:14: error: implicit declaration of func=
tion 'gpio_is_valid'; did you mean 'uuid_is_valid'? [-Werror=3Dimplicit-fun=
ction-declaration]
>      100 |         if (!gpio_is_valid(phy->common.gpio_en))
>          |              ^~~~~~~~~~~~~
>          |              uuid_is_valid
>    drivers/nfc/s3fwrn5/uart.c: In function 's3fwrn82_uart_probe':
> >> drivers/nfc/s3fwrn5/uart.c:147:15: error: implicit declaration of func=
tion 'devm_gpio_request_one' [-Werror=3Dimplicit-function-declaration]
>      147 |         ret =3D devm_gpio_request_one(&phy->ser_dev->dev, phy-=
>common.gpio_en,
>          |               ^~~~~~~~~~~~~~~~~~~~~
> >> drivers/nfc/s3fwrn5/uart.c:148:37: error: 'GPIOF_OUT_INIT_HIGH' undecl=
ared (first use in this function)
>      148 |                                     GPIOF_OUT_INIT_HIGH, "s3fw=
rn82_en");
>          |                                     ^~~~~~~~~~~~~~~~~~~
>    drivers/nfc/s3fwrn5/uart.c:148:37: note: each undeclared identifier is=
 reported only once for each function it appears in
> >> drivers/nfc/s3fwrn5/uart.c:154:37: error: 'GPIOF_OUT_INIT_LOW' undecla=
red (first use in this function)
>      154 |                                     GPIOF_OUT_INIT_LOW, "s3fwr=
n82_fw_wake");
>          |                                     ^~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors
> --
>    drivers/nfc/s3fwrn5/phy_common.c: In function 's3fwrn5_phy_set_wake':
> >> drivers/nfc/s3fwrn5/phy_common.c:22:9: error: implicit declaration of =
function 'gpio_set_value'; did you mean 'pte_set_val'? [-Werror=3Dimplicit-=
function-declaration]
>       22 |         gpio_set_value(phy->gpio_fw_wake, wake);
>          |         ^~~~~~~~~~~~~~
>          |         pte_set_val
>    cc1: some warnings being treated as errors
>
>
> vim +/devm_gpio_request_one +147 drivers/nfc/s3fwrn5/uart.c
>

Hi Arnd!

Will you be able to address it quickly or should I drop this patch
from my queue? I would like to send my PR to Torvalds early next week,
Wednesday at the latest.

Bartosz
