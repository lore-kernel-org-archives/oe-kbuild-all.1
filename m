Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA426AEC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 08:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739347600; cv=none; b=kuv5KWM4gpp8l/gf53K1okXLL7TyT1x94OmvsRPEeG2phlvgigpelnjnnWvY0b7kWpVTxEcvdsQ32qagbe13zVYlwLIBrrTpcriOApkfWzxaT2j3usivLSzLEtXhaBcCE3OcvAgnEV8a6YUmswDSUfBo8SqVddvf/sZfZV9XYMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739347600; c=relaxed/simple;
	bh=jQKL5lDONXvvbn0Lfc2NJ05Txa7m8VhPcVMy3iehMTc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3izQl+VCJzBCXLd6PwnchdioQEXIkV1sqyToyYty4QkA0OvRVf6PLYR2D599ip1ShDUpvW5pixLaPK0t/4WxepK1INVt4um3yuscVN3M3pXPe1qM183jl3yUx8GRtJdb09tD3oeH6/guXDIipXC2assukD3K+CPCewBPQjc8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9rWIC2S; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9rWIC2S"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ab7c14b880dso616311266b.1
        for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739347596; x=1739952396; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BD/L2YaaT9oQxWH3Y3n1355u9oee8XwMr4FHWMmdkJ8=;
        b=I9rWIC2SwHCbVgX6NQVqyLXI5YGUfjPfCSsdnevhW0HRquZq7apUDSePuTFTUzsijl
         jhQa+xrx0TiRMp6jsNBvTOxPmH3+0dibT4WSMr/5EPcKYXYaWefzDKmTbHEnbldSKgnB
         Zi9Qa7MZf720sKgNpjQiP7AOv7qeltTXFzDramHBqH+FKE/BWehTzO+j44704IVheREn
         DHgZmIf4slozjFT8rZJ/nDiT/c1jQ2C86hhzCWHGj58KwYSAo2dPgnd4jOSypaEAJe6K
         gNZMX5I/GzhDXUJynDEBH2AmSKKojliC4VR51IgtWiBkDx3/XRgEOBup/KgREgR5mA5k
         17kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739347596; x=1739952396;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BD/L2YaaT9oQxWH3Y3n1355u9oee8XwMr4FHWMmdkJ8=;
        b=l283OLyxFw+1KZD3O7A/21u+86sDj75PTF603dgIZ1keoMrZITgyRYDM8RBY98Ro4v
         jo3KyjdQTlWIeLfBu30XczK5osbDKIHwyh/Fz2gT2SJFHqzvcvdVjxVNvNFCvhVz82px
         ZzJgSqJfhBWTk0+SRj6tXxZPQ6iQ9RUh+rbc2usrnAl1P9tD0QtQL1SthFOETfQh9Gqu
         pAC6XTtY/ppRmjJoE4Nlahr0wXJQRn1IvapqnvO5uzg34oIUf69AF/eWmPID0uzuqrFm
         uFKfnHdPSfw2PWwwqpieR0LqS0hrOlqK6ocCd/hgCQwH83NnGRsozi7H706wJrO32Hm3
         +VHg==
X-Forwarded-Encrypted: i=1; AJvYcCXqmrBQqRcZLwgYnLnDIRTbexKzPrGbJTGZcU4529iN9zSFnofeBHQIt/j/hDRMZ8BfJeHRR8YAlWGe1J1G@lists.linux.dev
X-Gm-Message-State: AOJu0YzplHxzZNnCS6TzACuE2GabY+n7fTAd5NUb/+Y9Ju18HXt4a7zZ
	JbA0F82ym+pbi5pO7EgWO24xGcio4JuUkWOBV6vnPsLnAIpHb0kBhxLMxzLfFE4=
X-Gm-Gg: ASbGncvPdFEN7lQQnz4tMsuepDGC3PV1qxp2I/y3swJPyi3poCWMkCsXwaA3DWYhlYB
	meg4/xe/5i6AccYaFtF+a9E5+CoJIm5LTSGPZ7Qc6vU8G5aVqit69Uc+28EJ1XyLiNRMHUgifhR
	mfE1jZrwgE2hN0LV0dWi2j9sGYnd6IA9QKdpZPeUP8ZTnE5skrIG6mzM7UWTcqF81cMo48kQO8d
	iPL+w7DDOUqw85BQZN0secWQVcFO6042d4ioXP/YkuSglGvu+xwHnQHDGFio9e9AN7O4Sd5z9lQ
	F9goe8iOMXyU2p2loTGF
X-Google-Smtp-Source: AGHT+IHLEcyUkYsYbbKj8zuRYOjgSAfYpc7lL96ykCAhivGjpA12crx5tI1CZClApuuUNDeq9FUGhQ==
X-Received: by 2002:a17:907:2d27:b0:ab7:db70:6f1d with SMTP id a640c23a62f3a-ab7f38a11e5mr182752366b.57.1739347596223;
        Wed, 12 Feb 2025 00:06:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab7832a02fcsm1126118866b.94.2025.02.12.00.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 00:06:35 -0800 (PST)
Date: Wed, 12 Feb 2025 11:06:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, David Lechner <dlechner@baylibre.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>
Subject: [broonie-ci:v8_20250207_dlechner_spi_axi_spi_engine_add_offload_support
 7/7] drivers/spi/spi-offload.c:127 devm_spi_offload_get() error:
 dereferencing freed memory 'resource' (line 126)
Message-ID: <ff447734-5ce8-4ac7-8a77-b1538fbe52c8@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v8_20250207_dlechner_spi_axi_spi_engine_add_offload_support
head:   5a19e1985d014fab9892348f6175a19143cec810
commit: 5a19e1985d014fab9892348f6175a19143cec810 [7/7] spi: axi-spi-engine: implement offload support
config: x86_64-randconfig-161-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112344.7ggtFzyn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502112344.7ggtFzyn-lkp@intel.com/

smatch warnings:
drivers/spi/spi-offload.c:127 devm_spi_offload_get() error: dereferencing freed memory 'resource' (line 126)
drivers/spi/spi-offload.c:183 spi_offload_trigger_get() warn: variable dereferenced before check 'trigger->ops' (see line 173)
drivers/spi/spi-offload.c:300 spi_offload_trigger_enable() error: we previously assumed 'offload->ops' could be null (see line 291)

vim +/resource +127 drivers/spi/spi-offload.c

8e02d188698851 David Lechner 2025-02-07  106  struct spi_offload *devm_spi_offload_get(struct device *dev,
8e02d188698851 David Lechner 2025-02-07  107  					 struct spi_device *spi,
8e02d188698851 David Lechner 2025-02-07  108  					 const struct spi_offload_config *config)
8e02d188698851 David Lechner 2025-02-07  109  {
8e02d188698851 David Lechner 2025-02-07  110  	struct spi_controller_and_offload *resource;
8e02d188698851 David Lechner 2025-02-07  111  	int ret;
8e02d188698851 David Lechner 2025-02-07  112  
8e02d188698851 David Lechner 2025-02-07  113  	if (!spi || !config)
8e02d188698851 David Lechner 2025-02-07  114  		return ERR_PTR(-EINVAL);
8e02d188698851 David Lechner 2025-02-07  115  
8e02d188698851 David Lechner 2025-02-07  116  	if (!spi->controller->get_offload)
8e02d188698851 David Lechner 2025-02-07  117  		return ERR_PTR(-ENODEV);
8e02d188698851 David Lechner 2025-02-07  118  
8e02d188698851 David Lechner 2025-02-07  119  	resource = kzalloc(sizeof(*resource), GFP_KERNEL);
8e02d188698851 David Lechner 2025-02-07  120  	if (!resource)
8e02d188698851 David Lechner 2025-02-07  121  		return ERR_PTR(-ENOMEM);
8e02d188698851 David Lechner 2025-02-07  122  
8e02d188698851 David Lechner 2025-02-07  123  	resource->controller = spi->controller;
8e02d188698851 David Lechner 2025-02-07  124  	resource->offload = spi->controller->get_offload(spi, config);
8e02d188698851 David Lechner 2025-02-07  125  	if (IS_ERR(resource->offload)) {
8e02d188698851 David Lechner 2025-02-07 @126  		kfree(resource);
                                                              ^^^^^^^^
Freed

8e02d188698851 David Lechner 2025-02-07 @127  		return resource->offload;
                                                               ^^^^^^^^^^^^^^^^^
Use after free

8e02d188698851 David Lechner 2025-02-07  128  	}
8e02d188698851 David Lechner 2025-02-07  129  
8e02d188698851 David Lechner 2025-02-07  130  	ret = devm_add_action_or_reset(dev, spi_offload_put, resource);
8e02d188698851 David Lechner 2025-02-07  131  	if (ret)
8e02d188698851 David Lechner 2025-02-07  132  		return ERR_PTR(ret);
8e02d188698851 David Lechner 2025-02-07  133  
8e02d188698851 David Lechner 2025-02-07  134  	return resource->offload;
8e02d188698851 David Lechner 2025-02-07  135  }
[ snip ]

d7231be4b4657e David Lechner 2025-02-07  159  static struct spi_offload_trigger
d7231be4b4657e David Lechner 2025-02-07  160  *spi_offload_trigger_get(enum spi_offload_trigger_type type,
d7231be4b4657e David Lechner 2025-02-07  161  			 struct fwnode_reference_args *args)
d7231be4b4657e David Lechner 2025-02-07  162  {
d7231be4b4657e David Lechner 2025-02-07  163  	struct spi_offload_trigger *trigger;
d7231be4b4657e David Lechner 2025-02-07  164  	bool match = false;
d7231be4b4657e David Lechner 2025-02-07  165  	int ret;
d7231be4b4657e David Lechner 2025-02-07  166  
d7231be4b4657e David Lechner 2025-02-07  167  	guard(mutex)(&spi_offload_triggers_lock);
d7231be4b4657e David Lechner 2025-02-07  168  
d7231be4b4657e David Lechner 2025-02-07  169  	list_for_each_entry(trigger, &spi_offload_triggers, list) {
d7231be4b4657e David Lechner 2025-02-07  170  		if (trigger->fwnode != args->fwnode)
d7231be4b4657e David Lechner 2025-02-07  171  			continue;
d7231be4b4657e David Lechner 2025-02-07  172  
d7231be4b4657e David Lechner 2025-02-07 @173  		match = trigger->ops->match(trigger, type, args->args, args->nargs);
                                                                ^^^^^^^^^^^^^^
Unchecked dereference

d7231be4b4657e David Lechner 2025-02-07  174  		if (match)
d7231be4b4657e David Lechner 2025-02-07  175  			break;
d7231be4b4657e David Lechner 2025-02-07  176  	}
d7231be4b4657e David Lechner 2025-02-07  177  
d7231be4b4657e David Lechner 2025-02-07  178  	if (!match)
d7231be4b4657e David Lechner 2025-02-07  179  		return ERR_PTR(-EPROBE_DEFER);
d7231be4b4657e David Lechner 2025-02-07  180  
d7231be4b4657e David Lechner 2025-02-07  181  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  182  
d7231be4b4657e David Lechner 2025-02-07 @183  	if (!trigger->ops)
                                                     ^^^^^^^^^^^^
Too late.

d7231be4b4657e David Lechner 2025-02-07  184  		return ERR_PTR(-ENODEV);
d7231be4b4657e David Lechner 2025-02-07  185  
d7231be4b4657e David Lechner 2025-02-07  186  	if (trigger->ops->request) {
d7231be4b4657e David Lechner 2025-02-07  187  		ret = trigger->ops->request(trigger, type, args->args, args->nargs);
d7231be4b4657e David Lechner 2025-02-07  188  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  189  			return ERR_PTR(ret);
d7231be4b4657e David Lechner 2025-02-07  190  	}
d7231be4b4657e David Lechner 2025-02-07  191  
d7231be4b4657e David Lechner 2025-02-07  192  	kref_get(&trigger->ref);
d7231be4b4657e David Lechner 2025-02-07  193  
d7231be4b4657e David Lechner 2025-02-07  194  	return trigger;
d7231be4b4657e David Lechner 2025-02-07  195  }

[ snip ]

d7231be4b4657e David Lechner 2025-02-07  280  int spi_offload_trigger_enable(struct spi_offload *offload,
d7231be4b4657e David Lechner 2025-02-07  281  			       struct spi_offload_trigger *trigger,
d7231be4b4657e David Lechner 2025-02-07  282  			       struct spi_offload_trigger_config *config)
d7231be4b4657e David Lechner 2025-02-07  283  {
d7231be4b4657e David Lechner 2025-02-07  284  	int ret;
d7231be4b4657e David Lechner 2025-02-07  285  
d7231be4b4657e David Lechner 2025-02-07  286  	guard(mutex)(&trigger->lock);
d7231be4b4657e David Lechner 2025-02-07  287  
d7231be4b4657e David Lechner 2025-02-07  288  	if (!trigger->ops)
d7231be4b4657e David Lechner 2025-02-07  289  		return -ENODEV;
d7231be4b4657e David Lechner 2025-02-07  290  
d7231be4b4657e David Lechner 2025-02-07 @291  	if (offload->ops && offload->ops->trigger_enable) {
                                                    ^^^^^^^^^^^^
This assumes ->ops can be NULL

d7231be4b4657e David Lechner 2025-02-07  292  		ret = offload->ops->trigger_enable(offload);
d7231be4b4657e David Lechner 2025-02-07  293  		if (ret)
d7231be4b4657e David Lechner 2025-02-07  294  			return ret;
d7231be4b4657e David Lechner 2025-02-07  295  	}
d7231be4b4657e David Lechner 2025-02-07  296  
d7231be4b4657e David Lechner 2025-02-07  297  	if (trigger->ops->enable) {
d7231be4b4657e David Lechner 2025-02-07  298  		ret = trigger->ops->enable(trigger, config);
d7231be4b4657e David Lechner 2025-02-07  299  		if (ret) {
d7231be4b4657e David Lechner 2025-02-07 @300  			if (offload->ops->trigger_disable)
                                                                    ^^^^^^^^^^^^^^
Unchecked dereference.

d7231be4b4657e David Lechner 2025-02-07  301  				offload->ops->trigger_disable(offload);
d7231be4b4657e David Lechner 2025-02-07  302  			return ret;
d7231be4b4657e David Lechner 2025-02-07  303  		}
d7231be4b4657e David Lechner 2025-02-07  304  	}
d7231be4b4657e David Lechner 2025-02-07  305  
d7231be4b4657e David Lechner 2025-02-07  306  	return 0;
d7231be4b4657e David Lechner 2025-02-07  307  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

