Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43ABA2564
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 06:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727936593; cv=none; b=QSz4mH2a3UKC3XS1FvTGMZCSLqJltrvRMYSwVFq8plyxJJymJKCGxA2ZQT2rhCRWLYyiMUt/JiPqrmtEGmtCN4NHbwYeLs1gTALZU+pJB2jbBMy6vS0A85WK3KFfk/M/IU/kkD4ucqw8qtwD4U9c1H44CrpT//dtPqUW1iiP2oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727936593; c=relaxed/simple;
	bh=7E6ay5FVbH5HEXlZlqw9wm4R1KpLCGGc25E8+Z00cuk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXK8eJHsjlhI7jc15LVpWutQm/eRtdWR3z4dp32T/BOB6mhHF1dZmGO2JPmfzwSb/8DvWs7lrrisGliWgpcZJND46oZeUXD7KToDaWppcxq/bL6yndOiv7B7ES6iGEAXbX1nY0CRSmJliV2CKWGvbGf1SyXjPdaKwPrWLGEyVTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfGjGWco; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfGjGWco"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5398996acbeso606998e87.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 23:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727936589; x=1728541389; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJTABH0yTDU6XyRZOkD3MbOO1WBi4/a37Fad+7MJVMc=;
        b=cfGjGWcoydcHwuLcczsIcUo5R28w86c3Vy0ksGrO0dINAnDDtxHWL2IUxmgOEZUXXY
         dqFbuesbhLdKd06DnnevL3j07PvXY+HNSKclIhXLBBdwebNUNsrUE9jWLgUrVBEMyniO
         cRiavCpvIGYIcYafaGsKZM4ApmlXb0bMMEVzh6FxP5vphgDRhxWGgqIEzmcB7AJ/8cD+
         G5+Sauv+GctXdRgt5JDpKXPrBsDCl60q8a5vM9ZZlknmzFHA8n+0fsdcUBH5Pc7hqXSy
         P0xnKfuLmQzE7AbtWjbRCgSWwhj24vzYgVUIjl1bLWItXgmTpWIuMSaU43+DL8ZEmKoZ
         O+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727936589; x=1728541389;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJTABH0yTDU6XyRZOkD3MbOO1WBi4/a37Fad+7MJVMc=;
        b=KtVUpV6bp7B57JlP9n9xrZXuXP9zdKXJ3QMQP3A/+aoKmLmtuq8ov9RSHebH5UpY3p
         ZEerdQ9mLWhoCrBKT3dKsqriEy7s+6ImY6P2ACbMJ/TQ9Bs7LRgiejGYuCx5KFgebX0r
         108QMFSLAKN0dJ3K4eVCNWEb6mOjnFDCFSernQzrajtCjo7crTofAva5TooGHaNUDcoC
         5hK2Hnvkny35nbvfx0PlsraoYybRHFDD9HyK3mD8y3zdFxsoDezYylBnq42oo7a/1j9A
         zXdqd/aX21yfRbezJxhfMzJ7us5+BiG240d0cZuYfX39RtZUIGHF4PGTofxOg7dpsn+f
         EKJA==
X-Forwarded-Encrypted: i=1; AJvYcCWxEEt6GUU2J9tczokRf/QXlBQ50beLnO4HnbwzDPX2qSarfdj9KIeXdAFd7CvJqnHnK1Y9u2lWVt7I8kiC@lists.linux.dev
X-Gm-Message-State: AOJu0YwCHGJ2+KcVRJWB07QTi0CV5AUjOq7Cd2vEKQPR+aslHtLcVUUH
	oEp4mdogDnd+kzqZwUIJy+U+q150hvOxzHYeD1fQetfd6ylH2zq9VVDwsDn36R0=
X-Google-Smtp-Source: AGHT+IELQPVFEUO9TSULVxdfRXIhrq6JkAzCJJ7vlCT33et88SjonP7Qoqi+rkVPtkIFmhXNyD1wcA==
X-Received: by 2002:a05:6512:693:b0:52e:9619:e26a with SMTP id 2adb3069b0e04-539a0673b9emr3307099e87.26.1727936589073;
        Wed, 02 Oct 2024 23:23:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f7e2af1c4sm13850315e9.21.2024.10.02.23.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 23:23:08 -0700 (PDT)
Date: Thu, 3 Oct 2024 09:23:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-error-cleanup-2024-09-30 62/71]
 sound/soc/soc-card.c:215 snd_soc_card_set_bias_level() error: we previously
 assumed 'card' could be null (see line 212)
Message-ID: <71fb697f-9979-44b5-be3f-bd38ab93c258@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-error-cleanup-2024-09-30
head:   b31c07e66a585a36ee2d6795e3dbbb4cbabab338
commit: d6485ea092fa6dd4f36bfbb4c2eecef748734bf1 [62/71] ASoC: add common snd_soc_ret() and use it
config: x86_64-randconfig-161-20241003 (https://download.01.org/0day-ci/archive/20241003/202410031405.418T7N8I-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410031405.418T7N8I-lkp@intel.com/

smatch warnings:
sound/soc/soc-card.c:215 snd_soc_card_set_bias_level() error: we previously assumed 'card' could be null (see line 212)
sound/soc/soc-card.c:227 snd_soc_card_set_bias_level_post() error: we previously assumed 'card' could be null (see line 224)

vim +/card +215 sound/soc/soc-card.c

39caefda0a30ca Kuninori Morimoto 2020-05-28  206  int snd_soc_card_set_bias_level(struct snd_soc_card *card,
39caefda0a30ca Kuninori Morimoto 2020-05-28  207  				struct snd_soc_dapm_context *dapm,
39caefda0a30ca Kuninori Morimoto 2020-05-28  208  				enum snd_soc_bias_level level)
39caefda0a30ca Kuninori Morimoto 2020-05-28  209  {
39caefda0a30ca Kuninori Morimoto 2020-05-28  210  	int ret = 0;
39caefda0a30ca Kuninori Morimoto 2020-05-28  211  
39caefda0a30ca Kuninori Morimoto 2020-05-28 @212  	if (card && card->set_bias_level)
                                                            ^^^^
Delete this check

39caefda0a30ca Kuninori Morimoto 2020-05-28  213  		ret = card->set_bias_level(card, dapm, level);
39caefda0a30ca Kuninori Morimoto 2020-05-28  214  
39caefda0a30ca Kuninori Morimoto 2020-05-28 @215  	return soc_card_ret(card, ret);
                                                                            ^^^^
If card is NULL then this will crash

39caefda0a30ca Kuninori Morimoto 2020-05-28  216  }
d41278ea0579a8 Kuninori Morimoto 2020-05-28  217  
d41278ea0579a8 Kuninori Morimoto 2020-05-28  218  int snd_soc_card_set_bias_level_post(struct snd_soc_card *card,
d41278ea0579a8 Kuninori Morimoto 2020-05-28  219  				     struct snd_soc_dapm_context *dapm,
d41278ea0579a8 Kuninori Morimoto 2020-05-28  220  				     enum snd_soc_bias_level level)
d41278ea0579a8 Kuninori Morimoto 2020-05-28  221  {
d41278ea0579a8 Kuninori Morimoto 2020-05-28  222  	int ret = 0;
d41278ea0579a8 Kuninori Morimoto 2020-05-28  223  
d41278ea0579a8 Kuninori Morimoto 2020-05-28 @224  	if (card && card->set_bias_level_post)
d41278ea0579a8 Kuninori Morimoto 2020-05-28  225  		ret = card->set_bias_level_post(card, dapm, level);
d41278ea0579a8 Kuninori Morimoto 2020-05-28  226  
d41278ea0579a8 Kuninori Morimoto 2020-05-28 @227  	return soc_card_ret(card, ret);
d41278ea0579a8 Kuninori Morimoto 2020-05-28  228  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

