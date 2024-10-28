Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37E1192D70
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 08:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730104109; cv=none; b=EKzVjRKHDKnLcBFPRP3NxwpNtCOV4cqdjrmItFCunPfyZDPeqC7nOGjqtWxETRNwzQZ4Uyt4cGI6Ca0bjVDRtHuEC6H6Zln0qw7g6CowEExPwP3H87BfjOgi4flqZJQm3YUaocLF6xWHZVw2Z1bqWXocUUNu8uJh66nCUF74rE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730104109; c=relaxed/simple;
	bh=NVqXPS/L5BH4Gj7hbSyrhwDNjVwxjaH3REBBB+8AaVI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BC0MRn6Tdo+Geypi7aYhIr6Fvn4El8oGkRTOSczB0ZEjt8SZSQgf7wvdq3T4oswuHfqS20kxq42/HG/V8F1GOqeLMFKznKicI6YXZfi5kriODRsGcEc6VxGnKooWRBal82dz+m+MxE7W+aULF/6LRWQDhTkGDSZAdpASi5GNMCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TGaFi+wl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TGaFi+wl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so2856245f8f.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 01:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730104105; x=1730708905; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed5R3HTvhdD4zg/QXCYj0XYDAVw0ReLkpicM5ODvyHk=;
        b=TGaFi+wluyuHSPcCFknFi5DJ36Ghhd9IEcMh6ofVPFbE1Iei1MrQXSeaaRETJ5LfzL
         qiaWcIxuDQO3vfyCV7Up+msurbne9mGltk6y7DUv9G7iLQORSrpjjYRQ1aE0viPLGdhH
         IBVo67GLNjZm0iA2DJTQHn1DRKzb2iCIRWKaC4PCfCH6II798WZF2fxoXTj2x6Z1eNx8
         Zgxh5dcuOiuLYcdaPqXRIvGr7zpGxev0i2PSqEyz5FZ1FgnTOvLrUjdmW5OZ/ydxTlZ8
         rXvmPNFaJVEaKaTwoSB8akcPIumHwNZwVkcik5GWtbCkchz9SRT6+UPnwwWwCwuNsQM1
         Ir9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104105; x=1730708905;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ed5R3HTvhdD4zg/QXCYj0XYDAVw0ReLkpicM5ODvyHk=;
        b=RHYY/pk5rr/pUDEch3+X6dJ21cpV+MYc/Hge/J97MaOLZl0n002RxqEpORzwzg3mqG
         iPjjGcvFK/hAiyCgdRY3miehVnTZIHT6dbYQuHdIOsou+bYzVh6/QuBNKDPD6qqw9mRc
         cYAGj2EBUyDIY/IuJL70lgKwDucXdc7q16d5DQtYih7o13YJL4YJ2FB2Ti+BOxoJwrbW
         V06Gks25qYfxAN5J/nV8K3tAxpvqpNdijU8B6vMKMijt+hHqI30+w14Jy/vP+fih5nh/
         lu+jm2jPSwJzg5UR24zV60n0cxq3tdSkAMR/ykxyEgkSCnX2xLT7Nx5SpVOB8DN4Nux1
         LTZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMaQuyzD/1muaykkHvG5xfoiq/9cKYFxZCK9RBd9bJNXIqN/nEHSCQfrLbYu+KvcYWYXZoWcRd1g3bEmgh@lists.linux.dev
X-Gm-Message-State: AOJu0YzG17CchUci5Yg9QIRBQaNwfuq9cYXXt+u0aLIDF/uiwj9S8kOe
	MGkGH6BkbO9iXEC10xv/RumU+DRb1QsBaX+RSRu54P+TWw41bHTZgdRHR4qTXkU=
X-Google-Smtp-Source: AGHT+IEYWIsUxoaKX8/fpnoCrdG/jrvGQXwhIqgHw0yNtoMJow/Z0Cqr6QdJVulUYioxSRFShPxQEA==
X-Received: by 2002:a05:6000:10d0:b0:37d:30e7:3865 with SMTP id ffacd0b85a97d-380611a3e4amr5808602f8f.34.1730104105211;
        Mon, 28 Oct 2024 01:28:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c4cdsm8808039f8f.24.2024.10.28.01.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:28:24 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:28:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Herve Codina <herve.codina@bootlin.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery
 mechanism
Message-ID: <9a16ee73-cdc9-47bc-88f7-2fed5fdad2ff@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024095539.1637280-3-herve.codina@bootlin.com>

Hi Herve,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/dt-bindings-display-bridge-sn65dsi83-Add-interrupt/20241024-175758
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241024095539.1637280-3-herve.codina%40bootlin.com
patch subject: [PATCH 2/2] drm: bridge: ti-sn65dsi83: Add error recovery mechanism
config: csky-randconfig-r073-20241026 (https://download.01.org/0day-ci/archive/20241026/202410262052.CRR7XezU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410262052.CRR7XezU-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/ti-sn65dsi83.c:360 sn65dsi83_reset_pipeline() error: uninitialized symbol 'state'.

vim +/state +360 drivers/gpu/drm/bridge/ti-sn65dsi83.c

caeb909b9ed830 Herve Codina 2024-10-24  330  static int sn65dsi83_reset_pipeline(struct sn65dsi83 *sn65dsi83)
caeb909b9ed830 Herve Codina 2024-10-24  331  {
caeb909b9ed830 Herve Codina 2024-10-24  332  	struct drm_device *dev = sn65dsi83->bridge.dev;
caeb909b9ed830 Herve Codina 2024-10-24  333  	struct drm_modeset_acquire_ctx ctx;
caeb909b9ed830 Herve Codina 2024-10-24  334  	struct drm_atomic_state *state;

Almost everyone has their compiler set to zero out stack variables these days.
You should set this to struct drm_atomic_state *state = ERR_PTR(-EINVAL);.

caeb909b9ed830 Herve Codina 2024-10-24  335  	int err;
caeb909b9ed830 Herve Codina 2024-10-24  336  
caeb909b9ed830 Herve Codina 2024-10-24  337  	/* Use operation done in drm_atomic_helper_suspend() followed by
caeb909b9ed830 Herve Codina 2024-10-24  338  	 * operation done in drm_atomic_helper_resume() but without releasing
caeb909b9ed830 Herve Codina 2024-10-24  339  	 * the lock between suspend()/resume()
caeb909b9ed830 Herve Codina 2024-10-24  340  	 */
caeb909b9ed830 Herve Codina 2024-10-24  341  
caeb909b9ed830 Herve Codina 2024-10-24  342  	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, err);

This macro has a goto in it.

caeb909b9ed830 Herve Codina 2024-10-24  343  
caeb909b9ed830 Herve Codina 2024-10-24  344  	state = drm_atomic_helper_duplicate_state(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  345  	if (IS_ERR(state)) {
caeb909b9ed830 Herve Codina 2024-10-24  346  		err = PTR_ERR(state);
caeb909b9ed830 Herve Codina 2024-10-24  347  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  348  	}
caeb909b9ed830 Herve Codina 2024-10-24  349  
caeb909b9ed830 Herve Codina 2024-10-24  350  	err = drm_atomic_helper_disable_all(dev, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  351  	if (err < 0)
caeb909b9ed830 Herve Codina 2024-10-24  352  		goto unlock;
caeb909b9ed830 Herve Codina 2024-10-24  353  
caeb909b9ed830 Herve Codina 2024-10-24  354  	drm_mode_config_reset(dev);
caeb909b9ed830 Herve Codina 2024-10-24  355  
caeb909b9ed830 Herve Codina 2024-10-24  356  	err = drm_atomic_helper_commit_duplicated_state(state, &ctx);
caeb909b9ed830 Herve Codina 2024-10-24  357  
caeb909b9ed830 Herve Codina 2024-10-24  358  unlock:
caeb909b9ed830 Herve Codina 2024-10-24  359  	DRM_MODESET_LOCK_ALL_END(dev, ctx, err);
caeb909b9ed830 Herve Codina 2024-10-24 @360  	if (!IS_ERR(state))
caeb909b9ed830 Herve Codina 2024-10-24  361  		drm_atomic_state_put(state);

Calling drm_atomic_state_put(NULL) leads to an Oops.

caeb909b9ed830 Herve Codina 2024-10-24  362  	return err;
caeb909b9ed830 Herve Codina 2024-10-24  363  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

