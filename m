Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9662144A4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 08:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738742609; cv=none; b=t84cd7aEBNptrQIoVLnf9X3IzPY9DN8G1Zplra5pcDkdBeUb9DtNRoWgxE8FIOc/b62VCvOEptALU/IJQh1EVGyUKGmyibz7rVP9l6JOKG4toOP4aa9Pco/eG6Pg2r6z0wDpdszfvLPKxnAW8hQjLxwCPH8JHu+b7p0pc1H2zxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738742609; c=relaxed/simple;
	bh=psQMIzroh9RN0r+TbGN0P5HVazNDs44hfgG9Vw54G6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZreiWx0jQCvHL3MBZdSSrt/4dGUOC9aFoC/vZFJHFKvRLck/YQl2BQiQ60x6DMY2F7tUYtwf6YiMZpD7OqCdldVnm6sXHd8gUs+1/NcpmZrjABDyxAlpZF5u9ovem7MpAHhCnIh9lXaEsXXQtYB+QWiACFaeI+RsG8syVgbfrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso1561042e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 00:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738742606; x=1739347406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ATGBHpcxBkanhUM2ciEzSKnU3jjrhaei7uXTFLlO6ek=;
        b=tnjacVURttRafZr1uUba/mZIvRIdPJb5GYOLL5SgqnKE7x0tCGq1+5hVaXIO2IskAs
         UaNeK9/IBT3nRxP+0Kq2ALgZI8d6Bo6RBCcAjtrnn1nJZf2oD5HbWiYZ3JInsjPYkxXe
         LpSWi4xMtTMuKxGwtKZyQyX27UJU+6r4SCZwPJH8Y8PkLoBmrR/qzTbH8cxYSxhfU2Fv
         68Zd1JQODYcS7btddSLhBA4jsCnvi5hVZAKN2NqnoZ/UiS81Bop/bEhCrJX4gJXmuW1b
         6TQa41LGbneL6WnC9WgW85mP91055P30YX3kmhO5GqcZJ9yA+MnU6sOUUBGq3kvC2w8r
         fCug==
X-Forwarded-Encrypted: i=1; AJvYcCUs7H1aw6mX1md3WBOWWoXJ0LqKg02vp6Zi5E3/i5IXYDktkXMgRTDHIOlV6Aj9c3WMbOknUpR6jBf0bJVQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3JME3dG7S8CkC5i+djUnI0FTtiqsCcaIhRPoMnbnMEFn1Z40H
	S93UkKQdPtxSd6IyTPcFY5e03ypi25tL8dFzouEf5yT37X/jjDykkHG8GSKP
X-Gm-Gg: ASbGncuw4IPzYWt+oxTxMGfhCyR3rkqeVPsxVMqbmu4DU3VJQ49U7TNMMlsUtM2WdOa
	e1PNpJAKE3eg2sCdaihFzpPn71BaK/4XH3qFcDymVEPZW2KMWSAEu8vUrr88NLNMdS7SZPKqG9z
	p0eh9QAlq5T8M5yGmoj7uPxNmxa/0m32sDl3O0KwZrSzO513iMebwBMQk0yZDJzFI3k+qcY/lo9
	GO/WX4h8Ivku5qrIgPoCilKu32OxdCyWe/FyLVa1E3IpK9xCLgHlI4sgxY3WtnljaOzk6VJupr4
	SXRfVaMeLu7IS2ujj7RyEUkzpjaminCpYGXYmG7cBPQxMId0kn9vSw==
X-Google-Smtp-Source: AGHT+IGioYLdHEcYpe7Ql0oWUJaIoLj8MNVpPVq2sdeoS0Dfon0r/cQmtnzkK1aQXqx5nzr9RUfCpw==
X-Received: by 2002:a05:6122:1808:b0:518:859e:87ae with SMTP id 71dfb90a1353d-51f0c4abcebmr1300854e0c.7.1738742605715;
        Wed, 05 Feb 2025 00:03:25 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c3d224sm1810915e0c.26.2025.02.05.00.03.25
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 00:03:25 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4afde39e360so1634569137.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 05 Feb 2025 00:03:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUADuly81R32IF4LYfchyZDrQTjlHSxzBxLJZyXgjJvzwdmpnO/WmrxnaryDF23oJiLAcraKhld6Xb8Plnu@lists.linux.dev
X-Received: by 2002:a05:6102:5799:b0:4b2:cc94:1877 with SMTP id
 ada2fe7eead31-4ba47970ea1mr1390137137.13.1738742604981; Wed, 05 Feb 2025
 00:03:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502051327.dUo3s7aG-lkp@intel.com>
In-Reply-To: <202502051327.dUo3s7aG-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Feb 2025 09:03:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX--4MzHVOwBy9_RwJ_ftt03HDoEPiWzRpOP5kDDw8ZdQ@mail.gmail.com>
X-Gm-Features: AWEUYZn5vSos31j6kCgTKXD8Xr39u3fWavTY8IH_rfCVTlJhW2_24ktRlrmQ75o
Message-ID: <CAMuHMdX--4MzHVOwBy9_RwJ_ftt03HDoEPiWzRpOP5kDDw8ZdQ@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 3/15] drivers/spi/spi-litespi.c:90:50:
 sparse: sparse: cast to restricted __be16
To: kernel test robot <lkp@intel.com>
Cc: Filip Kokosinski <fkokosinski@internships.antmicro.com>, oe-kbuild-all@lists.linux.dev, 
	Gabriel Somlo <gsomlo@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Wed, 5 Feb 2025 at 06:34, kernel test robot <lkp@intel.com> wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   a1cd33eb9593685b8b0716cbecf1a817b6410ca2
> commit: 4743eb95afc8c00bcdc3b4e5fc8b7602e9b096e8 [3/15] LiteX: driver for LiteSPI
> config: arm-randconfig-r123-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051327.dUo3s7aG-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce: (https://download.01.org/0day-ci/archive/20250205/202502051327.dUo3s7aG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502051327.dUo3s7aG-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
> >> drivers/spi/spi-litespi.c:90:50: sparse: sparse: cast to restricted __be16
> >> drivers/spi/spi-litespi.c:96:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __be16 [usertype] @@
>    drivers/spi/spi-litespi.c:96:39: sparse:     expected unsigned short [usertype]
>    drivers/spi/spi-litespi.c:96:39: sparse:     got restricted __be16 [usertype]
> >> drivers/spi/spi-litespi.c:107:50: sparse: sparse: cast to restricted __be32
> >> drivers/spi/spi-litespi.c:113:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
>    drivers/spi/spi-litespi.c:113:39: sparse:     expected unsigned int [usertype]
>    drivers/spi/spi-litespi.c:113:39: sparse:     got restricted __be32 [usertype]

Thanks for your report!
>
> vim +90 drivers/spi/spi-litespi.c
>
>     44
>     45  static int litespi_rxtx(struct spi_controller *ctlr, struct spi_device *spi,
>     46                          struct spi_transfer *t)
>     47  {
>     48          struct litespi_hw *hw = spi_controller_get_devdata(ctlr);
>     49          u16 ctl_word = t->bits_per_word << LITESPI_CTRL_SHIFT_BPW;
>     50          int i;
>     51
>     52          /* set chip select */
>     53          litex_write8(hw->base + LITESPI_OFF_CS, BIT(spi_get_chipselect(spi, 0)));
>     54
>     55          /* set word size */
>     56          litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
>     57
>     58          /* add start bit to ctl_word */
>     59          ctl_word |= BIT(LITESPI_CTRL_START_BIT);
>     60
>     61          /*
>     62           * Validated SPI transfer length is multiple of SPI word size, which
>     63           * is itself a power-of-two multiple, and fits in a litex subregister
>     64           */
>     65          if (t->bits_per_word <= 8) {
>     66                  const u8 *tx = t->tx_buf;
>     67                  u8 *rx = t->rx_buf;
>     68
>     69                  /* word size is 1 byte */
>     70                  for (i = 0; i < t->len; i++) {
>     71                          if (tx)
>     72                                  litex_write8(hw->base +
>     73                                                   LITESPI_OFF_MOSI, *tx++);
>     74
>     75                          litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
>     76                          litespi_wait_xfer_end(hw);
>     77
>     78                          if (rx)
>     79                                  *rx++ = litex_read8(hw->base +
>     80                                                          LITESPI_OFF_MISO);
>     81                  }
>     82          } else if (t->bits_per_word <= 16) {
>     83                  const u16 *tx = t->tx_buf;
>     84                  u16 *rx = t->rx_buf;

s/u16/__be16/ in the two lines above.

>     85
>     86                  /* word size is 2 bytes */
>     87                  for (i = 0; i < t->len / 2; i++) {
>     88                          if (tx)
>     89                                  litex_write16(hw->base + LITESPI_OFF_MOSI,
>   > 90                                                   be16_to_cpu(*tx++));
>     91
>     92                          litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
>     93                          litespi_wait_xfer_end(hw);
>     94
>     95                          if (rx)
>   > 96                                  *rx++ = cpu_to_be16(litex_read16(
>     97                                                  hw->base + LITESPI_OFF_MISO));
>     98                  }
>     99          } else {
>    100                  const u32 *tx = t->tx_buf;
>    101                  u32 *rx = t->rx_buf;

s/u32/__be32/ in the two lines above.

>    102
>    103                  /* word size is 4 bytes */
>    104                  for (i = 0; i < t->len / 4; i++) {
>    105                          if (tx)
>    106                                  litex_write32(hw->base + LITESPI_OFF_MOSI,
>  > 107                                                   be32_to_cpu(*tx++));
>    108
>    109                          litex_write16(hw->base + LITESPI_OFF_CTRL, ctl_word);
>    110                          litespi_wait_xfer_end(hw);
>    111
>    112                          if (rx)
>  > 113                                  *rx++ = cpu_to_be32(litex_read32(
>    114                                                  hw->base + LITESPI_OFF_MISO));
>    115                  }
>    116          }
>    117
>    118          return 0;
>    119  }
>    120

I verified there is no change in generated code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
