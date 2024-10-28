Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312331D6DC5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112891; cv=none; b=kUvYjABD/+RUwZEcwpvqtJMrdisb0CCv9lFjb5m744RZ9vmRcnIMlJs27iPyx3yNzBreDqvaH5M8DLoG3f6+tKmDFQV/4PudUivSHUP1tWzWBVJmIejAnuCZrNU6rRsOmq283nSTfB9YWSPdZZOSQuLdJqyDtJzZUyvu3IACVVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112891; c=relaxed/simple;
	bh=FRT7cTeBL9rzdgEqPmoGx0xaa7VbGPuT/dkMIqKmKWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8QFB3GXfSX1cKg1hroDpIUw3o1J1ltNUlG/qhwZhqEvhvnu1NMFdA/WQHcnmRY2DHHCGAH4nonfJN+FrXaeVkS5UQMHT7G2V+4rES0dXg/Pu9ARDTavXPvwDyvZbricJXV6pFgSRD/QI7XC5MbL0WkOt6F9zuW8wtP80rZcfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=os8lmlqx; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="os8lmlqx"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-539fe02c386so4784620e87.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730112887; x=1730717687; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hIp8p1y9OYLmueWzt8+7yDMvWFfo7oDb41HmupTIZZA=;
        b=os8lmlqxhLXbhmyRUc/zNp8/sbEvKdqX9AgE9qfGU6zI2UB+u8XOmLRWvY01pxmgX6
         LXXkLrw7DU1vdFrKrRT09ULE1NBVfGYQ3krkOjfPFlyXKnsfv87ErSRkmBfgpn8NRAA6
         y8vKI1TEs7fnvGG/emBuCT+NHNLV64DVDMNc3lSH6GTJMqjWJQFAFNq4vt1xzCtgn65M
         leyDbaj72eunfuzdqzlaZFM6E09fu9D8aTvDIPNIEaYTeXRRhGYdDYMdGpyy71jcDpxG
         BVNsJcJMQ3sBL9r57cWmKcw96BElHebAgOK0B9QgIs4ek+gzv81eDYcCEC3c6bf80hNS
         iF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112887; x=1730717687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIp8p1y9OYLmueWzt8+7yDMvWFfo7oDb41HmupTIZZA=;
        b=aCaL7KJkczWJUzTxu6tMYjZqeSk6yV9aaiqTOU4gkl55Vf1wzaeU/TGynj7am0ERYA
         xvmDfku5+D7lfY64gCbOap3vv4q5L3hS2r9hM7epGOEAhUq5LDZNy1BvaT36psfjbAB6
         GET0pKjxPpcH+2xvnbaosQYj+N4bqIGcQ6sl9TCDpjc4d7uFvOakPYywfe6acNiP0yAD
         vazH4nDFdi5JDbY4uI674R/DPs/p2Ig6nkYTGElIZcLG8VnoQSPZ22Ac2DadcceNyyg/
         2207aNMdZD2YAu9MHIFvgWWlsad81SOMURMW1959kwYKDrETJEkXvVUeWiTvsmfWVq1L
         /vwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx/vMHEzXvIoairSsV0a8y/KoogmkMUrdf8yJSpDZRtT4hz9njmgR50kkspUxVzKDLCMbebtq+82w5cZWN@lists.linux.dev
X-Gm-Message-State: AOJu0YxQDde+z1C63d5N+sqsGxlFx0ec8DCEUrne77bj88vfgQ6Dr+Y/
	6xx5/4FobYq+g/fGzkDE15Vfjhy41VQQKRf90WJzgOwxk8Aeu2+FJJ1cUQ3yJWo=
X-Google-Smtp-Source: AGHT+IEvzbs7iCzZXXfk6Ann3ZL3OW88AuVYQtULh9f4OSje5nI375zcEnnbchgjpRTSYmWkTUgo6Q==
X-Received: by 2002:a05:6512:1107:b0:539:fbf8:5735 with SMTP id 2adb3069b0e04-53b33df7378mr2053614e87.8.1730112887274;
        Mon, 28 Oct 2024 03:54:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a7efsm1043915e87.56.2024.10.28.03.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 03:54:46 -0700 (PDT)
Date: Mon, 28 Oct 2024 12:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: Yongbang Shi <shiyongbang@huawei.com>, xinliang.liu@linaro.org, 
	tiantao6@hisilicon.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	kong.kongxinwei@hisilicon.com, oe-kbuild-all@lists.linux.dev, liangjian010@huawei.com, 
	chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
	shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
Message-ID: <5sb3loc23nf45up3tx3z7nq2s4hvevhxdwhq7t6w5hrwnyw7vi@kjg4vshkuvjm>
References: <20241022124148.1952761-2-shiyongbang@huawei.com>
 <202410250305.UHKDhtxy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410250305.UHKDhtxy-lkp@intel.com>

On Fri, Oct 25, 2024 at 03:52:49AM +0800, kernel test robot wrote:
> Hi Yongbang,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on linus/master v6.12-rc4 next-20241024]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Yongbang-Shi/drm-hisilicon-hibmc-add-dp-aux-in-hibmc/20241022-204925
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20241022124148.1952761-2-shiyongbang%40huawei.com
> patch subject: [PATCH V2 drm-dp 1/4] drm/hisilicon/hibmc: add dp aux in hibmc
> config: arm64-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250305.UHKDhtxy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410250305.UHKDhtxy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    aarch64-linux-ld: drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.o: in function `dp_aux_init':
> >> drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c:154: multiple definition of `dp_aux_init'; drivers/gpu/drm/msm/dp/dp_aux.o:dp_aux.c:(.text+0x8a0): first defined here

I think both of us should switch to a more generic names. I'll send a
patchset for msm/dp, please use some less generic prefix for hibmc
driver.

> 
> 
> vim +154 drivers/gpu/drm/hisilicon/hibmc/dp/dp_aux.c
> 
>    152	
>    153	void dp_aux_init(struct dp_dev *dp)
>  > 154	{
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

-- 
With best wishes
Dmitry
