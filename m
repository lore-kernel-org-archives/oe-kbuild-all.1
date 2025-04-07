Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA12C22A7E5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 07:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010161; cv=none; b=sx7GGUuc5nbIKDAhWD5RfORhJ0SEqWCbJUIAoGmIx50bksHg2I44gAau58wb5V+IdfcnKKmv1GH33D+B32Md4Q3I/1XPFK+kb4kmMQY8/39iS2ZTAnuMgSIXlHsRztLjmI0CoUVR+resEDMXRBParFDkac6Iy06Ki126LIz7R0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010161; c=relaxed/simple;
	bh=TFHb9jwv0UJ9scWKxpEMq9nwa38PClYIeK+KBhs32os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2amnPhFFj7EmePsOvhN+qIFp9tm92//rWXtGSuh6i6CFrAf3zhoeYSuoEHMVcVutW6cQPtMVDsC5yrkEeTJODMPu9nZgfuuuLB2XOtcxMC19wQofwgMTxEj6nVcuCQV0rcPOZO8bQLvZTLhlGWwK29N4Xn1EbzjDKmoQ5w2oZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=enFtYer6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="enFtYer6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso19946705e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Apr 2025 00:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744010158; x=1744614958; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6xaQ0k8E/GTOsok41VClhYmiK7cHYHv73jrSD8IYao=;
        b=enFtYer6cEKvbUmir6G30gVitRqJFwRRTJjjNgMfg+43u2Su9N0zX4SuGuZtCtDQ0o
         stfycz+xyDld1YFjBUpHXxNhhtaxOmfCQL3CujazQw4NNgRxHztbkWI3M032gr3V27PJ
         0br9Fp4kAtQtjBZLwXIAC+OJcCV74knhIZUSFapYmbP2Wmp6CGPLmF1giL5B0xRe3yG2
         ucekcO9vzbye0NYMwJ9wNAewoh8s0REhK9vzubfO57UngdAxvFjMTMb0QeAWwbgS5gA5
         4dGZx0eqCRamsTnDQWh2UXwOp02l9DoDYkxieK7Rv4l9wm0ua/YRJ1sX3T+85tpCX8k4
         8jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010158; x=1744614958;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6xaQ0k8E/GTOsok41VClhYmiK7cHYHv73jrSD8IYao=;
        b=KhFbzzsaQodgs35WmA0KoxHea3Wf9fA7u1nxBxHzCb8nQjeHDXpPASlMi1rWPz+oP9
         +ObrVRDuwN8bBsou7OPWgSwOOEtspdv44W26su84E1Irvisp7ZTXaBgcWNre2H2lEhqo
         mdmGYd7yumK/dhBRZgBjoLLwU6BIV2mwCbzD6IOhJEM0uXtR0la+x4dpNtdaDas+ATPc
         XILYE8vcn+E/fYyPhOo9CEB9Ip+P2Ydkm2Xjwqf37L5fMw2LGtQlV9TW5QmPfX+Ox2IC
         Qbao+y4BrdCILDT6vltaigBKv84Q3cVHiNA6B6YlyMG7b3FbcunKEFimKdzt33GS7gYQ
         OgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrDCeNMkfNR17rxiMyukjy1TmuRWonYOU4B9pgQgYVXSpw4fpwVuZVngfxXPBxMUj3/sJvNPpTJ4eN/zWh@lists.linux.dev
X-Gm-Message-State: AOJu0YxOnEq0f7+vtB8Nvh7zZ80MzBz0gtK7sGQ6nMqSLsLjcCycEGkW
	WSA5eUG4xVZpeuosdnwiZRJTuqd4PmicrCt5vMhWnUA5V/wfQY+URwLagaCr/dc=
X-Gm-Gg: ASbGnculq0V1M5+Le3Wri7RwTWIUE/PYLk84099rXDSYYaSMM4GGTR2wDsWH+xLVyAn
	LStNnDNbWhCHihTjuI/Ef64evXgplYSfCQYv0GHiFWEPC2M4JzZtCEuuRFWNYD2nskzwcGM6oi9
	RlPQCyKR5J2oZlrmSV0qLWnk46aQFA/VRYkecdNWznIUg/m1mEkT39Q+Y/osup8tsHDlscXcneh
	IJMW87abALMTE89cqpxL/Olhg0jsqiKpwkbujuqHJB7EUEVBiUIFlGFAlNneVfS8pAWfYO1bYPW
	TDOByqVS6f5thJgkwfCuj7/hf0E/Ec0CSB4AVeqFgxxE0JCNfg==
X-Google-Smtp-Source: AGHT+IE0yvUp003v7ANegxVMAf+lXFywEGIzWlDTx8NnJOOMHWUiiwpPL+cDtZZw/dVy3RRRVB84Iw==
X-Received: by 2002:a05:600c:3484:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-43ed0db4006mr113880375e9.31.1744010157861;
        Mon, 07 Apr 2025 00:15:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec366a699sm119704075e9.38.2025.04.07.00.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:15:57 -0700 (PDT)
Date: Mon, 7 Apr 2025 10:15:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2025-03-26 21/24]
 sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to
 'PTR_ERR'
Message-ID: <42101bfa-e3e7-4ae0-9c9e-c37593b8ece9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2025-03-26
head:   ba9316799e85a9ef14dd8a3e5580be4c97149576
commit: adf5f819442084ec2b0ea13a5834b05d10750e24 [21/24] ASoC: renesas: add MSIOF sound support
config: openrisc-randconfig-r071-20250407 (https://download.01.org/0day-ci/archive/20250407/202504070441.9TXJ68nR-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504070441.9TXJ68nR-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/msiof.c:367 msiof_open() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +367 sound/soc/renesas/rcar/msiof.c

adf5f819442084e Kuninori Morimoto 2025-03-24  356  static int msiof_open(struct snd_soc_component *component,
adf5f819442084e Kuninori Morimoto 2025-03-24  357  		      struct snd_pcm_substream *substream)
adf5f819442084e Kuninori Morimoto 2025-03-24  358  {
adf5f819442084e Kuninori Morimoto 2025-03-24  359  	struct device *dev = component->dev;
adf5f819442084e Kuninori Morimoto 2025-03-24  360  	struct dma_chan *chan;
adf5f819442084e Kuninori Morimoto 2025-03-24  361  	static const char *dma_names[] = {"rx", "tx"};
adf5f819442084e Kuninori Morimoto 2025-03-24  362  	int is_play = msiof_is_play(substream);
adf5f819442084e Kuninori Morimoto 2025-03-24  363  	int ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  364  
adf5f819442084e Kuninori Morimoto 2025-03-24  365  	chan = of_dma_request_slave_channel(dev->of_node, dma_names[is_play]);
adf5f819442084e Kuninori Morimoto 2025-03-24  366  	if (IS_ERR_OR_NULL(chan))

of_dma_request_slave_channel() can't return NULL, but the zero-day bot
doesn't do cross function analysis and the IS_ERR_OR_NULL() check tricks
Smatch into thinking "chan" can be NULL.

adf5f819442084e Kuninori Morimoto 2025-03-24 @367  		return PTR_ERR(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  368  
adf5f819442084e Kuninori Morimoto 2025-03-24  369  	ret = snd_dmaengine_pcm_open(substream, chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  370  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  371  		goto open_err_dma;
adf5f819442084e Kuninori Morimoto 2025-03-24  372  
adf5f819442084e Kuninori Morimoto 2025-03-24  373  	snd_soc_set_runtime_hwparams(substream, &msiof_pcm_hardware);
adf5f819442084e Kuninori Morimoto 2025-03-24  374  
adf5f819442084e Kuninori Morimoto 2025-03-24  375  	ret = snd_pcm_hw_constraint_integer(substream->runtime, SNDRV_PCM_HW_PARAM_PERIODS);
adf5f819442084e Kuninori Morimoto 2025-03-24  376  
adf5f819442084e Kuninori Morimoto 2025-03-24  377  open_err_dma:
adf5f819442084e Kuninori Morimoto 2025-03-24  378  	if (ret < 0)
adf5f819442084e Kuninori Morimoto 2025-03-24  379  		dma_release_channel(chan);
adf5f819442084e Kuninori Morimoto 2025-03-24  380  
adf5f819442084e Kuninori Morimoto 2025-03-24  381  	return ret;
adf5f819442084e Kuninori Morimoto 2025-03-24  382  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

