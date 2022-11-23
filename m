Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700791C04
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 16:30:23 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id b73so268740yba.4
        for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Nov 2022 08:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5iELkw5vCNW3WN6W/KE81SmHIlacrKw4q765aXBAO20=;
        b=tTLNv2bAOnB7ruAP0FieQk5nhcnM9w5MvIGKuS2eeFv5GxUWmZgiPOla5vHARrehwl
         f0+zCJ6Wy3DqR90+tAUJax+39S4d0133XUQ2uTLLgarT9uii3G55M6yhIwb+rwwFjLNv
         iGtvoGAu5QJjSYXISID/c7z1cQRVn99PfPdO5eMzDIkpNr5rFo235fEEKXPIO/djpuXU
         0nWHBee7m9clhF65j4YuzyE8MphVJIfc9YwzaPUJNQOW5qzl0H1/T/wrVN/uSBWUPTi8
         /Pl3elslP+a4NovJNymfyRFv0I5DozgKm2dz7DpWaBxHksYg8SsGlsdzEgrcrFfejJ6J
         UyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iELkw5vCNW3WN6W/KE81SmHIlacrKw4q765aXBAO20=;
        b=pzpvTxLIXN4dGWxsn4mrrcl38c+h/pOiad++oYDYpiS0mp33Oz+Lhbr75FGJ8/6eZe
         mtHcI6lH2HhaTQMKlfYzClnqcmjY1568a6iQJWLiSR8VQ3R2506CdcHi0w7zpNwVn/0/
         HlwbCXAOT8KswtLDrfDPPo2lFAOCr5RT0W1t0c+xCRazBeljc/jnwysYvvrF9+U4Soah
         eb0i/RafWBIUQcqBKwOenWY4dnSarLrEc02KXOu+3ez2HWcWEXQMmF7STLvJRM7PvCrL
         IhD+b3zifGIr/OLoUlmBAAp83Lk64jsPrc8uaVUuY4Ei44TcxCP+LzpJK+qGgq1PTYxV
         qkKg==
X-Gm-Message-State: ANoB5pk4xqwnyPj3S5z/Kb+8g3iVGs92iT6gdvo1UO4/XVF+5QY7zcph
	MqgH1hSzJaiLXFsfXYhZmve9nncbC/Aw0kLQpoGOSQ==
X-Google-Smtp-Source: AA0mqf569QCE+MWM0v1v+JM5Zq53zSxeY91vaYogzbrr/hmgBDIQZD2oWK9eWbXoxV8jHkiVQmtNTCS6vUhvZ+osmPk=
X-Received: by 2002:a25:73ca:0:b0:6d2:1a07:d35b with SMTP id
 o193-20020a2573ca000000b006d21a07d35bmr8768692ybc.518.1669221017651; Wed, 23
 Nov 2022 08:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211232331.BVAg4Q0c-lkp@intel.com> <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
In-Reply-To: <CAMuHMdUuyGPDDE=xZQd3_Ne1DbiU+1vEXB5XuicOz6zM73tvPA@mail.gmail.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 23 Nov 2022 17:30:06 +0100
Message-ID: <CACMJSetN2_0o0jdxrCPSdA=51iObKnhfcFTTKPG0FkBQs-gXkg@mail.gmail.com>
Subject: Re: [brgl:gpio/for-next 56/58] drivers/gpio/gpio-max732x.c:613:42:
 warning: initialization of 'const struct i2c_device_id *' from 'int' makes
 pointer from integer without a cast
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: kernel test robot <lkp@intel.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	oe-kbuild-all@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Nov 2022 at 17:09, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Wed, Nov 23, 2022 at 4:49 PM kernel test robot <lkp@intel.com> wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
> > head:   3687a82b1db1c827cc4b367e3efde3235f68d9f6
> > commit: 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc [56/58] gpio: max732x: Convert to i2c's .probe_new()
> > config: m68k-allyesconfig
> > compiler: m68k-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git/commit/?id=95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
> >         git remote add brgl https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
> >         git fetch --no-tags brgl gpio/for-next
> >         git checkout 95889cd3c8d8c64b3cd0baaecdaca2d82312b5fc
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash drivers/gpio/
> >
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> >
> > All warnings (new ones prefixed by >>):
> >
> >    drivers/gpio/gpio-max732x.c: In function 'max732x_probe':
> >    drivers/gpio/gpio-max732x.c:613:42: error: implicit declaration of function 'i2c_client_get_device_id'; did you mean 'i2c_get_device_id'? [-Werror=implicit-function-declaration]
> >      613 |         const struct i2c_device_id *id = i2c_client_get_device_id(client);
> >          |                                          ^~~~~~~~~~~~~~~~~~~~~~~~
> >          |                                          i2c_get_device_id
> > >> drivers/gpio/gpio-max732x.c:613:42: warning: initialization of 'const struct i2c_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> >    cc1: some warnings being treated as errors
> >
> >
> > vim +613 drivers/gpio/gpio-max732x.c
> >
> >    610
> >    611  static int max732x_probe(struct i2c_client *client)
> >    612  {
> >  > 613          const struct i2c_device_id *id = i2c_client_get_device_id(client);
>
> Depends on commit 662233731d66cf41 ("i2c: core: Introduce
> i2c_client_get_device_id helper function") in i2c/i2c/for-next?
>

Yes, already backed those out. Thanks.

Bart
