Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB6188CC6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 17:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725903070; cv=none; b=ebS0ptIEe/l2BQNQiKIxc+LdGmP4hSvueW+PEV9XGkAXP1/kUR1SlozBiZecxmdIp7jARyevCeN/ishrydpC9PK8WnBz4c25zRl+vte0M/58h8nO6lr9Ojk5l1fKld9wCXoLIrZjvnAFMBUI9/nRu0YvmQhKqEGFg6g5vrsNgUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725903070; c=relaxed/simple;
	bh=Z6mJvcZe2MesBZofy1uPkQhd+aKfwut11jWDOz6Jc3Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=agwvonlQTXp0AkVcng4TF+1rPhXwWPc0zlAYduB8iDzgaNQdywcorelZU2kRyDkS9Dj1XWaEEpIUZKeKJfXZNG0rdeKtOv0OwzK42dBa5sll+B95IO/3DLugqVOr8QmKIK+OFPj+kQtefDiHHqTwADPqb+JbN+Ylvf6gAMPHQz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jFzgbOK6; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jFzgbOK6"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cbe624c59so373125e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 09 Sep 2024 10:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725903066; x=1726507866; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8PiS3BCPtpO9F22HA9pONA15SeMVWRie+tAa6W5csc4=;
        b=jFzgbOK6wSXmW+JpCXqk6iRA1YOp4b50pTsNT2uQPZh9fjHFiYl5dr/9rpxRmMGDm0
         XhAmQygJ9VZG4aESdq4eBD2CGS/oyuT0tFpNjS36q8RdIWCwj421UpOdJdMka9p6AZIm
         1PdQjojrSGfnLA4pDfClySbgOr4iMr0WoXpKEQpnL9THUL4meHCl0ahwFf8dNTgmKuve
         X+f4l33sfa1duBFamH2ZsZdh9LBNa0tpuNmcB3tXrhbD+fnK/Oq5n6VQPeV/7U67MTRq
         yNCAmge1UUWGAoS0gBY1vUJTIn6Hw2bNpxQmWdTf+W52aW7bfT+292I8IyGmK21UdDt6
         jkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725903066; x=1726507866;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8PiS3BCPtpO9F22HA9pONA15SeMVWRie+tAa6W5csc4=;
        b=f+8RIZpyC9NTU2KOV1UK/+0W1BWCrqafOZI7qSJUCHuamRn+5DAH6E3dam2i68A9HP
         XF/Zm7cfjYeyYbo5tQwDc/QOFXkhEL4rYGPPFpAFDm2kmP4CiV/vk9FjmNzS8bd17IEH
         VHyf2BDu2VjgUpI3GEPQCykpveB0kfVjZoeHEmhaEwkRliQLvr3RxgctYuWnaGwKyWBF
         5jJbRbhQovo/h9z5Fq2L9pHh5B2LOdzu9GSgm8TvZNWOXe2yvuaUd28x4xS92aXaqcPp
         vOcDHS0YIO8i1WpAIz4tuaMR2uYo0BfhBp/Qx6RrWV+bRKG/4jHnsm19X5daRzPcAo0o
         pgXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBz5OdWEspxxS7THJgxjtWRpZJZcViqiX9cgGt4fXiyo8uDEPTeF9fdvCfZCMEt0ygVjTvliAvKmXBywVq@lists.linux.dev
X-Gm-Message-State: AOJu0YxHT3BHJXHz6QoDLSIdoAMnSy4+o6KvLo3lZq+oiavmnC0py9xl
	35T06yFjnJSfKcgj83sqESnceB8C0kz1kiXxCbtoFVv3Hy7mUxCYzqEXkLz2Dy0=
X-Google-Smtp-Source: AGHT+IG8YCZKd3Jy5v0Ys8OrH5RGLNJOThDfAM6nb3KaRMGZlBu7kgyv93neGwHauSgA7m/I2pKL9w==
X-Received: by 2002:a5d:5e12:0:b0:378:89d8:8242 with SMTP id ffacd0b85a97d-37889d88432mr6208872f8f.26.1725903065445;
        Mon, 09 Sep 2024 10:31:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:788a:4542:ae86:67f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a340sm6544029f8f.24.2024.09.09.10.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 10:31:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Stephen Boyd
 <sboyd@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jiucheng Xu
 <jiucheng.xu@amlogic.com>,  oe-kbuild-all@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
In-Reply-To: <202409100033.EPfBtwfK-lkp@intel.com> (kernel test robot's
	message of "Tue, 10 Sep 2024 00:42:47 +0800")
References: <20240906-meson-rst-aux-v4-9-08824c3d108b@baylibre.com>
	<202409100033.EPfBtwfK-lkp@intel.com>
Date: Mon, 09 Sep 2024 19:31:04 +0200
Message-ID: <1jcylcu42v.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue 10 Sep 2024 at 00:42, kernel test robot <lkp@intel.com> wrote:

> Hi Jerome,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 487b1b32e317b85c2948eb4013f3e089a0433d49]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/reset-amlogic-convert-driver-to-regmap/20240906-213857
> base:   487b1b32e317b85c2948eb4013f3e089a0433d49
> patch link:    https://lore.kernel.org/r/20240906-meson-rst-aux-v4-9-08824c3d108b%40baylibre.com
> patch subject: [PATCH v4 9/9] reset: amlogic: add auxiliary reset driver support
> config: parisc-randconfig-r123-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 14.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20240910/202409100033.EPfBtwfK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409100033.EPfBtwfK-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o: in function `meson_reset_aux_probe':
>>> (.text+0xc): undefined reference to `meson_reset_controller_register'
>>> hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x88): undefined reference to `meson_reset_toggle_ops'
>    hppa-linux-ld: drivers/reset/amlogic/reset-meson-aux.o:(.rodata+0x9c): undefined reference to `meson_reset_toggle_ops'

In the config the COMMON part is built as module while the AUX part is
built-in. Of course, this should not be allowed. The error was
introduced in the last patchset version due to another renaming.
Will be fixed this next one.

-- 
Jerome
