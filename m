Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8831C41760
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 09:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743413929; cv=none; b=GqEyC1H4QWkVHAw2rDHaJNj5f4tH3LEDbhQKEd4WpFjgFH04cOeStuIJN8pdxU+xhcDivjf2bcBxoxN7TwFoMFXKBa1WgrRAElIf002Vc3BOfPgX4NOufWDpiQt7jPkIHt8BYiELCgae8QF9m3yZsPDY74c85B6fUbr5r0EgHiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743413929; c=relaxed/simple;
	bh=I7UNyDBbA9jDRS+zpL+Q1Gy4CwKC+2rj1AFqEXPNc+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAc2W2ICgLxVxBZjEbBUVfJIeaf936MznoLiO7yVlxL1pTQBs/SOHpqPWU8/rbk+zPnofvRxewV35nBTgp/4XYvuATFtq8V5kkEAOLNx4XdPi6WWpScYBVhPqGfuJQtrRz+/X1lbCA60X1dSgbRGqv8Em3Qrr5eLhQ9Tfe24a5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KRBRiSc/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KRBRiSc/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43948021a45so42930905e9.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 02:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743413926; x=1744018726; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTvbIUBPW1DmF7yCVGeHkhbc+ahxTr1adm6t4e4kNrY=;
        b=KRBRiSc/lQbCkwtwNUmbopYmCwNavMSTqatskN5YTer6dZpYDBhE+ZYTJ8dnJ7oJ8h
         psogVuGPmwzlNLbPOl7IOZX7tCvi0HFf8hwc5GL8RlZy+DJiJt/XjGYpjhe144/+8Joo
         gwTwnHJHi41QVUIsNjD2ro4XJMnudYTT7SBsr1ZbUXLMYM0XyKeKlJBOJJ8qLKa+V179
         BLwAFqWE44dZ93UzLfs0jzAOUMF1vhQ9ck5vVfOiQGSGvUthdWUvpzftRzIeJDbtJi7s
         pagOyLmLOtqGYkFsfnuTYTGAfVWjXtgrzzdJsRUfH2mi/S+lfEDJ9rGbWGduQYCoclhe
         Ix6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743413926; x=1744018726;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTvbIUBPW1DmF7yCVGeHkhbc+ahxTr1adm6t4e4kNrY=;
        b=ahrvVnSVsjY9se0DmEmCI4y4++/1zjvz0XA1ZBpRhGk96gk5SkWck6LBg+h6DWSmqs
         WBDhN4QYDE112tYw3fz7vb5nRzDGPSCgEYHQlR4IGWgtL8eKcEuZ1j+BX2TSyJ7HvnEN
         rnPA5CExUa0l9isNV182gDuRGRfqov/nARFtUa4wTsi304yhb80jv8M5guPHPYpkaxYV
         31UavZV/StYhiFh79VdcwZNynpppsj/4xlt/flCJgoYplqAEAmra/SJvOtAIyivFjBwY
         be2VDFQj+FAgyYVB+fbdDVEetN/GN6SxZRWalJwCjanDuvhgcSlYjmGkGKi1XcNZMlUr
         aOpA==
X-Forwarded-Encrypted: i=1; AJvYcCUrmtIU9eZjlNrzcsvZDIOnUWY4yCkIJimWMxLDgd/6BedUAlPFB5uEP//6A4UhTe4PooJMm3jEpq65wIDs@lists.linux.dev
X-Gm-Message-State: AOJu0YwFiKW/ilx8d2KJBVN9lNW3p0UubtbIZUvY4balVYjnsTyA0BDq
	aKKidkUI0fGSSOAeRPJnTITZTZnRG1Ds05RZgDIhEICaNQE8Yrupv9lCf7jQi1k=
X-Gm-Gg: ASbGnctrK+/X/yvJn0sqigS34ZRGZMachuntJ4/SFWp6mHT1Qet8GJTjt1KQDoDKDLY
	2ZgDAjjD/PN3ZOG9zBn3c3YlxJzA4HIGSodidjN3cLuAK7gsk7vE/5ZNwmqvcwOeXlDT6y4Db4v
	uJLKokRGJuyCLtjzVUXUppoOkxSjHPTMqOcSHSNH9+sCDUxEcXNDDxCNFBypl/IVyRl622951cG
	qTybG7Gq+bI+otO8kezOYUNQUBtZGZ919GmTiv1Qe1Aco58zgu3Ucq8ygeqnYRscxTC2zb32Dq6
	23miL08csnK0SpGe3hbOvFZijnlYhCdkcNEgdUe3Ep3gAwWyXfs7rCioY2Dc
X-Google-Smtp-Source: AGHT+IHGnNUC+2mfT8wXcz6JVOv/TUyQEYUhFeLpUqCUkFasATg/jdDibO3HGsXSjZ3Kbed9rjwnHA==
X-Received: by 2002:a05:600c:4e87:b0:43c:f5fe:5c26 with SMTP id 5b1f17b1804b1-43db61d8249mr63350045e9.4.1743413925790;
        Mon, 31 Mar 2025 02:38:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d82dedd03sm159698295e9.3.2025.03.31.02.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:38:45 -0700 (PDT)
Date: Mon, 31 Mar 2025 12:38:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Robert Winkler <rwinkler@internships.antmicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Gabriel Somlo <gsomlo@gmail.com>,
	Marek Czerski <m.czerski@ap-tech.pl>,
	Stafford Horne <shorne@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 6/15] drivers/gpio/gpio-litex.c:228
 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.
Message-ID: <f8480c68-70e3-478b-927f-d21f9d0cef14@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/litex-hub/linux litex-rebase
head:   896969d069ea7223671dd1aac991c551baa91bac
commit: 3eb679a2997bf7eb6be1760544632505440a563f [6/15] LiteX: driver for LiteGPIO interface
config: s390-randconfig-r072-20250330 (https://download.01.org/0day-ci/archive/20250330/202503301335.C7M94pcE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503301335.C7M94pcE-lkp@intel.com/

smatch warnings:
drivers/gpio/gpio-litex.c:228 litex_gpio_irq_set_type() warn: inconsistent returns '&gpio_s->gpio_lock'.

vim +228 drivers/gpio/gpio-litex.c

3eb679a2997bf7 Robert Winkler 2020-12-22  188  static int litex_gpio_irq_set_type(struct irq_data *idata, unsigned int type)
3eb679a2997bf7 Robert Winkler 2020-12-22  189  {
3eb679a2997bf7 Robert Winkler 2020-12-22  190  	struct gpio_chip *chip = irq_data_get_irq_chip_data(idata);
3eb679a2997bf7 Robert Winkler 2020-12-22  191  	struct litex_gpio *gpio_s = gpiochip_get_data(chip);
3eb679a2997bf7 Robert Winkler 2020-12-22  192  	int offset = irqd_to_hwirq(idata) % GPIO_PINS_MAX;
3eb679a2997bf7 Robert Winkler 2020-12-22  193  	unsigned long flags;
3eb679a2997bf7 Robert Winkler 2020-12-22  194  	u32 bit = BIT(offset);
3eb679a2997bf7 Robert Winkler 2020-12-22  195  	u32 mode, edge;
3eb679a2997bf7 Robert Winkler 2020-12-22  196  
3eb679a2997bf7 Robert Winkler 2020-12-22  197  	spin_lock_irqsave(&gpio_s->gpio_lock, flags);
3eb679a2997bf7 Robert Winkler 2020-12-22  198  
3eb679a2997bf7 Robert Winkler 2020-12-22  199  	mode = litex_gpio_get_reg(gpio_s, LITEX_GPIO_MODE_OFFSET);
3eb679a2997bf7 Robert Winkler 2020-12-22  200  	edge = litex_gpio_get_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET);
3eb679a2997bf7 Robert Winkler 2020-12-22  201  
3eb679a2997bf7 Robert Winkler 2020-12-22  202  	switch (type & IRQ_TYPE_SENSE_MASK) {
3eb679a2997bf7 Robert Winkler 2020-12-22  203  		case IRQ_TYPE_NONE:
3eb679a2997bf7 Robert Winkler 2020-12-22  204  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  205  
3eb679a2997bf7 Robert Winkler 2020-12-22  206  		case IRQ_TYPE_EDGE_RISING:
3eb679a2997bf7 Robert Winkler 2020-12-22  207              mode &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  208  			edge &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  209  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  210  
3eb679a2997bf7 Robert Winkler 2020-12-22  211  		case IRQ_TYPE_EDGE_FALLING:
3eb679a2997bf7 Robert Winkler 2020-12-22  212              mode &= ~bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  213  			edge |= bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  214  			break;
3eb679a2997bf7 Robert Winkler 2020-12-22  215  
3eb679a2997bf7 Robert Winkler 2020-12-22  216          case IRQ_TYPE_EDGE_BOTH:
3eb679a2997bf7 Robert Winkler 2020-12-22  217  			mode |= bit;
3eb679a2997bf7 Robert Winkler 2020-12-22  218              break;
3eb679a2997bf7 Robert Winkler 2020-12-22  219  
3eb679a2997bf7 Robert Winkler 2020-12-22  220  		default:
3eb679a2997bf7 Robert Winkler 2020-12-22  221  			return -EINVAL;

unlock before returning.

3eb679a2997bf7 Robert Winkler 2020-12-22  222  	}
3eb679a2997bf7 Robert Winkler 2020-12-22  223  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_MODE_OFFSET, mode);
3eb679a2997bf7 Robert Winkler 2020-12-22  224  	litex_gpio_set_reg(gpio_s, LITEX_GPIO_EDGE_OFFSET, edge);
3eb679a2997bf7 Robert Winkler 2020-12-22  225  
3eb679a2997bf7 Robert Winkler 2020-12-22  226  	spin_unlock_irqrestore(&gpio_s->gpio_lock, flags);
3eb679a2997bf7 Robert Winkler 2020-12-22  227  
3eb679a2997bf7 Robert Winkler 2020-12-22 @228  	return 0;
3eb679a2997bf7 Robert Winkler 2020-12-22  229  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

