Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56453101C9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 07:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gH8GhkxZ"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-d9a4c0d89f7so1969376276.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 00:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697182100; x=1697786900; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Yib7OMBCHm6UwuQ9QWk+F7jjtT8gG/POYcXA2UHH3Q=;
        b=gH8GhkxZWRUE2Q08Z8Gdw5BW5bJ4n5CLU+VU8i9oaUG35ew2oL1yjJPn7nnTAMxDJp
         HHcBz6uOFdUU8VddSOIbmJb5eTXi9yV2hX60P7fBVvVc8GBJthUfro0M7YGVpIGka+SR
         EIitj5Tld7BYoOYB2JDNzc6kYHg4m0tK4owrugpl5vct0l7hZ3vZozN7ClDyzdLGwSae
         He7NLA0QMctWZIJo6dsr0fLKO9jeH15LXKE1h1sTtJmfge1e3eUtQP5LQNvwCOtyOq81
         Ogtey4Cb083j4DJRt95H/TtlcO6f6QBoFZAZVPuawUvFu0wbOEREPvCGszYKtVscH5Sz
         Y9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697182100; x=1697786900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yib7OMBCHm6UwuQ9QWk+F7jjtT8gG/POYcXA2UHH3Q=;
        b=LCLjHWm+ffzKcseQSl/e/m/7C2x8ZH9LWKjcWEhaiVh2QYfNVNRtzB/pgiqhxRwuix
         Q57vtWMOkBFo38RIo20VGCP6qaA7EawK0CdaWh/u8zH+VPokyOdsonVwPjt0k47URkSd
         1BVwsXGcYulPb76ptLqdkDDR1fKEwWVyVjJzUGy0FzW+5dutSezsDlkkWcIIxCduAHDt
         HYlqOdQL+KcGz9PsdGsayhHNaxvIeAicgA+KI56Wq3YCVIKiLdTvbFi/TXvRm6Bd1xAr
         PEwlUQJdMKX6PgSWGUEa7wJmNbFACPo4CMyyhMCneOla1BERl8CNMkKJsh+CYyP21kwD
         DDDg==
X-Gm-Message-State: AOJu0YztYmoeHdX2cUB01n+1WIE1IkcbcMljclHJi0ihndP2plsrNbmu
	v9GddrcTNLTXuYAzMHBH18rfWdM5t9B2me37UsDIu2zN+Bi5KpqD
X-Google-Smtp-Source: AGHT+IFxcVBk7eoQexdweiHt3Yo+0O2fd32UCQ4GSzNtaxh1rBliV/v1wrURbnVQuCUenuheYmfpHotoLjiXHCM+lvg=
X-Received: by 2002:a25:a525:0:b0:d7b:9211:51a5 with SMTP id
 h34-20020a25a525000000b00d7b921151a5mr24066162ybi.44.1697182100158; Fri, 13
 Oct 2023 00:28:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202310131321.jDp5kiph-lkp@intel.com>
In-Reply-To: <202310131321.jDp5kiph-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 13 Oct 2023 09:28:09 +0200
Message-ID: <CACMJSeuX40z=+qaS833kYvr84Sv=S1P-5Nz6nHG7T+Usy7KmpA@mail.gmail.com>
Subject: Re: [brgl:gpio/devel 48/62] drivers/pinctrl/pinctrl-st.c:1326:9:
 error: implicit declaration of function 'st_gpio_direction_input'; did you
 mean 'st_gpio_direction_output'?
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Oct 2023 at 07:25, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/devel
> head:   78853aac42280ea9b48d7abc74b348463cf8588d
> commit: e1e2007b6bb0ba0e1bb89235ffde4c0330655c29 [48/62] pinctrl: st: drop the wrapper around pinctrl_gpio_direction_input()
> config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131321.jDp5kiph-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202310131321.jDp5kiph-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/pinctrl/pinctrl-st.c: In function 'st_gpio_irq_request_resources':
> >> drivers/pinctrl/pinctrl-st.c:1326:9: error: implicit declaration of function 'st_gpio_direction_input'; did you mean 'st_gpio_direction_output'? [-Werror=implicit-function-declaration]
>     1326 |         st_gpio_direction_input(gc, d->hwirq);
>          |         ^~~~~~~~~~~~~~~~~~~~~~~
>          |         st_gpio_direction_output
>    cc1: some warnings being treated as errors
>
>
> vim +1326 drivers/pinctrl/pinctrl-st.c
>
> 727b0f71a56de6 Srinivas Kandagatla 2014-01-16  1321
> e855fa9a65c407 Patrice Chotard     2017-03-16  1322  static int st_gpio_irq_request_resources(struct irq_data *d)
> e855fa9a65c407 Patrice Chotard     2017-03-16  1323  {
> e855fa9a65c407 Patrice Chotard     2017-03-16  1324     struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1325
> e855fa9a65c407 Patrice Chotard     2017-03-16 @1326     st_gpio_direction_input(gc, d->hwirq);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1327
> c36f8c06ebd0c4 Linus Walleij       2023-04-04  1328     return gpiochip_reqres_irq(gc, d->hwirq);
> e855fa9a65c407 Patrice Chotard     2017-03-16  1329  }
> e855fa9a65c407 Patrice Chotard     2017-03-16  1330
>
> :::::: The code at line 1326 was first introduced by commit
> :::::: e855fa9a65c40788b5069abb0d094537daa22e05 pinctrl: st: add irq_request/release_resources callbacks
>
> :::::: TO: Patrice Chotard <patrice.chotard@st.com>
> :::::: CC: Linus Walleij <linus.walleij@linaro.org>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Now fixed in the gpio/devel branch.

Bart
