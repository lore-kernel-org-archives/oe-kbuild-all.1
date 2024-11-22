Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BBE1531C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 07:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261561; cv=none; b=J4F/jgg04ezrucQ8a5zaJcx4UfQEap0k7KWFfSPVHbfCesaqDxTwGDHmb/5BIVx5tQVNZKl8kN16/PS2KQkeIy0RXGkdRaSUbVCWcIgITje5x7DqqYmpBXmnT0DzUrf96BMOI+bFMeLjgvz2u3w0Yk29pyYXLGPyJI7gT9+KzG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261561; c=relaxed/simple;
	bh=5HXtMqhw3tXV3gZZK7lbXDy0S3J+fgiHJzU7zjwgBZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WREWUdpMLwog+jvLkTfMEVMEv9j9WoZvg4cbOrXVgDii2dG33hm892lU4VtjUTg8vNOA67eoxkc1SFth7Elz1KQW6cQyDBfAwRNYCukSbubZGWaYMcLocT2eEG2cmHW9bAh+qhVc9abnHk2m5DgJx9fdkrbthv5IC3mL1EKFS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=clgnANci; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="clgnANci"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3825a721ae5so935826f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Nov 2024 23:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732261557; x=1732866357; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3Es+EYJzhWtzxIqPztkeb+fLawoz/8tmOGiwlpXsU=;
        b=clgnANcidQtjomAopOJkzZFvJ6mRLPVHuT6Gk50MotPgHRNPjJ+36vaBAeXdiRnGZf
         1Sd87SQ/Rg9s3A8ATs7zdzIvO2pIIUhFpGg5xZ74MxhF7TO6AxLZi8bXd0MLs0EcKdaa
         AvG5F/5g7l5kXVryeyiVOsqtzPcMb+7aDPHIUF/BI0QPDH0dTCHkseaGwq4jFulf1JoQ
         Hfa+S8odIe2C68xuE8gjge3ip2vAl7EoxLkU0t/+WQPhkBHZ55AL0hJ/yVMJFLiNxpPb
         t2T0wdIYCS8z5eVjJTBl6DauCnDHKaWSPCbNXS7zPQJpb54lyDZawerbLcJQOm7uFupv
         31ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261557; x=1732866357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kp3Es+EYJzhWtzxIqPztkeb+fLawoz/8tmOGiwlpXsU=;
        b=ZrP+UEOdC6olccNv/0Pxb4FFLbcwXeHK5ddqath/KFDBj5vt2Rys/M4txZSotRCo0Q
         pbIlRbui7MjfIfHYLheF/OgZIpg1ZB3lifBuXKAgfuEeu6vVqcHbRhKax/3BUOb3tpRH
         +Y0y0uy3RSMuTTm/z+CBD2LWyf6voUvM+cfTvnwmP7+9z+JXXOEwXCb2K7cotmCdPxCg
         cErLk2MrtuZ/QKZI4bf3AQebapeBXtzwS0w9zwYqgE3MPolk6KPPgKoWRfbpDQ0Wpbhm
         JrUlST2hK1Zdxk8ZCid1TfCEfOrGhXIKXg8YuLmjjcBW7V7kUpAwKZNYRMSs4ue8HDN1
         sGAA==
X-Forwarded-Encrypted: i=1; AJvYcCUS5H6oJanWSu0Ra5o01gX2adv+gWCQy2Iv/oZl6FlvHv84oFBUClu8ncTl3leOrRCnf73xeGGFuTP5g5ce@lists.linux.dev
X-Gm-Message-State: AOJu0YyuwjANfV8RX8ewUUayqpqR12lqaa+vOSeW78v/tmarxtjBI/kI
	PF1QBJXtEPUIw0ko0Sz0ijd2bsWQTElbnmoVVRn108+zdIu+aD//bRtH2BeqcMM=
X-Gm-Gg: ASbGncuLj4Ns548jcRj0noL/EMfx8LUgC7c8FHaGrS9gV/uP7VCG+hKMUF1YZlc6xMs
	p+MP53aGS0tTG1pEQ/oJJNWMa9P+jL6UBZwvc0t0SlHDJB5iOqWpi+QanJ5rRxjF3nSTBqR1dIk
	9JJAqoPH7zg1Y+KKvhn6g8ShBvOcGsD+a6Lc5wsDaqDJiOTh7GCG8QL7x8XHwF1MoZ/2TG12zGw
	zBUy/DBpH2P/fLbueuk7xnVVQF2clhRGXgc9n92lj4HU7iQHCdue/0=
X-Google-Smtp-Source: AGHT+IFwRn6hrEcHQ9I6nQ268X1gXrm8sfvunsDK3GyTofhPaRS1QQnV5dbgZWbsMLcZFqf7T3+lYQ==
X-Received: by 2002:a05:6000:1545:b0:382:3efc:c6de with SMTP id ffacd0b85a97d-382601132d7mr1279165f8f.3.1732261557506;
        Thu, 21 Nov 2024 23:45:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc44f7sm1692299f8f.82.2024.11.21.23.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 23:45:57 -0800 (PST)
Date: Fri, 22 Nov 2024 10:45:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready()
 warn: iterator 'i' not incremented
Message-ID: <54307d9c-a9bf-4bc1-b15d-60c5ba53d0ea@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 93da10eee90b2ffa4b496dd4a6ea276c57461fb6 media: intel/ipu6: Fix direct dependency Kconfig error
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221147.N6w23gDo-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411221147.N6w23gDo-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu-bridge.c:752 ipu_bridge_ivsc_is_ready() warn: iterator 'i' not incremented

vim +/i +752 drivers/media/pci/intel/ipu-bridge.c

c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  745  static int ipu_bridge_ivsc_is_ready(void)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  746  {
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  747  	struct acpi_device *sensor_adev, *adev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  748  	struct device *csi_dev;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  749  	bool ready = true;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  750  	unsigned int i;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  751  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03 @752  	for (i = 0; i < ARRAY_SIZE(ipu_supported_sensors); i++) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  753  #if IS_ENABLED(CONFIG_ACPI)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  754  		const struct ipu_sensor_config *cfg =
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  755  			&ipu_supported_sensors[i];
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  756  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  757  		for_each_acpi_dev_match(sensor_adev, cfg->hid, NULL, -1) {
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  758  #else
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  759  		while (true) {
                                                                                                        ^^^^^^^^^^^^^^

8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  760  			sensor_adev = NULL;
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  761  #endif
8810e055b57543 drivers/media/pci/intel/ipu-bridge.c       Ricardo Ribalda 2024-05-01  762  			if (!ACPI_PTR(sensor_adev->status.enabled))
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  763  				continue;


These continues make sense in for_each_acpi_dev_match() but not in a while (true) {
loop.  We're stuck forever.

c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  764  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  765  			adev = ipu_bridge_get_ivsc_acpi_dev(sensor_adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  766  			if (!adev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  767  				continue;
                                                                                                                        ^^^^^^^^


c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  768  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  769  			csi_dev = ipu_bridge_get_ivsc_csi_dev(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  770  			if (!csi_dev)
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  771  				ready = false;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  772  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  773  			put_device(csi_dev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  774  			acpi_dev_put(adev);
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  775  		}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  776  	}
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  777  
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  778  	return ready;
c66821f381aed2 drivers/media/pci/intel/ipu-bridge.c       Wentong Wu      2023-08-03  779  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

