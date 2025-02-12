Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72BAC20126A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 07:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739345217; cv=none; b=C+So4DOWo/DtuZcLUmQGPoRtU8eyjpRV+WD+TzQ9tnWlJ4rKbEJMrQdSURZkLIe0BSH+ncZj5yV9MbuqOehb1Crf0258PqdhojBYEsGHp3Dr4ys/bzoEWeuH7yWBXWH+HWz/mgAgi83l19R7kxGGyLbTNwkCngTBaeDSRrfhqgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739345217; c=relaxed/simple;
	bh=Stf0Jb6AOQt3UW45VdcZWRKlmtA1GKvuSfA1nYZiAmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=rV/qu8BleT0GUBMLY4eetysr78tP8JXH/cwqFIWLgmaTfmgjmOzJ1kGWV22i1y1sobqBWAqQLVJ1angnQD2NZNQi3Oky33uO63p3noKpI4An+0ndkJE7/2QK41knCrwCtI/SNx1Nj0+UFI9QzZwpViA9fZLniefdRnAbiHshHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Je2oQQnR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Je2oQQnR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5de6e26d4e4so6911010a12.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 23:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739345214; x=1739950014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AJTh/3LX42S4U+/p3ueXWIJVVkrm4MNl6nXiRtJNaS8=;
        b=Je2oQQnROiJgoi/TkDLIOz33GvoTTHB6zorTliimdm1FLaAzGLbxvVq5p8LZvpf8QS
         nmX+xK72bxyoA2C7qioB9P6/DnIxZNW27ySMZCIqj8CHy77wDdAaRDhdFeKqGUeSAmrE
         RePSHdXPeY4DHG6keanOF7Xj4HBR2WXvmbXvqyqlpEmV5K0zLWVc96h3vu2gJShG+Dpi
         k1ZT5mm8gteF6YzFkeF8/sQeGtMkfFLrSKx8TyKp06n8I5PzJpwb+ZBYwqs09VlRCA9G
         4a3hBR66533zPDf0L6s45Zqvh4ddKmEdUaKCXdgwPchb19/vj4IUGmsD7IfHxQ9ycI2E
         UImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739345214; x=1739950014;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJTh/3LX42S4U+/p3ueXWIJVVkrm4MNl6nXiRtJNaS8=;
        b=AyC2RADbhAE3ZNhTqqOL0+n6FNK/0mrAsPUAcoKp1fnUY+CEwD4jnlU674cNLLZyA5
         Cgpu6Jm4Saa4ZFfuv4jGEm86+y1KOqUYe/JQiqLy2invoqNrFlNIegZAY5hiC6Mv4yNY
         14S78XlMI0/HwQiGEcDAcDRzGl5BDV72tRtmOzJ0qHUkbVUiS3C/vW1//SH9bFsEtHDF
         OdJRCFNQ3AF0WV7CsSFTVNlNAANemkUwBp67GKqzmjzFMmN50zFG37yNBroSuwo4eR+s
         MFCIb5dibfOPVnsL/Payi+8hL921qE49K2Hs5BlJstkdDUwcrrs22Y8/dDWe8z0qg6iv
         +lAg==
X-Forwarded-Encrypted: i=1; AJvYcCWJp40Cd+LdLHaBzycoLSmtabIWt2N9flalcj536Kq2MRmjMEp/EMDtU1eSrfENlsRZbNrasf05CIOzl09t@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc3Wdjo2nWlAD2s/8efSvbVKpBrzhUm6LffnWyDTKS3oglOdkc
	LRoiiwv7miSapZYTVDtGABSeeHO5Asetutdin5WV4g8zdxObW5/Aql8DsoegTOk=
X-Gm-Gg: ASbGncuw6P9QTD+O8Q+t0EVkAuY9Ls/5tk1Fmj1OrCJyo445iq1ufRFHJ/Galibtsfi
	6Zq47Fsc6siqA7OVkc8n4VkQ//C9Nc2YM558hoWrkSlZ/AWmxWodHIOmIPLLbRdYkXDdmjk4VFX
	MCYRFD8opDT7ABQAuof8dXMiOIy4N1b+M+9+UYp3FgKd+VnRAz34tkJUCfIOmHc3QcS7G8FJkLr
	luLCvoMsivjhhvWISZN8U5OEGv3twrHUkZJQ7+a6qb3IFc6LbOGeK6q6kPX7t7oAFnMDuerTZjY
	THlBWzd3nqzViNQ5vWaI
X-Google-Smtp-Source: AGHT+IFEIukrsfK6bZlW7MrqvUc4H7nNhVSu1KFPTEnyStLzMs/D5F7VfW3cbMd6Iv6A4IGV/jSXWQ==
X-Received: by 2002:a05:6402:3553:b0:5d1:1f1:a283 with SMTP id 4fb4d7f45d1cf-5deadd7bc87mr1609569a12.4.1739345213733;
        Tue, 11 Feb 2025 23:26:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de5a2fc79esm7995187a12.10.2025.02.11.23.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 23:26:53 -0800 (PST)
Date: Wed, 12 Feb 2025 10:26:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary
 device creation helper
Message-ID: <7bb0b7ea-8ca4-4ea1-a7ec-d56646240e59@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-aux-device-create-helper-v2-6-fa6a0f326527@baylibre.com>

Hi Jerome,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/driver-core-auxiliary-bus-add-device-creation-helper/20250207-023433
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250206-aux-device-create-helper-v2-6-fa6a0f326527%40baylibre.com
patch subject: [PATCH v2 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
config: xtensa-randconfig-r071-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081655.FlCrxpYN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502081655.FlCrxpYN-lkp@intel.com/

smatch warnings:
drivers/clk/imx/clk-imx8mp-audiomix.c:241 clk_imx8mp_audiomix_reset_controller_register() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +241 drivers/clk/imx/clk-imx8mp-audiomix.c

c350f4c434316c Jerome Brunet 2025-02-06  231  static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
6f0e817175c5b2 Shengjiu Wang 2024-06-14  232  {
c350f4c434316c Jerome Brunet 2025-02-06  233  	struct auxiliary_device *adev;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  234  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  235  	if (!of_property_present(dev->of_node, "#reset-cells"))
6f0e817175c5b2 Shengjiu Wang 2024-06-14  236  		return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  237  
c350f4c434316c Jerome Brunet 2025-02-06  238  	adev = devm_auxiliary_device_create(dev, KBUILD_MODNAME,
c350f4c434316c Jerome Brunet 2025-02-06  239  					    "reset", NULL, 0);
c350f4c434316c Jerome Brunet 2025-02-06  240  	if (IS_ERR_OR_NULL(adev))
c350f4c434316c Jerome Brunet 2025-02-06 @241  		return PTR_ERR(adev);

If devm_auxiliary_device_create() could return NULL then that would count
as success.  But devm_auxiliary_device_create() can't return NULL.  It
only makes sense to return NULL if the auxiliary device is optional.

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

6f0e817175c5b2 Shengjiu Wang 2024-06-14  242  
6f0e817175c5b2 Shengjiu Wang 2024-06-14  243  	return 0;
6f0e817175c5b2 Shengjiu Wang 2024-06-14  244  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

