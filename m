Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE81E882E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731076446; cv=none; b=BTvQ3RTwjVpeigIxfrY8PIt/tc4ce7BRTl8FYmvaHkV+7KxpvDcIu7JiXCvhLJtC80/cTsQH6NP0uceqO6w1Wgasdh80ySO6kEwKO92gJh7pbKqBbO7j5DHKjaQu4gCNBGenLUcHgGXzATxs1SpuwJlzLLT76En/NnLL2N/hEHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731076446; c=relaxed/simple;
	bh=DPU+D+82CmA9h5Ph6EL7ffraHSVchVSGoKUFRSRG56Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=h9jpGkKwR3YZgAkh+3R2IrLIpMOE54PxsTR0YsHqQwGhlbFbTsTux4DXLPYxjLqcyF+Bc13BgUIs79NMnBqb0Wsn94pHN57OLXodaBRn9ZYS4s0/lK4q9i9wVRyC6jVDpw6NiTZnr1N4aIPoTHYQOwx3c/ZoouzaultNiqcB27I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ybP7BiNd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ybP7BiNd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4ba20075so1497254f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 08 Nov 2024 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731076443; x=1731681243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4aKxG3gwOAGANkGkZ2NSS+guj7HDwh0arnh3SiLCSnU=;
        b=ybP7BiNdPXCNfpB0UQFFVoXysTCsmaQ9R3QmJ1aTFpMLdc14v9AAH+YMl40+DjkccB
         2ag23e9yjCNrnSgllLiF8+/VjAuyZCAWnlv2p3bAA2F3t3pnRZKsIfrThsn70SuwjX39
         ksVBQIBDr4E8sboyqy2knzSjxk2DyyAWLOEjiPlIFF6k1HLACb7yEBBwnDm0z3Uny3QE
         VwQa7p1o7K1KBSeGdsp8NXBZfsIPhMiqiIxDucNc+Bi2cT2l+2+cqoS6pZqEmJX5uJAo
         w43R/STqQbTl2dlS/EIRLd3XJK/SG33bfIHBzNBu7aXDg7FI+PDuEsk0/dVHi5+DB7jp
         N/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731076443; x=1731681243;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4aKxG3gwOAGANkGkZ2NSS+guj7HDwh0arnh3SiLCSnU=;
        b=oMODm4+v9HeXPDEgqLYNtUBwNPJvF+axGRsOMcNiCtGyBSWOz40YxD2UK6HiKfA1YF
         5giYie/nDEXdmw1gRioUmbzgM/ueG7vH0whSi10EHfLvZSOycRJbnmXSMvNiYh/ZVLYu
         QRMD55un5IR41dP9+1M3A/q/awuPvwBS9YneMNBtfm/q9i355+E/TLiXVIz0JJNG8EDd
         /iWjbbUYqRtsAk/4zUPS0hOMoL3JO9wTvQRfp+h8KlC74xejxMFRUD0oxWTX0ssuvTW7
         umyvnY68jByHu/+lltFTzlFDrHuU021fRE26566hz7W+wbEd8fScIciKCkMLXv4NHQsS
         lNcA==
X-Forwarded-Encrypted: i=1; AJvYcCUeQzz4+MKhZgy7AasTEHoQ2/oYqB2fw5q/qCm51pkAAp1s4MEOEp4hUYMyVQB/uCOjiee8RXZcyC+AHzYG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy6HrCaVOo11PMLWzyCEM4KveMWjxbhQoe1Jr/Z2uVa/EluvaF
	WCA5/yQyz1DhoACdN4dDsi/TpKqB2A1UXbtn2GVIUtmqp2+guTdkZ7sfm63/MVc=
X-Google-Smtp-Source: AGHT+IFiQTvvUUVNBS+RC050g+C25oacYB7OQt6yFvIZkoyX4jf9tm4lHFTxhmnrBwsgz4a+MFioMQ==
X-Received: by 2002:a05:6000:1866:b0:37d:4870:dedf with SMTP id ffacd0b85a97d-381f172a6e7mr2781004f8f.19.1731076443139;
        Fri, 08 Nov 2024 06:34:03 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed99a34bsm4960209f8f.54.2024.11.08.06.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 06:34:02 -0800 (PST)
Date: Fri, 8 Nov 2024 17:34:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
Message-ID: <954d6aa4-5dc7-4421-9b92-4cb9a0b9d40c@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106061812.6819-3-vicentiu.galanopulo@remote-tech.co.uk>

Hi Vicentiu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vicentiu-Galanopulo/dt-bindings-leds-Add-LED1202-LED-Controller/20241106-142011
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20241106061812.6819-3-vicentiu.galanopulo%40remote-tech.co.uk
patch subject: [PATCH 3/3] [PATCH v6] leds: Add LED1202 I2C driver
config: loongarch-randconfig-r073-20241107 (https://download.01.org/0day-ci/archive/20241108/202411080756.6eYdrM5X-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411080756.6eYdrM5X-lkp@intel.com/

smatch warnings:
drivers/leds/leds-st1202.c:175 st1202_brightness_get() error: uninitialized symbol 'value'.

vim +/value +175 drivers/leds/leds-st1202.c

7e6780184dc934 Vicentiu Galanopulo 2024-11-06  155  static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  156  {
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  157  	struct st1202_led *led;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  158  	struct st1202_chip *chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  159  	u8 value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  160  	int ret;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  161  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  162  	led = cdev_to_st1202_led(led_cdev);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  163  	chip = led->chip;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  164  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  165  	mutex_lock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  166  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  167  	ret = st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num,
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  168  				&value);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  169  	if (ret != 0)
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  170  		dev_err(&chip->client->dev, "Reading register [0x%x] failed, error: %d\n",
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  171  			ST1202_ILED_REG0 + led->led_num, ret);

Presumably value is uninitialized if st1202_read_reg() fails.  Normally
I would just mark st1202_read_reg() as a no-fail function and not
report it but here there is explicit error checking so it's weird.

7e6780184dc934 Vicentiu Galanopulo 2024-11-06  172  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  173  	mutex_unlock(&chip->lock);
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  174  
7e6780184dc934 Vicentiu Galanopulo 2024-11-06 @175  	return value;
7e6780184dc934 Vicentiu Galanopulo 2024-11-06  176  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

