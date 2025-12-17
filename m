Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160D2D73B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987592; cv=none; b=SaGQerw5gesAR21nm1jQA+ablifI/tqHtnRgXSSR7EJA/7f8rRWe67qecBcY190NZkqwYPeevxtn4N2wEW1IEALXcLrP1duHVKA0b8qTc7Ze8OB6QZoQa8DaJ4k6EXjZIqcxiJeE2D7k5OkF/dK2lK3TSyqYamHhPyva7Cmwy7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987592; c=relaxed/simple;
	bh=5AniAOa5/+PqR2pfWWBxXsgkgtusgwQDvb/Y/U1A2iY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=u9z7bSg2oYpZyvCGioULgo8RKfX/y2RstMu5hH1KHfvmBLhBUfTEdt+McuYTaZpO+eecyLeA5tAPVWFsqbfCSThqc3Q20iHN++jbc1Mm0iNT+q+zYAwYnpq7DD8AaPawFr3QTaDeMGkWQU4ENb77NOrI1NUQoDs5YIOiQi13Inc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hYUkM2XI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hYUkM2XI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so65888435e9.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765987588; x=1766592388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DhaZn5snWYZuZvKSLH9hbfe1Vg8CeCc34oBkhAsHEMg=;
        b=hYUkM2XI2VMmbVRCP8tG/DFH+oQ4Cve2aSoo3RvjVCm/taYoIJ+7pXSM3udRo62oP1
         DfL6OycFMS3EYV9aaN6PBtqnrAiHbW7+t+nhIl4jLRP1DUejecBL94Y8KecJT5I0JPFt
         VXu1tXq4Z3kovUkMDajURx7pc7EJuHHpy+rf+DBdlQMagwwstkR4ju3zJyrQlPOK12m8
         XudhHWGGXivuC7dpqMKCUXhQDaoxWTWjSd1AEES8ZnbGpReoUg4zS0z/icIiTp/sPVGq
         0BaGgVMMHyb97Lk32GtGOodkebgo8Cv+2+XRINj3nirxzybDwGfM3ZN5wZ5ZMUR0WN23
         Rskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765987588; x=1766592388;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhaZn5snWYZuZvKSLH9hbfe1Vg8CeCc34oBkhAsHEMg=;
        b=VSahvhpjGsB9KPIcr3EYHDsHfDpyD/UpcdqNcjRbhZVe/xz42+vh7eOtGx1KLeLl8X
         CmU2OuZaQf+afZ/wx0E25zckxTL7rX6dHpqfLJ7lxtULyCymFrGUseUTgIlTdBozhJ6b
         YJ0nxpX+heZIwm+V2QFtwJKIVmzVvUpk+6GUY6oxghKA6av0MWBcjFmnRfQFGhCupi1z
         WMNpOwuzJpWOZClVNsowN3xdcJglg++kVRgC3O6YWLEh4d2WjqcE68UrapszbBqHw5lW
         p19JtyTWq+t01rD2zcNWuJ2+rcwl4TOnVA4cgqAOuYibJajsvyRia2xB50r12QGQPP3s
         Mkjg==
X-Forwarded-Encrypted: i=1; AJvYcCXcbbVwI3c26iXNd1Xbbv3TLbqLMf5f/yzs82BvASrHreD7S+cIvkj3rCuZfZmVel/qr6ORJiU3eS30nLY1@lists.linux.dev
X-Gm-Message-State: AOJu0YzF4n4Xcyde9d/pWJsG2GFjob6J33eldBTrTnrH9YYKFaS1ZDiu
	fW7wTuLmG6nHiJBQNwyWUPg09c6j52zjJVob+I7LB29vvA2vej/QKr3I8Jdlq1AN6CM=
X-Gm-Gg: AY/fxX518JplPMLvE90KvxPSVcRrToyphQK48DYG2CnR816LvFcTgFRF1W1CrJeJ++k
	mxY4P2ABA3Chzj5PyAVHDIfiPoy/8TtbCSFDMwLe06Ra8D5EoIjQuERjNj73HE5M9w3cSJYipon
	OTQM2Unt5WsDMl57DlGidebFXrFf9iq1VMFRcpK+DFWs4jFaO7ngDKc8OHPgd+uwLS/6qeO8/QO
	BtSfTBjhRlK5xgicgFyTJBF2PUHc+49RyE0/saddvhIcsQSgETCsf4ZfiJIV16kM27VonbSsF9S
	ec+rjSd/C0MPJm76rl9JKJFyjOphePAdXzE1nTZwWjgcXH91OwXvnuOG2mh7T0Qe8oXPZ1Ljtr+
	NeccbooxHRJ8D0tQLBLFKYAqwdvIzvjcYQ2vmoCNt05ZS27yPcsmTAC6yKSuAAMXx0g5BksQc03
	AKeVs8ktA6YUyjWy9jNmyxTvYtxvE=
X-Google-Smtp-Source: AGHT+IE5C+8XR7IV6c4zVwBm3meFZRpb0J9v6SiNoXA//+Q4cpgDwjNmTD5ceMYxYddcVa3nUo3oWQ==
X-Received: by 2002:a05:600c:8119:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47a8f8a7170mr178296865e9.3.1765987587466;
        Wed, 17 Dec 2025 08:06:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bd90f0bd9sm34497855e9.5.2025.12.17.08.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:06:27 -0800 (PST)
Date: Wed, 17 Dec 2025 19:06:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Oder Chiou <oder_chiou@realtek.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202512140909.a0ok9gVy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-3-oder_chiou@realtek.com>

Hi Oder,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-support-for-ALC5575/20251211-190355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251211110130.2925541-3-oder_chiou%40realtek.com
patch subject: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
config: parisc-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140909.a0ok9gVy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512140909.a0ok9gVy-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt5575.c:256 rt5575_fw_load_by_spi() error: uninitialized symbol 'ret'.

vim +/ret +256 sound/soc/codecs/rt5575.c

56f073d89eb8e0 Oder Chiou 2025-12-11  247  static int rt5575_fw_load_by_spi(struct rt5575_priv *rt5575)
56f073d89eb8e0 Oder Chiou 2025-12-11  248  {
56f073d89eb8e0 Oder Chiou 2025-12-11  249  	struct i2c_client *i2c = rt5575->i2c;
56f073d89eb8e0 Oder Chiou 2025-12-11  250  	struct spi_device *spi;
56f073d89eb8e0 Oder Chiou 2025-12-11  251  	struct device *dev = &i2c->dev;
56f073d89eb8e0 Oder Chiou 2025-12-11  252  	int ret;
56f073d89eb8e0 Oder Chiou 2025-12-11  253  
56f073d89eb8e0 Oder Chiou 2025-12-11  254  	spi = rt5575_spi_find_device();
56f073d89eb8e0 Oder Chiou 2025-12-11  255  	if (!spi) {
56f073d89eb8e0 Oder Chiou 2025-12-11 @256  		dev_err(dev, "Get SPI device failure: %d\n", ret);
                                                                                                     ^^^
ret isn't initialized.

56f073d89eb8e0 Oder Chiou 2025-12-11  257  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  258  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  259  
56f073d89eb8e0 Oder Chiou 2025-12-11  260  	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
56f073d89eb8e0 Oder Chiou 2025-12-11  261  	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  262  	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
56f073d89eb8e0 Oder Chiou 2025-12-11  263  
56f073d89eb8e0 Oder Chiou 2025-12-11  264  	ret = rt5575_spi_fw_load(spi);
56f073d89eb8e0 Oder Chiou 2025-12-11  265  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  266  		dev_err(dev, "Load firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  267  		return -ENODEV;

s/-ENODEV/ret/

56f073d89eb8e0 Oder Chiou 2025-12-11  268  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  269  
56f073d89eb8e0 Oder Chiou 2025-12-11  270  	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  271  	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
56f073d89eb8e0 Oder Chiou 2025-12-11  272  
56f073d89eb8e0 Oder Chiou 2025-12-11  273  	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  274  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  275  		dev_err(dev, "Run firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  276  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  277  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  278  
56f073d89eb8e0 Oder Chiou 2025-12-11  279  	return 0;
56f073d89eb8e0 Oder Chiou 2025-12-11  280  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

