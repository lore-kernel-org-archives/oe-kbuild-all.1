Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3FB32143E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765790547; cv=none; b=by2I2ySIGrqwj4Ndati32+HvXcXai77itcMBQjY6FuxY8zrT/7pADsYwO70Hem6HZcc4ZRTo+2XjmPWzkuVRDdNIDVSjD1JXH9S6j/L39cDaxDkVYrmoJzvH/n2CLxUpMouf4nBMccf7T7/1DPuaFD4kksD5hXBmuaF/7WxkUI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765790547; c=relaxed/simple;
	bh=1J0QdY00wB4PJO+YgVHnaMOLl0QgYV3MI07wp0Bf3uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ML+hAcNPYR55DIqs5DiRjqu4cXvK4HDaNIE3n7umu1oBf/xAmQj3OkfFOR4nL0z0OsQHHWeTRmKn8wewcZJxDqhR7gSsgUR8YjcHo3uWP/pAAxIAWzsc98wb0wFLjrbYeO256bBNH8+rTqM5IFTIU6hK+L6CRNkHKkNPDidznSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o07deQt/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o07deQt/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so36056195e9.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765790543; x=1766395343; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y2VXxX616Xa5Cko+/2ttqFKgeLLoj3bQjcWSa30krj8=;
        b=o07deQt/stpZQunSh8HYGVoFOf5rzZddjuO0xmEM7XrTp4K5m081dbRj5eBiilAgt+
         tGmH+swzbSMOYqS2uSQQCla5H/FTza7CYFHsBvWwaDlo17jT3cyq8MAPfKEHsr/d3S+C
         rslQ8ZnjH9P0FpHgHcu+tt3Q0GzyD/0EZ7ZFY1aTBzXRRAKaNV/NcEbfIIVsjgmQYxC5
         cqFMIhl3JM08UW6N7Kkm2tMerR0yj5LGYK7jixZj49Ps5GLYlNcZjZP/EL3q/yCRNzZe
         BjXHC+Ui9Ls/iR5UFzL2ERnywuCpgJd1yOKg5VwHvWYBl13sJMfSzdh3J7WulDOzF2eu
         SFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765790543; x=1766395343;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2VXxX616Xa5Cko+/2ttqFKgeLLoj3bQjcWSa30krj8=;
        b=f/RHE0GaruC0qoXrEox9E8OxiQmYZKDdFTpLt4jGsTRwzVEnY22iSl2eBj6+NnkJiW
         7bYBSwHP237n9nnUAeJX9KpWoc/0W09nrcb2elR5RBIx3js8pCc1sdGEa4kTkogIN08I
         QgMNJ6nn2PUNpc+/2vDorpfogqHbXSx3w57lgzrxuoOuXpw6zgoY09LVqZJwJwcIpoIl
         Nez+l9nJpr/Nz56F7g/95fNVH1zIW+FZ1rMaRTtyZXuPiyCbqmQ7icRG34CiCNYkuMaQ
         ZTHABxhx0qK+mDbgElXKpNkeDdt4LH/uUafMMUzPnqCQnXG+FCuOw6adA3iexZgsf3NW
         a3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVFU9Q/vJDJEA19XeBM8vAKexSqP3lCW3xwtcMxhqwkK33h9tFEwqPTSEpECSt+mIWEy9QH7Csf5V87wXZA@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0StCnoLLOZhPGGeyo55pplgJErXQF99BHcLAhiBK+KGegoJMK
	W7mMmvqGFSZZ+2Wc1zGj6nFnlMu4fYHB9Bas+9wKQhM7FaKV9NSWtFNFO5m5amRULnZ63Ub3o9m
	j7l7C
X-Gm-Gg: AY/fxX6R8rO5U0HWl5OPMv6dnd6H1/wWCypN+HM+X6tESJDjcCHw7/KuNASNnXLmWLD
	WrCxu39To/s5/8A1pgNe51qJ1PGQ7frO9Z3/ax0IpuyAc/tQaq7EVIZRDdn0MbYSgCkWUWD7JiV
	ysGCTM9PQGnPLygsjq4GcvCjEAJPHBeq45qV+lIdXxifIxytHJYvUzzyInXmRXhd/ayp2hrSF7I
	IhGgru+X+DA8K9125PEt3KjJBob7DkjEUoQvOTQ3FvoK00gtuRvycjj0063wrUDFdMNWbDDFTdK
	6ZuKHj3nDUKH821gp3On19bxxqKRaqB1t9JO3wNaiKUY1XUFq6Yt71wJEc7iURH9ecjpRxIXbu4
	Xmoi0vHn3DzbxhprZBpJwSv2d3t+AXFhSKPby68KyN7uIQAzCOpzrNKIbeUEsp1aANSCavbmGmx
	GEjhrcjaDPmK8fl6+h
X-Google-Smtp-Source: AGHT+IE7Knx5lMleMfeMPsA8aVy7Wl2m2eXYgXjZ8WdEgLLRycfAIbcFrV8EyUjms/49oisAl+1Y/g==
X-Received: by 2002:a05:600c:4f09:b0:477:fad:acd9 with SMTP id 5b1f17b1804b1-47a8f916685mr86996195e9.34.1765790543149;
        Mon, 15 Dec 2025 01:22:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f6e5baasm186959115e9.13.2025.12.15.01.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:22:22 -0800 (PST)
Date: Mon, 15 Dec 2025 12:22:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Andy Yan <andy.yan@rock-chips.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202512151515.PjP26FTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: d68ba7bac9555d05e2f5b310c898b2a5c7eff174 drm/rockchip: Add RK3588 DPTX output support
config: arm64-randconfig-r071-20251215 (https://download.01.org/0day-ci/archive/20251215/202512151515.PjP26FTp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512151515.PjP26FTp-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-dp.c:2080 dw_dp_bind() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +2080 drivers/gpu/drm/bridge/synopsys/dw-dp.c

86eecc3a9c2e06 Andy Yan 2025-08-22  2068  	ret = phy_init(dp->phy);
86eecc3a9c2e06 Andy Yan 2025-08-22  2069  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2070  		dev_err_probe(dev, ret, "phy init failed\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2071  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2072  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2073  
86eecc3a9c2e06 Andy Yan 2025-08-22  2074  	ret = devm_add_action_or_reset(dev, dw_dp_phy_exit, dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2075  	if (ret)
86eecc3a9c2e06 Andy Yan 2025-08-22  2076  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2077  
86eecc3a9c2e06 Andy Yan 2025-08-22  2078  	dp->irq = platform_get_irq(pdev, 0);
86eecc3a9c2e06 Andy Yan 2025-08-22  2079  	if (dp->irq < 0)
86eecc3a9c2e06 Andy Yan 2025-08-22 @2080  		return ERR_PTR(ret);

s/ret/dp->irq/

86eecc3a9c2e06 Andy Yan 2025-08-22  2081  
86eecc3a9c2e06 Andy Yan 2025-08-22  2082  	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
86eecc3a9c2e06 Andy Yan 2025-08-22  2083  					IRQF_ONESHOT, dev_name(dev), dp);
86eecc3a9c2e06 Andy Yan 2025-08-22  2084  	if (ret) {
86eecc3a9c2e06 Andy Yan 2025-08-22  2085  		dev_err_probe(dev, ret, "failed to request irq\n");
86eecc3a9c2e06 Andy Yan 2025-08-22  2086  		return ERR_PTR(ret);
86eecc3a9c2e06 Andy Yan 2025-08-22  2087  	}
86eecc3a9c2e06 Andy Yan 2025-08-22  2088  
86eecc3a9c2e06 Andy Yan 2025-08-22  2089  	return dp;
86eecc3a9c2e06 Andy Yan 2025-08-22  2090  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

