Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859E240927D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 10:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593752; cv=none; b=sjWt27m0AVOHC2lRvxd1gG/n+iqnG4PwvBVLttgyBDpyv+0lVHjWYZrC3DTiHKuoONCQUF8wTsF9c0z9R5F1qqLvxpLt0B1HzWGphzBokYFJPZaXo8DF2U2Mv7Tx28C5+zwpyRF1CiU3pU6QaJYbVXYQf45x5FprXDFgnoAE+xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593752; c=relaxed/simple;
	bh=wRyd2vfRdql4h/Kz7A5B/FCEp6F8EqRGdnY2ZwKx+cY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l1rmvoziee8PxJY4hS63wSibjaSOPqCJklUqntoOf97B1X2VKqj+uiVylrUjojOcRrkDIA5RiaHcXo5EHjSf1eh2d6rGXvOFKfGau7xQXOCRRprQ6QY0w9YZVj+MMlF2wh0sa4XCGevfcpG/uovy6TQNbh4BzdPZc1hKmGUnVyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcPX4T+0; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcPX4T+0"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4955cd5da3dso711692b6e.2
        for <oe-kbuild-all@lists.linux.dev>; Thu, 09 Jul 2026 03:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783593749; x=1784198549; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqY9tTm6V78GGL+zIVOxCNvg7lHNudn+dnRY3++oib4=;
        b=VcPX4T+0caQjyjrJm/LV2rx3XvIegvThkLMknLHuv+TBxoXzpuq3E26aJt7zvco5QR
         TcIo4ubue++NO6zz0UW6YgXr3XKTXK/3hQBZvulZRv4OEf9HNsx2QQGq+650RHjm1/q4
         P46FRfgObWt3N6ystlSIhdTWU07p87EmKYChBy0E273wUJK0bvKdNXQCOOZmKbVSov+m
         UBz7I7JtT/quTahFeMWNJ8qvb3pRuhzBwiMOiqmRfpUsF3fnoqlAitKXfoo6cqGMeits
         EsWADkkeWLgYwGtzmusCgEA9ptHGHxJXIWVK3R6luNh+WwU0b+z7T3SYLWudTgOxdCxh
         Ie/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593749; x=1784198549;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqY9tTm6V78GGL+zIVOxCNvg7lHNudn+dnRY3++oib4=;
        b=Eu6Pr3qhw33GuM8LhYcikOmcfigay7lT2w+I9a58eXKwZIj5CrRierj9TCqbzHX616
         mL55fryoLxAY3mRprfUmgdM3YhdTH6eCj5/2OtY5hohZ0qP1E+BPCOkMQulZOOHiZr4G
         X/IJQIab4ErDXveyg0UdCQlMN53v6jyHLmZ7z/igGUja3Zh47kSnyuQVHmN48dMye4Ru
         UWoP5rALnVX7ldCxXNbgvy46pVG3fZ4ChtxPWHehoDS2AuQvrIFlGjEC2tE2SwL+FpKz
         zSLJFj28dHX0AQEyEpD4IMBbNyZSRMnWAuaIXM7dYffjt+aKbtix2/1F9YGIyyVG0SU5
         +i0g==
X-Forwarded-Encrypted: i=1; AFNElJ/Kgnw/ug8gXQckHFjPnqPeRHf/mRFrhsfXaV+Az0+h38PM6zJ7m5triry+Z+Ihp9hWq3OS4nkgcYNTMI4l@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Iod5Q30j2KHceKWxoXtDz+ahbGsY4RKEXhRE16g4NHcrAeT1
	ie7WNnaBJO318Go+q4t93V9FSAl7MFLoriC/7NNkSTJx+N2IFH3HUL1T51MaRDEBLYw=
X-Gm-Gg: AfdE7cnzmhqIP/6HgUxdeoqbKIoRRtfyX4FMXMi+Vv5Z5vRqkAFBL8lDSLqwH7QYXDp
	QDIVTnm7eE4OuYY9xwmpMkSwxhoEfY7hrcTmOpqv4jSJ+gF6OCAEttqg7OnrL1lDQ/CbfH1vvxH
	TKSHav/gYKxCEUuGZQp2xtCnjrkyqw3KJrWatM/vXOoh8LDD562INNfqtTsNt8WgRq0XgAYtQ8r
	mIXhGyBdXiaZEei6T5eFwwSFpHTBDN+N5bduJIR3XZ5gn2G+f2HB1BU6e2I/OgkWKsygAZNdxEx
	WcXE0S/4L1xaUyreTx0Nzb8XJccO+RrcymF4O0Qk4Dp/JnJTca838RAXAdvUyrzVK5iEGAosaCu
	/JpXzfol8GiiPFSR2h7ZM539LS0lnZnD8Kouab0FifxnkdXRndlBpIVDu1zKP0Gl4Dad5Sch43G
	f42Fxw2pN4wzpC0Vg=
X-Received: by 2002:a05:6808:3198:b0:48b:9987:ba17 with SMTP id 5614622812f47-4a204bdf898mr4818811b6e.35.1783593749407;
        Thu, 09 Jul 2026 03:42:29 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f31sm3343228b6e.4.2026.07.09.03.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:42:27 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:42:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn:
 variable dereferenced before check 'pdev' (see line 500)
Message-ID: <202607031755.QZSurBLv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2c9a99135da931377240942d44f3dea104cedb8
commit: 491fadb2b818e1d900229a1f8243de6458381306 drm/msm/adreno: Move adreno_gpu_func to catalogue
date:   8 months ago
config: arm64-randconfig-r072-20260703 (https://download.01.org/0day-ci/archive/20260703/202607031755.QZSurBLv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 491fadb2b818 ("drm/msm/adreno: Move adreno_gpu_func to catalogue")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031755.QZSurBLv-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a2xx_gpu.c:503 a2xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 500)
drivers/gpu/drm/msm/adreno/a4xx_gpu.c:642 a4xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 637)
drivers/gpu/drm/msm/adreno/a3xx_gpu.c:530 a3xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 525)

vim +/pdev +503 drivers/gpu/drm/msm/adreno/a2xx_gpu.c

491fadb2b818e1 Akhil P Oommen 2025-11-18  493  static struct msm_gpu *a2xx_gpu_init(struct drm_device *dev)
21af872cd8c695 Jonathan Marek 2018-11-21  494  {
21af872cd8c695 Jonathan Marek 2018-11-21  495  	struct a2xx_gpu *a2xx_gpu = NULL;
21af872cd8c695 Jonathan Marek 2018-11-21  496  	struct adreno_gpu *adreno_gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  497  	struct msm_gpu *gpu;
21af872cd8c695 Jonathan Marek 2018-11-21  498  	struct msm_drm_private *priv = dev->dev_private;
21af872cd8c695 Jonathan Marek 2018-11-21  499  	struct platform_device *pdev = priv->gpu_pdev;
491fadb2b818e1 Akhil P Oommen 2025-11-18 @500  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                        ^^^^^^

21af872cd8c695 Jonathan Marek 2018-11-21  501  	int ret;
21af872cd8c695 Jonathan Marek 2018-11-21  502  
21af872cd8c695 Jonathan Marek 2018-11-21 @503  	if (!pdev) {
                                                    ^^^^^^
Hopefully, this code could be deleted.

21af872cd8c695 Jonathan Marek 2018-11-21  504  		dev_err(dev->dev, "no a2xx device\n");
21af872cd8c695 Jonathan Marek 2018-11-21  505  		ret = -ENXIO;
21af872cd8c695 Jonathan Marek 2018-11-21  506  		goto fail;
21af872cd8c695 Jonathan Marek 2018-11-21  507  	}
21af872cd8c695 Jonathan Marek 2018-11-21  508  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

