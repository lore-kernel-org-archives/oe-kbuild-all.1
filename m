Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB52210E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 11:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765624677; cv=none; b=PxuUWTuACBHJD64E9YB/8ef7Z3RMwtb/LiNPZ6J+WNCu8TaaFSPwOw/aly4zm8Iwzb+PWqlGR8bXcc5yhgFVJ5DrigZDGM3dmFkgMSzb7cnxUIzmPON5m4FTraHW+qNiPk7SL0EFAILGUbDzVgGWZECZhfUlfgAGLNiFuN4ExRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765624677; c=relaxed/simple;
	bh=e12LoeSKNj9jBS9YbjJvrMPmYBRWP+jF/q8oxF/Ksc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ip6yBy+PYCdmLhSSKr3iHKqARkbNzW8HhTUofZhpgnAJVOnXG3HLDFQDt0Y7U4SrxNhx3v4YsQ0upYm8GUSzMQON1wjn9jE3lHLQW4p07cCzMc/nh2v5KEOfKkwslmlPfBvpeh9lxP41YaDPdI2aU7tqhk2+s/3G/5ppGTWelYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LfkkpvkG; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LfkkpvkG"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so22900305e9.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765624674; x=1766229474; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0qSAC8NXt53qphrOpngwf6jj5roP/lHhrO1GfHV0Lj4=;
        b=LfkkpvkGVEXzHdCeoUrZGtnO6DbFYIt3akosFQCB+b2aoRZ6RfH5Jr6tNWnAhi9GSf
         VR3qVmzyTUEhabD8XQVN1BhPmtJvNcYn/Kat4Ix7VKEzklVWMUdPXVyEqiXLDk3HYDx0
         oSXDzaJRQmLV0hMhI+qjhVgkseN7MTiLid5y9KzWes8vu+ZPmRUrebsRXFD69OWgLfRO
         iX/TwaBZkKH68Lvwzp40UydV0XS8F2D11B7tlU9GEYc0QfwwxqUaZPm5vNlBxj+Xxd3f
         78e8PYew13u+eRGazv4/bgLNNDegRIUvh0WVM6PP1mcTzL/iK+qCVZK90AvEkpvjWJcK
         c0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765624674; x=1766229474;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0qSAC8NXt53qphrOpngwf6jj5roP/lHhrO1GfHV0Lj4=;
        b=UX2NJoE/UGJvxVC9Vi/ktncbbRMu4XJ7FGvK3HuJlf7c8IFJKk8hVoa6hLgNiTUlrf
         bA6S4rvSUPq2exyFk7SXEcyof25J9HeUkKaL+rRsoX3iPIhRuHD2fAdYMNGokn/bcyR1
         eJdJTA3LgkePPkF0hbskeAte8/D/phOgh7fw+1TMBEF7D6LS1mA1rUs/qUvTLC21Ei/y
         lBrBKHC/hih48B/5e9UOsFBDigEc73VpNwnluPcl2F62HYYFEERddJCsv7KVORS3b2K2
         F+eqcUTAMvMJHMcWtQWIbl45iFM5f35sPJpesiwAkrRjMlPw0V38x8su8ClkQZl9/IRV
         48Vw==
X-Forwarded-Encrypted: i=1; AJvYcCUBcWS9juuOICa89hBOLDmXeuVeuiW2BGyaUGMIEg4FoY/84ft7x8MT8aVKohjwvYFZvPPBWSvgoGiEY+ey@lists.linux.dev
X-Gm-Message-State: AOJu0YxGqPzmHnVn5fVGB2V2SrxPhsxY6qKJzeviE5FGpLnmzIjMN3S9
	v3Yip0cxLLIj73c73rUzMS9KeTs2qV8mAKcdK1plushWi+FJ2MreqSHXSXRc09Yv+tM=
X-Gm-Gg: AY/fxX7VVdKXB2mtL+pJtWXfbNiPFc3mQc+6FntheCbXenelI+lggcSjq+21/rCIFhK
	1L0xSo6XE4ZdeTBPysx3FYGoN+q2R66kBKdryGlCdAJjkfcRi30/BizGq4xQp39EdlwKxxMTw70
	J9AJLul1Opxa4lM9B22HFQfFY5w2G3TiupAPNxjXtRvnjxn8qqQd4NzaPBViQJTS4aypj15N5NS
	wnZDAnBLepDExRVFdP5I9/ASHjkillgZ1oFMaIFTFLB2lHKsRXpUSnAmMJuImq2dj+nBJsp1+QF
	4q0pDJ6c8XNp/FHOK645pN07dtjgmvhVzy1ovGcG4tJKUhuW9GRkOZhUPQiqIiUb4JQ+fKkdxbE
	9snUm55BCMvRT9LrzK2gshgqovat+AShme4RYvWIZmqCT1b6/Wj5eI1K4Ak6vEr1oVV9tWfkX+Y
	/EzP39hNJQvdRj8Cws
X-Google-Smtp-Source: AGHT+IHRCQKtbRQ230wVUIItJpKcBD3j3LsY4Z8JoR5peHT9p0nvoo+ZJ4j3ZHuq54Sq4ma7S84d/Q==
X-Received: by 2002:a05:6000:1244:b0:42f:bad7:af76 with SMTP id ffacd0b85a97d-42fbad7b0c9mr3880749f8f.15.1765624673356;
        Sat, 13 Dec 2025 03:17:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b8a841sm18233664f8f.30.2025.12.13.03.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 03:17:52 -0800 (PST)
Date: Sat, 13 Dec 2025 14:17:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: sound/soc/sdca/sdca_asoc.c:381 entity_pde_event() error:
 uninitialized symbol 'poll_us'.
Message-ID: <202512130749.Yq1y2hjQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 2c8b3a8e6aa877583e5dc2f669a8adc896a771d4 ASoC: SDCA: Create DAPM widgets and routes from DisCo
config: i386-randconfig-r073-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130749.Yq1y2hjQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512130749.Yq1y2hjQ-lkp@intel.com/

New smatch warnings:
sound/soc/sdca/sdca_asoc.c:381 entity_pde_event() error: uninitialized symbol 'poll_us'.

vim +/poll_us +381 sound/soc/sdca/sdca_asoc.c

2c8b3a8e6aa8775 Charles Keepax 2025-05-16  341  static int entity_pde_event(struct snd_soc_dapm_widget *widget,
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  342  			    struct snd_kcontrol *kctl, int event)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  343  {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  344  	struct snd_soc_component *component = widget->dapm->component;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  345  	struct sdca_entity *entity = widget->priv;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  346  	static const int polls = 100;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  347  	unsigned int reg, val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  348  	int from, to, i;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  349  	int poll_us;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  350  	int ret;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  351  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  352  	if (!component)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  353  		return -EIO;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  354  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  355  	switch (event) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  356  	case SND_SOC_DAPM_POST_PMD:
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  357  		from = widget->on_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  358  		to = widget->off_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  359  		break;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  360  	case SND_SOC_DAPM_POST_PMU:
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  361  		from = widget->off_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  362  		to = widget->on_val;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  363  		break;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  364  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  365  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  366  	for (i = 0; i < entity->pde.num_max_delay; i++) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  367  		struct sdca_pde_delay *delay = &entity->pde.max_delay[i];
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  368  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  369  		if (delay->from_ps == from && delay->to_ps == to) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  370  			poll_us = delay->us / polls;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  371  			break;

If we exit the loop without hitting this break then we'd be in trouble.
It's not clear if that's really possible...

2c8b3a8e6aa8775 Charles Keepax 2025-05-16  372  		}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  373  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  374  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  375  	reg = SDW_SDCA_CTL(SDW_SDCA_CTL_FUNC(widget->reg),
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  376  			   SDW_SDCA_CTL_ENT(widget->reg),
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  377  			   SDCA_CTL_PDE_ACTUAL_PS, 0);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  378  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  379  	for (i = 0; i < polls; i++) {
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  380  		if (i)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16 @381  			fsleep(poll_us);
                                                                               ^^^^^^^

2c8b3a8e6aa8775 Charles Keepax 2025-05-16  382  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  383  		ret = regmap_read(component->regmap, reg, &val);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  384  		if (ret)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  385  			return ret;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  386  		else if (val == to)
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  387  			return 0;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  388  	}
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  389  
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  390  	dev_err(component->dev, "%s: power transition failed: %x\n",
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  391  		entity->label, val);
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  392  	return -ETIMEDOUT;
2c8b3a8e6aa8775 Charles Keepax 2025-05-16  393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

