Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913C0126BF7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 06:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890129; cv=none; b=DoErNIazn4eBQTX9ggEm6B1/uxtN3Jg0axujvCHF2IdgcVjN8ifoQzHRoJtGwuQbwDMRA61a/UPxoQ9LIgVHjinpFKAUT9Cr0gbT5ZL77vdHDJR6Y9oRsznfP3kfHJ8/IaRZPVrtplagvyPPVt7Gy5nisLUjn2mpPry2josVgjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890129; c=relaxed/simple;
	bh=1ag5yhK2pzA2YXeOLuPeEPZIPT1YwYQUzomD839uEXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fl26XTOoFvm+bYrbC3ZXvbCSI/AeLfgWowSJwy7ZNYjH2co4MWuxVdxqcL6sEx2LR4sOjoNKillvsYfJqMhRFMtnismpJScgXNuyDQFJBR2NfjKY17Gsv+oZPB0g/KXTmLdLh60QEVRt0Kpw5F56tEpSHStE1fB11Tcs8nY8rNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lx69Vi7W; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lx69Vi7W"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so20807375e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 22:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768890123; x=1769494923; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqcCKSyPCqADRPm0OZTWiOZxxfMu7XITKXeHqCYF8Y0=;
        b=lx69Vi7WoigvQELMcoxXd1+gagq8bblLc5Bibkctj/8bRAa4m5YVbVHbyxzVlBSQgI
         +kPDzTU1YvQb+GSHGtawN60gMdsTQghcoeelfDDzH+k2c1LL/1PF0S5LJ2/Xtb6GdUR5
         +VidkaY+aE7i2vm53qMk9ufkyh+M09ylsTtzyKFYN83RI4xqHaMpKWyjkF1ikdZb6LjI
         HisabSPfyCkCmuaycCN7oBnnZJizhc2J3cL9zmr+1r2ngXzaexCnlIptPhEN2KkOUonG
         iA3r4AwAerTemf0Wx3uxYYh4gC6boARa4xvSFHQeue0yrkuePX5cvJpEbXsMJksZcI0H
         Wk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890123; x=1769494923;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqcCKSyPCqADRPm0OZTWiOZxxfMu7XITKXeHqCYF8Y0=;
        b=daTYBGC5wfBpgcWGDD9o/25RfcGsv/YHr2JlkkL8XuaR24Y+joS29ADXPfaGC9/xf/
         EZKXBRbsWFaI7CwBkzfi5a1lC7N2S6fCopCA8mIt0rCNb9edpVjYQ6iYyOWgQanKl+nu
         i/UxEYtDfdftwNUqk0sYTkmn6oec7IIrJ+gOldLa6UYwez8IhvdVOO0Z41Th0IyxHdL0
         TYK12w4Cr5jWWkzCgA51Mta19e+vHhLwMa6WsUcHCA4vgdT32v63LjUZMn4f1Q/qoVZt
         RqTF7CykZuXEZrF+iSAgShhOLwYhlgX6FokTQ+Iu6z8fDJf++OdF6rFx2wPS3zdVhcyd
         WEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2pS7ht5JYIflCc5rkgmWdBjhdoeRlX3IFNnA7pA+4RAnmnHfygX432YUFsiMJc75FUb/dx+F/BckHdR0E@lists.linux.dev
X-Gm-Message-State: AOJu0YwWW86723bv1Wh4HaTkogrTSFYdYBhCM6Gh1clG5HKPwEQCaZzc
	RjfnHPfJ113qwIgjMV5K7TWOG4TqnXsPY943yIQ32RY6dpb9X7h6QF7XhLowZyjAD38=
X-Gm-Gg: AY/fxX7K6BkIAA4TmkD0iZKEsD6dFr+n5T71Hz3Z8SbkQ6BFjaTwEqAxhqXFVxi12nK
	ZjZjAsAtqFINWqFxMe8J469Lv+b8A0RwHsIC8KAU5xX0tSoBvDn/4AGHNJtCfhxOUcyI+nxKo8V
	5WmaSnqIah0ISIGx2/5e35tfl9Z/GBR7qkSF9bTtRsKG08RPYh7g663ga/9k2gwE6lW6KcRKLUa
	gGpg8THtuR6F1HyOIxFrIErn+wQxWBKHiAAUQfHDP3VxL1ySIk6UqKO06evSYeE2GGSGXNFR6yh
	IkBMInhdOS01wUn2ehT+7qE1IrDdlHbwelpe7T3rdQuZhtAnes/bhJbeeqJXmRkKCLubFvKb4+P
	vhRGYZQVsuVKFPpStKxQbS88R9Tbu+vj18fqNzDI0oYSURD1u5VqqLFeeKF9oylp0dq8Beautt1
	GPy9b/FltaPluPHSg1
X-Received: by 2002:a05:600c:310e:b0:47d:885d:d2ff with SMTP id 5b1f17b1804b1-4801eb11002mr159745445e9.29.1768890122511;
        Mon, 19 Jan 2026 22:22:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f12ee69sm2389711f8f.11.2026.01.19.22.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:22:02 -0800 (PST)
Date: Tue, 20 Jan 2026 09:21:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 196/196]
 sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy()
 'hcp->iec_status' too small (5 vs 24)
Message-ID: <202601192317.zYZXE5wG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 9eda09e511f648adf90efdb805e2429bf5bc25cb [196/196] UPSTREAM: ASoC: hdmi-codec: Add a prepare hook
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260119/202601192317.zYZXE5wG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601192317.zYZXE5wG-lkp@intel.com/

New smatch warnings:
sound/soc/codecs/hdmi-codec.c:587 hdmi_codec_prepare() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

Old smatch warnings:
sound/soc/codecs/hdmi-codec.c:551 hdmi_codec_hw_params() error: __memcpy() 'hcp->iec_status' too small (5 vs 24)

vim +587 sound/soc/codecs/hdmi-codec.c

9eda09e511f648 Maxime Ripard    2021-05-25  565  static int hdmi_codec_prepare(struct snd_pcm_substream *substream,
9eda09e511f648 Maxime Ripard    2021-05-25  566  			      struct snd_soc_dai *dai)
9eda09e511f648 Maxime Ripard    2021-05-25  567  {
9eda09e511f648 Maxime Ripard    2021-05-25  568  	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
9eda09e511f648 Maxime Ripard    2021-05-25  569  	struct hdmi_codec_daifmt *cf = dai->playback_dma_data;
9eda09e511f648 Maxime Ripard    2021-05-25  570  	struct snd_pcm_runtime *runtime = substream->runtime;
9eda09e511f648 Maxime Ripard    2021-05-25  571  	unsigned int channels = runtime->channels;
9eda09e511f648 Maxime Ripard    2021-05-25  572  	unsigned int width = snd_pcm_format_width(runtime->format);
9eda09e511f648 Maxime Ripard    2021-05-25  573  	unsigned int rate = runtime->rate;
9eda09e511f648 Maxime Ripard    2021-05-25  574  	struct hdmi_codec_params hp;
9eda09e511f648 Maxime Ripard    2021-05-25  575  	int ret;
09184118a8abae Jyri Sarha       2016-03-31  576  
9eda09e511f648 Maxime Ripard    2021-05-25  577  	if (!hcp->hcd.ops->prepare)
9eda09e511f648 Maxime Ripard    2021-05-25  578  		return 0;
9eda09e511f648 Maxime Ripard    2021-05-25  579  
9eda09e511f648 Maxime Ripard    2021-05-25  580  	dev_dbg(dai->dev, "%s() width %d rate %d channels %d\n", __func__,
9eda09e511f648 Maxime Ripard    2021-05-25  581  		width, rate, channels);
9eda09e511f648 Maxime Ripard    2021-05-25  582  
9eda09e511f648 Maxime Ripard    2021-05-25  583  	ret = hdmi_codec_fill_codec_params(dai, width, rate, channels, &hp);
9eda09e511f648 Maxime Ripard    2021-05-25  584  	if (ret < 0)
9eda09e511f648 Maxime Ripard    2021-05-25  585  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  586  
9eda09e511f648 Maxime Ripard    2021-05-25 @587  	memcpy(hp.iec.status, hcp->iec_status, sizeof(hp.iec.status));

Read overflow.  hp.iec.status is bigger than hcp->iec_status.

9eda09e511f648 Maxime Ripard    2021-05-25  588  	ret = snd_pcm_fill_iec958_consumer(runtime, hp.iec.status,
9eda09e511f648 Maxime Ripard    2021-05-25  589  					   sizeof(hp.iec.status));
9eda09e511f648 Maxime Ripard    2021-05-25  590  	if (ret < 0) {
9eda09e511f648 Maxime Ripard    2021-05-25  591  		dev_err(dai->dev, "Creating IEC958 channel status failed %d\n",
9eda09e511f648 Maxime Ripard    2021-05-25  592  			ret);
9eda09e511f648 Maxime Ripard    2021-05-25  593  		return ret;
9eda09e511f648 Maxime Ripard    2021-05-25  594  	}
9eda09e511f648 Maxime Ripard    2021-05-25  595  
9eda09e511f648 Maxime Ripard    2021-05-25  596  	cf->bit_fmt = runtime->format;
9eda09e511f648 Maxime Ripard    2021-05-25  597  	return hcp->hcd.ops->prepare(dai->dev->parent, hcp->hcd.data,
0cf4610b9f297e Jerome Brunet    2019-05-06  598  				     cf, &hp);
09184118a8abae Jyri Sarha       2016-03-31  599  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

