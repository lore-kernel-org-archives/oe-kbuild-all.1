Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7193314C0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 14:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230893; cv=none; b=brLUqvdvN6wGFl4jFI1QhcNJJ/XttiAmbEGh5VfHbyxWW9bQh6IovdtDpkD+eGBsoNg228q5fti+J/fqnsf8wk58vWzTB71cMQkNurcnz2uvzqbBXcpSeWpH6QZsKWj+esgdG80VT10AY6CjPv8vF1e1oteGvonhTeBGkcw/ePk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230893; c=relaxed/simple;
	bh=MgOdUmhxFApDz4sRw7UlK/dEuErVOukFGzY2IjjkGxw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=uWhSQ3A2v6ePLkkRfR/mEDR33cG74eZoqq108m3s7WnIKqIT3nNnC7KaXrNQX9Pg2L4wQI2Ka8kli73AirEczvdiGlmaMWLajmwtev6fCq0Kf0j5OGGmU8KEoaPjPyBLOVdCKhLfjhpelJFxaI1oDS1EAqLF3/yvxxyZ6dysDFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjeUviSo; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjeUviSo"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-471066cfc2aso8836255e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Oct 2025 07:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761230889; x=1761835689; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gOu4NGMCUBSkrR2LXCmniFlUsFFrudDXlxk8VUy4Cb0=;
        b=DjeUviSo1qgrNGKzflQ0ZwvntIVnFmNYX9/ERUWTRK5I3aM1dKNDABBvh626yVEeFO
         51ggQy2/IM2QuHSQiJYz5F1jVSm5I7ubsFt3ioLatgAkLuEQNzT6nBE7VpLcvDsaUwIL
         ql9HeJ4Dh+EHqCO6Pau2cx2K+f7kbT6HeR/8wQboHHKD1RmisxhAhDCSWW1c27KTIA9i
         LTPSWUZyCqfUTqKmjHqYUEQVWPirS9twvhaWo+ttLxqE8lY7kIr228F8HqVfUsOwS8/i
         h3ZlVRtg1fgwLItGfOqZmfHfx8TboXGr/z/GET/5R46BUdLjgXu4a+WMKSvCK29zGxJS
         l8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761230889; x=1761835689;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOu4NGMCUBSkrR2LXCmniFlUsFFrudDXlxk8VUy4Cb0=;
        b=hONx9XlBDMuxpmdrBouDvgIG2EHBM4K6i6TMYV65RmMH2IDFaSACQSaTLxmVg0YRgL
         6OoWk0IM2ma6SMgyth1lr+35T3Q/UAjH/s3rGgoSLOdSz6hbZbmsHSHY1ucLfj56Ywe9
         lApfwwKzD3pxoS6j+gwAIVKEOJASoRs1S8zttKxJZkY8f/S635tCqXdcaM5dHAx3fqv9
         tO6XHqpId837piAXjVKTz3PsEGu8oU2i8J2rbpdctqtMrfyMUKEMOvFTckV7pva/g6/0
         YjJv+l/umw0IvOxujCtrAOCVAynIn4rGcQcrCZLwLIbBfhE3sZbBvg9MibdRbi9Fje47
         RLNg==
X-Forwarded-Encrypted: i=1; AJvYcCXiFIrRLqZK7FLaE0QDfpKDcVs6j8g+sc26ZYXKMqYu6aIiIe39xU67pbwWh4UL9AdCb/PctA/cjXTmgIfT@lists.linux.dev
X-Gm-Message-State: AOJu0YwIhzjriyQcNZAMO548lpPJ0Va85z31bwjckrhkb9EfNg+NH/Hq
	3ooTYYZkQ+J5bPZ9xBttIyJPVKQxXswcv+aUOn1SvWDlJfwhsUoFHQOgaMd5g9/qfyA=
X-Gm-Gg: ASbGnctPldX1mIF0Kz7YRKWLCU/MNNjD8mm2kVqzMUwdx3JfmYuUw1zChnFfCDYOm5M
	9diqbM3HHHn3GvFStSRc8C1r55fsvQY5VpcuU8QxYlrIAw/o+lHZigkCD0oC+BC4jvkuHE21T9R
	OsaG5+FCmz8KRSYkuxIdY62cSfLjV802uNfexhLnkBjpcvFkPbhMbURpj1wY0E6726FGbz4yP1I
	oPZh8/MLuYz4DS5TJnyVC0DEI0XjdgUp/n2GiCGcj4hL2w1TSVDUGXMhsrWH/IMhYhCAuYo3geQ
	8QzUPSHlHLjvSr3Iz620T09X99Ro/qhebCzH2lXj9HG5vFGwADMaldGj20r5iBFDkgDtCYbX0P5
	Z2IzxGB17m3MJ5w/od8l5Tjn2rE1v++als30cddmGbZJw5V2Rt7//RjTEeVygn/5AURtVbxG/EN
	tiSA8QIJBKuziOrE/C
X-Google-Smtp-Source: AGHT+IHPh2MT5lwbkEnF6WyBRT0yvdgZZWzMZDal2Q67sdKk48DCYJobcUZUTlENYCgL3UDZOXyWQA==
X-Received: by 2002:a05:600c:37c7:b0:46e:477a:16cc with SMTP id 5b1f17b1804b1-47117902f6cmr144699475e9.24.1761230889325;
        Thu, 23 Oct 2025 07:48:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-474949df22csm64839095e9.0.2025.10.23.07.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 07:48:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 17:48:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 4/4] leds: Add Virtual Color LED Group driver
Message-ID: <202510231653.3V9E5oxE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013120955.227572-5-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-leds-Add-YAML-bindings-for-Virtual-Color-LED-Group-driver/20251013-201353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251013120955.227572-5-professorjonny98%40gmail.com
patch subject: [PATCH v2 4/4] leds: Add Virtual Color LED Group driver
config: loongarch-randconfig-r072-20251019 (https://download.01.org/0day-ci/archive/20251023/202510231653.3V9E5oxE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510231653.3V9E5oxE-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-group-virtualcolor.c:239 leds_virtualcolor_init_vled() warn: 'phandle_count' unsigned <= 0

vim +/phandle_count +239 drivers/leds/rgb/leds-group-virtualcolor.c

793ec9b4ba92eea Jonathan Brophy 2025-10-14  218  static int leds_virtualcolor_init_vled(struct device *dev, struct device_node *child,
793ec9b4ba92eea Jonathan Brophy 2025-10-14  219  				       struct virtual_led *vled, struct leds_virtualcolor *vc_data)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  220  {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  221  	struct led_init_data init_data = {};
793ec9b4ba92eea Jonathan Brophy 2025-10-14  222  	u32 blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  223  	u32 phandle_count;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  224  	u32 max_brightness;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  225  	int ret;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  226  	int i;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  227  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  228  	ret = of_property_read_u32(child, "priority", &vled->priority);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  229  	if (ret)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  230  		vled->priority = 0;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  231  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  232  	ret = of_property_read_u32(child, "blink", &blink_interval);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  233  	if (!ret) {
793ec9b4ba92eea Jonathan Brophy 2025-10-14  234  		vled->blink_delay_on = blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  235  		vled->blink_delay_off = blink_interval;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  236  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  237  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  238  	phandle_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
793ec9b4ba92eea Jonathan Brophy 2025-10-14 @239  	if (phandle_count <= 0) {
                                                            ^^^^^^^^^^^^^^^^^^
u32 can't be < 0.

793ec9b4ba92eea Jonathan Brophy 2025-10-14  240  		dev_err(dev, "No monochromatic LEDs specified for virtual LED %s\n",
793ec9b4ba92eea Jonathan Brophy 2025-10-14  241  			vled->cdev.name);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  242  		return -EINVAL;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  243  	}
793ec9b4ba92eea Jonathan Brophy 2025-10-14  244  
793ec9b4ba92eea Jonathan Brophy 2025-10-14  245  	vled->num_monochromatics = phandle_count;
793ec9b4ba92eea Jonathan Brophy 2025-10-14  246  	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
793ec9b4ba92eea Jonathan Brophy 2025-10-14  247  					    sizeof(*vled->monochromatics), GFP_KERNEL);
793ec9b4ba92eea Jonathan Brophy 2025-10-14  248  	if (!vled->monochromatics)
793ec9b4ba92eea Jonathan Brophy 2025-10-14  249  		return -ENOMEM;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

