Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A07F18B470
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727427299; cv=none; b=Vf18gEn/+dnaxyEKZZPIaLTBGekTd2BW2JUKfAdvmQvOSIHQlE7yxxf+TQYqfLPLU5dYz+o2drEDFtuiHb0oUU6ScgoBujE4YIWrPcu5HaOy8qIElROjutImVEbbtRdAjb0PqO1uORLAIAp8iMigv2X/DWQM0BFfCHpYpKdyTrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727427299; c=relaxed/simple;
	bh=zic0Dg/dCbMZxqQJEQ25W9/BN0Y1inzaAvDqykddIuc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iiNSo/wd0KlesQ4eT7DFLCdW7xSEozZE/NQI5LZ3NBuyPW0CBhneCHhoAnHmx7FAvKUPs9CDFo0TYwTLuTuuqS+E1AG7c9Bi5S9Uu7A8tortMgbTLuVCrjmDAYaKlbz9rH3exiKfNSkvl9QkN/IZ+6bKY2dQ9+lsBXYQpOVEEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZLaq2qoT; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZLaq2qoT"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37cdbdbbb1cso67013f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727427295; x=1728032095; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fcxi9p0WS1Xn5TcqlEIVcCis68ua1c6HTQWsnqVKYr0=;
        b=ZLaq2qoT9qcTsTvSTiPPtdfKBbUY3tJQXwZGZ0pyVmOmnMjqEaq92nFBI34H8AfTcM
         gwRLYlLiO5lW2uO4yqvCg4he7YuNMLLaq3xldvJvIqmeXhhwakmEQ72NUFWMocxeoiCp
         3f8FKIjqBu9gyymM9n69Doj6vt11bdJcc9S+vUAI5Ttx81UlCtF8y4YunpOEbXi5PWEb
         dNpflryXZ/4YMP+Ixu0BuIT78p+f1OP/U+17TODflcEPuJFZDzqWalM65juWmOAJ3E5m
         wRkfTYAEoiSAJOELggQjt0OdJw5jI1dEvC6FqbzRKnrLW7OIph3L6YBQjR0tvwjlEZF1
         T6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727427295; x=1728032095;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcxi9p0WS1Xn5TcqlEIVcCis68ua1c6HTQWsnqVKYr0=;
        b=BBQUEdDcr/By3l+7OWTe7muuwP0Yp8wvpAoRZsa4iu5aSmrbrxDSxzWFAugedNfqe2
         1IHmOEbdPzKYwfAYl1Q211xJ1f/PNGkyVTY/OaKb8iAJ14XbpERI+bbe/B/RPOyBL9GE
         e6RHEVKpZZOfyEX2oUgVNsexrwfdjg5NjwFsSBXwT/Z4WCDXTVtSrZcYmNV/h72QygT1
         ySD6gIPImfQRA0HCfVIBuJhabKycKSUF+6mmwc2ht1p3JXWQvb00iQchFhQ1CFGS1+FF
         ShHvjmTN5wC8o/4zy/CPj3bH9y52bC/ZElw/U1shHoKxchyiFzXrqILbrVSLguw3NACE
         hRvA==
X-Gm-Message-State: AOJu0YwaUsPhjc4lYevzU/sR81+Q1K7k+0m9FBrfZ5+mK81rscViNx+7
	MPsMX1gsiizeaPRPT+ArpzXqhuCuSm/oUAQvzb5zh+L8qLShU2L+6d5gU3pFDFY=
X-Google-Smtp-Source: AGHT+IHKtO/dvTlVM1i/G+FGnBmWNQ9Yarjiy9ww/jRrpEBTgYJsnEG4Sk5NeX3B7xgTn4KPY7UclA==
X-Received: by 2002:adf:f406:0:b0:37c:cc5e:9996 with SMTP id ffacd0b85a97d-37cd5a631c7mr1504551f8f.8.1727427294771;
        Fri, 27 Sep 2024 01:54:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a84:8f2f:8bdb:87])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d2d2sm1936801f8f.1.2024.09.27.01.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 01:54:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [clk-meson:clk-meson-next 11/11]
 drivers/clk/meson/meson8b.c:3700:23: warning: unused variable 'flags'
In-Reply-To: <202409271243.xjYHZS7H-lkp@intel.com> (kernel test robot's
	message of "Fri, 27 Sep 2024 12:36:50 +0800")
References: <202409271243.xjYHZS7H-lkp@intel.com>
Date: Fri, 27 Sep 2024 10:54:53 +0200
Message-ID: <1j7caxxyqq.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 27 Sep 2024 at 12:36, kernel test robot <lkp@intel.com> wrote:

> tree:   https://github.com/BayLibre/clk-meson.git clk-meson-next
> head:   e736da1956cf0880a02ec5023f3487eea7611b5f
> commit: e736da1956cf0880a02ec5023f3487eea7611b5f [11/11] clk: meson: meson8b: remove spinlock
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271243.xjYHZS7H-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271243.xjYHZS7H-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409271243.xjYHZS7H-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/clk/meson/meson8b.c: In function 'meson8b_clk_reset_update':
>>> drivers/clk/meson/meson8b.c:3700:23: warning: unused variable 'flags' [-Wunused-variable]
>     3700 |         unsigned long flags;
>          |                       ^~~~~

Silly mistake. I'll amend the commit if that's ok with you Martin ?

>
>
> vim +/flags +3700 drivers/clk/meson/meson8b.c
>
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3692  
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3693  static int meson8b_clk_reset_update(struct reset_controller_dev *rcdev,
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3694  				    unsigned long id, bool assert)
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3695  {
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3696  	struct meson8b_clk_reset *meson8b_clk_reset =
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3697  		container_of(rcdev, struct meson8b_clk_reset, reset);
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3698  	const struct meson8b_clk_reset_line *reset;
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17  3699  	unsigned int value = 0;
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17 @3700  	unsigned long flags;
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3701  
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3702  	if (id >= ARRAY_SIZE(meson8b_clk_reset_bits))
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3703  		return -EINVAL;
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3704  
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3705  	reset = &meson8b_clk_reset_bits[id];
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3706  
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17  3707  	if (assert != reset->active_low)
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17  3708  		value = BIT(reset->bit_idx);
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17  3709  
> 93c873d6864616 Martin Blumenstingl 2018-07-21  3710  	regmap_update_bits(meson8b_clk_reset->regmap, reset->reg,
> 0d3051c790ed2e Martin Blumenstingl 2020-04-17  3711  			   BIT(reset->bit_idx), value);
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3712  
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3713  	return 0;
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3714  }
> 189621726bc2f6 Martin Blumenstingl 2017-07-28  3715  
>
> :::::: The code at line 3700 was first introduced by commit
> :::::: 0d3051c790ed2ef6bd91b92b07220313f06b95b3 clk: meson: meson8b: Fix the polarity of the RESET_N lines
>
> :::::: TO: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> :::::: CC: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome
