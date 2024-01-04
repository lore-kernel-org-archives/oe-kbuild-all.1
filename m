Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0CF2C6AE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hEgogeWx"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-db3a09e96daso892424276.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 04 Jan 2024 13:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1704403784; x=1705008584; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDcJlzRwgOjmf9s3ju/kHyej59d33XX1hqLumYLyfkE=;
        b=hEgogeWxrgBmg8Ez6ysIi6zWUv1nO1iIMl1DumMNQ0f88c8SyMjcf8zVji7XIrX9uY
         AVQvR+3YXI1iP1Z6Yul0BUkNGpiDpNruxdizyJPKLY9l6ydAl7ow2x2J5ojf6W5PUtJq
         z+RtyJB8W/FX4VhyU5cWwSM5zc+JEPpOAuLrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704403784; x=1705008584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDcJlzRwgOjmf9s3ju/kHyej59d33XX1hqLumYLyfkE=;
        b=eeFhY2rcXCNlq8zLWfXA2skeLZDYtBFpz+thvWHK0V4hv/ZcLbJ8HNFCx1l6jQUBbn
         4k4rQN71loD2OTd8EiPSMfO4cBO63j3VNjaqkLElJhK+V2IiMvkDwEhc1N4RsN89pGiM
         3obflSlDvEVXuq5flNrvISGb+EPlO6qzbFS32pjLl1++FLg7F2eqRqann6AK5kblx217
         HUGN7zBeXzadoE4ycoogAoOcMUmP6JNNmjmvDCw9LU6QRxQT4rsLHiwMJvY0w6aP6rrR
         qYOG+ScgDy9HJYSTCIXdyq6eVix2fDrCQWVH+wK4grGCXhmBV1/ELmSYQUqHTvudvop3
         g2ww==
X-Gm-Message-State: AOJu0Yx2Tho/WTNq3pHBOBr5HBqPoZ+weYFS9B1vcCBqO1JHPjhRfL+9
	fsCAb9QEdBzzaRTNc9FU4TnHakYVBPJyrbjR29Pg6kMcVBWI
X-Google-Smtp-Source: AGHT+IFbQEHsVmVAV68hl37UcSvgcgKs002/+LTdYHsauicQGHlQdZcr1LUYTxY2eGVe/gEWwTFmkDgrb6AyHhyhCgE=
X-Received: by 2002:a5b:884:0:b0:dbd:b4c2:728d with SMTP id
 e4-20020a5b0884000000b00dbdb4c2728dmr1116662ybq.112.1704403784286; Thu, 04
 Jan 2024 13:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240104050605.1773158-1-zack.rusin@broadcom.com> <202401042305.WdnDeo57-lkp@intel.com>
In-Reply-To: <202401042305.WdnDeo57-lkp@intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 4 Jan 2024 16:29:33 -0500
Message-ID: <CABQX2QMFJ4arXwVNE5YF4pRHqkzVb-rjyqWwSOtrQ_+QLPLV9w@mail.gmail.com>
Subject: Re: [PATCH v2] input/vmmouse: Fix device name copies
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Raul Rangel <rrangel@chromium.org>, 
	linux-input@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 4, 2024 at 11:04=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Zack,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on dtor-input/next]
> [also build test ERROR on dtor-input/for-linus linus/master v6.7-rc8 next=
-20240104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Zack-Rusin/input-v=
mmouse-Fix-device-name-copies/20240104-130724
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git ne=
xt
> patch link:    https://lore.kernel.org/r/20240104050605.1773158-1-zack.ru=
sin%40broadcom.com
> patch subject: [PATCH v2] input/vmmouse: Fix device name copies
> config: i386-buildonly-randconfig-001-20240104 (https://download.01.org/0=
day-ci/archive/20240104/202401042305.WdnDeo57-lkp@intel.com/config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240104/202401042305.WdnDeo57-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401042305.WdnDeo57-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/input/mouse/vmmouse.c:77:7: error: variably modified 'phys' at=
 file scope
>      char phys[sizeof_field(struct serio, phys) +
>           ^~~~

This can be trivially fixed by using __builtin_strlen which with
fortify-strings.h is used anyway but before respining this I'll wait
to hear if this approach is ok. The sparse warning we can't do much
about because it doesn't recognize the fact that the array size is a
compile time expression.

z
