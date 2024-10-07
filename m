Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AD41D86DC
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Oct 2024 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728315704; cv=none; b=c1DK82PimFK/qW/fABqy/LXg5f1V+cnmDj4+g4bRBtKgvUyjwoN/c7r/1mJW8dLNrwBqohvdGEMwbjqFJR0zGMOFiTwnUZbMtKfmUeGO9wXblagZOmOYLyOM5aNzOGjZIQubLjKShe1SUTfg13Qub53d64lo0+1Jo7qszBSB9K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728315704; c=relaxed/simple;
	bh=PT8EMHuqy5rPTcAQcW3nttOPNpZjP5Fp04Mp/GmxpsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=m9PWzmvmncf70EOzjlk1k8Q9Htf4bV1BBlST/w2kei7uvuaw1Fj66debWwQhf1u+iuSE6mfV3CnpBZfnMLpEIVCq03749EcAO7VC6Riorp3IHsyaUH+MvS8Ty0ajH/S7ABzbfCANnSd9fl7Gl5EUlEH8MdMqanr1GgcTCy66Jw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+C6RrHh; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+C6RrHh"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cfff59d04so3661264f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 07 Oct 2024 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728315700; x=1728920500; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ARnoMCvCgsltYrhS969hYFyeA9hTUUb55Rt7GByaSkU=;
        b=t+C6RrHh1VBNVWB8qGziSDLaOTJJt0Dr6zUGCeTC2wX+dmMhBOuRWQlXvKAbYEvg+5
         BRSovQx02muqYBtX2o5PM/MmmCxh5o6xWjGHOBHrtEuI+ov7xrKpUBqm7yj0Y8dCov5q
         8pOySKLi0ArQP7VJKrEAERFTN+5nXwrS8Lyp4jTxP0/CueVvW5E9clBPgtye9qOy6E/0
         ta7u1xgWj95PCP9W1xDsXCWMo/kJXZyDCDam6jw/fboYhceendAVkqejs6HXLH8RTI9p
         kfiwlcL18w18ofEf6/WgMHkM4yxCNwX0UaCR8pIKSO9EbJkHfDtg6QoTS1SfP71Z5q79
         jclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315700; x=1728920500;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARnoMCvCgsltYrhS969hYFyeA9hTUUb55Rt7GByaSkU=;
        b=SZ9q8U6sAlDf9o6kh6x2U32wsQ6beCjwmgCuRYynBThDQJ6a4cov7055cJwF6RRD+R
         UwwbRqF1j3TC8osQk1rbHlHktPK7hMvmWONy5NJqG62CgPJLXmEarDnPg0L97pl59EdJ
         m/sfE6NKZ12eeuFJn+wZCikHLW4xCMs1GKuykUkQpzG+wPD0JSf0rNDXFaxOpl7GC9Bl
         KyeGHAeTlWvCU5yuw+2B/HAG7tYTCRLVEjPJ/npOokqNfRw5iDzWd3eiYasVXW/iRJTt
         aAtWhJoCD2dCXrm9Jo0tPFFN/9//+zRUzJOjjFqxT/Yo49jEXVLjjXqntAtQmyBUxnS+
         4Flg==
X-Forwarded-Encrypted: i=1; AJvYcCXfShnIPvslazHTKgTu2XZHUSusChXiCrpXGuLnzqBWSHwndAwrMfyHlhzOTrJ+GafTL3b2ioTk2r8YAg4u@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3zPPdl4AypdyDyio3IAiK+XR/nXMDYQlXIXELIt+JmMzRjl3/
	ZNYBkHz0e3SS0kDzRR1z4cgynu0b5XvrXnBwIUtKMJ06Hfke1Ircgogm53UvxMU=
X-Google-Smtp-Source: AGHT+IGxdXlmz5LN0TfcS0dSRYiTJFmNIAm6S0b8unbbg55LXrbI7bW+Sh4iR6+s5sUk666P5da4mQ==
X-Received: by 2002:adf:e352:0:b0:37c:ccba:8c93 with SMTP id ffacd0b85a97d-37d291de79cmr31745f8f.11.1728315700329;
        Mon, 07 Oct 2024 08:41:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16920549sm5967065f8f.54.2024.10.07.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 08:41:40 -0700 (PDT)
Date: Mon, 7 Oct 2024 18:41:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Drew Fustini <dfustini@tenstorrent.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded
 mutex
Message-ID: <6b3d9f7a-c87b-4ef5-8571-77276f3896a1@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00@tenstorrent.com>

Hi Drew,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/pinctrl-th1520-Convert-to-thp-mutex-to-guarded-mutex/20241006-033647
base:   2694868880705e8f6bb61b24b1b25adc42a4a217
patch link:    https://lore.kernel.org/r/20241005-th1520-pinctrl-fixes-v1-1-5c65dffa0d00%40tenstorrent.com
patch subject: [PATCH 1/2] pinctrl: th1520: Convert to thp->mutex to guarded mutex
config: parisc-randconfig-r072-20241007 (https://download.01.org/0day-ci/archive/20241007/202410072108.uG2sVTN4-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410072108.uG2sVTN4-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:538 th1520_pinctrl_dt_node_to_map() error: uninitialized symbol 'child'.

Old smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/child +538 drivers/pinctrl/pinctrl-th1520.c

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  418  {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  420  	struct device_node *child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  425  	int ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  426  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  428  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  430  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  432  			of_node_put(child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  433  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  434  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  435  			return -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  436  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  437  		nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  438  		if (of_property_present(child, "function"))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  439  			nmaps += npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  440  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  441  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  442  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  443  	if (!map)
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  444  		return -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  445  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  446  	nmaps = 0;
fb310b5cb13ad2 Drew Fustini         2024-10-05  447  	guard(mutex)(&thp->mutex);
fb310b5cb13ad2 Drew Fustini         2024-10-05  448  	for_each_available_child_of_node_scoped(np, child) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  449  		unsigned int rollback = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  450  		enum th1520_muxtype muxtype;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  451  		struct property *prop;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  452  		const char *funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  453  		const char **pgnames;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  454  		const char *pinname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  455  		int npins;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  456  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  457  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  458  		if (ret) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  459  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  460  				np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  461  			goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  462  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  463  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  464  		if (!of_property_read_string(child, "function", &funcname)) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  465  			muxtype = th1520_muxtype_get(funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  466  			if (!muxtype) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  467  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  468  					np, child, funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  469  				ret = -EINVAL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  470  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  471  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  472  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  473  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  474  						  np, child);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  475  			if (!funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  476  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  477  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  478  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  479  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  480  			npins = of_property_count_strings(child, "pins");
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  481  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  482  			if (!pgnames) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  483  				ret = -ENOMEM;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  484  				goto free_configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  485  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  486  		} else {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  487  			funcname = NULL;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  488  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  489  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  490  		npins = 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  491  		of_property_for_each_string(child, "pins", prop, pinname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  492  			unsigned int i;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  493  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  494  			for (i = 0; i < thp->desc.npins; i++) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  495  				if (!strcmp(pinname, thp->desc.pins[i].name))
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  496  					break;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  497  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  498  			if (i == thp->desc.npins) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  499  				nmaps = rollback;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  500  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  501  					np, child, pinname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  502  				goto free_configs;

err = -EINVAL?

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  503  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  504  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  505  			if (nconfigs) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  506  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  507  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  508  				map[nmaps].data.configs.configs = configs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  509  				map[nmaps].data.configs.num_configs = nconfigs;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  510  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  511  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  512  			if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  513  				pgnames[npins++] = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  514  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  515  				map[nmaps].data.mux.function = funcname;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  516  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  517  				nmaps += 1;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  518  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  519  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  520  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  521  		if (funcname) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  522  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  523  							  npins, (void *)muxtype);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  524  			if (ret < 0) {
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  525  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  526  				goto put_child;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  527  			}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  528  		}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  529  	}
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  530  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  531  	*maps = map;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  532  	*num_maps = nmaps;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  533  	return 0;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  534  
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  535  free_configs:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  536  	kfree(configs);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  537  put_child:
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30 @538  	of_node_put(child);

We're using _scoped() loops so this is a double put.

bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  539  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  540  	return ret;
bed5cd6f8a9883 Emil Renner Berthing 2024-09-30  541  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

