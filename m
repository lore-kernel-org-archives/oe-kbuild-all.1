Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20324209
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 12:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N9lrxi6L"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40790b0a224so12513565e9.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 04:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700828449; x=1701433249; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dz9Kvhk0WvZWXvI6Q9ohDOYuHfgM65j1fXGm1MsIZXo=;
        b=N9lrxi6LlVQaHN/d57363aSHoVyD9YHFJEcq/GDE4lP2qICHAwev7rHwDEwPVwPtVQ
         Ff5nltp9wI7l7EkGxBShyX6PmmAvl/imZpXO/fQLW7p25UENPZdN5lSMmRH6/MrX96wN
         NzPU4Nm5XZMk9AqZb784OpyosJSgJofph1bYIKvli/KZqiPF6O3cuZlktCt5cETw/w+d
         7JsWK+hLokQe09P43+71kD3jbCbGkHRzBqAytRg///z+wGPWRQhlBgma0iTbTkIQ/CNS
         xfw5WbF7oFRkvQx3mEUgc8XOEEhhOpR8KuNGP/EM9TbG65e6fxlAFo3e3l7M64q+XOog
         B2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700828449; x=1701433249;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dz9Kvhk0WvZWXvI6Q9ohDOYuHfgM65j1fXGm1MsIZXo=;
        b=NN653HfBFl0d0OYMXRYIUfKzKTDEouO2eRrPRKRXyvlkhZzCkucYCivUMEQyPvEaEQ
         fBndKv481G+nThGkFi8B3JIvu0oIOTUJS1Efjl8QYq7lI0TLqy75SdNhhdaRGqAU2axJ
         ZVhmTdS/Ibb6TbAyh5Fd+XcMW63MDhEN4qN/FZZgs6NuVpIJui3iBkeszaBHXYeI+fvC
         NSuGEo3W9wYgnP0jebQHpH8K5IatMbjsNF/rzunGCKVz7gJHZDXQDhNMVftkhcpfjn/U
         rqAjMcI5BjhHuyN4eEKcSD9GkVBWHydcIidbJ4btCRwW17azSQr0Um3fbwXEoREeu0zo
         2ORg==
X-Gm-Message-State: AOJu0Ywe3MCB0JgsPTo/Ej2c9pultuxP5AH4Hy/cOEVrgYvBCyFOR1BJ
	kYIZRgQfmUmGcuWHjwL7O2QrN2x3PECquR7f6Ko=
X-Google-Smtp-Source: AGHT+IE5x4k9bSSLITYkRpQf1gVTOCmBkJIZa7GAJhU37exNagjnigg/whBNtlpYufQTJLATIP5rng==
X-Received: by 2002:a05:600c:4ed3:b0:408:3c10:ad47 with SMTP id g19-20020a05600c4ed300b004083c10ad47mr1852667wmq.40.1700828447881;
        Fri, 24 Nov 2023 04:20:47 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c4f0f00b00405959bbf4fsm4891253wmq.19.2023.11.24.04.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 04:20:39 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 24 Nov 2023 15:20:33 +0300
To: oe-kbuild@lists.linux.dev, Paul Elder <paul.elder@ideasonboard.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [pinchartl:mtk/v6.7/thp7312/v7 4/4] drivers/media/i2c/thp7312.c:967
 thp7312_set_focus() error: uninitialized symbol 'new_state'.
Message-ID: <feb6576d-132d-4860-80fc-71e64c77eaf1@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/thp7312/v7
head:   362434bae3ce4547ea67e203cbbcb6211a619629
commit: 362434bae3ce4547ea67e203cbbcb6211a619629 [4/4] media: i2c: Add driver for THine THP7312
config: hexagon-randconfig-r081-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241349.sqcJU6Rv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231124/202311241349.sqcJU6Rv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311241349.sqcJU6Rv-lkp@intel.com/

smatch warnings:
drivers/media/i2c/thp7312.c:967 thp7312_set_focus() error: uninitialized symbol 'new_state'.

vim +/new_state +967 drivers/media/i2c/thp7312.c

362434bae3ce45 Paul Elder 2023-06-20   908  static int thp7312_set_focus(struct thp7312_device *thp7312)
362434bae3ce45 Paul Elder 2023-06-20   909  {
362434bae3ce45 Paul Elder 2023-06-20   910  	enum thp7312_focus_state new_state;
362434bae3ce45 Paul Elder 2023-06-20   911  	bool continuous;
362434bae3ce45 Paul Elder 2023-06-20   912  	u8 af_control;
362434bae3ce45 Paul Elder 2023-06-20   913  	u8 af_setting;
362434bae3ce45 Paul Elder 2023-06-20   914  	int ret = 0;
362434bae3ce45 Paul Elder 2023-06-20   915  
362434bae3ce45 Paul Elder 2023-06-20   916  	/* Start by programming the manual focus position if it has changed. */
362434bae3ce45 Paul Elder 2023-06-20   917  	if (thp7312->focus_absolute->is_new) {
362434bae3ce45 Paul Elder 2023-06-20   918  		unsigned int value;
362434bae3ce45 Paul Elder 2023-06-20   919  
362434bae3ce45 Paul Elder 2023-06-20   920  		value = thp7312_focus_values[thp7312->focus_absolute->val];
362434bae3ce45 Paul Elder 2023-06-20   921  
362434bae3ce45 Paul Elder 2023-06-20   922  		ret = cci_write(thp7312->regmap,
362434bae3ce45 Paul Elder 2023-06-20   923  				THP7312_REG_MANUAL_FOCUS_POSITION, value, NULL);
362434bae3ce45 Paul Elder 2023-06-20   924  		if (ret)
362434bae3ce45 Paul Elder 2023-06-20   925  			return ret;
362434bae3ce45 Paul Elder 2023-06-20   926  	}
362434bae3ce45 Paul Elder 2023-06-20   927  
362434bae3ce45 Paul Elder 2023-06-20   928  	/* Calculate the new focus state. */
362434bae3ce45 Paul Elder 2023-06-20   929  	switch (thp7312->focus_state) {
362434bae3ce45 Paul Elder 2023-06-20   930  	case THP7312_FOCUS_STATE_MANUAL:
362434bae3ce45 Paul Elder 2023-06-20   931  	default:
362434bae3ce45 Paul Elder 2023-06-20   932  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   933  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   934  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   935  			new_state = THP7312_FOCUS_STATE_ONESHOT;

Not initialized on else path.  Obvoiusly I'm guessing the else paths
can't happen for any of these, but you can see why the checker
complains.

362434bae3ce45 Paul Elder 2023-06-20   936  		break;
362434bae3ce45 Paul Elder 2023-06-20   937  
362434bae3ce45 Paul Elder 2023-06-20   938  	case THP7312_FOCUS_STATE_AUTO:
362434bae3ce45 Paul Elder 2023-06-20   939  		if (!thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   940  			new_state = THP7312_FOCUS_STATE_LOCKED;
362434bae3ce45 Paul Elder 2023-06-20   941  		break;
362434bae3ce45 Paul Elder 2023-06-20   942  
362434bae3ce45 Paul Elder 2023-06-20   943  	case THP7312_FOCUS_STATE_LOCKED:
362434bae3ce45 Paul Elder 2023-06-20   944  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   945  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   946  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   947  			new_state = THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   948  		else if (thp7312->focus_absolute->is_new)
362434bae3ce45 Paul Elder 2023-06-20   949  			new_state = THP7312_FOCUS_STATE_MANUAL;
362434bae3ce45 Paul Elder 2023-06-20   950  		break;
362434bae3ce45 Paul Elder 2023-06-20   951  
362434bae3ce45 Paul Elder 2023-06-20   952  	case THP7312_FOCUS_STATE_ONESHOT:
362434bae3ce45 Paul Elder 2023-06-20   953  		if (thp7312->focus_auto->val)
362434bae3ce45 Paul Elder 2023-06-20   954  			new_state = THP7312_FOCUS_STATE_AUTO;
362434bae3ce45 Paul Elder 2023-06-20   955  		else if (thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   956  			new_state = THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   957  		else if (thp7312->focus_absolute->is_new)
362434bae3ce45 Paul Elder 2023-06-20   958  			new_state = THP7312_FOCUS_STATE_MANUAL;
362434bae3ce45 Paul Elder 2023-06-20   959  		break;
362434bae3ce45 Paul Elder 2023-06-20   960  	}
362434bae3ce45 Paul Elder 2023-06-20   961  
362434bae3ce45 Paul Elder 2023-06-20   962  	/*
362434bae3ce45 Paul Elder 2023-06-20   963  	 * If neither the state nor the focus method has changed, and no new
362434bae3ce45 Paul Elder 2023-06-20   964  	 * one-shot focus is requested, there's nothing new to program to the
362434bae3ce45 Paul Elder 2023-06-20   965  	 * hardware.
362434bae3ce45 Paul Elder 2023-06-20   966  	 */
362434bae3ce45 Paul Elder 2023-06-20  @967  	if (thp7312->focus_state == new_state &&
                                                                            ^^^^^^^^^

362434bae3ce45 Paul Elder 2023-06-20   968  	    !thp7312->focus_method->is_new && !thp7312->focus_start->is_new)
362434bae3ce45 Paul Elder 2023-06-20   969  		return 0;
362434bae3ce45 Paul Elder 2023-06-20   970  
362434bae3ce45 Paul Elder 2023-06-20   971  	continuous = new_state == THP7312_FOCUS_STATE_MANUAL ||
362434bae3ce45 Paul Elder 2023-06-20   972  		     new_state == THP7312_FOCUS_STATE_ONESHOT;
362434bae3ce45 Paul Elder 2023-06-20   973  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

