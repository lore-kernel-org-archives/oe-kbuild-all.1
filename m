Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCD2F49E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 17:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268435; cv=none; b=XaDebOUi6wBmIpkEErNovtkCSjM9KLT5IitJJEAd5jyRESJq0uEHWX9cGmra504WGB3SQfXLXubVkg+QWkpZriWR7ANE6H7AbiyOsJQWwgePA9fEUDDCZ79j1pBYqVTnRxrOcp1laLmK9AVUUHrWV4MJxnCn0k39dFiq9SGHRgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268435; c=relaxed/simple;
	bh=ac+dj0rndcYqjmn89tRE8u9Zk6zsyI4KTZ3RrPJLnbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LYpDVeW/p8yr/DODkIaSpMUCTz4wmn+qS6c1We5HZItvLBhWS2jQuYUUSHY38F8FH08ViAk9FhQKy6Rw3PvplzehK/VHM4F7NuxRaUIW4jAXMAgl88mRWOlDDbQqx8icBx+W28zIHDTP2OAqvXnPfnQDW1kVEMgrJKwMfkHRyC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nbhg1C2t; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nbhg1C2t"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-407a5b577f8so1811662b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750268430; x=1750873230; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=Nbhg1C2tn2z4J8CqBf3SaTj9zkzI8ukH8DuLZ8wkkB833bsrbq/UNtfRs1hv2F3bb6
         K/7bEyp2IWiSm6nt0JCJlNAbaLoUkSqJE0xfBixzIfRQ3qfTzexTuYlKLoiJRViMwDx7
         q9/ZtALAAuEzD+Uea/+bcpwmMAka6mE/mDXUNzKm3ovLlKllr7zu0NuNEHMKmtIA7M8x
         vwXKnMlOFCpJrjLltHCOPv4oonN5jYPVXX2sP1jtuAW2im4+HrOxtetXpZE1Uqaxsvou
         mFUBJq4e4T0HPoA7P4IEM21+Mku/MamjM8wqHTVAO1TJe02j7CN/yRcA+5KscemPJDvV
         /EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750268430; x=1750873230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jheGvFrRBnUTJ/jqtFbTeeb7vfKBSDeMR+EMHPWYfE=;
        b=lD/WdunDsL5HCeIHPM389qzyTlyPZVgpx9wbmS8aemT+/6hgfX+JAQ8Hcao2JVV7eo
         gDqW6yHHbl46+AUFiLV5l5qEZiOJZ9xQhsoLrEsbwtg9LW6jQ46V/++3XYuKJCD6SB6x
         tjK48aM7fgatEPkA39HIHA9khOkWuXBOn4xr6EC2ZSYel1InBeiaG06NrlrMWkILKRSL
         4ipum9FotI/i0OBotZntvuB5pZdpIEWH+LTEfb82SKiqlbeTVBPHnxIQwXd8aAzUSaaY
         cnt1E/EVDWbC0u5N2UIK6VQgN8+pTCgY3Y+4gr/sF2TwwBpzBz5RzW13GwUcyAuf+xjM
         z28A==
X-Forwarded-Encrypted: i=1; AJvYcCUfr+lxpnMaixZqB48ASYp6yOA3M5F5pp2GwQIBli1wz9eMs8wSpUemU6BC7mUSDSem2ce/xPcxwK0SgfoS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Q6BETwf2xKx7ZfCaC0JSJrpOST9t9FHBUjKItZynrNiBtsHD
	j5483Q3n3bPCdXuDMfUHla8YGkP752XxJvlYomLui4xClZ0leu3J4LLT2KDGkf3CSBg=
X-Gm-Gg: ASbGncudc0Si5uUrPytEVM4PudvceKb9bA5XF/JKOVsmGJItL9YmBw87JCK6D7mbBc2
	IxBUARXifFJ1tQ3e27QvXB3U8iorRbM2NxnEc6w+F0EfRzQEbM0MNtyFX47QqW21tu4lXpsIaOm
	P9jycb/HMsMPhJhAiYl4dRWYH6bQMhyIfA5Y5UOBj+egAn418gaKgnf5dawb2STqaRpnnGfGF5h
	lTPJTMHAuAakaqAkVDzU74mKvtoYAcwaHWHxpy9y47jGzaXhAiJA3h8qh7X4clQWa88CQ2YJ0uL
	pKOk7P1VYR8j0nMP/f4ZHO4+VXUjj8zKUtT5+mZ59EiXlTBtvWKxI+53AK2drTyrbxDUbQ==
X-Google-Smtp-Source: AGHT+IECG3DT0XZa253ZiAtrOyEDWibKqgxLSniShtQDZC/Qv6j2rHi/ZcKJqvX1Mm8kJIJS9Lnp8g==
X-Received: by 2002:a05:6808:4fec:b0:406:7769:d351 with SMTP id 5614622812f47-40a7c20ba96mr10089279b6e.23.1750268430492;
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a7418c881sm2415408b6e.41.2025.06.18.10.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:40:30 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:40:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	=?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>,
	dmitry.torokhov@gmail.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tomas Jurena <jurenatomas@gmail.com>
Subject: Re: [PATCH] Input: tca6416-keypad - Add OF support for driver
 instantiation
Message-ID: <eef98df0-5beb-40c1-a4e6-722012635812@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610154609.1382818-1-jurenatomas@gmail.com>

Hi Tomáš,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tom-Ju-ena/Input-tca6416-keypad-Add-OF-support-for-driver-instantiation/20250611-094643
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20250610154609.1382818-1-jurenatomas%40gmail.com
patch subject: [PATCH] Input: tca6416-keypad - Add OF support for driver instantiation
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250614/202506140034.iXbhyNCx-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506140034.iXbhyNCx-lkp@intel.com/

smatch warnings:
drivers/input/keyboard/tca6416-keypad.c:263 tca6416_keypad_probe() error: we previously assumed 'pdata' could be null (see line 253)

vim +/pdata +263 drivers/input/keyboard/tca6416-keypad.c

3da11976b80c663 Uwe Kleine-König             2022-11-18  236  static int tca6416_keypad_probe(struct i2c_client *client)
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  237  {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  238  	uint8_t io_size = (uintptr_t)i2c_get_match_data(client);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  239  	struct tca6416_keys_platform_data *pdata;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  240  	struct tca6416_keypad_chip *chip;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  241  	struct input_dev *input;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  242  	int error;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  243  	int i;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  244  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  245  	/* Check functionality */
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  246  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  247  		dev_err(&client->dev, "%s adapter not supported\n",
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  248  			dev_driver_string(&client->adapter->dev));
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  249  		return -ENODEV;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  250  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  251  
c838cb3d477f797 Jingoo Han                   2013-12-05  252  	pdata = dev_get_platdata(&client->dev);
c4c4a926acb6b1c Tomas Jurena                 2025-06-10 @253  	if (!pdata && dev_fwnode(&client->dev)) {

Imagine pdata is NULL and so is dev_fwnode()

c4c4a926acb6b1c Tomas Jurena                 2025-06-10  254  		pdata = tca6416_parse_properties(&client->dev, io_size);
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  255  		if (!pdata) {
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  256  			dev_err(&client->dev,
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  257  				"Failed to parse device configuration from properties\n");
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  258  			return -EINVAL;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  259  		}
c4c4a926acb6b1c Tomas Jurena                 2025-06-10  260  	}
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  261  
91a4c69052bb660 Yangtao Li                   2023-07-23  262  	chip = devm_kzalloc(&client->dev,
91a4c69052bb660 Yangtao Li                   2023-07-23 @263  			    struct_size(chip, buttons, pdata->nbuttons),
                                                                                                               ^^^^^^^^^^^^^^^
Then it will crash

91a4c69052bb660 Yangtao Li                   2023-07-23  264  			    GFP_KERNEL);
91a4c69052bb660 Yangtao Li                   2023-07-23  265  	if (!chip)
91a4c69052bb660 Yangtao Li                   2023-07-23  266  		return -ENOMEM;
91a4c69052bb660 Yangtao Li                   2023-07-23  267  
91a4c69052bb660 Yangtao Li                   2023-07-23  268  	input = devm_input_allocate_device(&client->dev);
91a4c69052bb660 Yangtao Li                   2023-07-23  269  	if (!input)
91a4c69052bb660 Yangtao Li                   2023-07-23  270  		return -ENOMEM;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  271  
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  272  	chip->client = client;
30ba3ead05763b1 Sriramakrishnan Govindarajan 2010-05-03  273  	chip->input = input;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

