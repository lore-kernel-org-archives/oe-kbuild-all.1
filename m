Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2EB29AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 10:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668768172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yd4XhvkyCIC729wLxNYg+1Mcq/CQbURDnfZS5NSLDh4=;
	b=Ppg3KfiR1+qu4Y5VWj9FCASvhCeTtv6PHcDCa9jMW7T2eFiNvfmW8wUWWhyriNzha1wZK+
	B9ZkKqvwuFZ+Nhf6J451OtPDfTuyUms9z5ONr2HYbXvPdTgj3ZpbXI6svCDYvhVZSzGmGg
	9SseL3TBNQ1WoHBjcDtZuOEdrxjxsf8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-645-U0TCTt2uMlq_5f06ZMT5QQ-1; Fri, 18 Nov 2022 05:42:51 -0500
X-MC-Unique: U0TCTt2uMlq_5f06ZMT5QQ-1
Received: by mail-io1-f71.google.com with SMTP id n8-20020a6b4108000000b006de520dc5c9so2407547ioa.19
        for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Nov 2022 02:42:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yd4XhvkyCIC729wLxNYg+1Mcq/CQbURDnfZS5NSLDh4=;
        b=XGnzM5rbXAL8jyuQBNu+TJnv72Nf8r8VWnsu6bgmkbUqX2tnuiEAZi81iesHUbHA3C
         N5bEf1J9oY5rkBK4GomcH7Gwm2xkmZFeL2AEfBZkNrsl7F2Gmdnfl5d7j0uwISiFrl4a
         dePHlaWKfGlZmoVCD7m/3Gw1x6jUxqVw/ZBojHsuEveX5rN8OcLOWgMSBL22lbfXZii/
         o1L71vZujfsgH1r7UkuAj2tJ1AgByqro6s4h89x12sNRiKL2xG5A8m0ObJ6vY9FPaQE+
         sZ5eqJ2a9aBugCUwDriaK5UwayEcujbl5/pFgrkM0w8AWGnbyAr9tT9lRjHOU+uhsXfk
         Wpjw==
X-Gm-Message-State: ANoB5pkgyhP/xaiFHouozUpoUSFxpJA0fGCprCMHGuo5nI4yYLUxXLVy
	6NtvyLip2lGyX/UllYRjFsk2tz8yHdV0O41/Re+8rmyKZBDRDpiVNVjQF7Q02fiHU1j58kPh1ZD
	Wi9PfxAzJ+qjUG0oPTMBw+TKfn8wXuUEd+mYGzRb/pw==
X-Received: by 2002:a92:d811:0:b0:300:3d37:62fc with SMTP id y17-20020a92d811000000b003003d3762fcmr3092622ilm.15.1668768171004;
        Fri, 18 Nov 2022 02:42:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6yq68sdpiIlm1eL25qTabGssOu8AYsZeJ92nt4JEv2CVruV/74C3GswW+Cy6lGVMbWUp16DllEiIUHr7D9Gj8=
X-Received: by 2002:a92:d811:0:b0:300:3d37:62fc with SMTP id
 y17-20020a92d811000000b003003d3762fcmr3092614ilm.15.1668768170779; Fri, 18
 Nov 2022 02:42:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202211181742.QYJY6Gug-lkp@intel.com>
In-Reply-To: <202211181742.QYJY6Gug-lkp@intel.com>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Fri, 18 Nov 2022 11:42:39 +0100
Message-ID: <CAO-hwJ+R-OnNx6o5TimF2N=7UXHj7+ndF7hMd_aLrjrqwPHmBw@mail.gmail.com>
Subject: Re: [linux-next:master 7544/8929] ERROR: modpost: "input_ff_create_memless"
 [drivers/hid/hid-wiimote.ko] undefined!
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Jiri Kosina <jkosina@suse.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 18, 2022 at 10:37 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   147307c69ba4441ee90c1f8ce8edf5df4ea60f67
> commit: 25621bcc89762fe1329ae9c9dab75bc70ef1aee0 [7544/8929] HID: Kconfig: split HID support and hid-core compilation
> config: loongarch-randconfig-c023-20221118
> compiler: loongarch64-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=25621bcc89762fe1329ae9c9dab75bc70ef1aee0
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 25621bcc89762fe1329ae9c9dab75bc70ef1aee0
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "input_ff_create_memless" [drivers/hid/hid-wiimote.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/drv260x.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/drv2665.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/gpio-vibra.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/pwm-vibra.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/regulator-haptic.ko] undefined!
> >> ERROR: modpost: "input_ff_create_memless" [drivers/input/misc/sc27xx-vibra.ko] undefined!
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
>    Depends on [m]: INPUT [=m]
>    Selected by [y]:
>    - HID_ACRUX_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_ACRUX [=y]
>    - HID_EMS_FF [=y] && HID_SUPPORT [=y] && HID [=y]
>    - PANTHERLORD_FF [=y] && HID_SUPPORT [=y] && HID [=y] && HID_PANTHERLORD [=y]
>    Selected by [m]:
>    - INPUT_GPIO_VIBRA [=m] && INPUT [=m] && INPUT_MISC [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
>    - INPUT_REGULATOR_HAPTIC [=m] && INPUT [=m] && INPUT_MISC [=y] && REGULATOR [=y]
>    - INPUT_PWM_VIBRA [=m] && INPUT [=m] && INPUT_MISC [=y] && PWM [=y]
>    - INPUT_DRV260X_HAPTICS [=m] && INPUT_MISC [=y] && INPUT [=m] && I2C [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
>    - INPUT_DRV2665_HAPTICS [=m] && INPUT_MISC [=y] && INPUT [=m] && I2C [=y]
>    - INPUT_SC27XX_VIBRA [=m] && INPUT [=m] && INPUT_MISC [=y] && (MFD_SC27XX_PMIC [=n] || COMPILE_TEST [=y])
>    - HID_WIIMOTE [=m] && HID_SUPPORT [=y] && HID [=y] && LEDS_CLASS [=y]
>

That one is a nasty one: to be able to select INPUT as a module, you
need to disable *a lot* of things, like TTY and VT, and set EXPERT to
y.
With that, well, then the problem is that having INPUT=m and HID=y
will just not work because HID is relying on the input API.

That being said, the symptoms are weird: because HID drivers that are
using FF_MEMLESS can be now set to 'y', INPUT_FF_MEMLESS is then
forced to be set to y as well, but given that INPUT is m, everything
just falls apart for the drivers that are m, not y...

The simple solution is to have HID depends on INPUT, this way we can
not have HID drivers as y, everything will be forced as a module. This
is also required because hid-input.c is using the input API, and as
such we can not have HID=y and INPUT=m.

patch on its way.

Cheers,
Benjamin

