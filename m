Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1466C7E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 16:09:19 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id n12so6377869qvr.11
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 08:09:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkU8n1rGpBlbCpKTCwJGd7qJNj9Z1t7NxTgI6P3vlMs=;
        b=8BtzOjIr737mT/z3KHvGakIAN4IpK+qzHnXs06vO1ahxjOBomCAkG/cCky/hcyOKbR
         eBVn/bKKmLrktXrKEuqZhTySxDq8onsHXtBpWhuoBTKLe1Pkl9vjRONyimNYS3oGlx6L
         BjB+t/XYzQzMEFNx8vj/D/JGGunVOBRpMF9Xb4sCY5Vted6FxhbVeY0tXRQ8qwb2sC9I
         Stw9zTRaeBYQY1bbM8C1BUCH/QVif2fcNKAZ9Ne7vgBdzwD+YydMF99wY/vXW6jWLkmq
         VtZwwsuQAMMte/OLbCCJjcKW7VlD5CIcBE1Q7+1YbA30Sdm5vqxI4HXkYv57fQFOmY8L
         Hnmg==
X-Gm-Message-State: ANoB5pl2/q5zGYmTO6YTHwEVhLGwA5ZjlYb6H+WI9N7wR0IOwYQ6MJwG
	4/IjcjmgTs+u+BMUgPy6g/+6TQyNogsUUQ==
X-Google-Smtp-Source: AA0mqf7pjqUg0tcVVnFm+EXpn+f6nQjt5aDgdh6y/UvDLM2c9DGqtUOrhwah1Fn8WnVCN8/WOU7rMg==
X-Received: by 2002:a0c:bed2:0:b0:4c6:ac5c:fda3 with SMTP id f18-20020a0cbed2000000b004c6ac5cfda3mr8395691qvj.17.1669219758755;
        Wed, 23 Nov 2022 08:09:18 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id bq40-20020a05620a46a800b006fb7c42e73asm12359184qkb.21.2022.11.23.08.09.18
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 08:09:18 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id c140so1243409ybf.11
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 08:09:18 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr1634057ybc.543.1669219757796; Wed, 23
 Nov 2022 08:09:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211232331.BVAg4Q0c-lkp@intel.com>
In-Reply-To: <202211232331.BVAg4Q0c-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Nov 2022 17:09:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
Message-ID: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 56/58] drivers/gpio/gpio-max732x.c:613:42:
 warning: initialization of 'const struct i2c_device_id *' from 'int' makes
 pointer from integer without a cast
To: kernel test robot <lkp@intel.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 23, 2022 at 4:49 PM kernel test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> head:   3687a82b1db1c827cc4b367e3efde3235f68d9f6
> commit: 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc [56/58] gpio: max732x: Convert to i2c's .probe_new()
> config: m68k-allyesconfig
> compiler: m68k-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
>         git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
>         git fetch --no-tags brgl gpio/for-next
>         git checkout 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    drivers/gpio/gpio-max732x.c: In function 'max732x_probe':
>    drivers/gpio/gpio-max732x.c:613:42: error: implicit declaration of function 'i2c_client_get_device_id'; did you mean 'i2c_get_device_id'? [-Werror=implicit-function-declaration]
>      613 |         const struct i2c_device_id *id = i2c_client_get_device_id(client);
>          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
>          |                                          i2c_get_device_id
> >> drivers/gpio/gpio-max732x.c:613:42: warning: initialization of 'const struct i2c_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    cc1: some warnings being treated as errors
>
>
> vim +613 drivers/gpio/gpio-max732x.c
>
>    610
>    611  static int max732x_probe(struct i2c_client *client)
>    612  {
>  > 613          const struct i2c_device_id *id = i2c_client_get_device_id(client);

Depends on commit 662233731d66cf41 ("i2c: core: Introduce
i2c_client_get_device_id helper function") in i2c/i2c/for-next?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
