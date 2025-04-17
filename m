Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144801AC882
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875614; cv=none; b=b4Q7i6uTiFZ3FegF7ekvrkPj153ciU132uF1JRDtBpZagx5bh/A2BwpDR3oRi8LVuW7SVsAh1cbC6yyo9rKgpH67+aiKh807c8b8hkUYXBmqB8QmIJTzgGeEeZVTehzGULS5wpnNVVw0yhXmYSgpnMqEg3Y0ko9YN+QUEq4qQSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875614; c=relaxed/simple;
	bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F6xxO3UcdhOsqumnUNfnMmY4fE2Y0mkAT1myuHnybOkxPKMCvrFw+GJRJXFO2g3OI3GaEKJDvBxhlNbfDGiIy+f/q+p3ZZMtb2IFt7Z8pVfY+Rx/Mu3HiW54j8X3/P16jQib9iqf/vh5xOqRRTG6prlOcowhWegQZNF4YMDY1yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZWrOBQG; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZWrOBQG"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf61so5768751fa.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 00:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875611; x=1745480411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
        b=pZWrOBQG3zSqZ82V3uKzNbvso0h3q6w1jmBRvvSQp0UXcj8dPRjAuGVtUqPGa5O0Vi
         sxs7rWg4WEmWXv3mrIVeDveh3V1psvCHPfFOWtJDuL6eDUz9q1eTl/G2/MzQo/7Il/O2
         4ENN3FtOuTUeTpzsUCkBZ6fj+qf9EvZqEW0RbcU5VZ5rB/X8WVq4CjjpzQwZ2jRVrxtc
         8FXoC7oz0+Yfr5UiP0yCrQnXGDN3YHIaPlzSrTVxAi/pnAVgMxBVJ1daJJXrnyOGOYcc
         lJng0G9t0k9eaM4IHvCnF24txql+BV2JShCQ0s8sgItI87HCErAM7bRsI9LY5wYbEZZY
         Y0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875611; x=1745480411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTWUZ7GG75MGdOuYepKN19ZkysIgaqJ3eIvg+KIv+4k=;
        b=nCOL9gaNeNEVe+7vhQErYtwgYS8PVq9B33ZnyJgfNz1SJNS/ajCOgy79ihmzdg76eS
         ONzjuKXMYGFgwe0PNdrFefUUF1aYIS1vwUXlw2/RGtTW+zDXhlGIgZgGIqGsb84cZ9ff
         tfvL5EK4Tjbu9q1j2elv8jUDNf806Q2H+y/P3pdMLK7+OLmcm39+2q7iAU7B0YLXA63R
         1zU7XW7ugW2vHU+xrd3ssHuUQr6YS5znwpebmR8Jk4pTcRDr7TVqcBSYgt6bBXhsg4nb
         +Ra4y6G4gAbHnFjQ2liBGatG40FTdY7sWFPZiL/9uUR/6QQ5KSopq+7cpZmEmRluA9jZ
         3Ewg==
X-Forwarded-Encrypted: i=1; AJvYcCVrBucf6F4bDNpDj8H37ZbTtveEB2CNGGNi3tG2OLlCRLXByG9FCHK0DeUMavuxj6aK7DTcOs11sBxP63Rq@lists.linux.dev
X-Gm-Message-State: AOJu0YzAQRRnAfyw81EXj4O/uabkjeUvb0w42N4xPTaFylvtQ908gxd9
	ez00kaPaI5GDMBnXID4fLyQG1mOF6B2S6wBXxJ7lLOfIcL/Z+Dvc2ujYtEP8QWzvNaYUsZy6tZX
	6gybs3g0esJMlwUvsOnzT6so/J+j8jlA94AtdfA==
X-Gm-Gg: ASbGncuz5uUPrjR5Ccu4PHqBlroRei6PiCepoKzYKYvGf14EAfQTkEeGuHCMIMYcs7P
	omHXJk0VZ7nEHCFgkLe8zcYxWFeW+Szb0laN+eBmVHrqnu+l1OoVc9SQvWGnt+mGB8/pgYTMnW9
	bD3qDL0TyxGZUBbgY3PSAFvg==
X-Google-Smtp-Source: AGHT+IEiIqX4aUPaydJ1PP141MrnnbHon/RuJNnAkVqairRqk2NvTUxvddZyFvb/1Nqn9kMA1RIB96pFHZiG8rhrSbY=
X-Received: by 2002:a05:651c:221c:b0:30c:1aa6:5565 with SMTP id
 38308e7fff4ca-31086da3d9emr5323571fa.20.1744875611003; Thu, 17 Apr 2025
 00:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504170707.IBFj7H28-lkp@intel.com>
In-Reply-To: <202504170707.IBFj7H28-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Apr 2025 09:40:00 +0200
X-Gm-Features: ATxdqUGx8WO-eDXtMko006_t0ICMvYXMIboRMkFn_7RA_E8SVE1D6ETmNgEk9DA
Message-ID: <CACRpkdZ-2eOrDRDFk2UqKULyog1GJzsSS4epidbQiNH-xPcV7w@mail.gmail.com>
Subject: Re: [linux-next:master 4325/4528] s390x-linux-ld: pinctrl-sx150x.c:undefined
 reference to `i2c_smbus_write_byte_data'
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 1:25=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> commit: c4d1b2ee4407b0b12e0dade40361eb86c1c710ed [4325/4528] pinctrl: sx1=
50x: enable building modules with COMPILE_TEST=3Dy

I just dropped this commit from my tree, it's buggy.

Yours,
Linus Walleij
