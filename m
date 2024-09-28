Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D558219AD85
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 09:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727515091; cv=none; b=JMgiyMoNObhA6Ff2MmhR+crX0dO8veKd/oNijikOaIHAo/qc+M2oXfFDpb0/7KvaELsu5O4O50jiyeMCB9swIXMUu5pHPPRfLtMJ/EDXytMY+CXBcVUDl//+l//xHDx4dCCEPOiuEsvNg9x5KRzOH9758lXtKCNf+4+oZzhQ4aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727515091; c=relaxed/simple;
	bh=/tnHTMVqWE4db5Wn37v006A8yI2jDJs76MG/NuX+nIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=dB99EznGh1Di7e1QsiOB7WmG0g7ydcS78NQs3iS8z3VIpguq7ZC29xPFv2xUckPtP2zwOXTjG0Kd2KYRsZD0s+q7wRp/sI8yQuieTmXO5ttNAXKb+fter7IskJY/YwEKnZmput+Y8SW/rvpTAb7NhI0WB6R55XARb5hl+vfENlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHQk/OFV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHQk/OFV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-37cc810ce73so1772536f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 02:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727515088; x=1728119888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GC9KpjYQ8SyUGpndgfxHfRjpZcEF2RD6QHN1LZE1WG4=;
        b=UHQk/OFVROqgczvLLbT7bTHjt7K62/yCgQNLHw89MABTNrC3WzUhLvapPj87xL9FQN
         NkoLzEouc/Up2lybq1Vjmt+w3YpjXAGiCMYxwd0t0imOWJFd5mrSqPQYxcDvjYhHkBr0
         lmXQrCexMtXQsHNdju+HDPllarHrvwavXaIFBzC+o3kb2DumdcpVDPO/fz9jR6ItGFl0
         2jA9Mm35HE1gALaw388RMZxGnIjUZNQbTR8jWRJ9ldX6oJU/Fjx7KLNZm6R0L+emxOQ1
         z34vKW0U8GWgTKORfClrEEGuBI1e6Oth7MkScsuqkc1RkHkMfT7NDuyipORS+ZmvzPIH
         NnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727515088; x=1728119888;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GC9KpjYQ8SyUGpndgfxHfRjpZcEF2RD6QHN1LZE1WG4=;
        b=wiOfF45GHhzRJ8Mz781o3UwfifVt6r8xLGWD2aVW9x9FW9ow9NSPBljB1cP/8kxWPG
         CjA6sVlgJZZDQC5wWrnGpZRBeogJbix6PrZ9vuKfjqRgIkW3IIfEw/s6ukQSJEuC8BTP
         ptSQ6n+CrYTReken32zaVDISluVU3U+g9++9dacIi/1mHilajbdKmq/FrhLdS/cym0iY
         JziOD1ZWKtVFLzJo8bAdR+pjXKDoUTY3IAqHcTlAk6cu7kK86G19FgcFuagR6KxBp233
         bWk5+D7L+QwuutTXaPxuOMc+JMxvD1LIQCZ57C+R4QN+dZ8C8UI8T2z4WlMjG6cx4s7o
         zDJw==
X-Forwarded-Encrypted: i=1; AJvYcCUi5ZJCYsL9KtNedMDgqhPC6RMSG5Trh+p3F4XG7D+wm+UEww33AEHSfuAljIdRFF5Uqlw0UaeZZZGpOwdQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzNuOAbY+PUdpiEzArJIHUIGRtF7rNyPwupxfwzjCVyWbO2DmGN
	4hapLSMqbbHzrpp5PyTe4GR0CtqAd4t/sIjxcXeVQZ/+w9wn5HT7I7vrJXjk52I=
X-Google-Smtp-Source: AGHT+IHS0T6F//UR7TqdmzA4oQxAr73u64ywuJhd1FFZKMRBp+6yuNZBQ4yS/8ZiDX6LnTE9hm/hsw==
X-Received: by 2002:adf:9b87:0:b0:37c:d12c:17e0 with SMTP id ffacd0b85a97d-37cd5b285c8mr3832374f8f.56.1727515087958;
        Sat, 28 Sep 2024 02:18:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd57450c7sm4335945f8f.101.2024.09.28.02.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 02:18:07 -0700 (PDT)
Date: Sat, 28 Sep 2024 12:17:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Igor Prusov <ivprusov@salutedevices.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, kernel@salutedevices.com,
	prusovigor@gmail.com
Subject: Re: [PATCH v3 6/6] ASoC: codecs: Add NeoFidelity NTP8835 codec
Message-ID: <3a614d4a-28b0-45f4-a3be-09f312a8e679@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925-ntp-amps-8918-8835-v3-6-e2459a8191a6@salutedevices.com>

Hi Igor,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Prusov/dt-bindings-vendor-prefixes-Add-NeoFidelity-Inc/20240925-230818
base:   c7fbbb45ef78ff349d16923b516bc8667367d1a6
patch link:    https://lore.kernel.org/r/20240925-ntp-amps-8918-8835-v3-6-e2459a8191a6%40salutedevices.com
patch subject: [PATCH v3 6/6] ASoC: codecs: Add NeoFidelity NTP8835 codec
config: alpha-randconfig-r072-20240928 (https://download.01.org/0day-ci/archive/20240928/202409281054.DUTb5KxU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409281054.DUTb5KxU-lkp@intel.com/

smatch warnings:
sound/soc/codecs/ntp8835.c:431 ntp8835_i2c_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +431 sound/soc/codecs/ntp8835.c

c4c94fd2babcb9 Igor Prusov 2024-09-25  412  static int ntp8835_i2c_probe(struct i2c_client *i2c)
c4c94fd2babcb9 Igor Prusov 2024-09-25  413  {
c4c94fd2babcb9 Igor Prusov 2024-09-25  414  	struct ntp8835_priv *ntp8835;
c4c94fd2babcb9 Igor Prusov 2024-09-25  415  	struct regmap *regmap;
c4c94fd2babcb9 Igor Prusov 2024-09-25  416  	int ret;
c4c94fd2babcb9 Igor Prusov 2024-09-25  417  
c4c94fd2babcb9 Igor Prusov 2024-09-25  418  	ntp8835 = devm_kzalloc(&i2c->dev, sizeof(*ntp8835), GFP_KERNEL);
c4c94fd2babcb9 Igor Prusov 2024-09-25  419  	if (!ntp8835)
c4c94fd2babcb9 Igor Prusov 2024-09-25  420  		return -ENOMEM;
c4c94fd2babcb9 Igor Prusov 2024-09-25  421  
c4c94fd2babcb9 Igor Prusov 2024-09-25  422  	ntp8835->i2c = i2c;
c4c94fd2babcb9 Igor Prusov 2024-09-25  423  
c4c94fd2babcb9 Igor Prusov 2024-09-25  424  	ntp8835->reset = devm_reset_control_get_shared(&i2c->dev, NULL);
c4c94fd2babcb9 Igor Prusov 2024-09-25  425  	if (IS_ERR(ntp8835->reset))
c4c94fd2babcb9 Igor Prusov 2024-09-25  426  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->reset),
c4c94fd2babcb9 Igor Prusov 2024-09-25  427  				     "Failed to get reset\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  428  
c4c94fd2babcb9 Igor Prusov 2024-09-25  429  	ret = reset_control_deassert(ntp8835->reset);
c4c94fd2babcb9 Igor Prusov 2024-09-25  430  	if (ret)
c4c94fd2babcb9 Igor Prusov 2024-09-25 @431  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->reset),

PTR_ERR(ret)

c4c94fd2babcb9 Igor Prusov 2024-09-25  432  				     "Failed to deassert reset\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  433  
c4c94fd2babcb9 Igor Prusov 2024-09-25  434  	dev_set_drvdata(&i2c->dev, ntp8835);
c4c94fd2babcb9 Igor Prusov 2024-09-25  435  
c4c94fd2babcb9 Igor Prusov 2024-09-25  436  	ntp8835_reset_gpio(ntp8835);
c4c94fd2babcb9 Igor Prusov 2024-09-25  437  
c4c94fd2babcb9 Igor Prusov 2024-09-25  438  	regmap = devm_regmap_init_i2c(i2c, &ntp8835_regmap);
c4c94fd2babcb9 Igor Prusov 2024-09-25  439  	if (IS_ERR(regmap))
c4c94fd2babcb9 Igor Prusov 2024-09-25  440  		return dev_err_probe(&i2c->dev, PTR_ERR(regmap),
c4c94fd2babcb9 Igor Prusov 2024-09-25  441  				     "Failed to allocate regmap\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  442  
c4c94fd2babcb9 Igor Prusov 2024-09-25  443  	ret = devm_snd_soc_register_component(&i2c->dev, &soc_component_ntp8835,
c4c94fd2babcb9 Igor Prusov 2024-09-25  444  					      &ntp8835_dai, 1);
c4c94fd2babcb9 Igor Prusov 2024-09-25  445  	if (ret)
c4c94fd2babcb9 Igor Prusov 2024-09-25  446  		return dev_err_probe(&i2c->dev, ret,
c4c94fd2babcb9 Igor Prusov 2024-09-25  447  				     "Failed to register component\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  448  
c4c94fd2babcb9 Igor Prusov 2024-09-25  449  	ntp8835->mclk = devm_clk_get_enabled(&i2c->dev, "mclk");
c4c94fd2babcb9 Igor Prusov 2024-09-25  450  	if (IS_ERR(ntp8835->mclk))
c4c94fd2babcb9 Igor Prusov 2024-09-25  451  		return dev_err_probe(&i2c->dev, PTR_ERR(ntp8835->mclk), "failed to get mclk\n");
c4c94fd2babcb9 Igor Prusov 2024-09-25  452  
c4c94fd2babcb9 Igor Prusov 2024-09-25  453  	return 0;
c4c94fd2babcb9 Igor Prusov 2024-09-25  454  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

