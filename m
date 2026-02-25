Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0819CD03
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 06:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772000548; cv=none; b=l2piGybWmpnwxbLlj8RUc5erK/gI0ecX4SoMrDAc83fTnSqHUtSVknQgxO5js7AC/RufgZdbutI/P7UDgunlVxA3AZhAcz+iFTIoBP6jfJPr3pvrnM4EkNSZJMMB0lKScsRNdIwoN8x+JwthHTvjn4KXgDLcqdpEqjBuuyG0c28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772000548; c=relaxed/simple;
	bh=k5U9idvKWqfoPSJ4m2BzIFQV2K6YVjt1yXurBmyIRXw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eIdta4KdMSaQ2jWoNed0fmNvby8Iks/xir+3rrUYUhPNoX1Ksz9c8ntcPt1jmuIxQ6/n+K1ngU6rW+ogGIZrG0lGDshV0d90CeGvieZhLHBsl00JPqt8vr1y1SaTuMa1AedqO9eualrkkAKr8ssxQT81MpkgOB+ZFSi+gurJ0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f7fwQftg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f7fwQftg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-437711e9195so4202235f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 22:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772000545; x=1772605345; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6TQX+cdB21OFB2LhMTn7qAOLA9HXWMn1D8RItFSzVI=;
        b=f7fwQftgydn2KDo/Pic68cJm6yqCxKhQBfLeXWUy6SDNsNoQDQKoO5sqkTkndYZxLL
         c98S7fnwqok1rWQKe7KnG3gHYsN5AmRlMjISiMubvic8zZJe5IG5rx8nWxO235QFWTwt
         2syMYkLprbzHf/6pFyAUvh4J+Gns7Eee+YFguXc5kfarvIaqkD2pUC2XJ7P563Pyczfi
         L+kYqYPJekXV239FV4+saS5VTHVmKm5QmxOV1LvZPoShmgQGDdHdXjL8kBhskI1uYEgS
         TbINhHtMTllXlUeGAhwXlPveYEhjWKA/8sGDDNaNFFOj/FOaVRE1/N3OVkjY1Oop9FPp
         boZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000545; x=1772605345;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6TQX+cdB21OFB2LhMTn7qAOLA9HXWMn1D8RItFSzVI=;
        b=rr6DuEFmNQwa938rUx/y1818+NZk1xyrUahXQxLNGRHDO7K0iOVcEdyjeCJ5HEiJo0
         JPD+0blPCILAYPYzJDZuz1rIQnhXpyTfIFgakukXTRD1cfWVjOv3KMyi9BqNVQvZO4hv
         rRsV9e4ax/TWLGxvEz3XwZ5d4vTOQZT56fuTDz1iD0idcbiRY1QZW1Jypc4pQqTjz0yM
         IRTKIfSiOa5TvBeZZYSeUt6koZzaR7ppqtP4p1ZFP0H2vkFzCBIeR07h4uS2R1i7f9hB
         etiwT5x89KgbVdCI/QlJJKD2n6efmMikzrFb8m53l90EzrQucCW6fxsk6jyi/ZLLOZb/
         1Lng==
X-Forwarded-Encrypted: i=1; AJvYcCUew+WP0pRDv/6Chp1AY+llLbZY3jvf5ZdegwruBA22SMEGhFWRJQYJLNweS7PNgaSaNJAG7btsJnxt18eN@lists.linux.dev
X-Gm-Message-State: AOJu0YxgPe9uFVxO+hkT0maNeCszC8Nkm6ZTvPGkXzcY+ApuWhgSiQFL
	mGmFhd2oO6GIIPDRCiLdyAA6rIsPN1Xpk6lvVoQNzofqN8BJ58V4TX7fbpU+dto+j7s=
X-Gm-Gg: ATEYQzzxSde4iQjxpBjKfvcAIA+ue4DdI51GfKp2aIJ12tOA/HxB58SF/bmhgblxn3d
	5dSLvX5mds0O+cGGKqbWhG0LTbCADXmi9y7qLR8UxtHgFDnNOLApxfoRVF9eQsncMaf1XXbvUz+
	I6hG0UZMcWo8IQzmgcDt9QNB3xKauiT2bvc/j8wSvgIX6nAEytl3WleLILoNq02Nn2QFMUzSa/V
	8kUt048DXISY7fu8e9QsESP44Oq761w8Nxse8eQtq5yOAfbb28Lq6gVss+s1YnrqIG4Cp0XKxSk
	fjM59XcQSo3OMcqFMxdlu2e5tSKDtUNjUmMD5Tpta45UaHWQN0P5Bhl5wLtAQlf4Vw9ZsxiBSQO
	0H+cxRlN4rmOSF4zM7lGkTXnJP8ZWNmrnYIKbp1XTp2eeokTQdBFUqIjiBPCFmgSEcWr5kWVtIM
	5mq5DfCiuNUET60svg/8GhgYU+F6NL
X-Received: by 2002:a05:6000:3111:b0:436:1934:d234 with SMTP id ffacd0b85a97d-4396f16e524mr30347224f8f.3.1772000545179;
        Tue, 24 Feb 2026 22:22:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm30929164f8f.26.2026.02.24.22.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 22:22:24 -0800 (PST)
Date: Wed, 25 Feb 2026 09:22:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Pranav Kharche <pranavkharche7@gmail.com>,
	linus.walleij@kernel.org, brgl@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Pranav Kharche <pranavkharche7@gmail.com>
Subject: Re: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback
 for GPIO device lookup
Message-ID: <202602251030.c7iVKF8b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224163234.653438-1-pranavkharche7@gmail.com>

Hi Pranav,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranav-Kharche/gpio-gpiolib-swnode-Remove-deprecated-label-fallback-for-GPIO-device-lookup/20260225-003353
base:   https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio/for-next
patch link:    https://lore.kernel.org/r/20260224163234.653438-1-pranavkharche7%40gmail.com
patch subject: [PATCH] gpio: gpiolib-swnode: Remove deprecated label fallback for GPIO device lookup
config: csky-randconfig-r073-20260225 (https://download.01.org/0day-ci/archive/20260225/202602251030.c7iVKF8b-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202602251030.c7iVKF8b-lkp@intel.com/

smatch warnings:
drivers/gpio/gpiolib-swnode.c:45 swnode_get_gpio_device() warn: if statement not indented

vim +45 drivers/gpio/gpiolib-swnode.c

b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  26  static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  27  {
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  28  	const struct software_node *gdev_node;
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  29  	struct gpio_device *gdev;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  30  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  31  	gdev_node = to_software_node(fwnode);
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  32  	if (!gdev_node)
216c12047571906 Bartosz Golaszewski 2025-11-20  33  		goto fwnode_lookup;
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  34  
9d50f95bc0d5df5 Charles Keepax      2024-04-16  35  	/*
9d50f95bc0d5df5 Charles Keepax      2024-04-16  36  	 * Check for a special node that identifies undefined GPIOs, this is
9d50f95bc0d5df5 Charles Keepax      2024-04-16  37  	 * primarily used as a key for internal chip selects in SPI bindings.
9d50f95bc0d5df5 Charles Keepax      2024-04-16  38  	 */
9d50f95bc0d5df5 Charles Keepax      2024-04-16  39  	if (IS_ENABLED(CONFIG_GPIO_SWNODE_UNDEFINED) &&
6774a66d0e103d0 Bartosz Golaszewski 2025-12-15  40  	    gdev_node == &swnode_gpio_undefined)
9d50f95bc0d5df5 Charles Keepax      2024-04-16  41  		return ERR_PTR(-ENOENT);
9d50f95bc0d5df5 Charles Keepax      2024-04-16  42  
216c12047571906 Bartosz Golaszewski 2025-11-20  43  fwnode_lookup:
e5d527be7e69848 Bartosz Golaszewski 2025-11-03  44  	gdev = gpio_device_find_by_fwnode(fwnode);
ff91965ad8b214e Bartosz Golaszewski 2026-02-11 @45  	if (!gdev && gdev_node && gdev_node->name)
7969c87da8f4a6f Pranav Kharche      2026-02-24  46  		

Strange.  The tabs are there but no code.

ff91965ad8b214e Bartosz Golaszewski 2026-02-11  47  
b7b56e64a345e73 Bartosz Golaszewski 2023-09-27  48  	return gdev ?: ERR_PTR(-EPROBE_DEFER);
e7f9ff5dc90c382 Dmitry Torokhov     2022-11-11  49  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

