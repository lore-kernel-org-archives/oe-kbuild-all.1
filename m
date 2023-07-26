Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AA1AA60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 17:42:47 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-99bc9e3cbf1so1679366b.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 10:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690393365; x=1690998165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pACmhsSjZ8YJ9TxufenBT1D/qbv/chnjS1KEQgJ8zsg=;
        b=O1hgYMx9qFwj3qWMliR9d+d6JXBxLtiXtth3AoY5KKZTNGTlJ682Hc4UQLUZvWmWPk
         2jZFcp7pzEIuXC+MBIbbULrgAqP4CjzOjfYYWXBRhAjTgXbB1I88wMmX0R/sk7dt6Tz2
         2h6Jcxvh/e6Tmes4hDb6ihyxSJYHBEyB03r182CVLwu43uJm4+YUcWveN1qrqJSL3zQg
         Sshcx8CXYeSoYGo97TVJLJxPZXqgKqTFluMC0D0TyhiXLg0uI5uqgCjotZphIxMKdIWY
         UceZ4DSfMW2i1IMauc+kRV7i8F0YI9zMHum1eCdbjZa47mH2TwvDuRGlqDv+sFieBzRT
         XBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690393365; x=1690998165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pACmhsSjZ8YJ9TxufenBT1D/qbv/chnjS1KEQgJ8zsg=;
        b=TfRLXVs4N9nhDzjNaQ1ddpBMEhKOTJuUcNIhBW19ZTH9lvdi/s7eAvKeeGBxu0nKTa
         kXFQw44bBAVpA/WcSwLUmbFGW2z9yhBLwEC1/5KYkEdhbVRA+/URmvr0UraEKJZgyKJ5
         N/oQhHWcB8T9ZdJcMBjZtWAVTC4htRUBg4bdKHzsND3MinEds5OK9QsoJDxZy2QSLKsu
         69a46AxLLXIsOYNJajm0JdowIfrSLY90xc1Popo5rKuQJK9Lm0Ua+W4cp7kz5oO41uC6
         4rajuugo6jyrNBBE/apUVjtZAy7/DELm5UFgwKgb3ddtD5cZg8hdJ8dRl9Lku1uQtikr
         oI/g==
X-Gm-Message-State: ABy/qLZdPVZkQRbt6Ztpqr11sfesLMgmgnybRWg98ZHXrJvveDM+KMZp
	wI/a8Tyt+vksVnVv3H8GG9us95MlesBy9m/ukyw=
X-Google-Smtp-Source: APBJJlGngByA+F/45GQ5wXxhtN/UIgDpvYIDrlS9ZWHTmZ2yk50TQY+u2LQPvLyxktC3BzVoJGZe2mDYPIKRbWZ/kEc=
X-Received: by 2002:a17:907:9488:b0:988:8efc:54fa with SMTP id
 dm8-20020a170907948800b009888efc54famr139376ejc.37.1690393365249; Wed, 26 Jul
 2023 10:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307270116.Xf7g8Lne-lkp@intel.com>
In-Reply-To: <202307270116.Xf7g8Lne-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jul 2023 20:42:08 +0300
Message-ID: <CAHp75VfEbHkNGCSy1QVVC20STgTXZ7KkYhDcHj_OK0yPPAZU0Q@mail.gmail.com>
Subject: Re: [linux-next:master 2607/4710] drivers/gpio/gpio-ge.c:59:32:
 error: invalid use of undefined type 'struct platform_device'
To: kernel test robot <lkp@intel.com>
Cc: Rob Herring <robh@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 8:24=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   0ba5d07205771c50789fd9063950aa75e7f1183f
> commit: e91d0f05e66afba9a3804bccf3d0a4310bb30024 [2607/4710] gpio: Explic=
itly include correct DT includes
> config: powerpc-randconfig-r036-20230726 (https://download.01.org/0day-ci=
/archive/20230727/202307270116.Xf7g8Lne-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230727/202307270116=
.Xf7g8Lne-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307270116.Xf7g8Lne-lkp=
@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>

The series
https://lore.kernel.org/linux-gpio/20230724161320.63876-1-andriy.shevchenko=
@linux.intel.com/
fixes in particular this issue(s).

--=20
With Best Regards,
Andy Shevchenko
