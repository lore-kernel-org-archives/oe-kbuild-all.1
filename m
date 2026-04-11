Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7B61E1E04
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 08:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775894436; cv=none; b=SM+m2rEzJqsy+djIaHcxQ5tOh2CYzHAJNwrvQIXnsj+zkUdWxfGRPLYq/as9dRPWC8RrZmPzNK9StjAUu8E/oX6pyeIPN6BevWcbfXVzExVY5k4719OaONjHqp6kz9AypVjIpZ0C9wLEEdsW1hZQYFmp9vWyVml3V2FfAzuCiv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775894436; c=relaxed/simple;
	bh=18rof0FAOg8SSH7UeT/G6ZJ2QtS1VJqgI+A1f2HZscg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+R9jjXxElLgpV1Stv9bvC7kLjvRXzbN+s5zgBfvMJdF1NCqj5eax/vh3rw8WJFtQltQ73knxMOQW1sVQl72+XAUkCIgXir9625JsrUbAJu0uvLSjoKum9sfUcScfuu5WfpDNSUj4UFKafmw1bQYEAv5v0yfO1jEBSzZGbWM9GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHO3lEvu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHO3lEvu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso2285963f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 01:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775894433; x=1776499233; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HvDTNEGFLs6IzigTifHNQ2dGKAT9ic7dygGRAnZnhxA=;
        b=lHO3lEvuhkLUZEII/KpGSM7PxNm8h+AkexIbm7P6UwhVPWbysUzUd84nyNjnUFaxTI
         wQZ3mLQ3QtqFjMHji1bAWjIVe4aC4uoPXCsbHldoT4kji8VUDL9HyfiTJ4gLHfN0jzyH
         iuIffwig8hCG6yJu+kliPPKI45+PThmKkZbC2lquoObszpBIJ7H649LgTCSstWUVXY7F
         f17BFkVljPi4+ZRQnEUUFWeVNW1p9p8upTr4WGWxZH2JSWTd3dMc/cle+9yVxhk+RTpE
         EB22uXEQANhp91anaObfXnzvzaTnmqO6QfBJHCqZIIzp4HD1Lw5nTU7908fhUlpL80VE
         JgwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775894433; x=1776499233;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvDTNEGFLs6IzigTifHNQ2dGKAT9ic7dygGRAnZnhxA=;
        b=n1R049HWZo8WiPO1CZag3l3tEgrHQAyQgimxCiyEXrr4s+GmEzTmp4Ftaf7Wh8TTTp
         MUp//MLFojgUpPfG4FBWqXK1j4GzM8l9aN9TJ0R/8mMquvVW97LQQ9lPx+fRXMxASHS8
         CNjek02oeDXqdvzFao7bqaEaI/ydJ4lKk2ZvpaFDi89z/4AjupG4FTQ+iZcd3bOXw4mE
         88O2znuOOVvblT9oEvcCng1MVg54Oty7hRQDqf+bFtnV3cn4fUaXKl5Xveot2EcYg9pZ
         GDITDxVQ9Xku2KZBkhrwYi8Vw2GpW8UfcwxvoXdO8F/wXjmW9b+3eNCtNkIRezgAp16k
         Vx1g==
X-Forwarded-Encrypted: i=1; AJvYcCWbvjf5LAdcKypTh/b+n5IAElFtK8sMXsjmNweBaaNBeIMX/rgU88ld70WulVEMAjrmeg2vuwGn0WD+2Ptf@lists.linux.dev
X-Gm-Message-State: AOJu0YzpGkif0fhJIF0SkdVE2Jwhc2KVWMCh/slG1detW93zH6BDZMq2
	oSztiP9BbT/IGOEpyJCtBQt8QE2AhcaQiKqpk+mElHUkk17Qbqs6ttsh
X-Gm-Gg: AeBDietYd2gwGqC3iEl/cXLCTtCvy6/fAev5H7gkaPrOH3Sc/JrmUvUSV8zPu4HDYbY
	mnzUuc//sdK5RZzZfjxhs2aK4456iXiVweRUO8maL/Y8MvHWqnhdqVFR0CtDvorClWTkg8r9JNE
	rjepSt9SDagCJ1tU0wzKhpkJIO6gxhNSXDTaYqn29FXQg1z89ghVEqm1dMpzoYqeybjsa5erA09
	zBBcLXr6oZtrHR6qoyaPIyDpRQjKygXkKZDoYyG/3MlE3zbrpVVY57L1C26h+CShrmk5cL2zqKL
	ob13rz3Xe3nK2g/uK/mvpN/OmfjkfyPgTAAtvtsgM6FcTrmoTKA8Dj8qTJSwybhAQfZXUE73Tq0
	/sGGPn8Eh7oMAwXT7eijYJkFU82PvB88o93/XlG/+1+j51ccBJQNLbnWKILhotncSOVysh8oMY1
	Q9bM7d33tooyHxKtXh3Gg=
X-Received: by 2002:a05:6000:615:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-43d64292737mr8730734f8f.14.1775894432095;
        Sat, 11 Apr 2026 01:00:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63deb904sm14993252f8f.9.2026.04.11.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 01:00:31 -0700 (PDT)
Date: Sat, 11 Apr 2026 11:00:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn: 'desc'
 can also be NULL
Message-ID: <202604110938.6uIVnQtT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7c6c4ed80b874f721bc7c2c937e098c56e37d2f0
commit: 1e4f6db614a310cc34d07ffbf031c76ea9581bcf gpiolib: support shared GPIOs in core subsystem code
config: x86_64-randconfig-161-20260410 (https://download.01.org/0day-ci/archive/20260411/202604110938.6uIVnQtT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1e4f6db614a3 ("gpiolib: support shared GPIOs in core subsystem code")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604110938.6uIVnQtT-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib.c:4732 gpiod_find_and_request() warn: 'desc' can also be NULL

vim +/desc +4732 drivers/gpio/gpiolib.c

c6ccc4dde17676 Hans de Goede       2025-09-20  4643  
0d776cfd5e5b55 Stephen Boyd        2024-02-22  4644  struct gpio_desc *gpiod_find_and_request(struct device *consumer,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4645  					 struct fwnode_handle *fwnode,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4646  					 const char *con_id,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4647  					 unsigned int idx,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4648  					 enum gpiod_flags flags,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4649  					 const char *label,
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4650  					 bool platform_lookup_allowed)
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4651  {
ba2dc1cb549171 Hans de Goede       2022-12-29  4652  	unsigned long lookupflags = GPIO_LOOKUP_FLAGS_DEFAULT;
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4653  	const char *name = function_name_or_default(con_id);
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4654  	/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4655  	 * scoped_guard() is implemented as a for loop, meaning static
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4656  	 * analyzers will complain about these two not being initialized.
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4657  	 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4658  	struct gpio_desc *desc = NULL;
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4659  	int ret = 0;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4660  
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4661  	scoped_guard(srcu, &gpio_devices_srcu) {
c6ccc4dde17676 Hans de Goede       2025-09-20  4662  		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4663  					   &flags, &lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4664  		if (!IS_ERR_OR_NULL(desc) &&

Imagine desc is NULL

1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4665  		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4666  			/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4667  			 * We're dealing with a GPIO shared by multiple
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4668  			 * consumers. This is the moment to add the machine
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4669  			 * lookup table for the proxy device as previously
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4670  			 * we only knew the consumer's fwnode.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4671  			 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4672  			ret = gpio_shared_add_proxy_lookup(consumer, lookupflags);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4673  			if (ret)
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4674  				return ERR_PTR(ret);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4675  
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4676  			/* Trigger platform lookup for shared GPIO proxy. */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4677  			desc = ERR_PTR(-ENOENT);
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4678  			/* Trigger it even for fwnode-only gpiod_get(). */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4679  			platform_lookup_allowed = true;
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4680  		}
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4681  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4682  		if (gpiod_not_found(desc) && platform_lookup_allowed) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4683  			/*
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4684  			 * Either we are not using DT or ACPI, or their lookup
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4685  			 * did not return a result or this is a shared GPIO. In
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4686  			 * that case, use platform lookup as a fallback.
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4687  			 */
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4688  			dev_dbg(consumer,
e348544f7994d2 Bartosz Golaszewski 2024-01-19  4689  				"using lookup tables for GPIO lookup\n");
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4690  			desc = gpiod_find(consumer, con_id, idx, &lookupflags);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4691  		}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4692  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4693  		if (IS_ERR(desc)) {
5c887b65bbd1a3 Andy Shevchenko     2024-03-25  4694  			dev_dbg(consumer, "No GPIO consumer %s found\n", name);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4695  			return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4696  		}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4697  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4698  		/*
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4699  		 * If a connection label was passed use that, else attempt to use
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4700  		 * the device name as label
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4701  		 */
0eadd36d912374 Dmitry Torokhov     2022-09-03  4702  		ret = gpiod_request(desc, label);
                                                                                    ^^^^
This would crash.  The zero day bot doesn't do cross function
analysis so it can't detect it.

e348544f7994d2 Bartosz Golaszewski 2024-01-19  4703  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4704  	if (ret) {
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4705  		if (!(ret == -EBUSY && flags & GPIOD_FLAGS_BIT_NONEXCLUSIVE))
0eadd36d912374 Dmitry Torokhov     2022-09-03  4706  			return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4707  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4708  		/*
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4709  		 * This happens when there are several consumers for the same
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4710  		 * GPIO line: we just return here without further
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4711  		 * initialization. It's a hack introduced long ago to support
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4712  		 * fixed regulators. We now have a better solution with
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4713  		 * automated scanning where affected platforms just need to
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4714  		 * select the provided Kconfig option.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4715  		 *
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4716  		 * FIXME: Remove the GPIOD_FLAGS_BIT_NONEXCLUSIVE flag after
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4717  		 * making sure all platforms use the new mechanism.
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4718  		 */
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4719  		dev_info(consumer,
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4720  			 "nonexclusive access to GPIO for %s, consider updating your code to using gpio-shared-proxy\n",
1e4f6db614a310 Bartosz Golaszewski 2025-11-12  4721  			 name);
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4722  		return desc;
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4723  	}
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4724  
8eb1f71e7acca4 Dmitry Torokhov     2022-11-11  4725  	ret = gpiod_configure_flags(desc, con_id, lookupflags, flags);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4726  	if (ret < 0) {
0eadd36d912374 Dmitry Torokhov     2022-09-03  4727  		gpiod_put(desc);
39c9049770f8b5 Peng Fan            2024-03-25  4728  		dev_err(consumer, "setup of GPIO %s failed: %d\n", name, ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4729  		return ERR_PTR(ret);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4730  	}
0eadd36d912374 Dmitry Torokhov     2022-09-03  4731  
ee194b12bf9a2f Bartosz Golaszewski 2024-10-04 @4732  	gpiod_line_state_notify(desc, GPIO_V2_LINE_CHANGED_REQUESTED);
0eadd36d912374 Dmitry Torokhov     2022-09-03  4733  
0eadd36d912374 Dmitry Torokhov     2022-09-03  4734  	return desc;
0eadd36d912374 Dmitry Torokhov     2022-09-03  4735  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

