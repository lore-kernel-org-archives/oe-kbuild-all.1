Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3593296BC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756107325; cv=none; b=pLMv+r21VBjPBs1O2692ZspsdHIkks9IAWX5gXm2DadI6fqBeIOKuqPqnNG/6J1hGSFeygthY604YJQdpRSlTDEUg8QrpnREj9iwsWsqNt3hiZb0P58svffaMFwX/f0/MhgpbiLBomkdVzwXXLdn8UICWtsrvACv6APSr1S+gI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756107325; c=relaxed/simple;
	bh=MpXpYDmIRJcPM8ARHtXC4DLTjSZC1KnXl1kvzblT2DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=N1GznMw8e0KBEKlrbfkBP+Szr0Q55JxZbd4suuXhRihKe0tlxGDkqTN4gmlPux6fNwSaR3J90cfLZBhtXKn7iF1rwMUVZ9T49bSj3uUSAflibD1ra06xFHh9Kfq+cBr1iHRO8lOAJhN3p4NeY323LMrRb5Qg5Lnr9q9GVrXEsPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NiYbplQ3; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NiYbplQ3"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso20070005e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Aug 2025 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756107322; x=1756712122; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
        b=NiYbplQ3Fz/TS1HRAKiRv+87PcSA55YjCUTmDcalvR/oUFUaRPRa91di22kh25djnq
         8iyU4EeguhtjmL8qbJPwVdJxGIGfEXIOCdPwbWFt0Xk+NxOfaepquucofrkvyHcJeHC3
         tXrp5kMPDq8q9a09tbrd+U+GIoQq8Qsra0q5qRIk8iJGdj+RKyvJSb6yXw5vO1beAiu6
         Cw0g2Fsj8iibR8OqXmscsSWByThOs4W/JlJgPdX9j17pJZZH87d3ShRz1O0Kd4R46L99
         iGEttgveA0PZ25Sh+KvjM4GOYtkedPSmdP7AbU3/pgGKfmPJH1aSERCEJoR9wRD11u9Z
         JN+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756107322; x=1756712122;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qLqDCAEeqZueR/V1nZAa0eICESVjVswaFOTFOoFfvYo=;
        b=O2kpJD35HJGbpwmFG4sUUpVFA8Ks5c+KnAW9GUyJdyP1egEX7oavEILcAObGnj7LBQ
         2nlVkgNOW5geCgHaSSi5HcgUrdUVH6yB+TSvtm54bPthNU4rLojYBw7wMzysnUYoTgnO
         6iuy3ub5dRyFG7kXFCIefxChvbkranxudtQMP1NqSTMBvQea73T4ZK6fBq83rDcV8aPw
         DHtI98CcvTK/IhblK6APigo7S7yPy0bUom6GgTw9eiE/Iyjcxrey/Vz8TEPm62WuJDSd
         SRJkJiEZP4NB8DBWHZHAHlHwUzFbXaNk6xBpwu0zhFae2sjPXuBQhsdcZq1OkEGo4wUt
         +EcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdEDpdm004I9Lfako/85IBOEu8cZ5ENHv1KKEK/Y5tiM2SVOhWUzzrGBt9y/CZYjBo3JR8xJvlK8pL/pNi@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ6sVnouy2u4of2YFTfqPuiBAyqTe01nIIHhFUpSO7qUrSl4vb
	jxyxlEWhlI9znwcS0VOs/qGxTouva1etC7zdfpoiXOexKZcZ+2/VQLm5JQD0v9ZjBsU=
X-Gm-Gg: ASbGncu31CnZjzbwh1ke7yKLHRpwZhk7si5ZL0Lb5XhOelRlqtDLmqpByqAAVYuwVrc
	B9Baz8KZRGl7AmG3AO8F7i/6nscrG5TB7yaT7wB7Mw5IaWLR8DHFmtNAVE6yLLOobS5Qp7XhVxP
	2fjcJwc2+LDOSf920yfg6b0To/+F/2j2Gj+4kfMr0in0BkSFVXlcjfxmEfhTPGJ0uEYuMrpnGE8
	EIssVkfJ6eSgKsQyzW70mV+N7MejyNDFpXuCMNt2a72kfEpLwdxJgAlmecX2JG5G61HgsypKbG0
	+yziRqR5WQBHHgMb2BNmWtvpYHMc1ImbvnMTXHN1y835oaNjCFW22kQUa+iiNjo6GCYsgFiJO/f
	owheK+vR6DgPEngsO+bQB7vKBexI=
X-Google-Smtp-Source: AGHT+IErURa0Xlnp2EqAvu9MT0KYK+YicwHUY5MOLIbTG3b7xCaO3SGy7MLRfklR+AK/4jewEFfrgw==
X-Received: by 2002:a05:600c:3155:b0:456:21d2:c6f7 with SMTP id 5b1f17b1804b1-45b517b99ecmr101326305e9.23.1756107321591;
        Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b5748e743sm99362065e9.17.2025.08.25.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 00:35:21 -0700 (PDT)
Date: Mon, 25 Aug 2025 10:35:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/stm: ltdc: unify log system
Message-ID: <202508250637.nLxtkS26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821130356.883553-1-raphael.gallais-pou@foss.st.com>

Hi Raphael,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Raphael-Gallais-Pou/drm-stm-ltdc-unify-log-system/20250821-210930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
patch link:    https://lore.kernel.org/r/20250821130356.883553-1-raphael.gallais-pou%40foss.st.com
patch subject: [PATCH] drm/stm: ltdc: unify log system
config: arm-randconfig-r072-20250824 (https://download.01.org/0day-ci/archive/20250825/202508250637.nLxtkS26-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508250637.nLxtkS26-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/stm/ltdc.c:1150 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1148)
drivers/gpu/drm/stm/ltdc.c:1174 ltdc_crtc_verify_crc_source() warn: variable dereferenced before check 'crtc' (see line 1172)

vim +/crtc +1150 drivers/gpu/drm/stm/ltdc.c

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1143  static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1144  {
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1145  	struct ltdc_device *ldev;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1146  	int ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1147  
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1148  	drm_dbg_driver(crtc->dev, "\n");
                                                                       ^^^^^^^^^
Dereference.  A lot of the time people would suggest to delete these
types of printks and use ftrace instead.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1149  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1150  	if (!crtc)
                                                            ^^^^^
Checked too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1151  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1152  
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1153  	ldev = crtc_to_ltdc(crtc);
898a9e3f56db98 Raphael Gallais-Pou 2023-05-15  1154  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1155  	if (source && strcmp(source, "auto") == 0) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1156  		ldev->crc_active = true;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1157  		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1158  	} else if (!source) {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1159  		ldev->crc_active = false;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1160  		ret = regmap_clear_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1161  	} else {
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1162  		ret = -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1163  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1164  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1165  	ldev->crc_skip_count = 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1166  	return ret;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1167  }
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1168  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1169  static int ltdc_crtc_verify_crc_source(struct drm_crtc *crtc,
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1170  				       const char *source, size_t *values_cnt)
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1171  {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21 @1172  	drm_dbg_driver(crtc->dev, "\n");
                                                                        ^^^^^^^^
Dereference

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1173  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11 @1174  	if (!crtc)
                                                            ^^^^^
Too late.

79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1175  		return -ENODEV;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1176  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1177  	if (source && strcmp(source, "auto") != 0) {
fa2b2390600532 Raphael Gallais-Pou 2025-08-21  1178  		drm_dbg_driver(crtc->dev, "Unknown CRC source %s for %s\n",
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1179  			       source, crtc->name);
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1180  		return -EINVAL;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1181  	}
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1182  
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1183  	*values_cnt = 1;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1184  	return 0;
79b44684a14e36 Raphael Gallais-Pou 2022-02-11  1185  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

