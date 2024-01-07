Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B73111B0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 20:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uvICfy4K"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5e778e484dbso9788087b3.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 07 Jan 2024 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704658172; x=1705262972; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8nPAFCVrC9CMoZifbVgJ5oM9DI/tQqOkvpJC/laO9g=;
        b=uvICfy4Ka8wCd1sBExIELZFmGdjqn5I3dtwAR7OiMbYWLN3knZImUZA7VHOoZUVVLc
         8sF7Zyt5JVajtbJmoQSZVCxzLh0UIzNcoAufwJKDAgw9GnGM5XRMmGgnISlQeXGjPF6U
         idS5Hp+VurQkAXTFu+sMkjkb7wrhlGkHFOmuO7UP41JsWAtlAPPpnfiep9S6eo+izAgH
         2oetH1STkEKj9z1blAV9qCpwjEvYNUjYPl+xONsovizXzqTEPNNvSGr78s01Cmsucvl5
         9X0qmh0q3iq08kBevLca78et9XRsDft40hI28shBMABIZHgZNZNHPcIWZ8uPtA+Lu3uJ
         CYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704658172; x=1705262972;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8nPAFCVrC9CMoZifbVgJ5oM9DI/tQqOkvpJC/laO9g=;
        b=JQLwr4/V44jwNEeRThIsRoK5mwQBF4XOVQ7trIZzMq3lc8kXHuHRyTMQdPBKsqTSuE
         w8xu6HYKfMu9wcBx5gAl1wr7PhobHNjdY6AOH9qSjkV+O0atUbN6+hbY3rUVnUony5TO
         E8D5VbFvswn18ElLgoPKTxmucYWtQibouZhjE6SOQduLovAoix9zmf6D9Vu7utN+DdBF
         DWYcgu5xSzJMgSOsma+//9wmCH6mkOdJdtfJhuekdm4w7zVbnFG5HvLZXO4Zk+JLlosZ
         L42nrma6NC4F4qDctfMH/pUUqDyva2si2XSAsofa24MW5wF6t2EyfrkjrOSjybw8K1aD
         JHKg==
X-Gm-Message-State: AOJu0YzHGWcoOrL3rfDT4MeLgk8dN4gorAl+Q3GXfgv9WIEkCJ9Yb3cR
	6Mb4/7XBJ9CCjl3aFIQyBDrDZuZuJ8zfOx+C0IYkC56RLo4qxg==
X-Google-Smtp-Source: AGHT+IGry4XVFEl601f1I74BMHsJP4cbqCd0Ab5u8jISrZR00fsRvt+8hHK1amJ3NRebygDsQhpUtFxqb6C64MDG74s=
X-Received: by 2002:a0d:dfc5:0:b0:5f1:a1f2:f3bd with SMTP id
 i188-20020a0ddfc5000000b005f1a1f2f3bdmr1632919ywe.28.1704658172121; Sun, 07
 Jan 2024 12:09:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401061736.yM5FZ2oV-lkp@intel.com>
In-Reply-To: <202401061736.yM5FZ2oV-lkp@intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 7 Jan 2024 21:09:21 +0100
Message-ID: <CACRpkdbx=qgdy1JRyxzFGW+8Ojj+g2tLKU4dD8oWX9V0xH2-JQ@mail.gmail.com>
Subject: Re: arch/alpha/include/asm/core_t2.h:587:23: warning: no previous
 prototype for 't2_ioread64'
To: kernel test robot <lkp@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi robot,

On Sat, Jan 6, 2024 at 10:40=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:


> Hi Arnd,
>
> FYI, the error/warning still remains.

FYI I have already said I can't reproduce this at all. Not using
allnoconfig, not using the .config attached to the report.

I have no idea what this is.

Yours,
Linus Walleij
