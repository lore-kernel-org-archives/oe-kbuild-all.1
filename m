Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865D25A2AD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 07:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740469617; cv=none; b=NdCQ4qaw21dCOlKvwrsFwqX0qEf/77GXeCW8yrF+LRJG4T9eDEStPCP9p4WTVZSaCP0H48qmQGmoGhrua/RltJevJS8/LbpRxJH0aDv5Fm0vOcJfSMxiKB6BGmXwLVIkjj5AtOQBv50wXCqWUHa1pJXAZf69SOqfbiZYIQaedjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740469617; c=relaxed/simple;
	bh=ohB7GI+rPl7u9uDQRvlELtbw1w55yBaGwNmkDJC6mAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+z3TYRiQjUzO/5nNjZ4zYgNBhrkTawzvsuqL+M4/6+/8vyMu87Aj6xxHrwy9sySsqw1CCrO9xQpz5nPfXvMGUzvowA0VL0dl11gWlQmO6Q9aYOVNSzEBMDamxExLFdwQbiH9fNIHil18Bqkf2cBLWYn55o1CT8EVuMZvinYge8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MYp/G9uK; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MYp/G9uK"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb90f68f8cso1002371866b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740469613; x=1741074413; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXCAKt95ywcXshTwhbjKc4Ucz17O/lGYiaQ4iYXom4k=;
        b=MYp/G9uK+E680qUERZzE6bylSHoOLed9Q/XfmsyARyOYcQWoNf1LFdlK6RWBOKzaLt
         pJhzD/TOJFqDWA1RXam9wwrdaVhgk5kQCLf+QHBJ9xWMPc47breOzOztWNepAaFn4cNA
         Q5951Z6fenQNP+ulvK474Dc+z39WUofTrZ7gVMJWDICwl/Q+wH6jkTEYSWnUvtPSbt/N
         u95HLg8NIiQ/kYqsIdTNKuMPibC8fxdubbi+F2KBBPQsm2y5xBFUfQGrY/yc0jGSCiKQ
         WNgQhDAinbENUd9OGw+zQzo4TJD0p0j318Mxsvuq5F63GMsdIscnz0BqP1aA6bM1yA7O
         r2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740469613; x=1741074413;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uXCAKt95ywcXshTwhbjKc4Ucz17O/lGYiaQ4iYXom4k=;
        b=umhiXSaU0YwqYYwIIPpHTozm2yqZwf07xVcBNLiUIUrhpbL2IzhCk+METMSaPX9N/u
         yhFJD/w6+L9AROwqu9OaknY3RYNsaFfnWjeksVNMPYfncv9aGUdPB4ramU2rnaVsJbeN
         fnce9L4hV3CMbr4LqAQUEVCC7Pt9j5FH2USNul+mxL7mWnmANZW9UEcuUkUfb9KbS+xn
         U5PoB2FvjfXvDqNAeJtMve/lBb+wnsUuoP+2OtEBHl5Mbtuui7yiGQZH00bpy9jdAtfq
         WQVxGMFGiKsno1bmDf5bYgmiEI1OSvtGvji5nlH8LyLF7bkAAqDwRFwjWn0BlUnGMgKl
         x94g==
X-Forwarded-Encrypted: i=1; AJvYcCV5+jX6JB2tISIpivcG3ExSvR8DPjRK51lZowhUo4gSCuXKYdGmp83/p5BBhzZ5bBov2z6+R02ebSDd8sJk@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3qeU4e4/syK3ESSaCAqcnbWYqFD7Nn3YUSt4UtLdWS/2aUSaB
	vCv/yGwM+J3V1KpVGDtdl24YVN+GCxyhMp1bl0tPuXfCWTAREEVhlkZkZVOss98=
X-Gm-Gg: ASbGncsMTyJZ7mAcamcU1irq6J/KRQmSA0h00mBGrcmB4BozagGYchsfVVS3tymEnT4
	8LaJkoTPqvMs0MxUwEt3zK6UQZHDFjLX8gwROXOrphKqZIKJcRkd8b8Gq+pYhpC3GJgu6gWL0tm
	tTDMyC1wadSrYYCR+SMxJArSUf+4Nq5RNEkdYXIzTpZUdBb/Fub4tPdDUY/VFyI1Bu4SkZlfh+x
	xbcIGkV4DQLkGivo39xbfcSHFgf6rllDHnnHIIuqmLtdDlSkxgxx4Euczt7IdKD37aCgwVb2Uzo
	Bjrc4p3lQTKyoFK/qLGjzf0O3xYvSHg=
X-Google-Smtp-Source: AGHT+IG+S2JFGDs55Sx79Yqen/ZzoJ97beQ3jhOz/EYEdXQKXs3lCZSxe94pqkWYhsKID7dYF8NaMQ==
X-Received: by 2002:a17:907:3d8f:b0:ab7:d916:4fe4 with SMTP id a640c23a62f3a-abed0d3e840mr210369966b.24.1740469613077;
        Mon, 24 Feb 2025 23:46:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed205c28asm94829966b.158.2025.02.24.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:46:52 -0800 (PST)
Date: Tue, 25 Feb 2025 10:46:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Shiju Jose <shiju.jose@huawei.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [bp:edac-cxl 2/5] drivers/edac/edac_device.c:705 edac_dev_register()
 error: uninitialized symbol 'ret'.
Message-ID: <6036787e-1322-46ae-bd56-4a1e0d9966b9@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git edac-cxl
head:   4fab25b62bc682c0df886d97dcb106d4989c9ff1
commit: e777719d5bec32af859990456f4b0e0e362f425a [2/5] EDAC: Add scrub control feature
config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250225/202502251009.0sGkolEJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502251009.0sGkolEJ-lkp@intel.com/

smatch warnings:
drivers/edac/edac_device.c:705 edac_dev_register() error: uninitialized symbol 'ret'.

vim +/ret +705 drivers/edac/edac_device.c

9222ad0e3fd4c35 Shiju Jose 2025-02-12  609  int edac_dev_register(struct device *parent, char *name,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  610  		      void *private, int num_features,
9222ad0e3fd4c35 Shiju Jose 2025-02-12  611  		      const struct edac_dev_feature *ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  612  {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  613  	const struct attribute_group **ras_attr_groups;
e777719d5bec32a Shiju Jose 2025-02-12  614  	struct edac_dev_data *dev_data;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  615  	struct edac_dev_feat_ctx *ctx;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  616  	int attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  617  	int scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  618  	int ret, feat;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  619  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  620  	if (!parent || !name || !num_features || !ras_features)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  621  		return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  622  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  623  	/* Double parse to make space for attributes */
9222ad0e3fd4c35 Shiju Jose 2025-02-12  624  	for (feat = 0; feat < num_features; feat++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  625  		switch (ras_features[feat].ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  626  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  627  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  628  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  629  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  630  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  631  			return -EINVAL;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  632  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  633  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  634  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  635  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  636  	if (!ctx)
9222ad0e3fd4c35 Shiju Jose 2025-02-12  637  		return -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  638  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  639  	ras_attr_groups = kcalloc(attr_gcnt + 1, sizeof(*ras_attr_groups), GFP_KERNEL);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  640  	if (!ras_attr_groups) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  641  		ret = -ENOMEM;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  642  		goto ctx_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  643  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  644  
e777719d5bec32a Shiju Jose 2025-02-12  645  	if (scrub_cnt) {
e777719d5bec32a Shiju Jose 2025-02-12  646  		ctx->scrub = kcalloc(scrub_cnt, sizeof(*ctx->scrub), GFP_KERNEL);
e777719d5bec32a Shiju Jose 2025-02-12  647  		if (!ctx->scrub) {
e777719d5bec32a Shiju Jose 2025-02-12  648  			ret = -ENOMEM;
e777719d5bec32a Shiju Jose 2025-02-12  649  			goto groups_free;
e777719d5bec32a Shiju Jose 2025-02-12  650  		}
e777719d5bec32a Shiju Jose 2025-02-12  651  	}
e777719d5bec32a Shiju Jose 2025-02-12  652  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  653  	attr_gcnt = 0;
e777719d5bec32a Shiju Jose 2025-02-12  654  	scrub_cnt = 0;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  655  	for (feat = 0; feat < num_features; feat++, ras_features++) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  656  		switch (ras_features->ft_type) {
e777719d5bec32a Shiju Jose 2025-02-12  657  		case RAS_FEAT_SCRUB:
e777719d5bec32a Shiju Jose 2025-02-12  658  			if (!ras_features->scrub_ops ||
e777719d5bec32a Shiju Jose 2025-02-12  659  			    scrub_cnt != ras_features->instance)
e777719d5bec32a Shiju Jose 2025-02-12  660  				goto data_mem_free;

ret = -EINVAL?

e777719d5bec32a Shiju Jose 2025-02-12  661  
e777719d5bec32a Shiju Jose 2025-02-12  662  			dev_data = &ctx->scrub[scrub_cnt];
e777719d5bec32a Shiju Jose 2025-02-12  663  			dev_data->instance = scrub_cnt;
e777719d5bec32a Shiju Jose 2025-02-12  664  			dev_data->scrub_ops = ras_features->scrub_ops;
e777719d5bec32a Shiju Jose 2025-02-12  665  			dev_data->private = ras_features->ctx;
e777719d5bec32a Shiju Jose 2025-02-12  666  			ret = edac_scrub_get_desc(parent, &ras_attr_groups[attr_gcnt],
e777719d5bec32a Shiju Jose 2025-02-12  667  						  ras_features->instance);
e777719d5bec32a Shiju Jose 2025-02-12  668  			if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  669  				goto data_mem_free;
e777719d5bec32a Shiju Jose 2025-02-12  670  
e777719d5bec32a Shiju Jose 2025-02-12  671  			scrub_cnt++;
e777719d5bec32a Shiju Jose 2025-02-12  672  			attr_gcnt++;
e777719d5bec32a Shiju Jose 2025-02-12  673  			break;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  674  		default:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  675  			ret = -EINVAL;
e777719d5bec32a Shiju Jose 2025-02-12  676  			goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  677  		}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  678  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  679  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  680  	ctx->dev.parent = parent;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  681  	ctx->dev.bus = edac_get_sysfs_subsys();
9222ad0e3fd4c35 Shiju Jose 2025-02-12  682  	ctx->dev.type = &edac_dev_type;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  683  	ctx->dev.groups = ras_attr_groups;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  684  	ctx->private = private;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  685  	dev_set_drvdata(&ctx->dev, ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  686  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  687  	ret = dev_set_name(&ctx->dev, name);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  688  	if (ret)
e777719d5bec32a Shiju Jose 2025-02-12  689  		goto data_mem_free;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  690  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  691  	ret = device_register(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  692  	if (ret) {
9222ad0e3fd4c35 Shiju Jose 2025-02-12  693  		put_device(&ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  694  		return ret;
9222ad0e3fd4c35 Shiju Jose 2025-02-12  695  	}
9222ad0e3fd4c35 Shiju Jose 2025-02-12  696  
9222ad0e3fd4c35 Shiju Jose 2025-02-12  697  	return devm_add_action_or_reset(parent, edac_dev_unreg, &ctx->dev);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  698  
e777719d5bec32a Shiju Jose 2025-02-12  699  data_mem_free:
e777719d5bec32a Shiju Jose 2025-02-12  700  	kfree(ctx->scrub);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  701  groups_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  702  	kfree(ras_attr_groups);
9222ad0e3fd4c35 Shiju Jose 2025-02-12  703  ctx_free:
9222ad0e3fd4c35 Shiju Jose 2025-02-12  704  	kfree(ctx);
9222ad0e3fd4c35 Shiju Jose 2025-02-12 @705  	return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

