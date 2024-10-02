Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802D51D0DC1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884497; cv=none; b=ZQ/ycEh/c2dhZLlGNuMtCcMRrdjNBlAQrcyf23bIqUthbOuucezJDPOjnI15/M3NCsXGYxOqgLd5hz+23JyuuHmrmSeCGee/OY+6CRBFjj14pG4kemdNt5g/xVUMgLURQYNLdqDz8MnXB93WVC9CgsRx7b37nLuWYXo4MhSXCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884497; c=relaxed/simple;
	bh=6ZrgPPk7+OP6qoaFFfFV1VKcjbgtYzxuLhEBOQZ8RPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=i/calX5JJUcEEMrNDf1TiTA9ZhtZuBB+2/87U4XNcu6gbSNvjS39K7+kEfXM/ddOCs8NJ56AIf3R6talaBtZL3MENGeqSng1qEnuX4XN88KENsIGOlv1RBDt6rHRaYypWU9WFf3IYvd/s6ItRYF+qG/jKay/qOuYXNiweUkpTcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIgPawxy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIgPawxy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so57148155e9.0
        for <oe-kbuild-all@lists.linux.dev>; Wed, 02 Oct 2024 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727884493; x=1728489293; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fZrN4Qg6ttokjqWn1GOM/G8p3WlmOj7Oy1FeMejEpPc=;
        b=bIgPawxyyfV6ntxG5G9KDXc93jyjDrO1Awy4SVcmiLi1Y54fti34V6uplyAp8fgWTm
         GptPToO0SuX8phyNhCtkQACuXwI35CeiIZBCGXaDO+jA7oujPjYi9cy6uOS75LoiaaAH
         W21Ge9wp9bLLYgrXoZmLDRrr2rv/3NkJYbj9ez1g6LiamZKPC4fDJsZOdNFajIGSVHGo
         PrTZ+Shm07tKa96JrZFsZAy8wECcdHwDrgHLlziUk/ccd51js7eA0UiI2k6slpJSAGIi
         Rm9wy3/XsK140lzetl+QzG/qQk6cO89tbiSOuNzIay/CadmfEGDmd8v/eK0zYt5LUXB2
         wTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884493; x=1728489293;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fZrN4Qg6ttokjqWn1GOM/G8p3WlmOj7Oy1FeMejEpPc=;
        b=cA47tJUNhSrxdj0HgvvEzn/SzlyU+jSPKOtlMSIMmoqG6rwDjxB6qYe193R8TB11gM
         Ffc2Impq/lUseLHFoH9priKJK0Zp91jVEBWOSu6hE+WoDlq6tpYH0vvfaxeIm2tjRDH6
         QNW09xaikV2Vf5SArB2LIfGWAN72maCMd+grmDj7SLRaKgsB4qf6Nhn0BHtFw9mP2ljx
         6wyXlLzQQavFOElQy8BXK65kwzMsl610Su5t7H7O+71BetP5YNzuWJQKfDVFhsaP8ATY
         qpfewCTn0G5+9WtuRfSpeNvxglTX4gqjQtj3ZmZBmKJNShqcA3cnTW8DN32icdN0gbs/
         gfvg==
X-Forwarded-Encrypted: i=1; AJvYcCV0QdKtT/k7nHl95OTQ1XlvHpwzlIpw4WhSxTM74xbeEZquFbOgRs4WKGNupKYk0bvlH5g31vaU/7/THlj9@lists.linux.dev
X-Gm-Message-State: AOJu0YxxeiLFEbuzRPuFAU/YWSk76pJhurY+FLgvj8og2A/exI7h3iNR
	8P4XBPCNyrANGllEMs7RKEnlUY16TudQvU7kHpBJUNiPz2pO9bj71vzvZBwQ83M=
X-Google-Smtp-Source: AGHT+IHiwmCP8ElNVu2UzQ+gv+y7rGHDbPEqp2DrOSKquETwQlAYTReoIuqUlQNC4DpDy0dm0j0Wfw==
X-Received: by 2002:a05:600c:1f84:b0:425:7884:6b29 with SMTP id 5b1f17b1804b1-42f777c1b82mr25003785e9.19.1727884492401;
        Wed, 02 Oct 2024 08:54:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564bf8bsm14217498f8f.20.2024.10.02.08.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:54:51 -0700 (PDT)
Date: Wed, 2 Oct 2024 18:54:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Drew Fustini <dfustini@tenstorrent.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
Message-ID: <9f76efc9-c9c6-4097-a7a0-80e1b941866d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930-th1520-pinctrl-v3-2-32cea2bdbecb@tenstorrent.com>

Hi Drew,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Drew-Fustini/dt-bindings-pinctrl-Add-thead-th1520-pinctrl-bindings/20241001-035421
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20240930-th1520-pinctrl-v3-2-32cea2bdbecb%40tenstorrent.com
patch subject: [PATCH v3 2/8] pinctrl: Add driver for the T-Head TH1520 SoC
config: s390-randconfig-r072-20241002 (https://download.01.org/0day-ci/archive/20241002/202410022336.xyWlV0Tf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410022336.xyWlV0Tf-lkp@intel.com/

smatch warnings:
drivers/pinctrl/pinctrl-th1520.c:502 th1520_pinctrl_dt_node_to_map() warn: missing error code 'ret'

vim +/ret +502 drivers/pinctrl/pinctrl-th1520.c

e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  414  static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  415  					 struct device_node *np,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  416  					 struct pinctrl_map **maps,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  417  					 unsigned int *num_maps)
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  418  {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  419  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  420  	struct device_node *child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  421  	struct pinctrl_map *map;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  422  	unsigned long *configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  423  	unsigned int nconfigs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  424  	unsigned int nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  425  	int ret;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  426  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  427  	nmaps = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  428  	for_each_available_child_of_node(np, child) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  429  		int npins = of_property_count_strings(child, "pins");
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  430  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  431  		if (npins <= 0) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  432  			of_node_put(child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  433  			dev_err(thp->pctl->dev, "no pins selected for %pOFn.%pOFn\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  434  				np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  435  			return -EINVAL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  436  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  437  		nmaps += npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  438  		if (of_property_present(child, "function"))
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  439  			nmaps += npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  440  	}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  441  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  442  	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  443  	if (!map)
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  444  		return -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  445  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  446  	nmaps = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  447  	mutex_lock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  448  	for_each_available_child_of_node(np, child) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  449  		unsigned int rollback = nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  450  		enum th1520_muxtype muxtype;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  451  		struct property *prop;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  452  		const char *funcname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  453  		const char **pgnames;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  454  		const char *pinname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  455  		int npins;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  456  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  457  		ret = pinconf_generic_parse_dt_config(child, pctldev, &configs, &nconfigs);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  458  		if (ret) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  459  			dev_err(thp->pctl->dev, "%pOFn.%pOFn: error parsing pin config\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  460  				np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  461  			goto put_child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  462  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  463  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  464  		if (!of_property_read_string(child, "function", &funcname)) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  465  			muxtype = th1520_muxtype_get(funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  466  			if (!muxtype) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  467  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown function '%s'\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  468  					np, child, funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  469  				ret = -EINVAL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  470  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  471  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  472  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  473  			funcname = devm_kasprintf(thp->pctl->dev, GFP_KERNEL, "%pOFn.%pOFn",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  474  						  np, child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  475  			if (!funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  476  				ret = -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  477  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  478  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  479  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  480  			npins = of_property_count_strings(child, "pins");
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  481  			pgnames = devm_kcalloc(thp->pctl->dev, npins, sizeof(*pgnames), GFP_KERNEL);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  482  			if (!pgnames) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  483  				ret = -ENOMEM;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  484  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  485  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  486  		} else {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  487  			funcname = NULL;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  488  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  489  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  490  		npins = 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  491  		of_property_for_each_string(child, "pins", prop, pinname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  492  			unsigned int i;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  493  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  494  			for (i = 0; i < thp->desc.npins; i++) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  495  				if (!strcmp(pinname, thp->desc.pins[i].name))
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  496  					break;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  497  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  498  			if (i == thp->desc.npins) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  499  				nmaps = rollback;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  500  				dev_err(thp->pctl->dev, "%pOFn.%pOFn: unknown pin '%s'\n",
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  501  					np, child, pinname);

ret = -EINVAL?

e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30 @502  				goto free_configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  503  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  504  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  505  			if (nconfigs) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  506  				map[nmaps].type = PIN_MAP_TYPE_CONFIGS_PIN;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  507  				map[nmaps].data.configs.group_or_pin = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  508  				map[nmaps].data.configs.configs = configs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  509  				map[nmaps].data.configs.num_configs = nconfigs;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  510  				nmaps += 1;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  511  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  512  			if (funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  513  				pgnames[npins++] = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  514  				map[nmaps].type = PIN_MAP_TYPE_MUX_GROUP;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  515  				map[nmaps].data.mux.function = funcname;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  516  				map[nmaps].data.mux.group = thp->desc.pins[i].name;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  517  				nmaps += 1;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  518  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  519  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  520  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  521  		if (funcname) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  522  			ret = pinmux_generic_add_function(pctldev, funcname, pgnames,
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  523  							  npins, (void *)muxtype);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  524  			if (ret < 0) {
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  525  				dev_err(thp->pctl->dev, "error adding function %s\n", funcname);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  526  				goto put_child;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  527  			}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  528  		}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  529  	}
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  530  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  531  	*maps = map;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  532  	*num_maps = nmaps;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  533  	mutex_unlock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  534  	return 0;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  535  
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  536  free_configs:
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  537  	kfree(configs);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  538  put_child:
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  539  	of_node_put(child);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  540  	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  541  	mutex_unlock(&thp->mutex);
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  542  	return ret;
e7e62c9ab90ce8 Emil Renner Berthing 2024-09-30  543  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

